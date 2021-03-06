#include <LoRa.h>
//#include <Adafruit_GPS.h>
#include <Wire.h>
#include "IntersemaBaro.h"
#include <SPI.h>
#include <SD.h>
#include <SoftwareSerial.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include <music.h>
#include <pitches.h>
#include "music-scores.h"

int Flight_Log[10] = {0,0,0,0,0,0,0,0,0};

int loop_counter;

//%%%%%%%%%%%%%%%%%%%%%%%% MUSIC SETUP %%%%%%%%%%%%%%%%%%%%%%%%//

Music music(33);

/*
//%%%%%%%%%%%%%%%%%%%%%%%% GPS SETUP %%%%%%%%%%%%%%%%%%%%%%%%//



//what's the name of the hardware serial port?
//SoftwareSerial GPSSerial(1,0);


//Connect to the GPS on the hardware port
//Adafruit_GPS GPS(&GPSSerial);

//Set GPSECHO to 'false' to turn off echoing the GPS data to the Serial console
//Set to 'true' if you want to debug and listen to the raw GPS sentences
//#define GPSECHO  true
*/

//%%%%%%%%%%%%%%%%%%%%%%%% DATALOGGER SETUP %%%%%%%%%%%%%%%%%%%%%%%%//
int chipSelect = 53;

//%%%%%%%%%%%%%%%%%%%%%%%% ALTIMETER SETUP %%%%%%%%%%%%%%%%%%%%%%%%//

Intersema::BaroPressure_MS5607B baro(true);

// Altitude variables
float avg_alt;
float alt0;
float altitude;
float old_Alt;
float new_Alt;
unsigned long T0;
unsigned long T1;
unsigned long T;

//%%%%%%%%%%%%%%%%%%%%%%%% IMU SETUP %%%%%%%%%%%%%%%%%%%%%%%%//
#define BNO055_SAMPLERATE_DELAY_MS (100)

Adafruit_BNO055 bno = Adafruit_BNO055(55);
int ang[3] = {0,0,0};

//%%%%%%%%%%%%%%%%%%%%%%%% ACCELEROMETER SETUP %%%%%%%%%%%%%%%%%%%%%%%%//

int xRawMin = 0;
int xRawMax = 512;
 
int yRawMin = 0;
int yRawMax = 512;
 
int zRawMin = 0;
int zRawMax = 512;

int acc[3] = {0,0,0}; //accelerometer readout array; x, y, z axes respectively

//create state machine for deployment stages
enum states{
  None,
  Setup,
  Launchpad,
  Thrust,
  Descent,
  Deployment
};

//set initial state
states flight = None;
states timer = None;
int stages[5] = {1,2,3,4,5};
int currentStage = 1;

//Payload pin
const int PL = 14;

//%%%%%%%%%%%%%%%%%%%%%%%% RECOVERY PIN SETUP %%%%%%%%%%%%%%%%%%%%%%%%//

const int SAFETY = 22;
const int SEP = 3;
const int R = 5;

void setup() { 
  Serial.begin(9600); 
  LoRa.begin(915E6);
  Serial.println("initializing");
  //GPS.begin(9600); //uncomment GPS communication, comment out serial communication during flight
  
  /*
  while (!GPS.fix){
    Serial.println("Waiting for GPS signal...");
  }
  */
  
  //initialize pins
  pinMode(A13, INPUT); //X
  pinMode(A14, INPUT); //Y
  pinMode(A15, INPUT); //Z
  
  //recovery pins
  pinMode(R, OUTPUT);
  pinMode(SEP, OUTPUT);
  digitalWrite(R, HIGH);
  digitalWrite(SEP, HIGH);
  
  //IMU
  bno.begin();
  bno.setExtCrystalUse(true);
  uint8_t system, gyro, accel, mag;
  system = gyro = accel = mag = 0;
  bno.getCalibration(&system, &gyro, &accel, &mag);
  Serial.println("Sensors Initialized");

  //altimeter
  baro.init();

  //set starting altitude
  alt0 = 0;
  altitude = 0;
  avg_alt = 0;
  int num_points = 50;
  for (int i=0; i<num_points; i++)
    {
      alt0 += baro.getHeightCentiMeters()/30.48;
      delay(10);
    }
  alt0 /= num_points;            //normalize to the number of samples collected

  //set initial states
  flight = Setup;
  timer = None;
  currentStage = stages[0];
 
  //initialize datalogging
  if (!SD.begin(chipSelect)) {
      Serial.println("Card failed, or not present");
    }
    else{
      File dataFile = SD.open("Flight.txt", FILE_WRITE);

      if (dataFile){
          dataFile.println("Beginning New Flight");
          dataFile.close();
          Serial.println("New Datalog Created");
        }
      else{
          Serial.println("error opening file Flight.txt");
          return;
        }
      Serial.println("Initialization Complete");
    }
    

  // Music initialization
  music.is_playing = true;
}

//create a loop to calculate average acceleration values
int ReadAxis(int axisPin)
{
  long reading = 0;
  analogRead(axisPin);
  for (int i = 0; i < 10; i++)
  {
    reading += analogRead(axisPin);
  }
  return reading/10;
}

void AutoCalibrate(int xRaw, int yRaw, int zRaw)
{
  //Serial.println("Calibrate");
  if (xRaw < xRawMin)
  {
    xRawMin = xRaw;
  }
  if (xRaw > xRawMax)
  {
    xRawMax = xRaw;
  }
  
  if (yRaw < yRawMin)
  {
    yRawMin = yRaw;
  }
  if (yRaw > yRawMax)
  {
    yRawMax = yRaw;
  }
 
  if (zRaw < zRawMin)
  {
    zRawMin = zRaw;
  }
  if (zRaw > zRawMax)
  {
    zRawMax = zRaw;
  }
}

