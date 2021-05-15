EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 900  7000 750  500 
U 608055DF
F0 "LMR14050_5V1" 50
F1 "LMR14050_5V1.sch" 50
F2 "en" I L 900 7100 50 
F3 "V_in" I L 900 7250 50 
F4 "V_out" O R 1650 7250 50 
$EndSheet
Wire Wire Line
	4650 2900 3600 2900
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 60810CA8
P 3400 2900
F 0 "J1" H 3450 3100 50  0000 C CNN
F 1 "en" H 3450 3000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3400 2900 50  0001 C CNN
F 3 "~" H 3400 2900 50  0001 C CNN
	1    3400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3000 3650 3000
Wire Wire Line
	3650 3000 3650 3050
$Comp
L power:GND #PWR01
U 1 1 608119F0
P 3650 3050
F 0 "#PWR01" H 3650 2800 50  0001 C CNN
F 1 "GND" H 3655 2877 50  0000 C CNN
F 2 "" H 3650 3050 50  0001 C CNN
F 3 "" H 3650 3050 50  0001 C CNN
	1    3650 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3050 4200 3050
Wire Wire Line
	4200 3050 4200 3600
$Comp
L Connector:Barrel_Jack_Switch J2
U 1 1 6080AE45
P 3600 3700
F 0 "J2" H 3657 4017 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 3657 3926 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 3650 3660 50  0001 C CNN
F 3 "~" H 3650 3660 50  0001 C CNN
	1    3600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3800 3950 3800
Wire Wire Line
	4200 3800 4200 3850
$Comp
L power:GND #PWR0110
U 1 1 6080FDE2
P 4200 3850
F 0 "#PWR0110" H 4200 3600 50  0001 C CNN
F 1 "GND" H 4205 3677 50  0000 C CNN
F 2 "" H 4200 3850 50  0001 C CNN
F 3 "" H 4200 3850 50  0001 C CNN
	1    4200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3700 3950 3700
Wire Wire Line
	3950 3700 3950 3800
Connection ~ 3950 3800
Wire Wire Line
	3950 3800 4200 3800
Wire Wire Line
	3900 3600 4200 3600
$Comp
L power:GND #PWR0111
U 1 1 60832E6C
P 1150 1000
F 0 "#PWR0111" H 1150 750 50  0001 C CNN
F 1 "GND" H 1155 827 50  0000 C CNN
F 2 "" H 1150 1000 50  0001 C CNN
F 3 "" H 1150 1000 50  0001 C CNN
	1    1150 1000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 6083393A
P 1150 1000
F 0 "#FLG0103" H 1150 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 1150 1173 50  0000 C CNN
F 2 "" H 1150 1000 50  0001 C CNN
F 3 "~" H 1150 1000 50  0001 C CNN
	1    1150 1000
	1    0    0    -1  
$EndComp
Text Notes 3300 4050 0    50   ~ 0
Voltage Input
$Comp
L Mechanical:MountingHole H3
U 1 1 6099D34A
P 1300 5250
F 0 "H3" H 1400 5296 50  0000 L CNN
F 1 "MountingHole" H 1400 5205 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 1300 5250 50  0001 C CNN
F 3 "~" H 1300 5250 50  0001 C CNN
	1    1300 5250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6099DCD7
P 1300 5050
F 0 "H2" H 1400 5096 50  0000 L CNN
F 1 "MountingHole" H 1400 5005 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 1300 5050 50  0001 C CNN
F 3 "~" H 1300 5050 50  0001 C CNN
	1    1300 5050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6099DFD8
P 1300 4850
F 0 "H1" H 1400 4896 50  0000 L CNN
F 1 "MountingHole" H 1400 4805 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 1300 4850 50  0001 C CNN
F 3 "~" H 1300 4850 50  0001 C CNN
	1    1300 4850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6099E18F
P 1300 5450
F 0 "H4" H 1400 5496 50  0000 L CNN
F 1 "MountingHole" H 1400 5405 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 1300 5450 50  0001 C CNN
F 3 "~" H 1300 5450 50  0001 C CNN
	1    1300 5450
	1    0    0    -1  
$EndComp
Text Label 4400 3050 0    50   ~ 0
V_in
Wire Wire Line
	7400 1500 7400 1400
Text Label 7400 1500 3    50   ~ 0
V_adc_i
Text Notes 6950 1050 0    50   ~ 0
Test points\nIN - input voltage from wall wart\nADC_I - ACS723 current measurement voltage\nADC_V - Voltage after ACS723 (Pi4 input voltage)
Wire Wire Line
	7000 1500 7000 1400
