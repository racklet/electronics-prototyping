EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 3
Title "Special Computing Machine Power Distribution Test Board"
Date "2020-04-22"
Rev "1"
Comp "Verneri Hirvonen"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 5150 5250 2    50   ~ 0
en_signal1
Text Label 6250 5100 0    50   ~ 0
V_out1
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5E8445F7
P 2150 8650
F 0 "#FLG0101" H 2150 8725 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 8823 50  0000 C CNN
F 2 "" H 2150 8650 50  0001 C CNN
F 3 "~" H 2150 8650 50  0001 C CNN
	1    2150 8650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5E844B7C
P 2150 8700
F 0 "#PWR0101" H 2150 8450 50  0001 C CNN
F 1 "GND" H 2155 8527 50  0000 C CNN
F 2 "" H 2150 8700 50  0001 C CNN
F 3 "" H 2150 8700 50  0001 C CNN
	1    2150 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 8650 2150 8700
Text Notes 3850 4950 0    50   ~ 0
External control for\nstarting the regulator\n(and driven load)\n
$Comp
L LMR14050SDDA_reference-rescue:USB_C_Receptacle_USB2.0-Connector J1
U 1 1 5E9DA227
P 10100 3800
F 0 "J1" H 10207 4667 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 10207 4576 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 10250 3800 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 10250 3800 50  0001 C CNN
	1    10100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4700 9800 4750
Wire Wire Line
	9800 4750 10100 4750
Wire Wire Line
	10100 4750 10100 4700
Connection ~ 9800 4750
Wire Wire Line
	9800 4750 9800 4800
$Comp
L power:GND #PWR08
U 1 1 5E9DC209
P 9800 4800
F 0 "#PWR08" H 9800 4550 50  0001 C CNN
F 1 "GND" H 9805 4627 50  0000 C CNN
F 2 "" H 9800 4800 50  0001 C CNN
F 3 "" H 9800 4800 50  0001 C CNN
	1    9800 4800
	1    0    0    -1  
$EndComp
Text Label 10750 3200 0    50   ~ 0
V_out1
Wire Wire Line
	10750 3200 10700 3200
NoConn ~ 10700 3700
NoConn ~ 10700 3800
NoConn ~ 10700 3900
NoConn ~ 10700 4000
NoConn ~ 10700 4300
NoConn ~ 10700 4400
NoConn ~ 10700 3500
NoConn ~ 10700 3400
Wire Wire Line
	4250 5250 5600 5250
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5EA8949D
P 4050 5250
F 0 "J2" H 4158 5431 50  0000 C CNN
F 1 "Conn_EN" H 4158 5340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4050 5250 50  0001 C CNN
F 3 "~" H 4050 5250 50  0001 C CNN
	1    4050 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5350 4300 5350
$Comp
L power:GND #PWR013
U 1 1 5EA8C8FE
P 4300 5350
F 0 "#PWR013" H 4300 5100 50  0001 C CNN
F 1 "GND" H 4305 5177 50  0000 C CNN
F 2 "" H 4300 5350 50  0001 C CNN
F 3 "" H 4300 5350 50  0001 C CNN
	1    4300 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5EA91EA8
P 2200 1250
F 0 "H1" H 2300 1296 50  0000 L CNN
F 1 "MH" H 2300 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2200 1250 50  0001 C CNN
F 3 "~" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5EA92527
P 2550 1250
F 0 "H3" H 2650 1296 50  0000 L CNN
F 1 "MH" H 2650 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2550 1250 50  0001 C CNN
F 3 "~" H 2550 1250 50  0001 C CNN
	1    2550 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EA929B1
P 2200 1500
F 0 "H2" H 2300 1546 50  0000 L CNN
F 1 "MH" H 2300 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2200 1500 50  0001 C CNN
F 3 "~" H 2200 1500 50  0001 C CNN
	1    2200 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5EA92DD5
P 2550 1500
F 0 "H4" H 2650 1546 50  0000 L CNN
F 1 "MH" H 2650 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2550 1500 50  0001 C CNN
F 3 "~" H 2550 1500 50  0001 C CNN
	1    2550 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J3
U 1 1 5E9EF03C
P 2250 10050
F 0 "J3" H 2300 10367 50  0000 C CNN
F 1 "ground holes" H 2300 10276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 2250 10050 50  0001 C CNN
F 3 "~" H 2250 10050 50  0001 C CNN
	1    2250 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 9950 2050 10050
Connection ~ 2050 10050
Wire Wire Line
	2050 10050 2050 10150
Connection ~ 2050 10150
Wire Wire Line
	2050 10150 2050 10250
