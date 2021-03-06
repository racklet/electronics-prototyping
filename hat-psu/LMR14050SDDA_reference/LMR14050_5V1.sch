EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "LMR14040 DC-DC converter configured for 5.1V output"
Date "2021-04-21"
Rev "2"
Comp "Racklet"
Comment1 "Author: Verneri Hirvonen"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LMR14050:LMR14050SDDA U?
U 1 1 608570EF
P 4550 3550
AR Path="/60839B8F/608570EF" Ref="U?"  Part="1" 
AR Path="/60881EFC/608570EF" Ref="U?"  Part="1" 
F 0 "U?" H 4550 3500 50  0000 C CNN
F 1 "LMR14050SDDA" H 4550 3400 50  0000 C CNN
F 2 "Package_SO:Texas_HSOP-8-1EP_3.9x4.9mm_P1.27mm_ThermalVias" H 4550 3600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lmr14050.pdf" H 4550 3600 50  0001 C CNN
	1    4550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4500 4500 4500
Wire Wire Line
	4500 4500 4500 4550
Connection ~ 4500 4500
$Comp
L power:GND #PWR?
U 1 1 608570F8
P 4500 4550
AR Path="/60839B8F/608570F8" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/608570F8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4500 4300 50  0001 C CNN
F 1 "GND" H 4505 4377 50  0000 C CNN
F 2 "" H 4500 4550 50  0001 C CNN
F 3 "" H 4500 4550 50  0001 C CNN
	1    4500 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3450 5350 3450
Wire Wire Line
	5350 3450 5350 3550
Wire Wire Line
	5100 3850 5350 3850
Wire Wire Line
	5350 3850 5350 3750
Connection ~ 5350 3850
$Comp
L Device:C_Small C?
U 1 1 60857103
P 5350 3650
AR Path="/60839B8F/60857103" Ref="C?"  Part="1" 
AR Path="/60881EFC/60857103" Ref="C?"  Part="1" 
F 0 "C?" H 5258 3696 50  0000 R CNN
F 1 "100n" H 5258 3605 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5350 3650 50  0001 C CNN
F 3 "~" H 5350 3650 50  0001 C CNN
	1    5350 3650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60857109
P 6200 4050
AR Path="/60839B8F/60857109" Ref="R?"  Part="1" 
AR Path="/60881EFC/60857109" Ref="R?"  Part="1" 
F 0 "R?" H 6270 4096 50  0000 L CNN
F 1 "100k" H 6270 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6130 4050 50  0001 C CNN
F 3 "~" H 6200 4050 50  0001 C CNN
	1    6200 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6085710F
P 6200 4450
AR Path="/60839B8F/6085710F" Ref="R?"  Part="1" 
AR Path="/60881EFC/6085710F" Ref="R?"  Part="1" 
F 0 "R?" H 6270 4496 50  0000 L CNN
F 1 "17.8k" H 6270 4405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6130 4450 50  0001 C CNN
F 3 "~" H 6200 4450 50  0001 C CNN
	1    6200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4600 6200 4650
$Comp
L power:GND #PWR?
U 1 1 60857116
P 6200 4650
AR Path="/60839B8F/60857116" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/60857116" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6200 4400 50  0001 C CNN
F 1 "GND" H 6205 4477 50  0000 C CNN
F 2 "" H 6200 4650 50  0001 C CNN
F 3 "" H 6200 4650 50  0001 C CNN
	1    6200 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6085711D
P 4850 2850
AR Path="/60839B8F/6085711D" Ref="C?"  Part="1" 
AR Path="/60881EFC/6085711D" Ref="C?"  Part="1" 
F 0 "C?" H 5050 2900 50  0000 R CNN
F 1 "100n" H 5050 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4850 2850 50  0001 C CNN
F 3 "~" H 4850 2850 50  0001 C CNN
	1    4850 2850
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60857123
P 4850 3000
AR Path="/60839B8F/60857123" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/60857123" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 2750 50  0001 C CNN
F 1 "GND" H 4855 2827 50  0000 C CNN
F 2 "" H 4850 3000 50  0001 C CNN
F 3 "" H 4850 3000 50  0001 C CNN
	1    4850 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60857129
