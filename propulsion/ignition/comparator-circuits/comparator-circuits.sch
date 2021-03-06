EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Comparator:LM393 U1
U 1 1 5C75B3BE
P 5650 4000
AR Path="/5C75B3BE" Ref="U1"  Part="1" 
AR Path="/5C75A9F8/5C75B3BE" Ref="U?"  Part="1" 
F 0 "U1" H 5650 4367 50  0000 C CNN
F 1 "LM393" H 5650 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5650 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 5650 4000 50  0001 C CNN
	1    5650 4000
	1    0    0    -1  
$EndComp
$Comp
L Comparator:LM393 U1
U 3 1 5C75B3C5
P 6200 3950
AR Path="/5C75B3C5" Ref="U1"  Part="3" 
AR Path="/5C75A9F8/5C75B3C5" Ref="U?"  Part="3" 
F 0 "U1" H 6158 3996 50  0000 L CNN
F 1 "LM393" H 6158 3905 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6200 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 6200 3950 50  0001 C CNN
	3    6200 3950
	1    0    0    -1  
$EndComp
Wire Notes Line
	3200 4350 3200 3500
$Comp
L pspice:R R7
U 1 1 5C75B3CF
P 5000 3850
AR Path="/5C75B3CF" Ref="R7"  Part="1" 
AR Path="/5C75A9F8/5C75B3CF" Ref="R?"  Part="1" 
F 0 "R7" H 5068 3896 50  0000 L CNN
F 1 "50k" H 5068 3805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5000 3850 50  0001 C CNN
F 3 "~" H 5000 3850 50  0001 C CNN
	1    5000 3850
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R8
U 1 1 5C75B3D6
P 5000 4350
AR Path="/5C75B3D6" Ref="R8"  Part="1" 
AR Path="/5C75A9F8/5C75B3D6" Ref="R?"  Part="1" 
F 0 "R8" H 5068 4396 50  0000 L CNN
F 1 "500" H 5068 4305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5000 4350 50  0001 C CNN
F 3 "~" H 5000 4350 50  0001 C CNN
	1    5000 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4100 5000 4100
Connection ~ 5000 4100
Wire Wire Line
	6100 4600 6100 4250
Wire Wire Line
	6100 3650 6100 3450
Text Notes 4050 1500 0    50   ~ 0
Continuity Tester Circuits
$Comp
L pspice:R R5
U 1 1 5C75B3FD
P 4700 3700
AR Path="/5C75B3FD" Ref="R5"  Part="1" 
AR Path="/5C75A9F8/5C75B3FD" Ref="R?"  Part="1" 
F 0 "R5" H 4768 3746 50  0000 L CNN
F 1 "50k" H 4768 3655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4700 3700 50  0001 C CNN
F 3 "~" H 4700 3700 50  0001 C CNN
	1    4700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3450 5000 3450
Wire Wire Line
	5000 3600 5000 3450
Connection ~ 5000 3450
Wire Wire Line
	5000 3450 6100 3450
Wire Wire Line
	6100 4600 6100 4750
Connection ~ 6100 4600
Wire Wire Line
	5950 4000 5950 3350
Wire Notes Line
	6450 3500 6450 4350
$Comp
L Comparator:LM393 U1
U 2 1 5C923FB2
P 3650 4000
F 0 "U1" H 3650 3633 50  0000 C CNN
F 1 "LM393" H 3650 3724 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3650 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 3650 4000 50  0001 C CNN
	2    3650 4000
	-1   0    0    1   
$EndComp
$Comp
L pspice:R R2
U 1 1 5C9243A8
P 4100 4200
AR Path="/5C9243A8" Ref="R2"  Part="1" 
AR Path="/5C75A9F8/5C9243A8" Ref="R?"  Part="1" 
F 0 "R2" H 4168 4246 50  0000 L CNN
F 1 "500" H 4168 4155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4100 4200 50  0001 C CNN
F 3 "~" H 4100 4200 50  0001 C CNN
	1    4100 4200
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R1
U 1 1 5C92460C
P 4100 3700
AR Path="/5C92460C" Ref="R1"  Part="1" 
AR Path="/5C75A9F8/5C92460C" Ref="R?"  Part="1" 
F 0 "R1" H 4168 3746 50  0000 L CNN
F 1 "50k" H 4168 3655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4100 3700 50  0001 C CNN
F 3 "~" H 4100 3700 50  0001 C CNN
	1    4100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3900 4700 3900
Wire Wire Line
	4100 3900 4100 3950