Connection ~ 2050 10250
Wire Wire Line
	2050 10250 2050 10300
Wire Wire Line
	2550 9950 2550 10050
Connection ~ 2550 10050
Wire Wire Line
	2550 10050 2550 10150
Connection ~ 2550 10150
Wire Wire Line
	2550 10150 2550 10250
Connection ~ 2550 10250
Wire Wire Line
	2550 10250 2550 10300
$Comp
L power:GND #PWR015
U 1 1 5E9F2175
P 2550 10300
F 0 "#PWR015" H 2550 10050 50  0001 C CNN
F 1 "GND" H 2555 10127 50  0000 C CNN
F 2 "" H 2550 10300 50  0001 C CNN
F 3 "" H 2550 10300 50  0001 C CNN
	1    2550 10300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E9F23D5
P 2050 10300
F 0 "#PWR014" H 2050 10050 50  0001 C CNN
F 1 "GND" H 2055 10127 50  0000 C CNN
F 2 "" H 2050 10300 50  0001 C CNN
F 3 "" H 2050 10300 50  0001 C CNN
	1    2050 10300
	1    0    0    -1  
$EndComp
Text Notes 1700 9650 0    50   ~ 0
Holes to solder pin headers\nor wires to help with testing
Text Notes 3350 9650 0    50   ~ 0
Alternative connections for V_in
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5E9F53B8
P 3450 10100
F 0 "J4" H 3342 9775 50  0000 C CNN
F 1 "V_in alt" H 3342 9866 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3450 10100 50  0001 C CNN
F 3 "~" H 3450 10100 50  0001 C CNN
	1    3450 10100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 10000 3800 10000
Wire Wire Line
	3650 10100 3800 10100
$Comp
L power:GND #PWR016
U 1 1 5E9F9941
P 3800 10100
F 0 "#PWR016" H 3800 9850 50  0001 C CNN
F 1 "GND" H 3805 9927 50  0000 C CNN
F 2 "" H 3800 10100 50  0001 C CNN
F 3 "" H 3800 10100 50  0001 C CNN
	1    3800 10100
	1    0    0    -1  
$EndComp
Text Label 3800 10000 0    50   ~ 0
V_in
Text Notes 4750 9650 0    50   ~ 0
Alternative connecitions for V_out
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5EA02216
P 4900 10100
F 0 "J5" H 4792 9775 50  0000 C CNN
F 1 "V_out alt" H 4792 9866 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4900 10100 50  0001 C CNN
F 3 "~" H 4900 10100 50  0001 C CNN
	1    4900 10100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5EA0270E
P 5300 10100
F 0 "#PWR017" H 5300 9850 50  0001 C CNN
F 1 "GND" H 5305 9927 50  0000 C CNN
F 2 "" H 5300 10100 50  0001 C CNN
F 3 "" H 5300 10100 50  0001 C CNN
	1    5300 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 10100 5300 10100
Wire Wire Line
	5100 10000 5300 10000
Text Label 5300 10000 0    50   ~ 0
V_out1
$Comp
L Connector:Barrel_Jack_Switch J6
U 1 1 5E9F25DB
P 6550 10050
F 0 "J6" H 6607 10367 50  0000 C CNN
F 1 "DC_in" H 6607 10276 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 6600 10010 50  0001 C CNN
F 3 "~" H 6600 10010 50  0001 C CNN
	1    6550 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 9950 7050 9950
Text Notes 12100 8850 0    50   ~ 0
TODO:\n- Fuse?\n- Power switch
Text Label 7050 9950 0    50   ~ 0
V_in
Wire Wire Line
	6850 10150 6900 10150
$Comp
L power:GND #PWR018
U 1 1 5E9F7002
P 7050 10150
F 0 "#PWR018" H 7050 9900 50  0001 C CNN
F 1 "GND" H 7055 9977 50  0000 C CNN
F 2 "" H 7050 10150 50  0001 C CNN
F 3 "" H 7050 10150 50  0001 C CNN
	1    7050 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 10050 6900 10050
Wire Wire Line
	6900 10050 6900 10150
Connection ~ 6900 10150
Wire Wire Line
	6900 10150 7050 10150
$Comp
L Connector:Conn_01x02_Female J9
U 1 1 5E9FF313
P 4900 10650
F 0 "J9" H 4792 10325 50  0000 C CNN
F 1 "V_out alt" H 4792 10416 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4900 10650 50  0001 C CNN
F 3 "~" H 4900 10650 50  0001 C CNN
	1    4900 10650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5E9FF319
