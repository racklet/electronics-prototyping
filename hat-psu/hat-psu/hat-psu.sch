EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
S 3900 2300 750  500 
U 608055DF
F0 "LMR14050_5V1" 50
F1 "LMR14050_5V1.sch" 50
F2 "en" I L 3900 2400 50 
F3 "V_in" I L 3900 2550 50 
F4 "V_out" O R 4650 2550 50 
$EndSheet
Wire Wire Line
	5750 2600 5750 2150
Wire Wire Line
	3900 2400 2850 2400
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 60810CA8
P 2650 2400
F 0 "J1" H 2700 2600 50  0000 C CNN
F 1 "en" H 2700 2500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2650 2400 50  0001 C CNN
F 3 "~" H 2650 2400 50  0001 C CNN
	1    2650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2500 2900 2500
Wire Wire Line
	2900 2500 2900 2550
$Comp
L power:GND #PWR01
U 1 1 608119F0
P 2900 2550
F 0 "#PWR01" H 2900 2300 50  0001 C CNN
F 1 "GND" H 2905 2377 50  0000 C CNN
F 2 "" H 2900 2550 50  0001 C CNN
F 3 "" H 2900 2550 50  0001 C CNN
	1    2900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2550 3450 2550
Wire Wire Line
	3450 2550 3450 3100
Wire Wire Line
	6150 3100 6200 3100
Wire Wire Line
	5350 2800 5300 2800
Wire Wire Line
	5300 2800 5300 2550
$Comp
L Device:C_Small C7
U 1 1 6081D6DC
P 5550 2300
F 0 "C7" H 5642 2346 50  0000 L CNN
F 1 "100n" H 5642 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5550 2300 50  0001 C CNN
F 3 "~" H 5550 2300 50  0001 C CNN
	1    5550 2300
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Current:ACS723xLCTR-10AU U2
U 1 1 6082C4DA
P 5750 3000
F 0 "U2" H 6150 3500 50  0000 C CNN
F 1 "ACS723xLCTR-10AU" H 6200 3400 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5850 2650 50  0001 L CIN
F 3 "http://www.allegromicro.com/~/media/Files/Datasheets/ACS723-Datasheet.ashx?la=en" H 5750 3000 50  0001 C CNN
	1    5750 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J2
U 1 1 6080AE45
P 2850 3200
F 0 "J2" H 2907 3517 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 2907 3426 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 2900 3160 50  0001 C CNN
F 3 "~" H 2900 3160 50  0001 C CNN
	1    2850 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3300 3200 3300
Wire Wire Line
	3450 3300 3450 3350
$Comp
L power:GND #PWR0110
U 1 1 6080FDE2
P 3450 3350
F 0 "#PWR0110" H 3450 3100 50  0001 C CNN
F 1 "GND" H 3455 3177 50  0000 C CNN
F 2 "" H 3450 3350 50  0001 C CNN
F 3 "" H 3450 3350 50  0001 C CNN
	1    3450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3200 3200 3200
Wire Wire Line
	3200 3200 3200 3300
Connection ~ 3200 3300
Wire Wire Line
	3200 3300 3450 3300
Wire Wire Line
	3150 3100 3450 3100
$Comp
L power:GND #PWR03
U 1 1 6080FCE0
P 5750 3500
F 0 "#PWR03" H 5750 3250 50  0001 C CNN
F 1 "GND" H 5755 3327 50  0000 C CNN
F 2 "" H 5750 3500 50  0001 C CNN
F 3 "" H 5750 3500 50  0001 C CNN
	1    5750 3500
	1    0    0    -1  
$EndComp
Text Notes 5850 2400 0    50   ~ 0
Current measurement
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
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 60834467
P 7900 2900
F 0 "J3" H 7872 2832 50  0000 R CNN
F 1 "measurement" H 8100 2650 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7900 2900 50  0001 C CNN
F 3 "~" H 7900 2900 50  0001 C CNN
	1    7900 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7700 3000 7550 3000
Wire Wire Line
	7550 3000 7550 3050
$Comp
L power:GND #PWR05
U 1 1 60838E63
P 7550 3050
F 0 "#PWR05" H 7550 2800 50  0001 C CNN
F 1 "GND" H 7555 2877 50  0000 C CNN
F 2 "" H 7550 3050 50  0001 C CNN
F 3 "" H 7550 3050 50  0001 C CNN
	1    7550 3050
	1    0    0    -1  
$EndComp
Text Notes 2550 3550 0    50   ~ 0
Voltage Input
Text Notes 6100 5050 0    50   ~ 0
With these resistor values the 5.1V\nrail will correspond to 3.06V\ngiving some room measurement\naround the target voltage\n(can measure up to 5.5V with 3.3V DAC)
Text Label 6200 2800 0    50   ~ 0
V_adc_i
Wire Wire Line
	7000 2900 7700 2900
Wire Wire Line
	7000 4500 7000 2900
Text Label 6400 4500 0    50   ~ 0
V_adc_v
Text GLabel 4450 3450 0    50   Input ~ 0
5V1
Text Notes 5450 3900 0    50   ~ 0
Voltage measurement
Wire Wire Line
	5700 4500 5700 4450
Connection ~ 5700 4500
Wire Wire Line
	5700 4500 7000 4500
$Comp
L power:GND #PWR04
U 1 1 6081ED5C
P 5700 4900
F 0 "#PWR04" H 5700 4650 50  0001 C CNN
F 1 "GND" H 5705 4727 50  0000 C CNN
F 2 "" H 5700 4900 50  0001 C CNN
F 3 "" H 5700 4900 50  0001 C CNN
	1    5700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4850 5700 4900
