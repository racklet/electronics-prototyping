EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
Wire Wire Line
	11450 1850 11700 1850
Wire Wire Line
	11700 1850 11700 1900
Wire Wire Line
	11450 1750 12000 1750
Wire Wire Line
	12000 1750 12000 1900
Connection ~ 11700 1850
Wire Wire Line
	12000 1750 12900 1750
Connection ~ 12000 1750
Text Label 11050 1750 2    50   ~ 0
hub_d1+
Text Label 11050 1850 2    50   ~ 0
hub_d1-
Wire Wire Line
	11700 2100 11700 2150
Wire Wire Line
	11700 2150 11850 2150
Wire Wire Line
	12000 2150 12000 2100
$Comp
L power:GND #PWR0101
U 1 1 60F59818
P 11850 2150
F 0 "#PWR0101" H 11850 1900 50  0001 C CNN
F 1 "GND" H 11855 1977 50  0000 C CNN
F 2 "" H 11850 2150 50  0001 C CNN
F 3 "" H 11850 2150 50  0001 C CNN
	1    11850 2150
	1    0    0    -1  
$EndComp
Connection ~ 11850 2150
Wire Wire Line
	11850 2150 12000 2150
Text Label 11050 2750 2    50   ~ 0
hub_d2+
Text Label 11050 2850 2    50   ~ 0
hub_d2-
Text Label 11050 3600 2    50   ~ 0
hub_d3+
Text Label 11050 3700 2    50   ~ 0
hub_d3-
Text Label 11050 4600 2    50   ~ 0
hub_d4+
Text Label 11050 4700 2    50   ~ 0
hub_d4-
$Comp
L Device:R_Small R1
U 1 1 60F69641
P 11700 2000
F 0 "R1" H 11759 2046 50  0000 L CNN
F 1 "15k" H 11759 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 2000 50  0001 C CNN
F 3 "~" H 11700 2000 50  0001 C CNN
F 4 "15e3" H 11700 2000 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 2000 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 2000 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 2000 50  0001 C CNN "Tolerance_unit"
	1    11700 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 60F6B6D9
P 12000 2000
F 0 "R14" H 12059 2046 50  0000 L CNN
F 1 "15k" H 12059 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 2000 50  0001 C CNN
F 3 "~" H 12000 2000 50  0001 C CNN
F 4 "15e3" H 12000 2000 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 2000 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 2000 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 2000 50  0001 C CNN "Tolerance_unit"
	1    12000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 2850 11700 2850
Wire Wire Line
	11700 2850 11700 2900
Wire Wire Line
	11450 2750 12000 2750
Wire Wire Line
	12000 2750 12000 2900
Connection ~ 11700 2850
Connection ~ 12000 2750
Wire Wire Line
	11700 3100 11700 3150
Wire Wire Line
	11700 3150 11850 3150
Wire Wire Line
	12000 3150 12000 3100
$Comp
L power:GND #PWR06
U 1 1 60F6ECDE
P 11850 3150
F 0 "#PWR06" H 11850 2900 50  0001 C CNN
F 1 "GND" H 11855 2977 50  0000 C CNN
F 2 "" H 11850 3150 50  0001 C CNN
F 3 "" H 11850 3150 50  0001 C CNN
	1    11850 3150
	1    0    0    -1  
$EndComp
Connection ~ 11850 3150
Wire Wire Line
	11850 3150 12000 3150
$Comp
L Device:R_Small R11
U 1 1 60F6ECEA
P 11700 3000
F 0 "R11" H 11759 3046 50  0000 L CNN
F 1 "15k" H 11759 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 3000 50  0001 C CNN
F 3 "~" H 11700 3000 50  0001 C CNN
F 4 "15e3" H 11700 3000 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 3000 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 3000 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 3000 50  0001 C CNN "Tolerance_unit"
	1    11700 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R15
U 1 1 60F6ECF4
P 12000 3000
F 0 "R15" H 12059 3046 50  0000 L CNN
F 1 "15k" H 12059 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 3000 50  0001 C CNN
F 3 "~" H 12000 3000 50  0001 C CNN
F 4 "15e3" H 12000 3000 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 3000 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 3000 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 3000 50  0001 C CNN "Tolerance_unit"
	1    12000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 3700 11700 3700
Wire Wire Line
	11700 3700 11700 3750
Wire Wire Line
	11450 3600 12000 3600
Wire Wire Line
	12000 3600 12000 3750
Wire Wire Line
	11700 3700 12700 3700
Connection ~ 11700 3700
Wire Wire Line
	12000 3600 12900 3600
Connection ~ 12000 3600
Wire Wire Line
	11700 3950 11700 4000
Wire Wire Line
	11700 4000 11850 4000
Wire Wire Line
	12000 4000 12000 3950
$Comp
L power:GND #PWR07
U 1 1 60F70081
P 11850 4000
F 0 "#PWR07" H 11850 3750 50  0001 C CNN
F 1 "GND" H 11855 3827 50  0000 C CNN
F 2 "" H 11850 4000 50  0001 C CNN
F 3 "" H 11850 4000 50  0001 C CNN
	1    11850 4000
	1    0    0    -1  
$EndComp
Connection ~ 11850 4000
Wire Wire Line
	11850 4000 12000 4000
$Comp
L Device:R_Small R12
U 1 1 60F7008D
P 11700 3850
F 0 "R12" H 11759 3896 50  0000 L CNN
F 1 "15k" H 11759 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 3850 50  0001 C CNN
F 3 "~" H 11700 3850 50  0001 C CNN
F 4 "15e3" H 11700 3850 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 3850 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 3850 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 3850 50  0001 C CNN "Tolerance_unit"
	1    11700 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R16