P 5300 10650
F 0 "#PWR025" H 5300 10400 50  0001 C CNN
F 1 "GND" H 5305 10477 50  0000 C CNN
F 2 "" H 5300 10650 50  0001 C CNN
F 3 "" H 5300 10650 50  0001 C CNN
	1    5300 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 10650 5300 10650
Wire Wire Line
	5100 10550 5300 10550
Text Label 5300 10550 0    50   ~ 0
V_out2
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 5EA02114
P 3450 10650
F 0 "J8" H 3342 10325 50  0000 C CNN
F 1 "V_in alt" H 3342 10416 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3450 10650 50  0001 C CNN
F 3 "~" H 3450 10650 50  0001 C CNN
	1    3450 10650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 10550 3800 10550
Wire Wire Line
	3650 10650 3800 10650
$Comp
L power:GND #PWR020
U 1 1 5EA0211C
P 3800 10650
F 0 "#PWR020" H 3800 10400 50  0001 C CNN
F 1 "GND" H 3805 10477 50  0000 C CNN
F 2 "" H 3800 10650 50  0001 C CNN
F 3 "" H 3800 10650 50  0001 C CNN
	1    3800 10650
	1    0    0    -1  
$EndComp
Text Label 3800 10550 0    50   ~ 0
V_in
$Comp
L LMR14050SDDA_reference-rescue:USB_C_Receptacle_USB2.0-Connector J10
U 1 1 5EA7B416
P 10100 6450
F 0 "J10" H 10207 7317 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 10207 7226 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 10250 6450 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 10250 6450 50  0001 C CNN
	1    10100 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 7350 9800 7400
Wire Wire Line
	9800 7400 10100 7400
Wire Wire Line
	10100 7400 10100 7350
Connection ~ 9800 7400
Wire Wire Line
	9800 7400 9800 7450
$Comp
L power:GND #PWR033
U 1 1 5EA7B421
P 9800 7450
F 0 "#PWR033" H 9800 7200 50  0001 C CNN
F 1 "GND" H 9805 7277 50  0000 C CNN
F 2 "" H 9800 7450 50  0001 C CNN
F 3 "" H 9800 7450 50  0001 C CNN
	1    9800 7450
	1    0    0    -1  
$EndComp
Text Label 10750 5850 0    50   ~ 0
V_out2
Wire Wire Line
	10750 5850 10700 5850
NoConn ~ 10700 6350
NoConn ~ 10700 6450
NoConn ~ 10700 6550
NoConn ~ 10700 6650
NoConn ~ 10700 6950
NoConn ~ 10700 7050
NoConn ~ 10700 6150
NoConn ~ 10700 6050
Text Label 7700 1400 2    50   ~ 0
V_out1
Wire Wire Line
	7700 1400 7700 1450
$Comp
L Device:LED D3
U 1 1 5EB10820
P 7700 1600
F 0 "D3" V 7739 1483 50  0000 R CNN
F 1 "LED" V 7648 1483 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 7700 1600 50  0001 C CNN
F 3 "~" H 7700 1600 50  0001 C CNN
	1    7700 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 1750 7700 1800
$Comp
L Device:R R7
U 1 1 5EB1645C
P 7700 1950
F 0 "R7" H 7770 1996 50  0000 L CNN
F 1 "3.3k" H 7770 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7630 1950 50  0001 C CNN
F 3 "~" H 7700 1950 50  0001 C CNN
	1    7700 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5EB0FF45
P 7700 2150
F 0 "#PWR034" H 7700 1900 50  0001 C CNN
F 1 "GND" H 7705 1977 50  0000 C CNN
F 2 "" H 7700 2150 50  0001 C CNN
F 3 "" H 7700 2150 50  0001 C CNN
	1    7700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2100 7700 2150
Text Label 8300 1400 2    50   ~ 0
V_out2
Wire Wire Line
	8300 1400 8300 1450
$Comp
L Device:LED D4
U 1 1 5EB1F7C7
P 8300 1600
F 0 "D4" V 8339 1483 50  0000 R CNN
F 1 "LED" V 8248 1483 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 8300 1600 50  0001 C CNN
F 3 "~" H 8300 1600 50  0001 C CNN
	1    8300 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 1750 8300 1800
$Comp
L Device:R R8
U 1 1 5EB1F7CE
P 8300 1950
F 0 "R8" H 8370 1996 50  0000 L CNN
F 1 "3.3k" H 8370 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8230 1950 50  0001 C CNN
F 3 "~" H 8300 1950 50  0001 C CNN
	1    8300 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5EB1F7D4
