EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
Title "Compute unit HAT attachment"
Date "2021-06-13"
Rev "0.1.1"
Comp "Racklet"
Comment1 "https://racklet.io"
Comment2 "https://github.com/racklet/racklet"
Comment3 ""
Comment4 "Author: Verneri Hirvonen"
$EndDescr
$Comp
L Connector:Barrel_Jack_Switch J2
U 1 1 6080AE45
P 1300 1900
F 0 "J2" H 1357 2217 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1357 2126 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 1350 1860 50  0001 C CNN
F 3 "~" H 1350 1860 50  0001 C CNN
	1    1300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2000 1650 2000
$Comp
L power:GND #PWR0110
U 1 1 6080FDE2
P 1650 2050
F 0 "#PWR0110" H 1650 1800 50  0001 C CNN
F 1 "GND" H 1655 1877 50  0000 C CNN
F 2 "" H 1650 2050 50  0001 C CNN
F 3 "" H 1650 2050 50  0001 C CNN
	1    1650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1900 1650 1900
Wire Wire Line
	1650 1900 1650 2000
Connection ~ 1650 2000
$Comp
L power:GND #PWR0111
U 1 1 60832E6C
P 850 800
F 0 "#PWR0111" H 850 550 50  0001 C CNN
F 1 "GND" H 855 627 50  0000 C CNN
F 2 "" H 850 800 50  0001 C CNN
F 3 "" H 850 800 50  0001 C CNN
	1    850  800 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 6083393A
P 850 800
F 0 "#FLG0103" H 850 875 50  0001 C CNN
F 1 "PWR_FLAG" H 850 973 50  0000 C CNN
F 2 "" H 850 800 50  0001 C CNN
F 3 "~" H 850 800 50  0001 C CNN
	1    850  800 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6099D34A
P 6050 7200
F 0 "H3" H 6150 7246 50  0000 L CNN
F 1 "MountingHole" H 6150 7155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 6050 7200 50  0001 C CNN
F 3 "~" H 6050 7200 50  0001 C CNN
	1    6050 7200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6099DCD7
P 6050 7000
F 0 "H2" H 6150 7046 50  0000 L CNN
F 1 "MountingHole" H 6150 6955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 6050 7000 50  0001 C CNN
F 3 "~" H 6050 7000 50  0001 C CNN
	1    6050 7000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6099DFD8
P 6050 6800
F 0 "H1" H 6150 6846 50  0000 L CNN
F 1 "MountingHole" H 6150 6755 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 6050 6800 50  0001 C CNN
F 3 "~" H 6050 6800 50  0001 C CNN
	1    6050 6800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6099E18F
P 6050 7400
F 0 "H4" H 6150 7446 50  0000 L CNN
F 1 "MountingHole" H 6150 7355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 6050 7400 50  0001 C CNN
F 3 "~" H 6050 7400 50  0001 C CNN
	1    6050 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 60999573
P 6500 2850
F 0 "JP1" H 6650 3050 50  0000 C CNN
F 1 "Ammeter" H 6300 3050 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6500 2850 50  0001 C CNN
F 3 "~" H 6500 2850 50  0001 C CNN
	1    6500 2850
	1    0    0    -1  
$EndComp
Text Notes 5550 2200 0    50   ~ 0
Power measurement
Wire Wire Line
	3800 3000 3850 3000
Text Notes 4950 2700 0    50   ~ 0
current sense shunt\nTODO: Does this\nhave to be 10mohm?
Wire Wire Line
	9200 3200 9050 3200
Wire Wire Line
	9050 3200 9050 3300
$Comp
L power:GND #PWR05
U 1 1 60AE3D9A
P 9050 3300
F 0 "#PWR05" H 9050 3050 50  0001 C CNN
F 1 "GND" H 9055 3127 50  0000 C CNN
F 2 "" H 9050 3300 50  0001 C CNN
F 3 "" H 9050 3300 50  0001 C CNN
	1    9050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2850 6800 2850
Text Notes 7000 6500 0    50   ~ 0
This schematic follows the Raspberry Pi HAT design guide:\nhttps://github.com/raspberrypi/hats/blob/master/designguide.md
Text Notes 1100 2200 0    50   ~ 0
DC Jack
Wire Wire Line
	2350 1800 1600 1800
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J4
U 1 1 60A52FC7
P 1250 2950
F 0 "J4" H 1250 3500 50  0000 C CNN
F 1 "Backplane connector" H 1300 3350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 1250 2950 50  0001 C CNN
F 3 "~" H 1250 2950 50  0001 C CNN
	1    1250 2950
	1    0    0    -1  