Text Label 7000 1500 3    50   ~ 0
V_in
Wire Wire Line
	7800 1400 7800 1500
Text Label 7800 1500 3    50   ~ 0
V_adc_v
$Comp
L Connector:TestPoint TP3
U 1 1 609B0570
P 7800 1400
F 0 "TP3" H 7858 1518 50  0000 L CNN
F 1 "V(ACS_V)" H 7858 1427 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8000 1400 50  0001 C CNN
F 3 "~" H 8000 1400 50  0001 C CNN
	1    7800 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 609AF447
P 7400 1400
F 0 "TP2" H 7458 1518 50  0000 L CNN
F 1 "V(ACS_I)" H 7458 1427 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7600 1400 50  0001 C CNN
F 3 "~" H 7600 1400 50  0001 C CNN
	1    7400 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 609A74C8
P 7000 1400
F 0 "TP1" H 7058 1518 50  0000 L CNN
F 1 "V(IN)" H 7058 1427 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7200 1400 50  0001 C CNN
F 3 "~" H 7200 1400 50  0001 C CNN
	1    7000 1400
	1    0    0    -1  
$EndComp
Wire Notes Line
	4350 4250 4350 2400
Wire Notes Line
	4350 2400 3150 2400
Wire Notes Line
	3150 2400 3150 4250
Wire Notes Line
	3150 4250 4350 4250
Text Notes 3300 900  0    50   ~ 0
! Think about HAT backpowering
Text Notes 3300 1000 0    50   ~ 0
! Reverse polarity protection?
Text Notes 900  6850 0    50   ~ 0
5.1V DCDC
Text Notes 3200 2200 0    50   ~ 0
Rethink input connectors
$Sheet
S 4650 2750 550  400 
U 60A0E5A4
F0 "BD9E302EFJ-5V1" 50
F1 "BD9E302EFJ-5V1.sch" 50
F2 "VOUT" O R 5200 2900 50 
F3 "VIN" I L 4650 2900 50 
F4 "EN" I L 4650 3050 50 
$EndSheet
Wire Wire Line
	7600 2500 7600 2350
Connection ~ 7600 2500
Wire Wire Line
	7400 2500 7600 2500
Wire Wire Line
	7400 2550 7400 2500
$Comp
L power:GND #PWR0115
U 1 1 609F48BC
P 7400 2750
F 0 "#PWR0115" H 7400 2500 50  0001 C CNN
F 1 "GND" H 7405 2577 50  0000 C CNN
F 2 "" H 7400 2750 50  0001 C CNN
F 3 "" H 7400 2750 50  0001 C CNN
	1    7400 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2900 7150 2900
$Comp
L power:VBUS #PWR0114
U 1 1 609F1E09
P 8050 3450
F 0 "#PWR0114" H 8050 3300 50  0001 C CNN
F 1 "VBUS" H 8065 3623 50  0000 C CNN
F 2 "" H 8050 3450 50  0001 C CNN
F 3 "" H 8050 3450 50  0001 C CNN
	1    8050 3450
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0113
U 1 1 609F1BE2
P 7600 2350
F 0 "#PWR0113" H 7600 2200 50  0001 C CNN
F 1 "VBUS" H 7615 2523 50  0000 C CNN
F 2 "" H 7600 2350 50  0001 C CNN
F 3 "" H 7600 2350 50  0001 C CNN
	1    7600 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3750 7600 3850
Wire Notes Line
	10150 4300 8900 4300
Wire Notes Line
	10150 2750 10150 4300
Wire Notes Line
	8900 2750 10150 2750
Wire Notes Line
	8900 4300 8900 2750
Wire Wire Line
	7150 3450 7200 3450
Wire Wire Line
	7150 3800 6950 3800
Wire Wire Line
	7150 3450 7150 3800
Wire Wire Line
	6300 3800 6350 3800
Wire Wire Line
	8000 3150 9550 3150
$Comp
L Device:Jumper JP1
U 1 1 60999573
P 6650 3800
F 0 "JP1" H 6650 4064 50  0000 C CNN
F 1 "Ammeter" H 6650 3973 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6650 3800 50  0001 C CNN
F 3 "~" H 6650 3800 50  0001 C CNN
	1    6650 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 6083A844
P 9450 4000
F 0 "J4" H 9500 4200 50  0000 C CNN
F 1 "pi_5V" H 9500 4100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 4000 50  0001 C CNN
F 3 "~" H 9450 4000 50  0001 C CNN
	1    9450 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 4000 9250 4000
Wire Wire Line
	9150 3900 9250 3900