void loop(){

  ////////// Accelerometer //////////
  int xRaw = ReadAxis(A13); //take accelerometer voltages in X,Y,Z directions
  int yRaw = ReadAxis(A14);
  int zRaw = ReadAxis(A15);

  int xScaled = map(xRaw, xRawMin, xRawMax, -1000, 1000); //convert acceleration signals from voltage to numerical values
  int yScaled = map(yRaw, yRawMin, yRawMax, -1000, 1000);
  int zScaled = map(zRaw, zRawMin, zRawMax, -1000, 1000);

  int AX = {xScaled / 1000.0}; //scale acceleration vectors
  int AY = {yScaled / 1000.0};
  int AZ = {zScaled / 1000.0};

  acc[1] = AX; //write acceleration vector values to array
  acc[2] = AY;
  acc[3] = AZ;
  
  ////////// IMU //////////
  sensors_event_t event;
  bno.getEvent(&event);
  ang[1] = {(int)event.orientation.x}; //write orientation angles to array
  ang[2] = {(int)event.orientation.y};
  ang[3] = {(int)event.orientation.z};
  delay(BNO055_SAMPLERATE_DELAY_MS);

  //ALTMETER BASED DEPLOYMENT LOOP//
  altitude = baro.getHeightCentiMeters()/30.48 - alt0;
  avg_alt += (altitude - avg_alt)/5;
  Serial.println(avg_alt);
  switch(flight) {
    case Setup:
      currentStage = stages[0];
      Serial.println("SETUP");
      
      //%%%SAFETY CONDITION%%%
      /*while (digitalRead(SAFETY) == LOW){
        Serial.println('Please activate safety switch to continue');
      delay(1000);
       }
      */
      music.music_array = ARMED_SIGNAL;
        if(avg_alt > 10){
          flight = Launchpad;
        }
      break;
      
    case Launchpad:
      currentStage = stages[1];
      Serial.println("LAUNCHPAD");
      AutoCalibrate(xRaw,yRaw,zRaw);
      old_Alt = avg_alt;
      if(old_Alt > 100){
        T0 = millis();
        flight = Thrust;
        timer = Thrust;
      }
      break;
    
    case Thrust:
      currentStage = stages[2];
      Serial.println("THRUST");
      music.music_array = THRUST_SIGNAL;
      new_Alt = avg_alt;
      T = millis();
      if ((new_Alt - old_Alt)/(millis() - T) < 0){
        digitalWrite(SEP,LOW);
        flight = Descent;
      }
      old_Alt = new_Alt;
      break;

    case Descent:
      currentStage = stages[3];
      music.music_array = DESCENT_SIGNAL;
      Serial.println("DESCENT");
      if (avg_alt < 1000){
        digitalWrite(R, LOW);
        currentStage = stages[4];
        music.music_array = RECOVERY_SIGNAL;
        Serial.println("RECOVER");
      }
  }


  //TIMER BASED DEPLOYMENT LOOP//

/*  switch(timer){
    case Thrust:
      currentStage = stages[2];
      T1 = millis();
      if(T1 > T0 + 40000){
        digitalWrite(SEP, LOW);
        T0 = millis();
        timer = Descent;
      }
      break;
      
    case Descent:
      currentStage = stages[3];
      T1 = millis();
      if (T1 > T0 + 60000){
        digitalWrite(R, LOW);
        currentStage = stages[4];
      }*/
  }
   ////////// GPS //////////
 //float latitude = GPS.latitudeDegrees;
 //float longitude = GPS.latitudeDegrees;

  ////////// link data to arrays //////////
  Flight_Log[0] = {currentStage};
  Flight_Log[1] = {avg_alt};
  Flight_Log[2] = {acc[1]};
  Flight_Log[3] = {acc[2]};
  Flight_Log[4] = {acc[3]};
  Flight_Log[5] = {ang[1]};
  Flight_Log[6] = {ang[2]};
  Flight_Log[7] = {ang[3]};
  /*Flight_Log[8] = {latitude};
  Flight_Log[9] = {longitude};*/

 String data = "";

 for (int i = 0;i < 10;i++){
    data += Flight_Log[i];
    if (i < 10) {
      data += " ";
    }
 }
 Serial.println("Data acquired");
 File dataFile = SD.open("Flight.txt", FILE_WRITE);

 if (dataFile){
  dataFile.println(data);
  dataFile.close();
 }
 else{
  Serial.println("error opening file Flight.txt");
 }

  //RF Communication//

  LoRa.beginPacket();
  LoRa.print(data);
  LoRa.endPacket();
  Serial.println("Packet sent");

  //Debug//

   if (loop_counter % 20 == 0) {
    Serial.print("Stage ");
    Serial.println(Flight_Log[0]);
    Serial.println("Altitude:");
    Serial.println(Flight_Log[1]);
    Serial.println("Acceleration:");
    Serial.println(Flight_Log[2]);
    Serial.println(Flight_Log[3]); 
    Serial.println(Flight_Log[4]);
    Serial.println("Angular orientation:");
    Serial.println(Flight_Log[5]);
    Serial.println(Flight_Log[6]); 
    Serial.println(Flight_Log[7]);
    /*Serial.println("GPS Latitude, GPS Longitude:");
    Serial.println(Flight_Log[8]);
    Serial.println(Flight_Log[9]);  */
  }
 
 loop_counter++;
 music.update();
}
