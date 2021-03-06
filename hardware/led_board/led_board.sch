EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:matthew
LIBS:led_board-cache
EELAYER 25 0
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
L R R2
U 1 1 56B1171C
P 3800 2100
F 0 "R2" V 3880 2100 50  0000 C CNN
F 1 "8.2R" V 3800 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_2512" V 3730 2100 50  0001 C CNN
F 3 "" H 3800 2100 50  0000 C CNN
	1    3800 2100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR01
U 1 1 56B11916
P 3800 1550
F 0 "#PWR01" H 3800 1400 50  0001 C CNN
F 1 "+12V" H 3800 1690 50  0000 C CNN
F 2 "" H 3800 1550 50  0000 C CNN
F 3 "" H 3800 1550 50  0000 C CNN
	1    3800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2250 3500 2600
$Comp
L R R1
U 1 1 56B120D6
P 3500 2100
F 0 "R1" V 3580 2100 50  0000 C CNN
F 1 "8.2R" V 3500 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_2512" V 3430 2100 50  0001 C CNN
F 3 "" H 3500 2100 50  0000 C CNN
	1    3500 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2250 3800 2600
Wire Wire Line
	3500 3900 3500 4550
Wire Wire Line
	3500 4550 3800 4550
Wire Wire Line
	3800 3900 3800 4900
$Comp
L R R4
U 1 1 56B122C4
P 4550 2100
F 0 "R4" V 4630 2100 50  0000 C CNN
F 1 "8.2R" V 4550 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_2512" V 4480 2100 50  0001 C CNN
F 3 "" H 4550 2100 50  0000 C CNN
	1    4550 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2250 4250 2600
$Comp
L R R3
U 1 1 56B122DB
P 4250 2100
F 0 "R3" V 4330 2100 50  0000 C CNN
F 1 "8.2R" V 4250 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_2512" V 4180 2100 50  0001 C CNN
F 3 "" H 4250 2100 50  0000 C CNN
	1    4250 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2250 4550 2600
Wire Wire Line
	4250 3900 4250 4550
Wire Wire Line
	4250 4550 5000 4550
Wire Wire Line
	4550 3900 4550 4550
$Comp
L CONN_01X03 P2
U 1 1 56B1230B
P 5600 3250
F 0 "P2" H 5600 3450 50  0000 C CNN
F 1 "CONN_01X03" V 5700 3250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm_SMD_Pin1Left" H 5600 3250 50  0001 C CNN
F 3 "" H 5600 3250 50  0000 C CNN
	1    5600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1550 5150 3150
Wire Wire Line
	5150 3150 5400 3150
Wire Wire Line
	3800 4900 5150 4900
Wire Wire Line
	5150 4900 5150 3350
Wire Wire Line
	5150 3350 5400 3350
Connection ~ 3800 4550
Wire Wire Line
	5000 4550 5000 3250
Wire Wire Line
	5000 3250 5400 3250
Connection ~ 4550 4550
$Comp
L CONN_01X03 P1
U 1 1 56B1263F
P 5600 2600
F 0 "P1" H 5600 2800 50  0000 C CNN
F 1 "CONN_01X03" V 5700 2600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm_SMD_Pin1Left" H 5600 2600 50  0001 C CNN
F 3 "" H 5600 2600 50  0000 C CNN
	1    5600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2500 5400 2500
Connection ~ 5350 3150
Wire Wire Line
	5400 2600 5300 2600
Wire Wire Line
	5300 2600 5300 3250
Connection ~ 5300 3250
Connection ~ 5250 3350
Wire Wire Line
	5400 2700 5350 2700
Wire Wire Line
	5350 2700 5350 3150
Wire Wire Line
	5250 3350 5250 2500
$Comp
L CONN_01X01 P3
U 1 1 56B13E36
P 2600 2800
F 0 "P3" H 2600 2900 50  0000 C CNN
F 1 "CONN_01X01" V 2700 2800 50  0000 C CNN
F 2 "matthew:M3" H 2600 2800 50  0001 C CNN
F 3 "" H 2600 2800 50  0000 C CNN
	1    2600 2800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P4
U 1 1 56B13E95
P 2600 3300
F 0 "P4" H 2600 3400 50  0000 C CNN
F 1 "CONN_01X01" V 2700 3300 50  0000 C CNN
F 2 "matthew:M3" H 2600 3300 50  0001 C CNN
F 3 "" H 2600 3300 50  0000 C CNN
	1    2600 3300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 56B13EE8
P 2600 3800
F 0 "P5" H 2600 3900 50  0000 C CNN
F 1 "CONN_01X01" V 2700 3800 50  0000 C CNN
F 2 "matthew:M3" H 2600 3800 50  0001 C CNN
F 3 "" H 2600 3800 50  0000 C CNN
	1    2600 3800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 56B13F3E
P 2600 4300
F 0 "P6" H 2600 4400 50  0000 C CNN
F 1 "CONN_01X01" V 2700 4300 50  0000 C CNN
F 2 "matthew:M3" H 2600 4300 50  0001 C CNN
F 3 "" H 2600 4300 50  0000 C CNN
	1    2600 4300
	1    0    0    -1  
$EndComp
$Comp
L LED D10
U 1 1 59DAABDE
P 4550 2750
F 0 "D10" H 4550 2850 50  0000 C CNN
F 1 "LED" H 4550 2650 50  0000 C CNN
F 2 "matthew:LED3030" H 4550 2750 50  0001 C CNN
F 3 "" H 4550 2750 50  0001 C CNN
	1    4550 2750
	0    -1   -1   0   