$EndComp
Text Label 1050 2950 2    50   ~ 0
USB_D+
Text Label 1050 3050 2    50   ~ 0
USB_D-
Text Notes 3650 5000 0    50   ~ 0
R3 value selects I2C address as specified\nin the PAC1921 datasheet on page 23\nopen -> 0011_000
Text Label 3800 3000 2    50   ~ 0
DCDC_EN
Text GLabel 4850 2800 1    50   Input ~ 0
5V1
Wire Wire Line
	8700 2850 9200 2850
Text Notes 7900 2600 0    50   ~ 0
Backpowering diode circuit
Text Notes 2150 7050 0    50   ~ 0
5V1 Green LED:\nV_f = 2.20V\nI = 0.010A\nR = (5.10V - 2.20V) / 0.010A\n  = 290 ohm ≈ 330 ohm
Text Notes 950  6200 0    50   ~ 0
Power indicators
Text GLabel 1050 6750 1    50   Input ~ 0
5V1
$Comp
L power:GND #PWR012
U 1 1 60A8DC82
P 1050 7350
F 0 "#PWR012" H 1050 7100 50  0001 C CNN
F 1 "GND" H 1055 7177 50  0000 C CNN
F 2 "" H 1050 7350 50  0001 C CNN
F 3 "" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 60A8CF46
P 1050 7200
F 0 "R10" H 1120 7246 50  0000 L CNN
F 1 "330" H 1120 7155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 980 7200 50  0001 C CNN
F 3 "~" H 1050 7200 50  0001 C CNN
	1    1050 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 60A8C560
P 1050 6900
F 0 "D2" V 1089 6782 50  0000 R CNN
F 1 "GREEN" V 998 6782 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1050 6900 50  0001 C CNN
F 3 "~" H 1050 6900 50  0001 C CNN
	1    1050 6900
	0    -1   -1   0   
$EndComp
$Comp
L Graphic:Logo_Open_Hardware_Small #LOGO1
U 1 1 60ABE771
P 10900 6850
F 0 "#LOGO1" H 10900 7125 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 10900 6625 50  0001 C CNN
F 2 "" H 10900 6850 50  0001 C CNN
F 3 "~" H 10900 6850 50  0001 C CNN
	1    10900 6850
	1    0    0    -1  
$EndComp
Wire Notes Line
	4400 4200 4300 4200
Wire Notes Line
	4300 4200 4300 4700
Text Notes 2900 3100 0    50   ~ 0
G
Text Notes 2600 2950 0    50   ~ 0
D
Text Notes 3050 2950 0    50   ~ 0
S
Text Notes 2450 2500 0    50   ~ 0
P-Channel MOSFET\nReverse polarity protection
$Comp
L power:GND #PWR0101
U 1 1 60B9270C
P 2850 3150
F 0 "#PWR0101" H 2850 2900 50  0001 C CNN
F 1 "GND" H 2855 2977 50  0000 C CNN
F 2 "" H 2850 3150 50  0001 C CNN
F 3 "" H 2850 3150 50  0001 C CNN
	1    2850 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2850 3350 2850
$Comp
L Transistor_FET:FDS9435A Q3
U 1 1 60BB8B0E
P 2850 2950
F 0 "Q3" V 3192 2950 50  0000 C CNN
F 1 "FDS4435BZ" V 3101 2950 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3050 2875 50  0001 L CIN
F 3 "https://rocelec.widen.net/view/pdf/rwygqx6rjd/FAIRS27615-1.pdf?t.download=true&u=5oefqw" V 2850 2950 50  0001 L CNN
	1    2850 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 2000 1650 2050
Wire Wire Line
	2350 1800 2350 2850
Text Notes 5150 1200 0    50   ~ 0
Select VDD source with a jumper:\n1. USB power from backplane\n2. DCDC 5.1V Pi PSU voltage rail
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 60C2FFF9
P 3350 2850
F 0 "#FLG0102" H 3350 2925 50  0001 C CNN
F 1 "PWR_FLAG" H 3350 3023 50  0000 C CNN
F 2 "" H 3350 2850 50  0001 C CNN
F 3 "~" H 3350 2850 50  0001 C CNN
	1    3350 2850
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0102
U 1 1 60C31923
P 1250 800
F 0 "#PWR0102" H 1250 650 50  0001 C CNN
F 1 "VDD" H 1265 973 50  0000 C CNN
F 2 "" H 1250 800 50  0001 C CNN
F 3 "" H 1250 800 50  0001 C CNN
	1    1250 800 
	1    0    0    -1  
