EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Tomodachi"
Date "2021-03-20"
Rev "2.2"
Comp ""
Comment1 "Dmitri Popov"
Comment2 "littlebackupbox.com"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR04
U 1 1 580C1B61
P 6150 1850
F 0 "#PWR04" H 6150 1700 50  0001 C CNN
F 1 "+5V" H 6150 1990 50  0000 C CNN
F 2 "" H 6150 1850 50  0000 C CNN
F 3 "" H 6150 1850 50  0000 C CNN
	1    6150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1850 6150 2000
Wire Wire Line
	6150 2000 5950 2000
Wire Wire Line
	6150 2100 5950 2100
Connection ~ 6150 2000
$Comp
L power:GND #PWR03
U 1 1 580C1D11
P 6050 4050
F 0 "#PWR03" H 6050 3800 50  0001 C CNN
F 1 "GND" H 6050 3900 50  0000 C CNN
F 2 "" H 6050 4050 50  0000 C CNN
F 3 "" H 6050 4050 50  0000 C CNN
	1    6050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2200 6050 2600
Wire Wire Line
	6050 3600 5950 3600
Wire Wire Line
	6050 3400 5950 3400
Connection ~ 6050 3600
Wire Wire Line
	6050 2900 5950 2900
Connection ~ 6050 3400
Wire Wire Line
	6050 2600 5950 2600
Connection ~ 6050 2900
$Comp
L power:GND #PWR02
U 1 1 580C1E01
P 5350 4050
F 0 "#PWR02" H 5350 3800 50  0001 C CNN
F 1 "GND" H 5350 3900 50  0000 C CNN
F 2 "" H 5350 4050 50  0000 C CNN
F 3 "" H 5350 4050 50  0000 C CNN
	1    5350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3900 5450 3900
Wire Wire Line
	5350 2400 5350 3200
Wire Wire Line
	5350 3200 5450 3200
Connection ~ 5350 3900
Connection ~ 5250 2000
Wire Wire Line
	5250 2800 5450 2800
Wire Wire Line
	5250 2000 5450 2000
Wire Wire Line
	5250 1850 5250 2000
$Comp
L power:+3.3V #PWR01
U 1 1 580C1BC1
P 5250 1850
F 0 "#PWR01" H 5250 1700 50  0001 C CNN
F 1 "+3.3V" H 5250 1990 50  0000 C CNN
F 2 "" H 5250 1850 50  0000 C CNN
F 3 "" H 5250 1850 50  0000 C CNN
	1    5250 1850
	1    0    0    -1  
$EndComp
Connection ~ 5350 3200
Wire Wire Line
	4300 2300 5450 2300
Wire Wire Line
	5450 2500 4300 2500
Wire Wire Line
	4300 2600 5450 2600
Wire Wire Line
	4300 2700 5450 2700
Wire Wire Line
	5450 2900 4300 2900
Wire Wire Line
	4300 3000 5450 3000
Wire Wire Line
	5450 3300 4300 3300
Wire Wire Line
	5450 3600 4300 3600
Wire Wire Line
	4300 3700 5450 3700
Wire Wire Line
	5950 3700 7000 3700
Wire Wire Line
	5950 3800 7000 3800
Wire Wire Line
	5950 3200 7000 3200
Wire Wire Line
	5950 3300 7000 3300
Wire Wire Line
	5950 3000 7000 3000
Wire Wire Line
	5950 3100 7000 3100
Wire Wire Line
	5950 2700 7000 2700
Wire Wire Line
	5950 2800 7000 2800
Wire Wire Line
	5950 2400 7000 2400
Wire Wire Line
	5950 2500 7000 2500
Wire Wire Line
	5950 3500 7000 3500