P 3800 4250
AR Path="/60839B8F/60857129" Ref="C?"  Part="1" 
AR Path="/60881EFC/60857129" Ref="C?"  Part="1" 
F 0 "C?" V 3700 4150 50  0000 C CNN
F 1 "22nF" V 3700 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3800 4250 50  0001 C CNN
F 3 "~" H 3800 4250 50  0001 C CNN
	1    3800 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 4250 3900 4250
$Comp
L power:GND #PWR?
U 1 1 60857130
P 3600 4250
AR Path="/60839B8F/60857130" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/60857130" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 4000 50  0001 C CNN
F 1 "GND" V 3605 4122 50  0000 R CNN
F 2 "" H 3600 4250 50  0001 C CNN
F 3 "" H 3600 4250 50  0001 C CNN
	1    3600 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60857136
P 3800 3850
AR Path="/60839B8F/60857136" Ref="R?"  Part="1" 
AR Path="/60881EFC/60857136" Ref="R?"  Part="1" 
F 0 "R?" V 3700 3750 50  0000 C CNN
F 1 "84.5k" V 3700 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3730 3850 50  0001 C CNN
F 3 "~" H 3800 3850 50  0001 C CNN
	1    3800 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 3850 3950 3850
Wire Wire Line
	3700 4250 3600 4250
Wire Wire Line
	3650 3850 3600 3850
$Comp
L power:GND #PWR?
U 1 1 6085713F
P 3600 3850
AR Path="/60839B8F/6085713F" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/6085713F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 3600 50  0001 C CNN
F 1 "GND" V 3605 3722 50  0000 R CNN
F 2 "" H 3600 3850 50  0001 C CNN
F 3 "" H 3600 3850 50  0001 C CNN
	1    3600 3850
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60857146
P 6900 4050
AR Path="/60839B8F/60857146" Ref="C?"  Part="1" 
AR Path="/60881EFC/60857146" Ref="C?"  Part="1" 
F 0 "C?" H 6808 4096 50  0000 R CNN
F 1 "47uF" H 6808 4005 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 6900 4050 50  0001 C CNN
F 3 "~" H 6900 4050 50  0001 C CNN
	1    6900 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6900 3950 6900 3850
Wire Wire Line
	6900 3850 7250 3850
$Comp
L power:GND #PWR?
U 1 1 6085714E
P 6900 4200
AR Path="/60839B8F/6085714E" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/6085714E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6900 3950 50  0001 C CNN
F 1 "GND" H 6905 4027 50  0000 C CNN
F 2 "" H 6900 4200 50  0001 C CNN
F 3 "" H 6900 4200 50  0001 C CNN
	1    6900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4200 6900 4150
Wire Wire Line
	5350 3850 5550 3850
Wire Wire Line
	6200 3850 6200 3900
$Comp
L Device:L L?
U 1 1 60857157
P 5850 3850
AR Path="/60839B8F/60857157" Ref="L?"  Part="1" 
AR Path="/60881EFC/60857157" Ref="L?"  Part="1" 
F 0 "L?" V 6040 3850 50  0000 C CNN
F 1 "8.2uH" V 5949 3850 50  0000 C CNN
F 2 "Inductor_SMD:L_Wuerth_WE-PD-Typ-LS" H 5850 3850 50  0001 C CNN
F 3 "~" H 5850 3850 50  0001 C CNN
	1    5850 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 3850 6200 3850
Wire Wire Line
	6200 3850 6550 3850
Connection ~ 6200 3850
Connection ~ 6900 3850
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60857161
P 5600 2600
AR Path="/60839B8F/60857161" Ref="#FLG?"  Part="1" 
AR Path="/60881EFC/60857161" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 5600 2675 50  0001 C CNN
F 1 "PWR_FLAG" H 5450 2750 50  0000 L CNN
F 2 "" H 5600 2600 50  0001 C CNN
F 3 "~" H 5600 2600 50  0001 C CNN
	1    5600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3950 5550 3850
Connection ~ 5550 3850
Wire Wire Line
	5550 3850 5700 3850
$Comp
L power:GND #PWR?
U 1 1 6085716A
P 5550 4400
AR Path="/60839B8F/6085716A" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/6085716A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 4150 50  0001 C CNN
F 1 "GND" H 5555 4227 50  0000 C CNN
F 2 "" H 5550 4400 50  0001 C CNN
F 3 "" H 5550 4400 50  0001 C CNN
	1    5550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4200 6200 4250