$EndComp
$Comp
L racklet:PAC1921 U1
U 1 1 60BD6074
P 5250 3900
F 0 "U1" H 5250 4300 50  0000 C CNN
F 1 "PAC1921" H 5250 4200 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-10-1EP_3x3mm_P0.5mm_EP1.55x2.48mm" H 4850 5000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/PAC1921-Data-Sheet-DS20005293E.pdf" H 5200 4350 50  0001 C CNN
	1    5250 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 60BDB96B
P 5250 4450
F 0 "#PWR013" H 5250 4200 50  0001 C CNN
F 1 "GND" H 5255 4277 50  0000 C CNN
F 2 "" H 5250 4450 50  0001 C CNN
F 3 "" H 5250 4450 50  0001 C CNN
	1    5250 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4450 5250 4450
Connection ~ 5250 4450
Wire Wire Line
	5250 4450 5300 4450
$Comp
L Device:R_Small R3
U 1 1 60BE0D90
P 4500 4200
F 0 "R3" H 4559 4246 50  0000 L CNN
F 1 "OPEN" H 4559 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4500 4200 50  0001 C CNN
F 3 "~" H 4500 4200 50  0001 C CNN
	1    4500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4100 4500 4050
Wire Wire Line
	4500 4050 4700 4050
$Comp
L power:GND #PWR03
U 1 1 60BE53DD
P 4500 4350
F 0 "#PWR03" H 4500 4100 50  0001 C CNN
F 1 "GND" H 4505 4177 50  0000 C CNN
F 2 "" H 4500 4350 50  0001 C CNN
F 3 "" H 4500 4350 50  0001 C CNN
	1    4500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4350 4500 4300
Wire Wire Line
	4700 3950 4600 3950
Wire Wire Line
	4600 3950 4600 3750
Wire Wire Line
	4700 3750 4600 3750
Connection ~ 4600 3750
Wire Wire Line
	4600 3750 4600 3650
$Comp
L Device:R_Small R9
U 1 1 60A94ABA
P 5250 2850
F 0 "R9" V 5150 2900 50  0000 L CNN
F 1 "10m" V 5150 2700 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5250 2850 50  0001 C CNN
F 3 "~" H 5250 2850 50  0001 C CNN
	1    5250 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 2850 5000 3300
Wire Wire Line
	5000 2850 5150 2850
Wire Wire Line
	5500 3300 5500 2850
Wire Wire Line
	5500 2850 5350 2850
Wire Wire Line
	5500 2850 6200 2850
Connection ~ 5500 2850
Wire Wire Line
	4400 2850 4850 2850
Connection ~ 5000 2850
Wire Wire Line
	6600 4500 7250 4500
Wire Wire Line
	7150 4600 7250 4600
Text Label 7150 4700 2    50   ~ 0
USB_D-
Wire Wire Line
	7150 4700 7250 4700
Text Label 7150 4600 2    50   ~ 0
USB_D+
Wire Wire Line
	6900 3850 7250 3850
Connection ~ 6900 3850
Wire Wire Line
	6900 3650 6900 3850
Wire Wire Line
	6650 3750 7250 3750
Wire Wire Line
	6650 3650 6650 3750
$Comp
L Connector:TestPoint TP2
U 1 1 60ACB508
P 6900 3650
F 0 "TP2" H 6958 3768 50  0000 L CNN
F 1 "SDA" H 6958 3677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7100 3650 50  0001 C CNN
F 3 "~" H 7100 3650 50  0001 C CNN
	1    6900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3850 6900 3850
Text Notes 7250 3250 0    50   ~ 0
TODO: Design BMC
Text Notes 7350 5100 0    50   ~ 0
TODO:\nAdd connections\nto compute
Text Notes 5100 6050 0    50   ~ 0
Pull up values were determined with the assumption that:\n* bus capacitance ≈ 50pF\n* bus frequency = 400kHz\nIf the bus capacitance is higher than expected\nsmaller resistors or lower bus speeds can be used.
Text Label 7150 4300 2    50   ~ 0
DCDC_EN
Wire Wire Line
	7250 4300 7150 4300
Wire Wire Line
	6150 3450 6000 3450