U 1 1 60F70097
P 12000 3850
F 0 "R16" H 12059 3896 50  0000 L CNN
F 1 "15k" H 12059 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 3850 50  0001 C CNN
F 3 "~" H 12000 3850 50  0001 C CNN
F 4 "15e3" H 12000 3850 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 3850 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 3850 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 3850 50  0001 C CNN "Tolerance_unit"
	1    12000 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 4700 11700 4700
Wire Wire Line
	11700 4700 11700 4750
Wire Wire Line
	11450 4600 12000 4600
Wire Wire Line
	12000 4600 12000 4750
Wire Wire Line
	11700 4700 12700 4700
Connection ~ 11700 4700
Wire Wire Line
	12000 4600 12900 4600
Connection ~ 12000 4600
Wire Wire Line
	11700 4950 11700 5000
Wire Wire Line
	11700 5000 11850 5000
Wire Wire Line
	12000 5000 12000 4950
$Comp
L power:GND #PWR08
U 1 1 60F73C75
P 11850 5000
F 0 "#PWR08" H 11850 4750 50  0001 C CNN
F 1 "GND" H 11855 4827 50  0000 C CNN
F 2 "" H 11850 5000 50  0001 C CNN
F 3 "" H 11850 5000 50  0001 C CNN
	1    11850 5000
	1    0    0    -1  
$EndComp
Connection ~ 11850 5000
Wire Wire Line
	11850 5000 12000 5000
$Comp
L Device:R_Small R13
U 1 1 60F73C81
P 11700 4850
F 0 "R13" H 11759 4896 50  0000 L CNN
F 1 "15k" H 11759 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 4850 50  0001 C CNN
F 3 "~" H 11700 4850 50  0001 C CNN
F 4 "15e3" H 11700 4850 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 4850 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 4850 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 4850 50  0001 C CNN "Tolerance_unit"
	1    11700 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R17
U 1 1 60F73C8B
P 12000 4850
F 0 "R17" H 12059 4896 50  0000 L CNN
F 1 "15k" H 12059 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 4850 50  0001 C CNN
F 3 "~" H 12000 4850 50  0001 C CNN
F 4 "15e3" H 12000 4850 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 4850 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 4850 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 4850 50  0001 C CNN "Tolerance_unit"
	1    12000 4850
	1    0    0    -1  
$EndComp
Text HLabel 1350 1400 0    50   Input ~ 0
5V1
Text HLabel 1350 1850 0    50   Input ~ 0
GND
Wire Wire Line
	11050 1750 11250 1750
Wire Wire Line
	11050 1850 11250 1850
$Comp
L Device:R_Small R5
U 1 1 60F95BF5
P 11350 2750
F 0 "R5" V 11250 2650 50  0000 C CNN
F 1 "27" V 11250 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 2750 50  0001 C CNN
F 3 "~" H 11350 2750 50  0001 C CNN
F 4 "27" V 11350 2750 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 2750 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 2750 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 2750 50  0001 C CNN "Tolerance_unit"
	1    11350 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 60F95BFF
P 11350 2850
F 0 "R6" V 11250 2750 50  0000 C CNN
F 1 "27" V 11250 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 2850 50  0001 C CNN
F 3 "~" H 11350 2850 50  0001 C CNN
F 4 "27" V 11350 2850 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 2850 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 2850 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 2850 50  0001 C CNN "Tolerance_unit"
	1    11350 2850
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 60F97433
P 11350 3600
F 0 "R7" V 11250 3500 50  0000 C CNN
F 1 "27" V 11250 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 3600 50  0001 C CNN
F 3 "~" H 11350 3600 50  0001 C CNN
F 4 "27" V 11350 3600 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 3600 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 3600 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 3600 50  0001 C CNN "Tolerance_unit"
	1    11350 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 60F9743D
P 11350 3700
F 0 "R8" V 11250 3600 50  0000 C CNN
F 1 "27" V 11250 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 3700 50  0001 C CNN
F 3 "~" H 11350 3700 50  0001 C CNN
F 4 "27" V 11350 3700 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 3700 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 3700 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 3700 50  0001 C CNN "Tolerance_unit"
	1    11350 3700
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 60F9909D
P 11350 4600
F 0 "R9" V 11250 4500 50  0000 C CNN
F 1 "27" V 11250 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 4600 50  0001 C CNN
F 3 "~" H 11350 4600 50  0001 C CNN
F 4 "27" V 11350 4600 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 4600 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 4600 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 4600 50  0001 C CNN "Tolerance_unit"
	1    11350 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 60F990A7
P 11350 4700
F 0 "R10" V 11250 4600 50  0000 C CNN
F 1 "27" V 11250 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 4700 50  0001 C CNN
F 3 "~" H 11350 4700 50  0001 C CNN
F 4 "27" V 11350 4700 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 4700 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 4700 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 4700 50  0001 C CNN "Tolerance_unit"
	1    11350 4700
	0    1    -1   0   
$EndComp
Wire Wire Line
	11250 4700 11050 4700
Wire Wire Line
	11250 4600 11050 4600
Wire Wire Line
	11250 3700 11050 3700
Wire Wire Line
	11250 3600 11050 3600
Wire Wire Line
	11250 2850 11050 2850
Wire Wire Line
	11250 2750 11050 2750
