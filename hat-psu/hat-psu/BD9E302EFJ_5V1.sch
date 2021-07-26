EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 9
Title "Compute unit HAT attachment"
Date "2021-06-13"
Rev "0.1.1"
Comp "Racklet"
Comment1 "https://racklet.io"
Comment2 "https://github.com/racklet/racklet"
Comment3 "https://github.com/racklet/racklet"
Comment4 "Author: Verneri Hirvonen"
$EndDescr
$Comp
L Device:L L2
U 1 1 60A118D6
P 6700 3600
AR Path="/60A118D6" Ref="L2"  Part="1" 
AR Path="/60A0E5A4/60A118D6" Ref="L2"  Part="1" 
AR Path="/60F06CF1/60A118D6" Ref="L?"  Part="1" 
F 0 "L2" V 6890 3600 50  0000 C CNN
F 1 "8.2" V 6799 3600 50  0000 C CNN
F 2 "racklet:DEM8045C" H 6700 3600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Murata%20PDFs/DEMO80(30,40,45)C%20Type.pdf" H 6700 3600 50  0001 C CNN
F 4 "true" V 6700 3600 50  0001 C CNN "ICCC_Show"
F 5 "8.2" V 6700 3600 50  0001 C CNN "value_expr"
	1    6700 3600
	0    -1   -1   0   
$EndComp
Text Notes 4600 4650 0    50   ~ 0
Should AGND\nhave a separate\nground plane?
$Comp
L Device:C_Small C?
U 1 1 60A1617F
P 7150 3750
F 0 "C?" H 7242 3796 50  0000 L CNN
F 1 "0.1" H 7242 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7150 3750 50  0001 C CNN
F 3 "~" H 7150 3750 50  0001 C CNN
F 4 "true" H 7150 3750 50  0001 C CNN "ICCC_Show"
F 5 "47" H 7150 3750 50  0001 C CNN "value_expr"
	1    7150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3600 7150 3650
Wire Wire Line
	6850 3600 7150 3600
Wire Wire Line
	7150 3600 7700 3600
Connection ~ 7150 3600
$Comp
L power:GND #PWR?
U 1 1 60A17059
P 7700 4550
F 0 "#PWR?" H 7700 4300 50  0001 C CNN
F 1 "GND" H 7705 4377 50  0000 C CNN
F 2 "" H 7700 4550 50  0001 C CNN
F 3 "" H 7700 4550 50  0001 C CNN
	1    7700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4550 7700 4500
Wire Wire Line
	7700 4000 7700 3950
Wire Wire Line
	7700 4300 7700 4250
Connection ~ 7700 3600
Wire Wire Line
	7700 3600 8050 3600
$Comp
L Device:C_Small C?
U 1 1 60A1779A
P 8050 4100
F 0 "C?" H 8142 4146 50  0000 L CNN
F 1 "15" H 8142 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8050 4100 50  0001 C CNN
F 3 "~" H 8050 4100 50  0001 C CNN
F 4 "true" H 8050 4100 50  0001 C CNN "ICCC_Show"
F 5 "15" H 8050 4100 50  0001 C CNN "value_expr"
	1    8050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4000 8050 3950
Wire Wire Line
	8050 3950 7700 3950
Connection ~ 7700 3950
Wire Wire Line
	7700 3950 7700 3600
Wire Wire Line
	8050 4200 8050 4250
Wire Wire Line
	8050 4250 7700 4250
Connection ~ 7700 4250
Wire Wire Line
	7700 4250 7700 4200
$Comp
L power:GND #PWR?
U 1 1 60A1950D
P 7150 3900
F 0 "#PWR?" H 7150 3650 50  0001 C CNN
F 1 "GND" H 7155 3727 50  0000 C CNN
F 2 "" H 7150 3900 50  0001 C CNN
F 3 "" H 7150 3900 50  0001 C CNN
	1    7150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3900 7150 3850
$Comp
L Device:C_Small C?
U 1 1 60A1C127
P 6300 4050
F 0 "C?" H 6392 4096 50  0000 L CNN
F 1 "5600" H 6392 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6300 4050 50  0001 C CNN
F 3 "~" H 6300 4050 50  0001 C CNN
F 4 "true" H 6300 4050 50  0001 C CNN "ICCC_Show"
F 5 "5600" H 6300 4050 50  0001 C CNN "value_expr"
	1    6300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 60A1CEC4