Text Label 6150 4250 2    50   ~ 0
V_FB1
Wire Wire Line
	6200 4250 6150 4250
Connection ~ 6200 4250
Wire Wire Line
	6200 4250 6200 4300
Text Label 5150 4250 0    50   ~ 0
V_FB1
Wire Wire Line
	5150 4250 5100 4250
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60857178
P 6550 3850
AR Path="/60839B8F/60857178" Ref="#FLG?"  Part="1" 
AR Path="/60881EFC/60857178" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 6550 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 6550 4023 50  0000 C CNN
F 2 "" H 6550 3850 50  0001 C CNN
F 3 "~" H 6550 3850 50  0001 C CNN
	1    6550 3850
	1    0    0    -1  
$EndComp
Connection ~ 6550 3850
Wire Wire Line
	6550 3850 6900 3850
Wire Wire Line
	5550 4400 5550 4350
Wire Wire Line
	5650 4300 5650 4350
Wire Wire Line
	5650 4350 5550 4350
Connection ~ 5550 4350
Wire Wire Line
	5550 4350 5550 4300
$Comp
L Device:D_Schottky_AAK D?
U 1 1 60857185
P 5550 4100
AR Path="/60839B8F/60857185" Ref="D?"  Part="1" 
AR Path="/60881EFC/60857185" Ref="D?"  Part="1" 
F 0 "D?" V 5529 4244 50  0000 L CNN
F 1 "D" V 5620 4244 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-277A" H 5550 4100 50  0001 C CNN
F 3 "~" H 5550 4100 50  0001 C CNN
	1    5550 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 2700 4850 2700
Wire Wire Line
	4850 2750 4850 2700
Wire Wire Line
	4850 2700 5200 2700
Connection ~ 4850 2700
Wire Wire Line
	5600 2600 5600 2700
Connection ~ 5600 2700
Wire Wire Line
	5600 2700 5850 2700
Wire Wire Line
	4850 3000 4850 2950
$Comp
L Device:C_Small C?
U 1 1 60857193
P 5200 2850
AR Path="/60839B8F/60857193" Ref="C?"  Part="1" 
AR Path="/60881EFC/60857193" Ref="C?"  Part="1" 
F 0 "C?" H 5100 2900 50  0000 R CNN
F 1 "4.7uF" H 5100 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5200 2850 50  0001 C CNN
F 3 "~" H 5200 2850 50  0001 C CNN
	1    5200 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 2750 5200 2700
Connection ~ 5200 2700
Wire Wire Line
	5200 2950 5200 3000
$Comp
L power:GND #PWR?
U 1 1 6085719D
P 5200 3000
AR Path="/60839B8F/6085719D" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/6085719D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5200 2750 50  0001 C CNN
F 1 "GND" H 5205 2827 50  0000 C CNN
F 2 "" H 5200 3000 50  0001 C CNN
F 3 "" H 5200 3000 50  0001 C CNN
	1    5200 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 608571B3
P 7250 4050
AR Path="/60839B8F/608571B3" Ref="C?"  Part="1" 
AR Path="/60881EFC/608571B3" Ref="C?"  Part="1" 
F 0 "C?" H 7158 4096 50  0000 R CNN
F 1 "47uF" H 7158 4005 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7250 4050 50  0001 C CNN
F 3 "~" H 7250 4050 50  0001 C CNN
	1    7250 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7250 3950 7250 3850
Connection ~ 7250 3850
$Comp
L power:GND #PWR?
U 1 1 608571C4
P 7250 4200
AR Path="/60839B8F/608571C4" Ref="#PWR?"  Part="1" 
AR Path="/60881EFC/608571C4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7250 3950 50  0001 C CNN
F 1 "GND" H 7255 4027 50  0000 C CNN
F 2 "" H 7250 4200 50  0001 C CNN
F 3 "" H 7250 4200 50  0001 C CNN
	1    7250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4200 7250 4150
Wire Wire Line
	4550 3200 4550 2700
Text HLabel 3500 3450 0    50   Input ~ 0
en
Wire Wire Line
	3500 3450 4000 3450
Text HLabel 5850 2700 2    50   Input ~ 0
V_in
Text HLabel 7550 3850 2    50   Output ~ 0
V_out
Wire Wire Line
	7250 3850 7550 3850
Wire Wire Line
	5200 2700 5600 2700
$EndSCHEMATC