$Comp
L Device:R_Small R4
U 1 1 60F938A0
P 11350 1850
F 0 "R4" V 11250 1750 50  0000 C CNN
F 1 "27" V 11250 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 1850 50  0001 C CNN
F 3 "~" H 11350 1850 50  0001 C CNN
F 4 "27" V 11350 1850 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 1850 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 1850 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 1850 50  0001 C CNN "Tolerance_unit"
	1    11350 1850
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60F91302
P 11350 1750
F 0 "R3" V 11250 1650 50  0000 C CNN
F 1 "27" V 11250 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 1750 50  0001 C CNN
F 3 "~" H 11350 1750 50  0001 C CNN
F 4 "27" V 11350 1750 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 1750 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 1750 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 1750 50  0001 C CNN "Tolerance_unit"
	1    11350 1750
	0    1    1    0   
$EndComp
Text HLabel 13700 4700 2    50   BiDi ~ 0
D4-
Text HLabel 13700 3700 2    50   BiDi ~ 0
D3-
Text HLabel 13700 2850 2    50   BiDi ~ 0
D2-
Text HLabel 13700 1850 2    50   BiDi ~ 0
D1-
Text HLabel 13700 4600 2    50   BiDi ~ 0
D4+
Text HLabel 13700 3600 2    50   BiDi ~ 0
D3+
Text HLabel 13700 2750 2    50   BiDi ~ 0
D2+
Text HLabel 13700 1750 2    50   BiDi ~ 0
D1+
$Comp
L Power_Protection:USBLC6-4SC6 U4
U 1 1 60FBFD85
P 12800 2300
F 0 "U4" V 13000 2900 50  0000 C CNN
F 1 "USBLC6-4SC6" V 12900 2900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 12800 1800 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-4.pdf" H 13000 2650 50  0001 C CNN
	1    12800 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	12900 1750 12900 1900
Wire Wire Line
	12700 1900 12700 1850
Wire Wire Line
	11700 1850 12700 1850
Wire Wire Line
	12900 2750 12900 2700
Wire Wire Line
	12000 2750 12900 2750
Wire Wire Line
	12700 2850 12700 2700
Wire Wire Line
	11700 2850 12700 2850
Wire Wire Line
	12900 1750 13700 1750
Connection ~ 12900 1750
Wire Wire Line
	13700 1850 12700 1850
Connection ~ 12700 1850
Wire Wire Line
	13700 2750 12900 2750
Connection ~ 12900 2750
Wire Wire Line
	12700 2850 13700 2850
Connection ~ 12700 2850
$Comp
L power:GND #PWR09
U 1 1 60FF84F9
P 12350 2350
F 0 "#PWR09" H 12350 2100 50  0001 C CNN
F 1 "GND" H 12355 2177 50  0000 C CNN
F 2 "" H 12350 2350 50  0001 C CNN
F 3 "" H 12350 2350 50  0001 C CNN
	1    12350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 2350 12350 2300
Wire Wire Line
	12350 2300 12400 2300
$Comp
L Power_Protection:USBLC6-4SC6 U5
U 1 1 61002AEA
P 12800 4150
F 0 "U5" V 13000 4750 50  0000 C CNN
F 1 "USBLC6-4SC6" V 12900 4750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 12800 3650 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-4.pdf" H 13000 4500 50  0001 C CNN
	1    12800 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	12900 3750 12900 3600
Connection ~ 12900 3600
Wire Wire Line
	12900 3600 13700 3600
Wire Wire Line
	12700 3750 12700 3700
Connection ~ 12700 3700
Wire Wire Line
	12700 3700 13700 3700
Wire Wire Line
	12900 4550 12900 4600
Connection ~ 12900 4600
Wire Wire Line
	12900 4600 13700 4600
Wire Wire Line
	12700 4550 12700 4700
Connection ~ 12700 4700
Wire Wire Line
	12700 4700 13700 4700
Text Notes 13350 1350 0    59   ~ 0
Hub-side termination matching\nDownstream facing pull-downs\nTVS protection diodes
Wire Notes Line
	13300 1100 11350 1100
Wire Notes Line
	11350 1100 11350 1550
Wire Notes Line
	13300 1200 11850 1200
Wire Notes Line
	11850 1200 11850 1550
Wire Notes Line
	13300 1300 12800 1300
Wire Notes Line
	12800 1300 12800 1550
Text Label 13250 2250 0    50   ~ 0
hub_vbus
Wire Wire Line
	13250 2250 13250 2300
Wire Wire Line
	13250 2300 13200 2300
Text Label 13250 4100 0    50   ~ 0
hub_vbus
Wire Wire Line
	13250 4100 13250 4150
Wire Wire Line
	13250 4150 13200 4150
$Comp
L power:GND #PWR010
U 1 1 610646E2
P 12350 4200
F 0 "#PWR010" H 12350 3950 50  0001 C CNN
F 1 "GND" H 12355 4027 50  0000 C CNN
F 2 "" H 12350 4200 50  0001 C CNN
F 3 "" H 12350 4200 50  0001 C CNN
	1    12350 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 4200 12350 4150
Wire Wire Line
	12350 4150 12400 4150
Text Notes 14150 1800 0    50   ~ 0
Downstream ports
Text Label 1450 1400 0    50   ~ 0
hub_vbus
$Comp
L racklet:MIC5504-3.3YM5-TR U3
U 1 1 610D200C
P 2600 1500
F 0 "U3" H 2600 1865 50  0000 C CNN
F 1 "MIC5504-3.3YM5-TR" H 2600 1774 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2650 1950 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/MIC5501-02-03-04-300mA-Single-Output-LDO-in-Small-Packages-DS20006006B.pdf" H 2600 1700 50  0001 C CNN
	1    2600 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 610D3723