P 6300 4300
F 0 "R6" H 6241 4254 50  0000 R CNN
F 1 "8.1" H 6241 4345 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6300 4300 50  0001 C CNN
F 3 "~" H 6300 4300 50  0001 C CNN
F 4 "true" H 6300 4300 50  0001 C CNN "ICCC_Show"
F 5 "16.2/2" H 6300 4300 50  0001 C CNN "value_expr"
F 6 "R7.Value/500.0" H 6300 4300 50  0001 C CNN "tolerance_expr"
F 7 "1.098" H 6300 4300 50  0001 C CNN "tolerance"
	1    6300 4300
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 60A1D4C6
P 7700 4100
F 0 "R7" H 7641 4054 50  0000 R CNN
F 1 "549" H 7641 4145 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7700 4100 50  0001 C CNN
F 3 "~" H 7700 4100 50  0001 C CNN
F 4 "true" H 7700 4100 50  0001 C CNN "ICCC_Show"
F 5 "549" H 7700 4100 50  0001 C CNN "value_expr"
	1    7700 4100
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60A1DFD2
P 7700 4400
F 0 "R?" H 7641 4354 50  0000 R CNN
F 1 "102" H 7641 4445 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7700 4400 50  0001 C CNN
F 3 "~" H 7700 4400 50  0001 C CNN
F 4 "true" H 7700 4400 50  0001 C CNN "ICCC_Show"
F 5 "102" H 7700 4400 50  0001 C CNN "value_expr"
	1    7700 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 3800 5800 3800
Wire Wire Line
	6300 3950 6300 3800
Wire Wire Line
	6300 4200 6300 4150
Wire Wire Line
	6300 4450 6300 4400
$Comp
L power:GND #PWR?
U 1 1 60A21A70
P 6300 4450
F 0 "#PWR?" H 6300 4200 50  0001 C CNN
F 1 "GND" H 6305 4277 50  0000 C CNN
F 2 "" H 6300 4450 50  0001 C CNN
F 3 "" H 6300 4450 50  0001 C CNN
	1    6300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4250 7550 4250
$Comp
L Device:C_Small C3
U 1 1 60A2522A
P 3900 4000
F 0 "C3" H 3992 4046 50  0000 L CNN
F 1 "51" H 3992 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3900 4000 50  0001 C CNN
F 3 "~" H 3900 4000 50  0001 C CNN
F 4 "true" H 3900 4000 50  0001 C CNN "ICCC_Show"
F 5 "Properties.Globals.TargetVoltage * 10" H 3900 4000 50  0001 C CNN "value_expr"
F 6 "35" H 3900 4000 50  0001 C CNN "voltagerating_expr"
F 7 "V" H 3900 4000 50  0001 C CNN "voltagerating_unit"
F 8 "35 V" H 3900 4000 50  0001 C CNN "voltagerating"
F 9 "Must be at least as large as the input voltage" H 3900 4000 50  0001 C CNN "voltagerating_comment"
	1    3900 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A25F03
P 3700 4300
F 0 "#PWR?" H 3700 4050 50  0001 C CNN
F 1 "GND" H 3705 4127 50  0000 C CNN
F 2 "" H 3700 4300 50  0001 C CNN
F 3 "" H 3700 4300 50  0001 C CNN
	1    3700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3700 3900 3700
Wire Wire Line
	3900 3900 3900 3700
Connection ~ 3900 3700
Wire Wire Line
	3900 4250 3900 4100
Wire Wire Line
	3500 4250 3700 4250
$Comp
L power:GND #PWR?
U 1 1 60A1408D
P 4650 3950
F 0 "#PWR?" H 4650 3700 50  0001 C CNN
F 1 "GND" H 4655 3777 50  0000 C CNN
F 2 "" H 4650 3950 50  0001 C CNN
F 3 "" H 4650 3950 50  0001 C CNN
	1    4650 3950
	1    0    0    -1  
$EndComp
Text Label 7550 4250 0    50   ~ 0
fb
Text Label 6050 3900 0    50   ~ 0
fb
Wire Wire Line
	6050 3900 5800 3900
