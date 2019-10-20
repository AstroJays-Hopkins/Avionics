#include <SPI.h>
#include <LoRa.h>

#include "util.h"

//declare pins for fueling, venting, and disconnect/reset switches
SwInput fuelOn = SwInput(51);
SwInput fuelOff = SwInput(53);
SwInput ignition = SwInput(47);
SwInput bvFwd = SwInput(43);
SwInput bvRev = SwInput(45);
SwInput vent = SwInput(41);
int tOpen = 0;

int8_t CommandV;
int8_t CommandD;
int8_t CommandF;
int8_t BValve;
int8_t trimKey;

//set variables for the condition of each switch
//this corresponds to the desired state of the analogous solenoid
//variable to store list of desired states
int8_t Command[3];

//variable to save last valve command on button to prevent repetitive signal sending? -> only "switch" commands processed
bool prevBVCommand = false;
bool prevIgnitionCommand = false;
bool prevFuelCommand = true;
bool prevVentCommand = true;
bool newCommand = false;

void setup() {
    //begin RF communiation
    LoRa.begin(915E6);
    LoRa.setTxPower(2);
    Serial.begin(9600);
    // Set pullups on switch pins (see schematic)
    pinMode(bvFwd.pin, INPUT_PULLUP);
    pinMode(bvRev.pin, INPUT_PULLUP);
    pinMode(vent.pin, INPUT_PULLUP);
    // Ignition is different due to LED and should not be pulled up
    pinMode(ignition.pin, INPUT);
}

void ventCom(){
    if(getButton(&vent) == LOW && prevVentCommand == true) {
        CommandV = 1; //indicate venting command was sent
        prevVentCommand = false;
        newCommand = true;
    } else if(getButton(&vent) == HIGH && prevVentCommand == false) {
        CommandV = 0;
        prevVentCommand = true;
        newCommand = true;
    }
}

void fuelCom() {
    if(getButton(&fuelOn) == LOW and prevFuelCommand == true) {
        CommandF = 1; //indicate fueling variable was sent
        prevFuelCommand = false;
        newCommand = true;
    } else if(getButton(&fuelOn) == HIGH and prevFuelCommand == false) {
        CommandF = 0; //indicate stop fueling varaible was sent
        prevFuelCommand = true;
        newCommand = true;
    }
}

void BV() {
    if (Serial.available()) {
        // The testing of valve via serial input, which can happen EVEN IF
        // IGNITION LOCK IS LOW
        trimKey = Serial.read();
        if (trimKey == 1 or trimKey == 0) {
             //indicate ball valve was driven in the direction determined by the
            BValve = trimKey;
            newCommand = true;
        }
    } if(getButton(&bvFwd) == LOW && prevBVCommand == false) {
        BValve = 1;
        prevBVCommand = true;
        newCommand = true;
    } else if(getButton(&bvRev) == LOW && prevBVCommand == false) {
        BValve = 0;
        prevBVCommand = true;
        newCommand = true;
    } else if(getButton(&bvFwd) == HIGH && getButton(&bvRev) == HIGH && prevBVCommand == true) {
        BValve = 2;
        prevBVCommand = false;
        newCommand = true;
    }
}

void ignitionCom() {
    if (getButton(&ignition) == HIGH && prevIgnitionCommand != true) {
        //only execute ignition function if key switch is turned to ON position
        BValve = 3; //indicate ignition variable was sent
        prevIgnitionCommand = true;
        newCommand = true;
    }
}

void getCom() { //check states, send commands to open/close valves to rocket
    ventCom();
    fuelCom();
    BV();
    ignitionCom();
}

void loop() {
    CommandV = 2; //set states to default holding state variables
    CommandF = 2;
    BValve = 2;
    trimKey = 2;

    getCom(); //detect desired states
    //compile data packet to send to solenoid actuator
    int8_t Command[3] = {CommandV, CommandF, BValve};
    // Serial.println(Command); //DEBUG: display what you sent as the command
    if(newCommand){
        LoRa.beginPacket(); //start transmission
        for(int i=0; i<3; i++){
            Serial.print(Command[i]);
            LoRa.print(Command[i]); //just gonna send it, asuhh dudes
        }
        LoRa.endPacket();
        Serial.println("New Command");
        Serial.println("------------------------------");
        newCommand = false;
    }
}
