EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Compute unit HAT attachment"
Date "2021-06-13"
Rev "0.1.1"
Comp "Racklet"
Comment1 "https://racklet.io"
Comment2 "https://github.com/racklet/racklet"
Comment3 ""
Comment4 "Author: Verneri Hirvonen"
$EndDescr
Text HLabel 3250 2850 0    50   Output ~ 0
PAC_CLK
Text HLabel 3250 2950 0    50   BiDi ~ 0
PAC_DATA
Text HLabel 3250 3050 0    50   Output ~ 0
PAC_INT
Text Notes 2500 2650 0    50   ~ 0
PAC1921 power monitoring\nsensor interface
Wire Notes Line
	3850 2650 5050 2650
Wire Notes Line
	5050 2650 5050 5650
Text Notes 3900 2600 0    50   ~ 0
TODO: Replace with BMC
Wire Wire Line
	3950 2850 3250 2850
Wire Wire Line
	3950 2950 3250 2950
Wire Wire Line
	3950 3050 3250 3050
Wire Wire Line
	3950 3150 3250 3150
$Comp
L power:GND #PWR01
U 1 1 60A78ECB
P 3700 3300
F 0 "#PWR01" H 3700 3050 50  0001 C CNN
F 1 "GND" H 3705 3127 50  0000 C CNN
F 2 "" H 3700 3300 50  0001 C CNN
F 3 "" H 3700 3300 50  0001 C CNN
	1    3700 3300
	1    0    0    -1  
$EndComp
Text HLabel 3250 3850 0    50   Output ~ 0
DCDC_EN
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 60A95880
P 4150 3950
F 0 "J5" H 4122 3832 50  0000 R CNN
F 1 "DCDC enable" H 4122 3923 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4150 3950 50  0001 C CNN
F 3 "~" H 4150 3950 50  0001 C CNN
	1    4150 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 3850 3250 3850
Wire Wire Line
	3950 3950 3700 3950
Wire Wire Line
	3700 3950 3700 4050
$Comp
L power:GND #PWR019
U 1 1 60A96C90
P 3700 4050
F 0 "#PWR019" H 3700 3800 50  0001 C CNN
F 1 "GND" H 3705 3877 50  0000 C CNN
F 2 "" H 3700 4050 50  0001 C CNN
F 3 "" H 3700 4050 50  0001 C CNN
	1    3700 4050
	1    0    0    -1  
$EndComp
Text Notes 2500 3700 0    50   ~ 0
BD9E DCDC enable signal
Text HLabel 3250 3150 0    50   Input ~ 0
PAC_DAC
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 60AD2D9F
P 4150 3050
F 0 "J1" H 4122 2982 50  0000 R CNN
F 1 "PAC1921 Interface" H 4122 3073 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4150 3050 50  0001 C CNN
F 3 "~" H 4150 3050 50  0001 C CNN
	1    4150 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 3300 3700 3250
Wire Wire Line
	3700 3250 3950 3250
Wire Wire Line
	3250 4700 3950 4700
Wire Wire Line
	3950 4600 3250 4600
Wire Wire Line
	3700 4800 3700 4900
Wire Wire Line
	3950 4800 3700 4800
$Comp
L power:GND #PWR0103
U 1 1 60C33C44
P 3700 4900
F 0 "#PWR0103" H 3700 4650 50  0001 C CNN
F 1 "GND" H 3705 4727 50  0000 C CNN
F 2 "" H 3700 4900 50  0001 C CNN
F 3 "" H 3700 4900 50  0001 C CNN
	1    3700 4900
	1    0    0    -1  
$EndComp
Text HLabel 3250 4700 0    50   Input ~ 0
USB_D-
Text HLabel 3250 4600 0    50   Input ~ 0
USB_D+
Wire Notes Line
	5050 5650 3850 5650
Wire Notes Line
	3850 5650 3850 2650
Text HLabel 3250 4500 0    50   Input ~ 0
USB_5V
$Comp
L Connector_Generic:Conn_01x04 J7
U 1 1 60CB1B2C
P 4150 4600
F 0 "J7" H 4230 4592 50  0000 L CNN
F 1 "USB Header" H 4230 4501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4150 4600 50  0001 C CNN
F 3 "~" H 4150 4600 50  0001 C CNN
	1    4150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4500 3250 4500
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 60C6AA56
P 4200 5550
F 0 "J9" H 4172 5432 50  0000 R CNN
F 1 "BMC_3V3" H 4172 5523 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4200 5550 50  0001 C CNN
F 3 "~" H 4200 5550 50  0001 C CNN
	1    4200 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60C6B798
P 3700 5600
F 0 "#PWR04" H 3700 5350 50  0001 C CNN
F 1 "GND" H 3705 5427 50  0000 C CNN
F 2 "" H 3700 5600 50  0001 C CNN
F 3 "" H 3700 5600 50  0001 C CNN
	1    3700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 5600 3700 5550
Wire Wire Line
	3700 5550 4000 5550
Wire Wire Line
	4000 5450 3250 5450
Text HLabel 3250 5450 0    50   Input ~ 0
3V3
$Sheet
S 7700 3750 950  350 
U 60F06CF1
F0 "BD9E302EFJ" 50
F1 "BD9E302EFJ-5V1.sch" 50
$EndSheet
$EndSCHEMATC