Wire Wire Line
	5700 4550 5700 4500
$Comp
L Device:R R5
U 1 1 6081DC05
P 5700 4700
F 0 "R5" H 5770 4746 50  0000 L CNN
F 1 "3.3k" H 5770 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 4700 50  0001 C CNN
F 3 "~" H 5700 4700 50  0001 C CNN
	1    5700 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 6081D6FF
P 5700 4300
F 0 "R4" H 5770 4346 50  0000 L CNN
F 1 "2.2k" H 5770 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 4300 50  0001 C CNN
F 3 "~" H 5700 4300 50  0001 C CNN
	1    5700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4050 5700 4150
Wire Wire Line
	5600 4050 5700 4050
Text GLabel 5600 4050 0    50   Input ~ 0
5V1
Text GLabel 7300 3550 0    50   Input ~ 0
5V1
$Comp
L power:GND #PWR0112
U 1 1 60839721
P 7300 3650
F 0 "#PWR0112" H 7300 3400 50  0001 C CNN
F 1 "GND" H 7305 3477 50  0000 C CNN
F 2 "" H 7300 3650 50  0001 C CNN
F 3 "" H 7300 3650 50  0001 C CNN
	1    7300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3550 7400 3550
Wire Wire Line
	7300 3650 7400 3650
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 6083A844
P 7600 3650
F 0 "J4" H 7650 3850 50  0000 C CNN
F 1 "pi_5V" H 7650 3750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7600 3650 50  0001 C CNN
F 3 "~" H 7600 3650 50  0001 C CNN
	1    7600 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 60999573
P 4800 3450
F 0 "JP1" H 4800 3714 50  0000 C CNN
F 1 "Ammeter" H 4800 3623 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4800 3450 50  0001 C CNN
F 3 "~" H 4800 3450 50  0001 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6099D34A
P 2400 4750
F 0 "H3" H 2500 4796 50  0000 L CNN
F 1 "MountingHole" H 2500 4705 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 2400 4750 50  0001 C CNN
F 3 "~" H 2400 4750 50  0001 C CNN
	1    2400 4750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6099DCD7
P 2400 4550
F 0 "H2" H 2500 4596 50  0000 L CNN
F 1 "MountingHole" H 2500 4505 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 2400 4550 50  0001 C CNN
F 3 "~" H 2400 4550 50  0001 C CNN
	1    2400 4550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6099DFD8
P 2400 4350
F 0 "H1" H 2500 4396 50  0000 L CNN
F 1 "MountingHole" H 2500 4305 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 2400 4350 50  0001 C CNN
F 3 "~" H 2400 4350 50  0001 C CNN
	1    2400 4350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6099E18F
P 2400 4950
F 0 "H4" H 2500 4996 50  0000 L CNN
F 1 "MountingHole" H 2500 4905 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 2400 4950 50  0001 C CNN
F 3 "~" H 2400 4950 50  0001 C CNN
	1    2400 4950
	1    0    0    -1  
$EndComp
Text Label 3650 2550 0    50   ~ 0
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
Wire Wire Line
	6150 2800 7700 2800
Wire Wire Line
	4450 3450 4500 3450
Wire Wire Line
	5300 3100 5300 3450
Wire Wire Line
	5300 3450 5100 3450
Wire Wire Line
	5300 3100 5350 3100
Wire Notes Line
	3600 3750 3600 1900
Wire Notes Line
	3600 1900 2400 1900
Wire Notes Line
	2400 1900 2400 3750
Wire Notes Line
	2400 3750 3600 3750
Wire Notes Line
	7050 3950 7050 2400
Wire Notes Line
	7050 2400 8300 2400
Wire Notes Line
	8300 2400 8300 3950
Wire Notes Line
	8300 3950 7050 3950
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 609EFA09
P 1850 2450
F 0 "J?" H 1768 2125 50  0000 C CNN
F 1 "Conn_01x02" H 1768 2216 50  0000 C CNN
F 2 "" H 1850 2450 50  0001 C CNN
F 3 "~" H 1850 2450 50  0001 C CNN
	1    1850 2450
	-1   0    0    1   
$EndComp
Text Notes 3300 900  0    50   ~ 0
! Think about HAT backpowering
Wire Wire Line
	5750 3400 5750 3500
$Comp
L power:VBUS #PWR0113
U 1 1 609F1BE2
P 5750 2000
F 0 "#PWR0113" H 5750 1850 50  0001 C CNN
F 1 "VBUS" H 5765 2173 50  0000 C CNN
F 2 "" H 5750 2000 50  0001 C CNN
F 3 "" H 5750 2000 50  0001 C CNN
	1    5750 2000
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0114
U 1 1 609F1E09
P 6200 3100
F 0 "#PWR0114" H 6200 2950 50  0001 C CNN
F 1 "VBUS" H 6215 3273 50  0000 C CNN
F 2 "" H 6200 3100 50  0001 C CNN
F 3 "" H 6200 3100 50  0001 C CNN
	1    6200 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2550 5300 2550
$Comp
L power:GND #PWR0115
U 1 1 609F48BC
P 5550 2400
F 0 "#PWR0115" H 5550 2150 50  0001 C CNN
F 1 "GND" H 5555 2227 50  0000 C CNN
F 2 "" H 5550 2400 50  0001 C CNN
F 3 "" H 5550 2400 50  0001 C CNN
	1    5550 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2200 5550 2150
Wire Wire Line
	5550 2150 5750 2150
Connection ~ 5750 2150
Wire Wire Line
	5750 2150 5750 2000
Text Notes 3300 1000 0    50   ~ 0
! Reverse polarity protection?
$EndSCHEMATC