Connection ~ 6150 3450
Wire Wire Line
	6150 3450 6150 3350
Wire Wire Line
	6000 3450 6000 3500
Wire Wire Line
	6300 3450 6150 3450
Wire Wire Line
	6300 3500 6300 3450
Wire Wire Line
	6300 3700 6300 3850
$Comp
L Device:R_Small R2
U 1 1 60AC1F26
P 6300 3600
F 0 "R2" H 6359 3646 50  0000 L CNN
F 1 "4.7k" H 6359 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6300 3600 50  0001 C CNN
F 3 "~" H 6300 3600 50  0001 C CNN
	1    6300 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 60AC1A3E
P 6000 3600
F 0 "R1" H 6059 3646 50  0000 L CNN
F 1 "4.7k" H 6059 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6000 3600 50  0001 C CNN
F 3 "~" H 6000 3600 50  0001 C CNN
	1    6000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3750 6650 3750
Wire Wire Line
	6000 3700 6000 3750
Wire Wire Line
	2650 2850 2350 2850
Wire Wire Line
	3850 2850 3350 2850
Connection ~ 3350 2850
Wire Wire Line
	4850 2800 4850 2850
Connection ~ 4850 2850
Wire Wire Line
	4850 2850 5000 2850
Wire Wire Line
	6000 3750 5800 3750
Connection ~ 6000 3750
Wire Wire Line
	5800 3850 6300 3850
Connection ~ 6300 3850
Wire Wire Line
	5800 3950 7250 3950
Wire Wire Line
	7250 4050 5800 4050
$Comp
L power:VBUS #PWR0104
U 1 1 60BFD071
P 6600 4500
F 0 "#PWR0104" H 6600 4350 50  0001 C CNN
F 1 "VBUS" H 6615 4673 50  0000 C CNN
F 2 "" H 6600 4500 50  0001 C CNN
F 3 "" H 6600 4500 50  0001 C CNN
	1    6600 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0105
U 1 1 60BFF460
P 1050 2850
F 0 "#PWR0105" H 1050 2700 50  0001 C CNN
F 1 "VBUS" V 1065 2977 50  0000 L CNN
F 2 "" H 1050 2850 50  0001 C CNN
F 3 "" H 1050 2850 50  0001 C CNN
	1    1050 2850
	0    -1   -1   0   
$EndComp
Text GLabel 1050 3150 0    50   Input ~ 0
VIN
Text GLabel 1650 2800 1    50   Input ~ 0
VIN
Wire Wire Line
	1550 2850 1650 2850
Connection ~ 2350 2850
Wire Wire Line
	1650 2800 1650 2850
Connection ~ 1650 2850
Wire Wire Line
	1650 2850 2350 2850
$Comp
L power:VBUS #PWR0106
U 1 1 60C027EA
P 1550 3150
F 0 "#PWR0106" H 1550 3000 50  0001 C CNN
F 1 "VBUS" V 1565 3278 50  0000 L CNN
F 2 "" H 1550 3150 50  0001 C CNN
F 3 "" H 1550 3150 50  0001 C CNN
	1    1550 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 3050 2000 3050
Wire Wire Line
	2000 3050 2000 2950
Wire Wire Line
	2000 2950 1550 2950
Wire Wire Line
	2000 3050 2000 3100
Connection ~ 2000 3050
$Comp
L power:GND #PWR0107
U 1 1 60C0707F
P 2000 3100
F 0 "#PWR0107" H 2000 2850 50  0001 C CNN
F 1 "GND" H 2005 2927 50  0000 C CNN
F 2 "" H 2000 3100 50  0001 C CNN
F 3 "" H 2000 3100 50  0001 C CNN
	1    2000 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 60ACB7DA
P 6650 3650
F 0 "TP1" H 6708 3768 50  0000 L CNN
F 1 "SCL" H 6708 3677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6850 3650 50  0001 C CNN
F 3 "~" H 6850 3650 50  0001 C CNN
	1    6650 3650
	1    0    0    -1  
$EndComp
Connection ~ 6650 3750
Wire Wire Line
	7250 3450 7100 3450
Wire Wire Line
	7100 3450 7100 3350