$Comp
L power:GND #PWR0112
U 1 1 60839721
P 9150 4000
F 0 "#PWR0112" H 9150 3750 50  0001 C CNN
F 1 "GND" H 9155 3827 50  0000 C CNN
F 2 "" H 9150 4000 50  0001 C CNN
F 3 "" H 9150 4000 50  0001 C CNN
	1    9150 4000
	1    0    0    -1  
$EndComp
Text GLabel 9150 3900 0    50   Input ~ 0
5V1
Text GLabel 7450 4400 0    50   Input ~ 0
5V1
Wire Wire Line
	7450 4400 7550 4400
Wire Wire Line
	7550 4400 7550 4500
$Comp
L Device:R R4
U 1 1 6081D6FF
P 7550 4650
F 0 "R4" H 7620 4696 50  0000 L CNN
F 1 "2.2k" H 7620 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7480 4650 50  0001 C CNN
F 3 "~" H 7550 4650 50  0001 C CNN
	1    7550 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 6081DC05
P 7550 5050
F 0 "R5" H 7620 5096 50  0000 L CNN
F 1 "3.3k" H 7620 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7480 5050 50  0001 C CNN
F 3 "~" H 7550 5050 50  0001 C CNN
	1    7550 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4900 7550 4850
Wire Wire Line
	7550 5200 7550 5250
$Comp
L power:GND #PWR04
U 1 1 6081ED5C
P 7550 5250
F 0 "#PWR04" H 7550 5000 50  0001 C CNN
F 1 "GND" H 7555 5077 50  0000 C CNN
F 2 "" H 7550 5250 50  0001 C CNN
F 3 "" H 7550 5250 50  0001 C CNN
	1    7550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4850 8850 4850
Connection ~ 7550 4850
Wire Wire Line
	7550 4850 7550 4800
Text Notes 7300 4250 0    50   ~ 0
Voltage measurement
Text GLabel 6300 3800 0    50   Input ~ 0
5V1
Text Label 8250 4850 0    50   ~ 0
V_adc_v
Wire Wire Line
	8850 4850 8850 3250
Wire Wire Line
	8850 3250 9550 3250
Text Label 8050 3150 0    50   ~ 0
V_adc_i
Text Notes 7950 5400 0    50   ~ 0
With these resistor values the 5.1V\nrail will correspond to 3.06V\ngiving some room measurement\naround the target voltage\n(can measure up to 5.5V with 3.3V DAC)
$Comp
L power:GND #PWR05
U 1 1 60838E63
P 9400 3400
F 0 "#PWR05" H 9400 3150 50  0001 C CNN
F 1 "GND" H 9405 3227 50  0000 C CNN
F 2 "" H 9400 3400 50  0001 C CNN
F 3 "" H 9400 3400 50  0001 C CNN
	1    9400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3350 9400 3400
Wire Wire Line
	9550 3350 9400 3350
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 60834467
P 9750 3250
F 0 "J3" H 9722 3182 50  0000 R CNN
F 1 "measurement" H 9950 3000 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9750 3250 50  0001 C CNN
F 3 "~" H 9750 3250 50  0001 C CNN
	1    9750 3250
	-1   0    0    1   
$EndComp
Text Notes 7700 2750 0    50   ~ 0
Current measurement
$Comp
L power:GND #PWR03
U 1 1 6080FCE0
P 7600 3850
F 0 "#PWR03" H 7600 3600 50  0001 C CNN
F 1 "GND" H 7605 3677 50  0000 C CNN
F 2 "" H 7600 3850 50  0001 C CNN
F 3 "" H 7600 3850 50  0001 C CNN
	1    7600 3850
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Current:ACS723xLCTR-10AU U2
U 1 1 6082C4DA
P 7600 3350
F 0 "U2" H 8000 3850 50  0000 C CNN
F 1 "ACS723xLCTR-10AU" H 8050 3750 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7700 3000 50  0001 L CIN
F 3 "http://www.allegromicro.com/~/media/Files/Datasheets/ACS723-Datasheet.ashx?la=en" H 7600 3350 50  0001 C CNN
	1    7600 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 6081D6DC
P 7400 2650
F 0 "C7" H 7492 2696 50  0000 L CNN
F 1 "100n" H 7492 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7400 2650 50  0001 C CNN
F 3 "~" H 7400 2650 50  0001 C CNN
	1    7400 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7150 3150 7150 2900
Wire Wire Line
	7200 3150 7150 3150
Wire Wire Line
	8000 3450 8050 3450
Wire Wire Line
	7600 2950 7600 2500
$EndSCHEMATC
