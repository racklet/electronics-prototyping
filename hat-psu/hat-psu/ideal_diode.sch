EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 9
Title "Compute unit HAT attachment"
Date "2021-06-13"
Rev "0.1.1"
Comp "Racklet"
Comment1 "https://racklet.io"
Comment2 "https://github.com/racklet/racklet"
Comment3 ""
Comment4 "Author: Verneri Hirvonen"
$EndDescr
Text HLabel 6750 3500 2    50   Output ~ 0
CATHODE
Text HLabel 4000 3500 0    50   Input ~ 0
ANODE
Text Notes 3000 3000 0    50   ~ 0
Prevent power delivery to PSU\nif the normal Pi PSU is connected\n\n* TODO: Select a suitable diode\n* TODO: Adjust PSU output voltage to\n    take the voltage drop over this diode into account\n\nOR\n\n* Ideal 0V forward voltage diode circuit:\n    https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3b_1p2_reduced.pdf\n* https://github.com/raspberrypi/hats/blob/master/zvd-circuit.png
$Comp
L Device:Q_PMOS_GSD Q2
U 1 1 60BE7E39
P 5350 3600
F 0 "Q2" V 5692 3600 50  0000 C CNN
F 1 " TSM500P02CX" V 5601 3600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 3700 50  0001 C CNN
F 3 "~" H 5350 3600 50  0001 C CNN
	1    5350 3600
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC857BS Q1
U 1 1 60BEE94E
P 5050 4150
F 0 "Q1" H 5241 4104 50  0000 L CNN
F 1 "BCM857BS" H 5241 4195 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5250 4250 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/BCM857BS.pdf" H 5050 4150 50  0001 C CNN
	1    5050 4150
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:BC857BS Q1
U 2 1 60BEF586
P 5650 4150
F 0 "Q1" H 5840 4104 50  0000 L CNN
F 1 "BCM857BS" H 5840 4195 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5850 4250 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/BCM857BS.pdf" H 5650 4150 50  0001 C CNN
	1    5650 4150
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60BF5068
P 4950 4650
F 0 "R4" H 5009 4696 50  0000 L CNN
F 1 "10k" H 5009 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4950 4650 50  0001 C CNN
F 3 "~" H 4950 4650 50  0001 C CNN
	1    4950 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 60BF5408
P 5750 4650
F 0 "R5" H 5809 4696 50  0000 L CNN
F 1 "47k" H 5809 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5750 4650 50  0001 C CNN
F 3 "~" H 5750 4650 50  0001 C CNN
	1    5750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4350 5750 4500
Wire Wire Line
	5350 4500 5750 4500
Connection ~ 5750 4500
Wire Wire Line
	5750 4500 5750 4550
Wire Wire Line
	4950 4350 4950 4400
Wire Wire Line
	5450 4150 5450 4400
Wire Wire Line
	5450 4400 5250 4400
Connection ~ 4950 4400
Wire Wire Line
	4950 4400 4950 4550
Wire Wire Line
	5350 3800 5350 4500
Wire Wire Line
	5250 4150 5250 4400
Connection ~ 5250 4400
Wire Wire Line
	5250 4400 4950 4400
Wire Wire Line
	4950 4750 4950 4800
$Comp
L power:GND #PWR020
U 1 1 60BF8821
P 4950 4800
F 0 "#PWR020" H 4950 4550 50  0001 C CNN
F 1 "GND" H 4955 4627 50  0000 C CNN
F 2 "" H 4950 4800 50  0001 C CNN
F 3 "" H 4950 4800 50  0001 C CNN
	1    4950 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 60BF8875
P 5750 4800
F 0 "#PWR021" H 5750 4550 50  0001 C CNN
F 1 "GND" H 5755 4627 50  0000 C CNN
F 2 "" H 5750 4800 50  0001 C CNN
F 3 "" H 5750 4800 50  0001 C CNN
	1    5750 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4800 5750 4750
Wire Wire Line
	4950 3950 4950 3500
Wire Wire Line
	4000 3500 4950 3500
Wire Wire Line
	4950 3500 5150 3500
Connection ~ 4950 3500
Wire Wire Line
	5550 3500 5750 3500
Wire Wire Line
	5750 3950 5750 3500
Connection ~ 5750 3500
Wire Wire Line
	5750 3500 6750 3500
Wire Notes Line
	4450 4450 4450 3950
Wire Notes Line
	4450 3950 6250 3950
Wire Notes Line
	6250 3950 6250 4450
Wire Notes Line
	6250 4450 4450 4450
Text Notes 5250 3750 0    50   ~ 0
G
Text Notes 5100 3600 0    50   ~ 0
D
Text Notes 5550 3600 0    50   ~ 0
S
$EndSCHEMATC