Connection ~ 4100 3950
$Comp
L pspice:R R3
U 1 1 5C925596
P 4400 3850
AR Path="/5C925596" Ref="R3"  Part="1" 
AR Path="/5C75A9F8/5C925596" Ref="R?"  Part="1" 
F 0 "R3" H 4468 3896 50  0000 L CNN
F 1 "50k" H 4468 3805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4400 3850 50  0001 C CNN
F 3 "~" H 4400 3850 50  0001 C CNN
	1    4400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3900 4100 3900
Wire Wire Line
	4100 3450 4400 3450
Connection ~ 4700 3450
Wire Wire Line
	4400 3450 4400 3600
Connection ~ 4400 3450
Wire Wire Line
	4400 3450 4700 3450
Wire Wire Line
	3950 4100 4400 4100
Wire Wire Line
	4100 4450 4100 4600
Wire Wire Line
	4700 3900 4700 3950
Wire Notes Line
	3200 3500 6450 3500
Wire Notes Line
	3200 4350 6450 4350
$Comp
L pspice:R R4
U 1 1 5C963501
P 4400 4350
AR Path="/5C963501" Ref="R4"  Part="1" 
AR Path="/5C75A9F8/5C963501" Ref="R?"  Part="1" 
F 0 "R4" H 4468 4396 50  0000 L CNN
F 1 "500" H 4468 4305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4400 4350 50  0001 C CNN
F 3 "~" H 4400 4350 50  0001 C CNN
	1    4400 4350
	1    0    0    -1  
$EndComp
Connection ~ 4400 4100
$Comp
L pspice:R R6
U 1 1 5C963D37
P 4700 4200
AR Path="/5C963D37" Ref="R6"  Part="1" 
AR Path="/5C75A9F8/5C963D37" Ref="R?"  Part="1" 
F 0 "R6" H 4768 4246 50  0000 L CNN
F 1 "500" H 4768 4155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4700 4200 50  0001 C CNN
F 3 "~" H 4700 4200 50  0001 C CNN
	1    4700 4200
	1    0    0    -1  
$EndComp
Connection ~ 4700 3950
Wire Wire Line
	5000 4600 4700 4600
Connection ~ 5000 4600
Connection ~ 4400 4600
Wire Wire Line
	4400 4600 4100 4600
Wire Wire Line
	5000 4600 6100 4600
Wire Wire Line
	4700 4450 4700 4600
Connection ~ 4700 4600
Wire Wire Line
	4700 4600 4400 4600
$Comp
L Device:C C1
U 1 1 5C964E70
P 6650 3950
F 0 "C1" H 6765 3996 50  0000 L CNN
F 1 "0.1u" H 6765 3905 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 6688 3800 50  0001 C CNN
F 3 "~" H 6650 3950 50  0001 C CNN
	1    6650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3650 6650 3650
Wire Wire Line
	6650 3650 6650 3800
Connection ~ 6100 3650
Wire Wire Line
	6650 4100 6650 4250
Wire Wire Line
	6650 4250 6100 4250
Connection ~ 6100 4250
$Comp
L Connector:Conn_01x05_Female J4
U 1 1 5C9659FB
P 3650 4800
F 0 "J4" V 3497 5048 50  0000 L CNN
F 1 "Conn_01x05_Female" V 3588 5048 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3650 4800 50  0001 C CNN
F 3 "~" H 3650 4800 50  0001 C CNN
	1    3650 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 4600 3850 4600
Connection ~ 4100 4600
Connection ~ 3550 4600
Wire Wire Line
	3550 4600 3450 4600
Connection ~ 3650 4600
Wire Wire Line
	3650 4600 3550 4600
Connection ~ 3750 4600
Wire Wire Line
	3750 4600 3650 4600
Connection ~ 3850 4600
Wire Wire Line
	3850 4600 3750 4600
$Comp
L power:GND #PWR0101
U 1 1 5C9663E3
P 6100 4750
F 0 "#PWR0101" H 6100 4500 50  0001 C CNN
F 1 "GND" H 6105 4577 50  0000 C CNN
F 2 "" H 6100 4750 50  0001 C CNN
F 3 "" H 6100 4750 50  0001 C CNN
	1    6100 4750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5C96666A
P 6100 1800
F 0 "#PWR0102" H 6100 1650 50  0001 C CNN
F 1 "VCC" H 6117 1973 50  0000 C CNN
F 2 "" H 6100 1800 50  0001 C CNN
F 3 "" H 6100 1800 50  0001 C CNN
	1    6100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3350 3350 4000
$Comp
L Connector:Conn_01x06_Female J3
U 1 1 5C969366
P 3550 3150
F 0 "J3" V 3490 2762 50  0000 R CNN
F 1 "Conn_01x06_Female" V 3399 2762 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 3550 3150 50  0001 C CNN
F 3 "~" H 3550 3150 50  0001 C CNN
	1    3550 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 3350 3750 3350
