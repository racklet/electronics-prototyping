EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 60AE4690
P 3400 3450
F 0 "J3" H 3450 4600 50  0000 C CNN
F 1 "Raspberry Pi GPIO PinSocket" H 3450 4500 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 3400 3450 50  0001 C CNN
F 3 "~" H 3400 3450 50  0001 C CNN
	1    3400 3450
	1    0    0    -1  
$EndComp
Text HLabel 1800 1800 0    50   Input ~ 0
5.1V
Text HLabel 1800 1950 0    50   UnSpc ~ 0
GND
Wire Wire Line
	3700 2750 3800 2750
Wire Wire Line
	1800 1800 2000 1800
Wire Wire Line
	1800 1950 2000 1950
Text Label 2000 1950 0    50   ~ 0
Ground
Wire Wire Line
	3700 2650 3800 2650
Wire Wire Line
	3800 2550 3700 2550
Connection ~ 3800 2550
Wire Wire Line
	3800 2650 3800 2550
Wire Wire Line
	3900 2550 3800 2550
Wire Wire Line
	3800 2750 3800 3150
Wire Wire Line
	3800 3150 3700 3150
Wire Wire Line
	3800 3150 3800 3450
Wire Wire Line
	3800 3450 3700 3450
Connection ~ 3800 3150
Wire Wire Line
	3800 3450 3800 3950
Wire Wire Line
	3800 3950 3700 3950
Connection ~ 3800 3450
Wire Wire Line
	3100 2950 3100 3750
Wire Wire Line
	3100 3750 3200 3750
Wire Wire Line
	3100 2950 3200 2950
Wire Wire Line
	3100 3750 3100 4450
Wire Wire Line
	3100 4450 3200 4450
Connection ~ 3100 3750
Wire Wire Line
	3700 4150 3800 4150
Wire Wire Line
	3800 4150 3800 3950
Connection ~ 3800 3950
Wire Wire Line
	3100 4450 3100 4650
Connection ~ 3100 4450
Connection ~ 3800 4150
Wire Wire Line
	3800 4150 3800 4650
Wire Wire Line
	3700 3850 3900 3850
Wire Wire Line
	3200 3850 3000 3850
Text Label 3000 3850 2    50   ~ 0
GPIO_0_(ID_SD)
Wire Notes Line
	8800 6450 8800 5750
Wire Notes Line
	8800 5750 11150 5750
Wire Notes Line
	11150 5750 11150 6450
Wire Notes Line
	11150 6450 8800 6450
Text Notes 8850 6050 0    50   ~ 0
Pins 27 and 28 correspond to ID_SD and ID_SC\nrespectively. They are not used and should be\nleft as unconnected to conform with the HAT specification
Wire Wire Line
	3200 4050 3000 4050
Text Label 3000 4050 2    50   ~ 0
GPIO_6
Wire Wire Line
	3700 2850 3900 2850
Text Label 3900 2850 0    50   ~ 0
GPIO_14_(TXD)
Text Label 3900 4250 0    50   ~ 0
GPIO_16
Wire Wire Line
	3900 4250 3700 4250
Text Label 10100 5400 0    50   ~ 0
GPIO_6
Text Label 10100 5500 0    50   ~ 0
GPIO_14
Text Label 10100 5600 0    50   ~ 0
GPIO_16
Text Notes 8850 5300 0    50   ~ 0
Warning! Might be driven at boot time by old hardware
Wire Notes Line
	8800 5700 8800 5150
Wire Notes Line
	8800 5150 11150 5150
Wire Notes Line
	11150 5150 11150 5700
Wire Notes Line
	11150 5700 8800 5700
Text Notes 3900 1600 0    50   ~ 0
Pi GPIO header signals are forwarded to PinHeader for prototyping
Text Notes 4900 1800 0    50   ~ 0
————————>
Text Label 3000 2550 2    50   ~ 0
3V3_power
Text Label 3000 2650 2    50   ~ 0
GPIO_2_(SDA)
Text Label 3000 2750 2    50   ~ 0
GPIO_3_(SCL)
Text Label 3000 2850 2    50   ~ 0
GPIO_4_(GPCLK0)
Text Notes 2950 2150 0    50   ~ 0
Connects to Pi GPIO header
Text Notes 6300 2150 0    50   ~ 0
PinHeader for prototyping
Text Label 3000 3050 2    50   ~ 0
GPIO_17
Wire Wire Line
	3000 2550 3200 2550
Wire Wire Line
	3200 2650 3000 2650
Wire Wire Line
	3000 2750 3200 2750
Wire Wire Line
	3200 2850 3000 2850