P 1950 1650
F 0 "C3" H 2042 1696 50  0000 L CNN
F 1 "1µ" H 2042 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1950 1650 50  0001 C CNN
F 3 "~" H 1950 1650 50  0001 C CNN
F 4 "1e-6" H 1950 1650 50  0001 C CNN "Value_expr"
	1    1950 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1500 2150 1500
Wire Wire Line
	2150 1500 2150 1400
Wire Wire Line
	2250 1400 2150 1400
Connection ~ 2150 1400
$Comp
L Device:C_Small C4
U 1 1 610DCB54
P 3100 1650
F 0 "C4" H 3192 1696 50  0000 L CNN
F 1 "1µ" H 3192 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3100 1650 50  0001 C CNN
F 3 "~" H 3100 1650 50  0001 C CNN
F 4 "1e-6" H 3100 1650 50  0001 C CNN "Value_expr"
	1    3100 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1400 1950 1400
Wire Wire Line
	1950 1400 1950 1550
Wire Wire Line
	1950 1850 2600 1850
Wire Wire Line
	3100 1850 3100 1750
Wire Wire Line
	3100 1400 2950 1400
Wire Wire Line
	1950 1750 1950 1850
Wire Wire Line
	3100 1550 3100 1400
Connection ~ 1950 1400
Wire Wire Line
	2600 1800 2600 1850
Connection ~ 2600 1850
Wire Wire Line
	2600 1850 3100 1850
Wire Wire Line
	2600 1850 2600 1900
$Comp
L power:GND #PWR04
U 1 1 61101B62
P 2600 1900
F 0 "#PWR04" H 2600 1650 50  0001 C CNN
F 1 "GND" H 2605 1727 50  0000 C CNN
F 2 "" H 2600 1900 50  0001 C CNN
F 3 "" H 2600 1900 50  0001 C CNN
	1    2600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1400 3500 1400
Connection ~ 3100 1400
Text Label 3700 1400 0    50   ~ 0
hub_vcc
Text Notes 2450 1000 0    50   ~ 0
3.3V LDO
$Comp
L Device:C_Small C5
U 1 1 6115A44B
P 3500 1650
F 0 "C5" H 3592 1696 50  0000 L CNN
F 1 "100n" H 3592 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3500 1650 50  0001 C CNN
F 3 "~" H 3500 1650 50  0001 C CNN
F 4 "100e-9" H 3500 1650 50  0001 C CNN "Value_expr"
	1    3500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1550 3500 1400
Connection ~ 3500 1400
Wire Wire Line
	3500 1400 3700 1400
Wire Wire Line
	3500 1750 3500 1850
Wire Wire Line
	3500 1850 3100 1850