P 8300 2150
F 0 "#PWR035" H 8300 1900 50  0001 C CNN
F 1 "GND" H 8305 1977 50  0000 C CNN
F 2 "" H 8300 2150 50  0001 C CNN
F 3 "" H 8300 2150 50  0001 C CNN
	1    8300 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2100 8300 2150
Text Notes 7450 1250 0    50   ~ 0
Indicator LEDs
Text Notes 3250 8100 0    50   ~ 0
Reverse polarity protection
Text Label 3400 8500 2    50   ~ 0
V_in
Wire Wire Line
	3850 8500 3400 8500
Text Label 4650 8500 0    50   ~ 0
V_in_protected
Text Label 5550 5100 2    50   ~ 0
V_in_protected
Wire Wire Line
	4250 8500 4400 8500
$Comp
L power:GND #PWR036
U 1 1 5EA18C8C
P 4050 9150
F 0 "#PWR036" H 4050 8900 50  0001 C CNN
F 1 "GND" H 4055 8977 50  0000 C CNN
F 2 "" H 4050 9150 50  0001 C CNN
F 3 "" H 4050 9150 50  0001 C CNN
	1    4050 9150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRLML9301 Q1
U 1 1 5EA26248
P 4050 8600
F 0 "Q1" V 4392 8600 50  0000 C CNN
F 1 "IRLML6344TRPBF" V 4301 8600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4250 8525 50  0001 L CIN
F 3 "https://www.infineon.com/dgdl/irlml6344pbf.pdf?fileId=5546d462533600a4015356689c44262c" H 4050 8600 50  0001 L CNN
	1    4050 8600
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener_Small D5
U 1 1 5EA2A726
P 4400 8650
F 0 "D5" V 4354 8718 50  0000 L CNN
F 1 "10V" V 4445 8718 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" V 4400 8650 50  0001 C CNN
F 3 "https://www.digikey.fi/product-detail/fi/on-semiconductor/MM3Z10VST1G/MM3Z10VST1GOSCT-ND/687054" V 4400 8650 50  0001 C CNN
	1    4400 8650
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 8550 4400 8500
Connection ~ 4400 8500
Wire Wire Line
	4400 8500 4650 8500
Wire Wire Line
	4400 8750 4400 8850
Wire Wire Line
	4400 8850 4050 8850
Wire Wire Line
	4050 8850 4050 8800
Wire Wire Line
	4050 8850 4050 8900
Connection ~ 4050 8850
$Comp
L Device:R_Small R9
U 1 1 5EA4E280
P 4050 9000
F 0 "R9" H 4109 9046 50  0000 L CNN
F 1 "100K" H 4109 8955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4050 9000 50  0001 C CNN
F 3 "~" H 4050 9000 50  0001 C CNN
	1    4050 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 9150 4050 9100
$Sheet
S 5600 4850 600  550 
U 60839B8F
F0 "LMR14050_5V1" 50
F1 "LMR14050_5V1.sch" 50
F2 "V_out" O R 6200 5100 50 
F3 "en" I L 5600 5250 50 
F4 "V_in" I L 5600 5100 50 
$EndSheet
Wire Wire Line
	6250 5100 6200 5100
Wire Wire Line
	5550 5100 5600 5100
Text Label 5150 6200 2    50   ~ 0
en_signal2
Text Label 6250 6050 0    50   ~ 0
V_out2
Wire Wire Line
	4250 6200 5600 6200
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 60881EEF
P 4050 6200
F 0 "J?" H 4158 6381 50  0000 C CNN
F 1 "Conn_EN" H 4158 6290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4050 6200 50  0001 C CNN
F 3 "~" H 4050 6200 50  0001 C CNN
	1    4050 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6300 4300 6300
$Comp
L power:GND #PWR?
U 1 1 60881EF6
P 4300 6300
F 0 "#PWR?" H 4300 6050 50  0001 C CNN
F 1 "GND" H 4305 6127 50  0000 C CNN
F 2 "" H 4300 6300 50  0001 C CNN
F 3 "" H 4300 6300 50  0001 C CNN
	1    4300 6300
	1    0    0    -1  
$EndComp
Text Label 5550 6050 2    50   ~ 0
V_in_protected
$Sheet
S 5600 5800 600  550 
U 60881EFC
F0 "sheet60881EE5" 50
F1 "LMR14050_5V1.sch" 50
F2 "V_out" O R 6200 6050 50 
F3 "en" I L 5600 6200 50 
F4 "V_in" I L 5600 6050 50 
$EndSheet
Wire Wire Line
	6250 6050 6200 6050
Wire Wire Line
	5550 6050 5600 6050
$EndSCHEMATC