Text HLabel 8050 3600 2    50   Output ~ 0
VOUT
Text HLabel 3300 3700 0    50   Input ~ 0
VIN
$Comp
L Device:C_Small C?
U 1 1 60A2ECA9
P 5350 3050
F 0 "C?" V 5121 3050 50  0000 C CNN
F 1 "0.1" V 5212 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5350 3050 50  0001 C CNN
F 3 "~" H 5350 3050 50  0001 C CNN
F 4 "true" V 5350 3050 50  0001 C CNN "ICCC_Show"
F 5 "0.1" V 5350 3050 50  0001 C CNN "value_expr"
	1    5350 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3050 5450 3050
Wire Wire Line
	5250 3050 4450 3050
Wire Wire Line
	4450 3050 4450 3600
Wire Wire Line
	4450 3600 4750 3600
Wire Wire Line
	4750 3800 4300 3800
Wire Wire Line
	4300 3800 4300 4600
Wire Wire Line
	4300 4600 3300 4600
Wire Wire Line
	3700 4300 3700 4250
Connection ~ 3700 4250
Wire Wire Line
	3700 4250 3900 4250
Text HLabel 3300 4600 0    50   Input ~ 0
EN
Wire Wire Line
	3500 3700 3300 3700
Connection ~ 3500 3700
Wire Wire Line
	3900 3700 3500 3700
Wire Wire Line
	3500 4250 3500 4100
Wire Wire Line
	3500 3900 3500 3700
$Comp
L Device:C_Small C2
U 1 1 60A24C15
P 3500 4000
F 0 "C2" H 3592 4046 50  0000 L CNN
F 1 "5100 F" H 3592 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3500 4000 50  0001 C CNN
F 3 "~" H 3500 4000 50  0001 C CNN
F 4 "true" H 3500 4000 50  0001 C CNN "ICCC_Show"
F 5 "C3*100" H 3500 4000 50  0001 C CNN "value_expr"
F 6 "F" H 3500 4000 50  0001 C CNN "value_unit"
	1    3500 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A7FBCB
P 6450 3700
F 0 "#PWR?" H 6450 3450 50  0001 C CNN
F 1 "GND" H 6455 3527 50  0000 C CNN
F 2 "" H 6450 3700 50  0001 C CNN
F 3 "" H 6450 3700 50  0001 C CNN
	1    6450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3700 5900 3700
Wire Wire Line
	5800 3500 5900 3500
Wire Wire Line
	5900 3500 5900 3700
Connection ~ 5900 3700
Wire Wire Line
	5900 3700 5800 3700
$Comp
L racklet:BD9E302EFJ-E2 U?
U 1 1 60C766A3
P 5300 3750
F 0 "U?" H 5275 4265 50  0000 C CNN
F 1 "BD9E302EFJ-E2" H 5275 4174 50  0000 C CNN
F 2 "Package_SO:HTSOP-8-1EP_3.9x4.9mm_P1.27mm_EP2.4x3.2mm_ThermalVias" H 5200 4250 50  0001 C CNN
F 3 "https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator/bd9e302efj-e.pdf" H 5200 3750 50  0001 C CNN
F 4 "true" H 5300 3750 50  0001 C CNN "ICCC_Show"
F 5 "BD9E302EFJ-E2" H 5300 3750 50  0001 C CNN "Model"
F 6 "3" H 5300 3750 50  0001 C CNN "currentoutput_min_expr"
F 7 "3" H 5300 3750 50  0001 C CNN "currentOutput_min"
F 8 "12" H 5300 3750 50  0001 C CNN "min_vin_max_expr"
F 9 "24" H 5300 3750 50  0001 C CNN "max_vin_min_expr"
	1    5300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3900 4650 3900
Wire Wire Line
	4650 3900 4650 3950
Wire Wire Line
	5800 3600 6250 3600
Wire Wire Line
	6250 3050 6250 3600
Connection ~ 6250 3600
Wire Wire Line
	6250 3600 6550 3600
$Sheet
S 2950 2600 500 150
U 60FFED3D
F0 "Properties_BD9E302EFJ_5V1" 50
F1 "Properties.sch" 50
$EndSheet
$EndSCHEMATC