Connection ~ 3100 1850
Text Notes 650  10900 0    50   ~ 0
Generate 100us - 1ms\npower-on-reset pulse\n\n* TI support forum recommends 15k and 1u,\n(https://e2e.ti.com/support/interface-group/interface/f/interface-forum/476641/tusb2046-reset-condition)\n* LTSpice simulation shows that 10k and 100n\nmeet timing criteria better (and are very generic values)
Wire Wire Line
	1350 1400 1950 1400
Wire Wire Line
	1950 1850 1350 1850
Connection ~ 1950 1850
Text Label 11050 5500 2    50   ~ 0
hub_d5+
Text Label 11050 5600 2    50   ~ 0
hub_d5-
Text Label 11050 6500 2    50   ~ 0
hub_d6+
Text Label 11050 6600 2    50   ~ 0
hub_d6-
Wire Wire Line
	11450 5600 11700 5600
Wire Wire Line
	11700 5600 11700 5650
Wire Wire Line
	11450 5500 12000 5500
Wire Wire Line
	12000 5500 12000 5650
Wire Wire Line
	11700 5600 12700 5600
Connection ~ 11700 5600
Wire Wire Line
	12000 5500 12900 5500
Connection ~ 12000 5500
Wire Wire Line
	11700 5850 11700 5900
Wire Wire Line
	11700 5900 11850 5900
Wire Wire Line
	12000 5900 12000 5850
$Comp
L power:GND #PWR011
U 1 1 61232E09
P 11850 5900
F 0 "#PWR011" H 11850 5650 50  0001 C CNN
F 1 "GND" H 11855 5727 50  0000 C CNN
F 2 "" H 11850 5900 50  0001 C CNN
F 3 "" H 11850 5900 50  0001 C CNN
	1    11850 5900
	1    0    0    -1  
$EndComp
Connection ~ 11850 5900
Wire Wire Line
	11850 5900 12000 5900
$Comp
L Device:R_Small R26
U 1 1 61232E15
P 11700 5750
F 0 "R26" H 11759 5796 50  0000 L CNN
F 1 "15k" H 11759 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 5750 50  0001 C CNN
F 3 "~" H 11700 5750 50  0001 C CNN
F 4 "15e3" H 11700 5750 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 5750 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 5750 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 5750 50  0001 C CNN "Tolerance_unit"
	1    11700 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R29
U 1 1 61232E1F
P 12000 5750
F 0 "R29" H 12059 5796 50  0000 L CNN
F 1 "15k" H 12059 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 5750 50  0001 C CNN
F 3 "~" H 12000 5750 50  0001 C CNN
F 4 "15e3" H 12000 5750 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 5750 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 5750 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 5750 50  0001 C CNN "Tolerance_unit"
	1    12000 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 6600 11700 6600
Wire Wire Line
	11700 6600 11700 6650
Wire Wire Line
	11450 6500 12000 6500
Wire Wire Line
	12000 6500 12000 6650
Wire Wire Line
	11700 6600 12700 6600
Connection ~ 11700 6600
Wire Wire Line
	12000 6500 12900 6500
Connection ~ 12000 6500
Wire Wire Line
	11700 6850 11700 6900
Wire Wire Line
	11700 6900 11850 6900
Wire Wire Line
	12000 6900 12000 6850
$Comp
L power:GND #PWR012
U 1 1 61232E30
P 11850 6900
F 0 "#PWR012" H 11850 6650 50  0001 C CNN
F 1 "GND" H 11855 6727 50  0000 C CNN
F 2 "" H 11850 6900 50  0001 C CNN
F 3 "" H 11850 6900 50  0001 C CNN
	1    11850 6900
	1    0    0    -1  
$EndComp
Connection ~ 11850 6900
Wire Wire Line
	11850 6900 12000 6900
$Comp
L Device:R_Small R27
U 1 1 61232E3C
P 11700 6750
F 0 "R27" H 11759 6796 50  0000 L CNN
F 1 "15k" H 11759 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 6750 50  0001 C CNN
F 3 "~" H 11700 6750 50  0001 C CNN
F 4 "15e3" H 11700 6750 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 6750 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 6750 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 6750 50  0001 C CNN "Tolerance_unit"
	1    11700 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R30
U 1 1 61232E46
P 12000 6750
F 0 "R30" H 12059 6796 50  0000 L CNN
F 1 "15k" H 12059 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 6750 50  0001 C CNN
F 3 "~" H 12000 6750 50  0001 C CNN
F 4 "15e3" H 12000 6750 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 6750 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 6750 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 6750 50  0001 C CNN "Tolerance_unit"
	1    12000 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R20
U 1 1 61232E50
P 11350 5500
F 0 "R20" V 11250 5400 50  0000 C CNN
F 1 "27" V 11250 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 5500 50  0001 C CNN
F 3 "~" H 11350 5500 50  0001 C CNN
F 4 "27" V 11350 5500 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 5500 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 5500 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 5500 50  0001 C CNN "Tolerance_unit"
	1    11350 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R21
U 1 1 61232E5A
P 11350 5600
F 0 "R21" V 11250 5500 50  0000 C CNN
F 1 "27" V 11250 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 5600 50  0001 C CNN
F 3 "~" H 11350 5600 50  0001 C CNN
F 4 "27" V 11350 5600 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 5600 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 5600 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 5600 50  0001 C CNN "Tolerance_unit"
	1    11350 5600
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R22
U 1 1 61232E64
P 11350 6500
F 0 "R22" V 11250 6400 50  0000 C CNN
F 1 "27" V 11250 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 6500 50  0001 C CNN
F 3 "~" H 11350 6500 50  0001 C CNN
F 4 "27" V 11350 6500 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 6500 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 6500 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 6500 50  0001 C CNN "Tolerance_unit"
	1    11350 6500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R23
U 1 1 61232E6E
P 11350 6600
F 0 "R23" V 11250 6500 50  0000 C CNN
F 1 "27" V 11250 6700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 6600 50  0001 C CNN
F 3 "~" H 11350 6600 50  0001 C CNN
F 4 "27" V 11350 6600 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 6600 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 6600 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 6600 50  0001 C CNN "Tolerance_unit"
	1    11350 6600
	0    1    -1   0   
$EndComp
Wire Wire Line
	11250 6600 11050 6600
Wire Wire Line
	11250 6500 11050 6500
Wire Wire Line
	11250 5600 11050 5600
Wire Wire Line
	11250 5500 11050 5500
Text HLabel 13700 6600 2    50   BiDi ~ 0
D6-
Text HLabel 13700 5600 2    50   BiDi ~ 0
D5-
Text HLabel 13700 6500 2    50   BiDi ~ 0
D6+
Text HLabel 13700 5500 2    50   BiDi ~ 0
D5+
$Comp
L Power_Protection:USBLC6-4SC6 U2
U 1 1 61232E7C
P 12800 6050
F 0 "U2" V 13000 6650 50  0000 C CNN
F 1 "USBLC6-4SC6" V 12900 6650 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 12800 5550 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-4.pdf" H 13000 6400 50  0001 C CNN
	1    12800 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	12900 5650 12900 5500
Connection ~ 12900 5500
Wire Wire Line
	12900 5500 13700 5500
Wire Wire Line
	12700 5650 12700 5600
Connection ~ 12700 5600
Wire Wire Line
	12700 5600 13700 5600
Wire Wire Line
	12900 6450 12900 6500
Connection ~ 12900 6500
Wire Wire Line
	12900 6500 13700 6500
Wire Wire Line
	12700 6450 12700 6600
Connection ~ 12700 6600
Wire Wire Line
	12700 6600 13700 6600
Text Label 13250 6000 0    50   ~ 0
hub_vbus
Wire Wire Line
	13250 6000 13250 6050
Wire Wire Line
	13250 6050 13200 6050
$Comp
L power:GND #PWR014
U 1 1 61232E91
P 12350 6100
F 0 "#PWR014" H 12350 5850 50  0001 C CNN
F 1 "GND" H 12355 5927 50  0000 C CNN
F 2 "" H 12350 6100 50  0001 C CNN
F 3 "" H 12350 6100 50  0001 C CNN
	1    12350 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 6100 12350 6050
Wire Wire Line
	12350 6050 12400 6050
Text Label 11050 7450 2    50   ~ 0
hub_d7+
Text Label 11050 7550 2    50   ~ 0
hub_d7-
Wire Wire Line
	11450 7550 11700 7550
Wire Wire Line
	11700 7550 11700 7600
Wire Wire Line
	11450 7450 12000 7450
Wire Wire Line
	12000 7450 12000 7600
Wire Wire Line
	11700 7550 12700 7550
Connection ~ 11700 7550
Wire Wire Line
	12000 7450 12900 7450
Connection ~ 12000 7450
Wire Wire Line
	11700 7800 11700 7850
Wire Wire Line
	11700 7850 11850 7850
Wire Wire Line
	12000 7850 12000 7800
$Comp
L power:GND #PWR013
U 1 1 612509F8
P 11850 7850
F 0 "#PWR013" H 11850 7600 50  0001 C CNN
F 1 "GND" H 11855 7677 50  0000 C CNN
F 2 "" H 11850 7850 50  0001 C CNN
F 3 "" H 11850 7850 50  0001 C CNN
	1    11850 7850
	1    0    0    -1  
$EndComp
Connection ~ 11850 7850
Wire Wire Line
	11850 7850 12000 7850
$Comp
L Device:R_Small R28
U 1 1 61250A04
P 11700 7700
F 0 "R28" H 11759 7746 50  0000 L CNN
F 1 "15k" H 11759 7655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11700 7700 50  0001 C CNN
F 3 "~" H 11700 7700 50  0001 C CNN
F 4 "15e3" H 11700 7700 50  0001 C CIN "Value_expr"
F 5 "5 %" H 11700 7700 50  0001 C CNN "Tolerance"
F 6 "5" H 11700 7700 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 11700 7700 50  0001 C CNN "Tolerance_unit"
	1    11700 7700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R31
U 1 1 61250A0E
P 12000 7700
F 0 "R31" H 12059 7746 50  0000 L CNN
F 1 "15k" H 12059 7655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 12000 7700 50  0001 C CNN
F 3 "~" H 12000 7700 50  0001 C CNN
F 4 "15e3" H 12000 7700 50  0001 C CIN "Value_expr"
F 5 "5 %" H 12000 7700 50  0001 C CNN "Tolerance"
F 6 "5" H 12000 7700 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 12000 7700 50  0001 C CNN "Tolerance_unit"
	1    12000 7700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R24
U 1 1 61250A18
P 11350 7450
F 0 "R24" V 11250 7350 50  0000 C CNN
F 1 "27" V 11250 7550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 7450 50  0001 C CNN
F 3 "~" H 11350 7450 50  0001 C CNN
F 4 "27" V 11350 7450 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 7450 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 7450 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 7450 50  0001 C CNN "Tolerance_unit"
	1    11350 7450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R25
U 1 1 61250A22
P 11350 7550
F 0 "R25" V 11250 7450 50  0000 C CNN
F 1 "27" V 11250 7650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 11350 7550 50  0001 C CNN
F 3 "~" H 11350 7550 50  0001 C CNN
F 4 "27" V 11350 7550 50  0001 C CNN "Value_expr"
F 5 "10 %" V 11350 7550 50  0001 C CNN "Tolerance"
F 6 "10" V 11350 7550 50  0001 C CNN "Tolerance_expr"
F 7 "%" V 11350 7550 50  0001 C CNN "Tolerance_unit"
	1    11350 7550
	0    1    -1   0   
$EndComp
Wire Wire Line
	11250 7550 11050 7550
Wire Wire Line
	11250 7450 11050 7450
Text HLabel 13700 7550 2    50   BiDi ~ 0
D7-
Text HLabel 13700 7450 2    50   BiDi ~ 0
D7+
$Comp
L Power_Protection:USBLC6-4SC6 U6
U 1 1 61250A2C
P 12800 8000
F 0 "U6" V 13000 8600 50  0000 C CNN
F 1 "USBLC6-4SC6" V 12900 8600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 12800 7500 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-4.pdf" H 13000 8350 50  0001 C CNN
	1    12800 8000
	0    1    1    0   
$EndComp
Wire Wire Line
	12900 7600 12900 7450
Connection ~ 12900 7450
Wire Wire Line
	12900 7450 13700 7450
Wire Wire Line
	12700 7600 12700 7550
Connection ~ 12700 7550
Wire Wire Line
	12700 7550 13700 7550
Text Label 13250 7950 0    50   ~ 0
hub_vbus
Wire Wire Line
	13250 7950 13250 8000
Wire Wire Line
	13250 8000 13200 8000
$Comp
L power:GND #PWR015
U 1 1 61250A3B
P 12350 8050
F 0 "#PWR015" H 12350 7800 50  0001 C CNN
F 1 "GND" H 12355 7877 50  0000 C CNN
F 2 "" H 12350 8050 50  0001 C CNN
F 3 "" H 12350 8050 50  0001 C CNN
	1    12350 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 8050 12350 8000
Wire Wire Line
	12350 8000 12400 8000
Text Label 12700 8500 0    50   ~ 0
u-
Wire Wire Line
	12700 8500 12700 8400
Wire Wire Line
	12900 8400 12900 8500
Text Label 12900 8500 0    50   ~ 0
u+
Text Label 6900 3550 0    50   ~ 0
hub_d1+
Text Label 6900 3750 0    50   ~ 0
hub_d2+
Text Label 6900 3950 0    50   ~ 0
hub_d3+
Text Label 6900 4150 0    50   ~ 0
hub_d4+
Text Label 6900 3650 0    50   ~ 0
hub_d1-
Text Label 6900 3850 0    50   ~ 0
hub_d2-
Text Label 6900 4050 0    50   ~ 0
hub_d3-
Text Label 6900 4250 0    50   ~ 0
hub_d4-
$Comp
L Device:R_Small R2
U 1 1 60F8F3AA
P 4550 5100
F 0 "R2" V 4450 5150 50  0000 C CNN
F 1 "1.02k" V 4450 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4550 5100 50  0001 C CNN
F 3 "~" H 4550 5100 50  0001 C CNN
F 4 "1/(2*3.1416*Y1.Value*C1)" V 4550 5100 50  0001 C CNN "Value_expr"
	1    4550 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 61068A5A
P 4100 5250
F 0 "C2" H 4192 5296 50  0000 L CNN
F 1 "26p" H 4192 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4100 5250 50  0001 C CNN
F 3 "~" H 4100 5250 50  0001 C CNN
F 4 "C1" H 4100 5250 50  0001 C CNN "Value_expr"
	1    4100 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 61068D5F
P 3500 5250
F 0 "C1" H 3408 5204 50  0000 R CNN
F 1 "26p" H 3408 5295 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3500 5250 50  0001 C CNN
F 3 "~" H 3500 5250 50  0001 C CNN
F 4 "2*(Y1.C_Load - 7e-12)" H 3500 5250 50  0001 C CNN "Value_expr"
	1    3500 5250
	1    0    0    1   
$EndComp
Wire Wire Line
	3500 5150 3500 5100
Wire Wire Line
	3500 5100 3650 5100
Wire Wire Line
	4100 5150 4100 5100
Wire Wire Line
	4100 5100 3950 5100
Wire Wire Line
	4100 5350 4100 5400
Wire Wire Line
	4100 5400 3800 5400
Wire Wire Line
	3500 5400 3500 5350
$Comp
L power:GND #PWR03
U 1 1 6107940D
P 3800 5400
F 0 "#PWR03" H 3800 5150 50  0001 C CNN
F 1 "GND" H 3805 5227 50  0000 C CNN
F 2 "" H 3800 5400 50  0001 C CNN
F 3 "" H 3800 5400 50  0001 C CNN
	1    3800 5400
	1    0    0    -1  
$EndComp
Connection ~ 3800 5400
Wire Wire Line
	3800 5400 3500 5400
Wire Wire Line
	4100 5100 4450 5100
Connection ~ 4100 5100
Wire Wire Line
	4650 5100 5050 5100
Wire Wire Line
	4100 5000 5050 5000
Connection ~ 3500 5100
Wire Wire Line
	3500 5100 3500 4700
Wire Wire Line
	4100 4700 4100 5000
Wire Wire Line
	3500 4700 4100 4700
$Comp
L Device:Crystal Y1
U 1 1 61067C98
P 3800 5100
F 0 "Y1" H 3800 5400 50  0000 C CNN
F 1 "6 MHz" H 3800 5300 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 3800 5100 50  0001 C CNN
F 3 "~" H 3800 5100 50  0001 C CNN
F 4 "6e6" H 3800 5100 50  0001 C CNN "Value_expr"
F 5 "Hz" H 3800 5100 50  0001 C CNN "Value_unit"
F 6 "20p" H 3800 5100 50  0001 C CNN "C_Load"
F 7 "20e-12" H 3800 5100 50  0001 C CNN "C_Load_expr"
	1    3800 5100
	1    0    0    -1  
$EndComp
Text HLabel 3100 3900 0    50   BiDi ~ 0
U+
Text HLabel 3100 4000 0    50   BiDi ~ 0
U-
Text Notes 2750 3800 0    50   ~ 0
Upstream port
Wire Wire Line
	4850 4250 4850 4200
Text Label 4850 4200 2    50   ~ 0
hub_vcc
$Comp
L Device:C_Small C6
U 1 1 61033ECB
P 4850 4650
F 0 "C6" H 4758 4604 50  0000 R CNN
F 1 "100n" H 4758 4695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4850 4650 50  0001 C CNN
F 3 "~" H 4850 4650 50  0001 C CNN
F 4 "100e-9" H 4850 4650 50  0001 C CNN "Value_expr"
	1    4850 4650
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R19
U 1 1 6101C93A
P 4850 4350
F 0 "R19" H 4909 4396 50  0000 L CNN
F 1 "10k" H 4909 4305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4850 4350 50  0001 C CNN
F 3 "~" H 4850 4350 50  0001 C CNN
F 4 "10e3" H 4850 4350 50  0001 C CIN "Value_expr"
F 5 "5 %" H 4850 4350 50  0001 C CNN "Tolerance"
F 6 "5" H 4850 4350 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 4850 4350 50  0001 C CNN "Tolerance_unit"
	1    4850 4350
	-1   0    0    -1  
$EndComp
Text Notes 4300 3050 0    50   ~ 0
Identify as a\nfull-speed device
Wire Notes Line
	4600 3750 4600 3100
Wire Notes Line
	4650 3750 4600 3750
$Comp
L racklet:TUSB2077APTR U1
U 1 1 60FD1E45
P 5950 4900
F 0 "U1" H 5950 6050 50  0000 C CNN
F 1 "TUSB2077APTR" H 5950 5950 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 5950 6150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tusb2077a.pdf?HQS=dis-dk-null-digikeymode-dsf-pf-null-wwe&ts=1627013523157&ref_url=https%253A%252F%252Fwww.digikey.fi%252F" H 5950 6150 50  0001 C CNN
	1    5950 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6100CD5A
P 5950 6650
F 0 "#PWR05" H 5950 6400 50  0001 C CNN
F 1 "GND" H 5955 6477 50  0000 C CNN
F 2 "" H 5950 6650 50  0001 C CNN
F 3 "" H 5950 6650 50  0001 C CNN
	1    5950 6650
	1    0    0    -1  
$EndComp
Text Label 5950 3250 0    50   ~ 0
hub_vcc
$Comp
L power:GND #PWR01
U 1 1 6103DC32
P 4850 4750
F 0 "#PWR01" H 4850 4500 50  0001 C CNN
F 1 "GND" H 4855 4577 50  0000 C CNN
F 2 "" H 4850 4750 50  0001 C CNN
F 3 "" H 4850 4750 50  0001 C CNN
	1    4850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 6350 4950 6350
Wire Wire Line
	4950 6350 4950 6400
$Comp
L power:GND #PWR02
U 1 1 610822A2
P 4950 6400
F 0 "#PWR02" H 4950 6150 50  0001 C CNN
F 1 "GND" H 4955 6227 50  0000 C CNN
F 2 "" H 4950 6400 50  0001 C CNN
F 3 "" H 4950 6400 50  0001 C CNN
	1    4950 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5900 4950 5900
Wire Wire Line
	4950 5900 4950 5800
Wire Wire Line
	4950 5800 5050 5800
Wire Wire Line
	4950 5800 4850 5800
Connection ~ 4950 5800
Text Label 4850 5800 2    50   ~ 0
hub_vcc
NoConn ~ 5050 6000
Text Notes 550  5400 0    50   ~ 0
TODO:\n* LEDs for status outputs?\n* use suspend signal for powering off circuitry?
$Comp
L Device:R_Small R18
U 1 1 6114378C
P 4950 3750
F 0 "R18" H 5009 3796 50  0000 L CNN
F 1 "1.5k" H 5009 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4950 3750 50  0001 C CNN
F 3 "~" H 4950 3750 50  0001 C CNN
F 4 "1.5e3" H 4950 3750 50  0001 C CIN "Value_expr"
F 5 "5 %" H 4950 3750 50  0001 C CNN "Tolerance"
F 6 "5" H 4950 3750 50  0001 C CNN "Tolerance_expr"
F 7 "%" H 4950 3750 50  0001 C CNN "Tolerance_unit"
	1    4950 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5050 3550 4950 3550
Wire Wire Line
	4950 3550 4950 3650
Wire Wire Line
	4950 3900 5050 3900
Wire Wire Line
	4950 3850 4950 3900
Connection ~ 4950 3900
Wire Wire Line
	4850 4450 4850 4500
Wire Wire Line
	4850 4500 5050 4500
Connection ~ 4850 4500
Wire Wire Line
	4850 4500 4850 4550
Text Label 6900 4350 0    50   ~ 0
hub_d5+
Text Label 6900 4450 0    50   ~ 0
hub_d5-
Text Label 6900 4550 0    50   ~ 0
hub_d6+
Text Label 6900 4650 0    50   ~ 0
hub_d6-
Text Label 6900 4750 0    50   ~ 0
hub_d7+
Text Label 6900 4850 0    50   ~ 0
hub_d7-
Wire Wire Line
	3100 3900 4950 3900
Wire Wire Line
	3100 4000 5050 4000
Text Label 3700 4000 0    50   ~ 0
u-
Text Label 3700 3900 0    50   ~ 0
u+
Wire Wire Line
	5050 6250 4950 6250
Wire Wire Line
	4950 6250 4950 5900
Connection ~ 4950 5900
Text Notes 4300 6200 0    50   ~ 0
self-powered
Wire Notes Line
	4900 6250 4550 6250
Wire Notes Line
	4550 6250 4550 6200
Text Notes 7000 5500 0    50   ~ 0
active-low push-pull outputs\nthat enable external power switches\n\nPTC fuses on all downstream ports\nare more affordable so these are unused
Wire Notes Line
	6950 5600 6950 5000
Wire Wire Line
	5950 3250 5950 3300
Wire Wire Line
	5950 3300 5900 3300
Wire Wire Line
	5900 3300 5900 3350
Wire Wire Line
	5950 3300 6000 3300
Wire Wire Line
	6000 3300 6000 3350
Connection ~ 5950 3300
Wire Wire Line
	5850 6550 5850 6600
Wire Wire Line
	5850 6600 5950 6600
Wire Wire Line
	5950 6600 5950 6650
Wire Wire Line
	5950 6550 5950 6600
Connection ~ 5950 6600
Wire Wire Line
	6050 6550 6050 6600
Wire Wire Line
	6050 6600 5950 6600
Wire Wire Line
	6900 6350 6900 6250
Connection ~ 6900 5850
Wire Wire Line
	6900 5850 6900 5750
Connection ~ 6900 5950
Wire Wire Line
	6900 5950 6900 5850
Connection ~ 6900 6050
Wire Wire Line
	6900 6050 6900 5950
Connection ~ 6900 6150
Wire Wire Line
	6900 6150 6900 6050
Connection ~ 6900 6250
Wire Wire Line
	6900 6250 6900 6150
Text Label 6950 5750 0    50   ~ 0
hub_vcc
Wire Wire Line
	6950 5750 6900 5750
Connection ~ 6900 5750
NoConn ~ 6900 5600
NoConn ~ 6900 5500
NoConn ~ 6900 5400
NoConn ~ 6900 5300
NoConn ~ 6900 5200
NoConn ~ 6900 5100
NoConn ~ 6900 5000
$EndSCHEMATC