Text Label 7100 3350 2    50   ~ 0
BMC_3V3
Text Label 2950 4200 0    50   ~ 0
BMC_3V3
$Comp
L racklet:MIC5504-3.3YM5-TR U3
U 1 1 60C73EE6
P 2050 4300
F 0 "U3" H 2050 4665 50  0000 C CNN
F 1 "MIC5504-3.3YM5-TR" H 2050 4574 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2100 4750 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/MIC5501-02-03-04-300mA-Single-Output-LDO-in-Small-Packages-DS20006006B.pdf" H 2050 4500 50  0001 C CNN
	1    2050 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 60C74CCB
P 2700 4350
F 0 "C9" H 2792 4396 50  0000 L CNN
F 1 "1u" H 2792 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2700 4350 50  0001 C CNN
F 3 "~" H 2700 4350 50  0001 C CNN
	1    2700 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 60C75210
P 1350 4350
F 0 "C8" H 1442 4396 50  0000 L CNN
F 1 "1u" H 1442 4305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1350 4350 50  0001 C CNN
F 3 "~" H 1350 4350 50  0001 C CNN
	1    1350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4300 1650 4300
Wire Wire Line
	1650 4300 1650 4200
Wire Wire Line
	1650 4200 1700 4200
Wire Wire Line
	1650 4200 1350 4200
Connection ~ 1650 4200
$Comp
L power:GND #PWR018
U 1 1 60C78F62
P 2050 4700
F 0 "#PWR018" H 2050 4450 50  0001 C CNN
F 1 "GND" H 2055 4527 50  0000 C CNN
F 2 "" H 2050 4700 50  0001 C CNN
F 3 "" H 2050 4700 50  0001 C CNN
	1    2050 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4200 2700 4200
Wire Wire Line
	2700 4250 2700 4200
Connection ~ 2700 4200
Wire Wire Line
	2700 4200 2950 4200
Wire Wire Line
	2050 4700 2050 4650
Wire Wire Line
	2700 4450 2700 4650
Wire Wire Line
	2700 4650 2050 4650
Connection ~ 2050 4650
Wire Wire Line
	2050 4650 2050 4600
Wire Wire Line
	2050 4650 1350 4650
Wire Wire Line
	1350 4650 1350 4450
Wire Wire Line
	1350 4250 1350 4200
Connection ~ 1350 4200
Wire Wire Line
	1350 4200 950 4200
$Comp
L power:VBUS #PWR014
U 1 1 60C85D7C
P 950 4200
F 0 "#PWR014" H 950 4050 50  0001 C CNN
F 1 "VBUS" V 965 4327 50  0000 L CNN
F 2 "" H 950 4200 50  0001 C CNN
F 3 "" H 950 4200 50  0001 C CNN
	1    950  4200
	1    0    0    -1  
$EndComp
Text Notes 900  3800 0    50   ~ 0
Regulate BCM 3.3V supply from USB bus (backplane power rail)\nso that it can be controlled independently from the compute power
$Comp
L power:VBUS #PWR0108
U 1 1 60C91355
P 4600 3650
F 0 "#PWR0108" H 4600 3500 50  0001 C CNN
F 1 "VBUS" H 4500 3800 50  0000 L CNN
F 2 "" H 4600 3650 50  0001 C CNN
F 3 "" H 4600 3650 50  0001 C CNN
	1    4600 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR011
U 1 1 60C91F69
P 1650 800
F 0 "#PWR011" H 1650 650 50  0001 C CNN
F 1 "VBUS" H 1550 950 50  0000 L CNN
F 2 "" H 1650 800 50  0001 C CNN
F 3 "" H 1650 800 50  0001 C CNN
	1    1650 800 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60C93399
P 1650 800
F 0 "#FLG01" H 1650 875 50  0001 C CNN
F 1 "PWR_FLAG" H 1650 973 50  0000 C CNN
F 2 "" H 1650 800 50  0001 C CNN
F 3 "~" H 1650 800 50  0001 C CNN
	1    1650 800 
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60C322F5
P 1250 800
F 0 "#FLG0101" H 1250 875 50  0001 C CNN
F 1 "PWR_FLAG" H 1250 973 50  0000 C CNN
F 2 "" H 1250 800 50  0001 C CNN
F 3 "~" H 1250 800 50  0001 C CNN
	1    1250 800 
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 60CA3AA5
P 1650 7350
F 0 "#PWR022" H 1650 7100 50  0001 C CNN
F 1 "GND" H 1655 7177 50  0000 C CNN
F 2 "" H 1650 7350 50  0001 C CNN
F 3 "" H 1650 7350 50  0001 C CNN
	1    1650 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 60CA3AAB