Wire Wire Line
	3000 3050 3200 3050
Text Label 3000 3150 2    50   ~ 0
GPIO_27
Text Label 3000 3250 2    50   ~ 0
GPIO_22
Text Label 3000 3350 2    50   ~ 0
3V3_power
Wire Wire Line
	3000 3350 3200 3350
Wire Wire Line
	3200 3250 3000 3250
Wire Wire Line
	3000 3150 3200 3150
Text Label 3000 3450 2    50   ~ 0
GPIO_10_(MOSI)
Text Label 3000 3550 2    50   ~ 0
GPIO_9_(MISO)
Text Label 3000 3650 2    50   ~ 0
GPIO_11_(SCLK)
Wire Wire Line
	3000 3450 3200 3450
Wire Wire Line
	3200 3550 3000 3550
Wire Wire Line
	3000 3650 3200 3650
Text Label 3900 3850 0    50   ~ 0
GPIO_1_(ID_SC)
Text Label 3000 3950 2    50   ~ 0
GPIO_5
Wire Wire Line
	3000 3950 3200 3950
Text Label 3000 4150 2    50   ~ 0
GPIO_13_(PWM1)
Wire Wire Line
	3000 4150 3200 4150
Text Label 3000 4250 2    50   ~ 0
GPIO_19_(PCM_FS)
Text Label 3000 4350 2    50   ~ 0
GPIO_26
Wire Wire Line
	3000 4250 3200 4250
Wire Wire Line
	3200 4350 3000 4350
Text Label 2000 1800 0    50   ~ 0
5V_power
Text Label 3900 2550 0    50   ~ 0
5V_power
Text Label 3100 4650 3    50   ~ 0
Ground
Text Label 3800 4650 3    50   ~ 0
Ground
Text Label 3900 2950 0    50   ~ 0
GPIO_15_(RXD)
Wire Wire Line
	3900 2950 3700 2950
Text Label 3900 3050 0    50   ~ 0
GPIO_18_(PCM_CLK)
Wire Wire Line
	3900 3050 3700 3050
Text Label 3900 3250 0    50   ~ 0
GPIO_23
Text Label 3900 3350 0    50   ~ 0
GPIO_24
Wire Wire Line
	3900 3350 3700 3350
Wire Wire Line
	3900 3250 3700 3250
Text Label 3900 3550 0    50   ~ 0
GPIO_25
Wire Wire Line
	3900 3550 3700 3550
Text Label 3900 3650 0    50   ~ 0
GPIO_8_(CE0)
Text Label 3900 3750 0    50   ~ 0
GPIO_7_(CE1)
Wire Wire Line
	3900 3650 3700 3650
Wire Wire Line
	3700 3750 3900 3750
Text Label 3900 4050 0    50   ~ 0
GPIO_12_(PWM0)
Wire Wire Line
	3900 4050 3700 4050
Text Label 3900 4350 0    50   ~ 0
GPIO_20_(PCM_DIN)
Text Label 3900 4450 0    50   ~ 0
GPIO_21_(PCM_DOUT)
Wire Wire Line
	3900 4350 3700 4350
Wire Wire Line
	3900 4450 3700 4450
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J6
U 1 1 60B69A79
P 6700 3450
F 0 "J6" H 6750 4600 50  0000 C CNN
F 1 "Prototyping PinHeader" H 6750 4500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 6700 3450 50  0001 C CNN
F 3 "~" H 6700 3450 50  0001 C CNN
	1    6700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2750 7100 2750
Wire Wire Line
	7000 2650 7100 2650
Wire Wire Line
	7100 2550 7000 2550
Connection ~ 7100 2550
Wire Wire Line
	7100 2650 7100 2550
Wire Wire Line
	7200 2550 7100 2550
Wire Wire Line
	7100 2750 7100 3150
Wire Wire Line
	7100 3150 7000 3150
Wire Wire Line
	7100 3150 7100 3450
Wire Wire Line
	7100 3450 7000 3450
Connection ~ 7100 3150
Wire Wire Line
	7100 3450 7100 3950
Wire Wire Line
	7100 3950 7000 3950
Connection ~ 7100 3450
Wire Wire Line
	6400 2950 6400 3750
Wire Wire Line
	6400 3750 6500 3750
Wire Wire Line
	6400 2950 6500 2950
Wire Wire Line
	6400 3750 6400 4450
Wire Wire Line
	6400 4450 6500 4450
Connection ~ 6400 3750
Wire Wire Line
	7000 4150 7100 4150
Wire Wire Line
	7100 4150 7100 3950
Connection ~ 7100 3950
Wire Wire Line
	6400 4450 6400 4650