Text Label 4300 2100 0    50   ~ 0
GPIO2(SDA1)
Text Label 4300 2200 0    50   ~ 0
GPIO3(SCL1)
Text Label 4300 2300 0    50   ~ 0
GPIO4(GCLK)
Text Label 4300 2500 0    50   ~ 0
GPIO17(GEN0)
Text Label 4300 2600 0    50   ~ 0
GPIO27(GEN2)
Text Label 4300 2700 0    50   ~ 0
GPIO22(GEN3)
Text Label 4300 2900 0    50   ~ 0
GPIO10(SPI0_MOSI)
Text Label 4300 3000 0    50   ~ 0
GPIO9(SPI0_MISO)
Text Label 4300 3100 0    50   ~ 0
GPIO11(SPI0_SCK)
Text Label 4300 3300 0    50   ~ 0
ID_SD
Text Label 4300 3400 0    50   ~ 0
GPIO5
Text Label 4300 3500 0    50   ~ 0
GPIO6
Text Label 4300 3600 0    50   ~ 0
GPIO13(PWM1)
Text Label 4300 3700 0    50   ~ 0
GPIO19(SPI1_MISO)
Text Label 4300 3800 0    50   ~ 0
GPIO26
Text Label 7000 3800 2    50   ~ 0
GPIO20(SPI1_MOSI)
Text Label 7000 3700 2    50   ~ 0
GPIO16
Text Label 7000 3500 2    50   ~ 0
GPIO12(PWM0)
Text Label 7000 3300 2    50   ~ 0
ID_SC
Text Label 7000 3200 2    50   ~ 0
GPIO7(SPI1_CE_N)
Text Label 7000 3100 2    50   ~ 0
GPIO8(SPI0_CE_N)
Text Label 7000 3000 2    50   ~ 0
GPIO25(GEN6)
Text Label 7000 2800 2    50   ~ 0
GPIO24(GEN5)
Text Label 7000 2700 2    50   ~ 0
GPIO23(GEN4)
Text Label 7000 2500 2    50   ~ 0
GPIO18(GEN1)(PWM0)
Text Label 7000 2400 2    50   ~ 0
GPIO15(RXD0)
Text Label 7000 2300 2    50   ~ 0
GPIO14(TXD0)
Wire Wire Line
	6050 2200 5950 2200
Connection ~ 6050 2600
Text Notes 650  7600 0    50   ~ 0
ID_SD and ID_SC PINS:\nThese pins are reserved for HAT ID EEPROM.\n\nAt boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).\n\nDO NOT USE these pins for anything other\nthan attaching an I2C ID EEPROM. Leave\nunconnected if ID EEPROM not required.
Text Notes 3900 6800 0    50   ~ 0
Mounting Holes
$Comp
L Connector_Generic:Conn_02x20_Odd_Even P1
U 1 1 59AD464A
P 5650 2900
F 0 "P1" H 5700 4017 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 5700 3926 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 800 1950 50  0001 C CNN
F 3 "" H 800 1950 50  0001 C CNN
	1    5650 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3900 7000 3900
Text Label 7000 3900 2    50   ~ 0
GPIO21(SPI1_SCK)
Wire Wire Line
	6150 2000 6150 2100
Wire Wire Line
	6050 3600 6050 4050
Wire Wire Line
	6050 3400 6050 3600
Wire Wire Line
	6050 2900 6050 3400
Wire Wire Line
	5350 3900 5350 4050
Wire Wire Line
	5250 2000 5250 2800
Wire Wire Line
	5350 3200 5350 3900
Wire Wire Line
	6050 2600 6050 2900
$Comp
L SSD1306-128x64_OLED:SSD1306 Brd1
U 1 1 600C449A
P 3400 2550
F 0 "Brd1" V 2985 2608 50  0000 C CNN
F 1 "SSD1306" V 3076 2608 50  0000 C CNN
F 2 "SSD1306:128x64OLED" H 3400 2800 50  0001 C CNN
F 3 "" H 3400 2800 50  0001 C CNN
	1    3400 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 2400 5350 2400
Connection ~ 5350 2400
Wire Wire Line
	5350 2400 5450 2400