P 1650 7200
F 0 "R11" H 1720 7246 50  0000 L CNN
F 1 "100" H 1720 7155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1580 7200 50  0001 C CNN
F 3 "~" H 1650 7200 50  0001 C CNN
	1    1650 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60CA3AB1
P 1650 6900
F 0 "D1" V 1689 6782 50  0000 R CNN
F 1 "GREEN" V 1598 6782 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1650 6900 50  0001 C CNN
F 3 "~" H 1650 6900 50  0001 C CNN
	1    1650 6900
	0    -1   -1   0   
$EndComp
Text Label 1650 6750 1    50   ~ 0
BMC_3V3
Text Notes 2150 7550 0    50   ~ 0
3V3 Green LED:\nV_f = 2.20V\nI = 0.010A\nR = (3.30V - 2.20V) / 0.010A\n  = 109 ohm ≈ 100 ohm
Wire Notes Line
	6150 4100 6150 5600
$Comp
L power:VBUS #PWR016
U 1 1 60CC9E7D
P 8650 1100
F 0 "#PWR016" H 8650 950 50  0001 C CNN
F 1 "VBUS" H 8550 1250 50  0000 L CNN
F 2 "" H 8650 1100 50  0001 C CNN
F 3 "" H 8650 1100 50  0001 C CNN
	1    8650 1100
	1    0    0    -1  
$EndComp
Text Notes 8400 800  0    50   ~ 0
PAC bypass caps
Wire Wire Line
	8650 1150 8650 1100
Wire Wire Line
	8650 1400 8650 1350
$Comp
L Device:C_Small C1
U 1 1 60B04A0E
P 8650 1250
F 0 "C1" H 8742 1296 50  0000 L CNN
F 1 "0.1u" H 8742 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8650 1250 50  0001 C CNN
F 3 "~" H 8650 1250 50  0001 C CNN
	1    8650 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 60B0405C
P 8650 1400
F 0 "#PWR017" H 8650 1150 50  0001 C CNN
F 1 "GND" H 8655 1227 50  0000 C CNN
F 2 "" H 8650 1400 50  0001 C CNN
F 3 "" H 8650 1400 50  0001 C CNN
	1    8650 1400
	1    0    0    -1  
$EndComp
Text Label 6150 3350 2    50   ~ 0
BMC_3V3
$Comp
L Device:R R99
U 1 1 60FFD411
P 5050 1700
F 0 "R99" H 5120 1746 50  0000 L CNN
F 1 "5.1" H 5120 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4980 1700 50  0001 C CNN
F 3 "~" H 5050 1700 50  0001 C CNN
F 4 "Properties.Globals.TargetVoltage" H 5050 1700 50  0001 C CNN "Value_expr"
	1    5050 1700
	1    0    0    -1  
$EndComp
$Sheet
S 9200 2700 950 600
U 60AD3F6A
F0 "compute_sbc" 50
F1 "compute_sbc.sch" 50
F2 "5.1V" I L 9200 2850 50
F3 "GND" U L 9200 3200 50
$EndSheet
$Sheet
S 7900 2750 800 200
U 60A9D2A2
F0 "ideal_diode" 50
F1 "ideal_diode.sch" 50
F2 "CATHODE" O R 8700 2850 50
F3 "ANODE" I L 7900 2850 50
$EndSheet
$Sheet
S 7250 3350 800 2050
U 60AC90CC
F0 "BMC" 50
F1 "BMC.sch" 50
F2 "PAC_CLK" O L 7250 3750 50
F3 "PAC_DATA" B L 7250 3850 50
F4 "PAC_INT" O L 7250 3950 50
F5 "DCDC_EN" O L 7250 4300 50
F6 "PAC_DAC" I L 7250 4050 50
F7 "USB_D-" I L 7250 4700 50
F8 "USB_D+" I L 7250 4600 50
F9 "USB_5V" I L 7250 4500 50
F10 "3V3" I L 7250 3450 50
$EndSheet
$Sheet
S 3850 2700 550 400
U 60A0E5A4
F0 "BD9E302EFJ_5V1" 50
F1 "BD9E302EFJ_5V1.sch" 50
F2 "VOUT" O R 4400 2850 50
F3 "VIN" I L 3850 2850 50
F4 "EN" I L 3850 3000 50
$EndSheet
$Sheet
S 3850 1600 500 150
U 60FF8D0D
F0 "Properties_hat_psu" 50
F1 "Properties.sch" 50
$EndSheet
$EndSCHEMATC