$Comp
L Connector:Conn_01x06_Female J7
U 1 1 5C96944C
P 5350 3150
F 0 "J7" V 5290 2762 50  0000 R CNN
F 1 "Conn_01x06_Female" V 5199 2762 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 5350 3150 50  0001 C CNN
F 3 "~" H 5350 3150 50  0001 C CNN
	1    5350 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 3350 3450 3350
Connection ~ 3350 3350
Connection ~ 3650 3350
Connection ~ 3450 3350
Wire Wire Line
	3450 3350 3550 3350
Connection ~ 3550 3350
Wire Wire Line
	3550 3350 3650 3350
Wire Wire Line
	3750 3350 3850 3350
Connection ~ 3750 3350
Wire Wire Line
	5950 3350 5650 3350
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J2
U 1 1 5C96B69E
P 3550 2600
F 0 "J2" V 3554 2880 50  0000 L CNN
F 1 "Conn_02x05_Counter_Clockwise" V 3645 2880 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 3550 2600 50  0001 C CNN
F 3 "~" H 3550 2600 50  0001 C CNN
	1    3550 2600
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J6
U 1 1 5C96D6CC
P 5350 2600
F 0 "J6" V 5354 2880 50  0000 L CNN
F 1 "Conn_02x05_Counter_Clockwise" V 5445 2880 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 5350 2600 50  0001 C CNN
F 3 "~" H 5350 2600 50  0001 C CNN
	1    5350 2600
	0    1    1    0   
$EndComp
Connection ~ 6100 3450
Wire Wire Line
	6100 1800 6100 1950
$Comp
L Connector:Conn_01x05_Female J1
U 1 1 5C96ED98
P 3550 2150
F 0 "J1" V 3397 2398 50  0000 L CNN
F 1 "Conn_01x05_Female" V 3488 2398 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3550 2150 50  0001 C CNN
F 3 "~" H 3550 2150 50  0001 C CNN
	1    3550 2150
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x05_Female J5
U 1 1 5C96EFFE
P 5350 2150
F 0 "J5" V 5197 2398 50  0000 L CNN
F 1 "Conn_01x05_Female" V 5288 2398 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 5350 2150 50  0001 C CNN
F 3 "~" H 5350 2150 50  0001 C CNN
	1    5350 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 1950 3450 1950
Connection ~ 6100 1950
Wire Wire Line
	6100 1950 6100 3450
Connection ~ 3450 1950
Wire Wire Line
	3450 1950 3550 1950
Connection ~ 3550 1950
Wire Wire Line
	3550 1950 3650 1950
Connection ~ 3650 1950
Wire Wire Line
	3650 1950 3750 1950
Connection ~ 3750 1950
Wire Wire Line
	3750 1950 5150 1950
Wire Wire Line
	5150 2900 5150 2400
Connection ~ 5550 1950
Wire Wire Line
	5550 1950 6100 1950
Wire Wire Line
	5450 1950 5550 1950
Connection ~ 5450 1950
Connection ~ 5350 1950
Wire Wire Line
	5350 1950 5450 1950
Wire Wire Line
	5250 1950 5350 1950
Connection ~ 5250 1950
Wire Wire Line
	5150 1950 5250 1950
Connection ~ 5150 1950
Wire Wire Line
	5150 3350 5250 3350
Connection ~ 5650 3350
Connection ~ 5250 3350
Wire Wire Line
	5250 3350 5350 3350
Connection ~ 5350 3350
Wire Wire Line
	5350 3350 5450 3350
Connection ~ 5450 3350
Wire Wire Line
	5450 3350 5550 3350
Connection ~ 5550 3350
Wire Wire Line
	5550 3350 5650 3350
Wire Wire Line
	5550 2400 5450 2400
Wire Wire Line
	5350 2400 5250 2400
Wire Wire Line
	5250 2900 5350 2900
Wire Wire Line
	5450 2900 5550 2900
Wire Wire Line
	3350 2400 3350 2900
Wire Wire Line
	3450 2400 3550 2400
Wire Wire Line
	3650 2400 3750 2400
Wire Wire Line
	3750 2900 3650 2900
Wire Wire Line
	3550 2900 3450 2900
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 5C98ADD7
P 6350 1750
F 0 "J8" V 6290 1562 50  0000 R CNN
F 1 "Conn_01x02_Female" V 6199 1562 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6350 1750 50  0001 C CNN
F 3 "~" H 6350 1750 50  0001 C CNN
	1    6350 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C98AF29
P 6450 1950
F 0 "#PWR0103" H 6450 1700 50  0001 C CNN
F 1 "GND" H 6455 1777 50  0000 C CNN
F 2 "" H 6450 1950 50  0001 C CNN
F 3 "" H 6450 1950 50  0001 C CNN
	1    6450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1950 6350 1950
$EndSCHEMATC