Wire Wire Line
	3750 2500 3800 2500
Wire Wire Line
	3800 2500 3800 2000
Wire Wire Line
	3800 2000 5250 2000
Wire Wire Line
	3750 2600 3850 2600
Wire Wire Line
	3850 2600 3850 2200
Wire Wire Line
	3850 2200 5450 2200
Wire Wire Line
	3750 2700 3900 2700
Wire Wire Line
	3900 2700 3900 2100
Wire Wire Line
	3900 2100 5450 2100
$Comp
L Device:LED D1
U 1 1 600CDD82
P 3600 3100
F 0 "D1" H 3593 3317 50  0000 C CNN
F 1 "ACT" H 3593 3226 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 3600 3100 50  0001 C CNN
F 3 "~" H 3600 3100 50  0001 C CNN
	1    3600 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 600CFD5B
P 7600 2300
F 0 "D2" H 7593 2045 50  0000 C CNN
F 1 "PWR" H 7593 2136 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 7600 2300 50  0001 C CNN
F 3 "~" H 7600 2300 50  0001 C CNN
	1    7600 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3100 5450 3100
Wire Wire Line
	3450 3100 3200 3100
Wire Wire Line
	2900 3100 2800 3100
Wire Wire Line
	2800 3100 2800 3200
Wire Wire Line
	2800 3200 5350 3200
Wire Wire Line
	5950 2300 7450 2300
Wire Wire Line
	7750 2300 7900 2300
Wire Wire Line
	8200 2300 8300 2300
Wire Wire Line
	8300 2300 8300 2200
Wire Wire Line
	8300 2200 6050 2200
Connection ~ 6050 2200
$Comp
L Switch:SW_Push_Dual_x2 SW2
U 1 1 600B15E5
P 2350 3800
F 0 "SW2" H 2350 4085 50  0000 C CNN
F 1 "RUN" H 2350 3994 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 2350 4000 50  0001 C CNN
F 3 "~" H 2350 4000 50  0001 C CNN
	1    2350 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 600D5E7B
P 3050 3100
F 0 "R1" V 2843 3100 50  0000 C CNN
F 1 "330" V 2934 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2980 3100 50  0001 C CNN
F 3 "~" H 3050 3100 50  0001 C CNN
	1    3050 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 600D384B
P 8050 2300
F 0 "R2" V 7843 2300 50  0000 C CNN
F 1 "330" V 7934 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7980 2300 50  0001 C CNN
F 3 "~" H 8050 2300 50  0001 C CNN
	1    8050 2300
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6016D91C
P 3950 7050
F 0 "H1" H 4050 7096 50  0000 L CNN
F 1 "MountingHole" H 4050 7005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 3950 7050 50  0001 C CNN
F 3 "~" H 3950 7050 50  0001 C CNN
	1    3950 7050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6016E2D8
P 3950 7350
F 0 "H2" H 4050 7396 50  0000 L CNN
F 1 "MountingHole" H 4050 7305 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 3950 7350 50  0001 C CNN
F 3 "~" H 3950 7350 50  0001 C CNN
	1    3950 7350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual_x2 SW1
U 1 1 604FA5F1
P 2350 3400
F 0 "SW1" H 2350 3685 50  0000 C CNN
F 1 "SELECT" H 2350 3594 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 2350 3600 50  0001 C CNN
F 3 "~" H 2350 3600 50  0001 C CNN
	1    2350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3500 4300 3500
Wire Wire Line
	2550 3800 5450 3800
Wire Wire Line
	2550 3400 5450 3400
Wire Wire Line
	5350 3900 1950 3900
Wire Wire Line
	1950 3900 1950 3800
Wire Wire Line
	1950 3400 2150 3400
Wire Wire Line
	2150 3800 1950 3800
Connection ~ 1950 3800
Wire Wire Line
	1950 3800 1950 3400
$EndSCHEMATC