Connection ~ 6400 4450
Connection ~ 7100 4150
Wire Wire Line
	7100 4150 7100 4650
Wire Wire Line
	7000 3850 7200 3850
Wire Wire Line
	6500 3850 6300 3850
Text Label 6300 3850 2    50   ~ 0
GPIO_0_(ID_SD)
Wire Wire Line
	6500 4050 6300 4050
Text Label 6300 4050 2    50   ~ 0
GPIO_6
Wire Wire Line
	7000 2850 7200 2850
Text Label 7200 2850 0    50   ~ 0
GPIO_14_(TXD)
Text Label 7200 4250 0    50   ~ 0
GPIO_16
Wire Wire Line
	7200 4250 7000 4250
Text Label 6300 2550 2    50   ~ 0
3V3_power
Text Label 6300 2650 2    50   ~ 0
GPIO_2_(SDA)
Text Label 6300 2750 2    50   ~ 0
GPIO_3_(SCL)
Text Label 6300 2850 2    50   ~ 0
GPIO_4_(GPCLK0)
Text Label 6300 3050 2    50   ~ 0
GPIO_17
Wire Wire Line
	6300 2550 6500 2550
Wire Wire Line
	6500 2650 6300 2650
Wire Wire Line
	6300 2750 6500 2750
Wire Wire Line
	6500 2850 6300 2850
Wire Wire Line
	6300 3050 6500 3050
Text Label 6300 3150 2    50   ~ 0
GPIO_27
Text Label 6300 3250 2    50   ~ 0
GPIO_22
Text Label 6300 3350 2    50   ~ 0
3V3_power
Wire Wire Line
	6300 3350 6500 3350
Wire Wire Line
	6500 3250 6300 3250
Wire Wire Line
	6300 3150 6500 3150
Text Label 6300 3450 2    50   ~ 0
GPIO_10_(MOSI)
Text Label 6300 3550 2    50   ~ 0
GPIO_9_(MISO)
Text Label 6300 3650 2    50   ~ 0
GPIO_11_(SCLK)
Wire Wire Line
	6300 3450 6500 3450
Wire Wire Line
	6500 3550 6300 3550
Wire Wire Line
	6300 3650 6500 3650
Text Label 7200 3850 0    50   ~ 0
GPIO_1_(ID_SC)
Text Label 6300 3950 2    50   ~ 0
GPIO_5
Wire Wire Line
	6300 3950 6500 3950
Text Label 6300 4150 2    50   ~ 0
GPIO_13_(PWM1)
Wire Wire Line
	6300 4150 6500 4150
Text Label 6300 4250 2    50   ~ 0
GPIO_19_(PCM_FS)
Text Label 6300 4350 2    50   ~ 0
GPIO_26
Wire Wire Line
	6300 4250 6500 4250
Wire Wire Line
	6500 4350 6300 4350
Text Label 7200 2550 0    50   ~ 0
5V_power
Text Label 6400 4650 3    50   ~ 0
Ground
Text Label 7100 4650 3    50   ~ 0
Ground
Text Label 7200 2950 0    50   ~ 0
GPIO_15_(RXD)
Wire Wire Line
	7200 2950 7000 2950
Text Label 7200 3050 0    50   ~ 0
GPIO_18_(PCM_CLK)
Wire Wire Line
	7200 3050 7000 3050
Text Label 7200 3250 0    50   ~ 0
GPIO_23
Text Label 7200 3350 0    50   ~ 0
GPIO_24
Wire Wire Line
	7200 3350 7000 3350
Wire Wire Line
	7200 3250 7000 3250
Text Label 7200 3550 0    50   ~ 0
GPIO_25
Wire Wire Line
	7200 3550 7000 3550
Text Label 7200 3650 0    50   ~ 0
GPIO_8_(CE0)
Text Label 7200 3750 0    50   ~ 0
GPIO_7_(CE1)
Wire Wire Line
	7200 3650 7000 3650
Wire Wire Line
	7000 3750 7200 3750
Text Label 7200 4050 0    50   ~ 0
GPIO_12_(PWM0)
Wire Wire Line
	7200 4050 7000 4050
Text Label 7200 4350 0    50   ~ 0
GPIO_20_(PCM_DIN)
Text Label 7200 4450 0    50   ~ 0
GPIO_21_(PCM_DOUT)
Wire Wire Line
	7200 4350 7000 4350
Wire Wire Line
	7200 4450 7000 4450
Text Label 9750 6300 0    50   ~ 0
GPIO_1_(ID_SC)
Text Label 9750 6200 0    50   ~ 0
GPIO_0_(ID_SD)
$EndSCHEMATC