$EndComp
$Comp
L LED D11
U 1 1 59DAAE4F
P 4550 3250
F 0 "D11" H 4550 3350 50  0000 C CNN
F 1 "LED" H 4550 3150 50  0000 C CNN
F 2 "matthew:LED3030" H 4550 3250 50  0001 C CNN
F 3 "" H 4550 3250 50  0001 C CNN
	1    4550 3250
	0    -1   -1   0   
$EndComp
$Comp
L LED D12
U 1 1 59DAAE95
P 4550 3750
F 0 "D12" H 4550 3850 50  0000 C CNN
F 1 "LED" H 4550 3650 50  0000 C CNN
F 2 "matthew:LED3030" H 4550 3750 50  0001 C CNN
F 3 "" H 4550 3750 50  0001 C CNN
	1    4550 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4550 3600 4550 3400
Wire Wire Line
	4550 2900 4550 3100
$Comp
L LED D7
U 1 1 59DAB01D
P 4250 2750
F 0 "D7" H 4250 2850 50  0000 C CNN
F 1 "LED" H 4250 2650 50  0000 C CNN
F 2 "matthew:LED3030" H 4250 2750 50  0001 C CNN
F 3 "" H 4250 2750 50  0001 C CNN
	1    4250 2750
	0    -1   -1   0   
$EndComp
$Comp
L LED D8
U 1 1 59DAB023
P 4250 3250
F 0 "D8" H 4250 3350 50  0000 C CNN
F 1 "LED" H 4250 3150 50  0000 C CNN
F 2 "matthew:LED3030" H 4250 3250 50  0001 C CNN
F 3 "" H 4250 3250 50  0001 C CNN
	1    4250 3250
	0    -1   -1   0   
$EndComp
$Comp
L LED D9
U 1 1 59DAB029
P 4250 3750
F 0 "D9" H 4250 3850 50  0000 C CNN
F 1 "LED" H 4250 3650 50  0000 C CNN
F 2 "matthew:LED3030" H 4250 3750 50  0001 C CNN
F 3 "" H 4250 3750 50  0001 C CNN
	1    4250 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4250 3600 4250 3400
Wire Wire Line
	4250 2900 4250 3100
$Comp
L LED D4
U 1 1 59DAB09F
P 3800 2750
F 0 "D4" H 3800 2850 50  0000 C CNN
F 1 "LED" H 3800 2650 50  0000 C CNN
F 2 "matthew:LED3030" H 3800 2750 50  0001 C CNN
F 3 "" H 3800 2750 50  0001 C CNN
	1    3800 2750
	0    -1   -1   0   
$EndComp
$Comp
L LED D5
U 1 1 59DAB0A5
P 3800 3250
F 0 "D5" H 3800 3350 50  0000 C CNN
F 1 "LED" H 3800 3150 50  0000 C CNN
F 2 "matthew:LED3030" H 3800 3250 50  0001 C CNN
F 3 "" H 3800 3250 50  0001 C CNN
	1    3800 3250
	0    -1   -1   0   
$EndComp
$Comp
L LED D6
U 1 1 59DAB0AB
P 3800 3750
F 0 "D6" H 3800 3850 50  0000 C CNN
F 1 "LED" H 3800 3650 50  0000 C CNN
F 2 "matthew:LED3030" H 3800 3750 50  0001 C CNN
F 3 "" H 3800 3750 50  0001 C CNN
	1    3800 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 3600 3800 3400
Wire Wire Line
	3800 2900 3800 3100
$Comp
L LED D1
U 1 1 59DAB1B7
P 3500 2750
F 0 "D1" H 3500 2850 50  0000 C CNN
F 1 "LED" H 3500 2650 50  0000 C CNN
F 2 "matthew:LED3030" H 3500 2750 50  0001 C CNN
F 3 "" H 3500 2750 50  0001 C CNN
	1    3500 2750
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 59DAB1BD
P 3500 3250
F 0 "D2" H 3500 3350 50  0000 C CNN
F 1 "LED" H 3500 3150 50  0000 C CNN
F 2 "matthew:LED3030" H 3500 3250 50  0001 C CNN
F 3 "" H 3500 3250 50  0001 C CNN
	1    3500 3250
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 59DAB1C3
P 3500 3750
F 0 "D3" H 3500 3850 50  0000 C CNN
F 1 "LED" H 3500 3650 50  0000 C CNN
F 2 "matthew:LED3030" H 3500 3750 50  0001 C CNN
F 3 "" H 3500 3750 50  0001 C CNN
	1    3500 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 3600 3500 3400
Wire Wire Line
	3500 2900 3500 3100
Wire Wire Line
	3500 1950 3500 1700
Wire Wire Line
	3500 1700 4250 1700
Wire Wire Line
	3800 1700 3800 1550
Wire Wire Line
	4250 1700 4250 1950
Connection ~ 3800 1700
$Comp
L +12V #PWR02
U 1 1 59DAE09D
P 5150 1550
F 0 "#PWR02" H 5150 1400 50  0001 C CNN
F 1 "+12V" H 5150 1690 50  0000 C CNN
F 2 "" H 5150 1550 50  0000 C CNN
F 3 "" H 5150 1550 50  0000 C CNN
	1    5150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1600 4550 1600
Connection ~ 3800 1600
Wire Wire Line
	3800 1950 3800 1850
Wire Wire Line
	3800 1850 4550 1850
Wire Wire Line
	4550 1600 4550 1950
Connection ~ 4550 1850
$EndSCHEMATC
