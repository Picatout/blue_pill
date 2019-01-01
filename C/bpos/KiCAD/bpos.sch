EESchema Schematic File Version 4
LIBS:bpos-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
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
$Comp
L Personal_KiCAD:BLUE_PILL M1
U 1 1 5BABCA52
P 6025 3650
F 0 "M1" H 6025 5378 50  0000 C CNN
F 1 "BLUE_PILL" H 6025 5287 50  0000 C CNN
F 2 "" H 6025 3650 50  0001 C CNN
F 3 "" H 6025 3650 50  0001 C CNN
	1    6025 3650
	1    0    0    -1  
$EndComp
$Comp
L device:Battery_Cell BT1
U 1 1 5BABCD9B
P 4200 2900
F 0 "BT1" H 4318 2996 50  0000 L CNN
F 1 "CR2032" H 4318 2905 50  0000 L CNN
F 2 "" V 4200 2960 50  0001 C CNN
F 3 "" V 4200 2960 50  0001 C CNN
	1    4200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2700 5525 2700
$Comp
L power:GND #PWR02
U 1 1 5BABCE6D
P 4200 3000
F 0 "#PWR02" H 4200 2750 50  0001 C CNN
F 1 "GND" H 4205 2827 50  0000 C CNN
F 2 "" H 4200 3000 50  0001 C CNN
F 3 "" H 4200 3000 50  0001 C CNN
	1    4200 3000
	1    0    0    -1  
$EndComp
$Comp
L Personal_KiCAD:POLOLU23201a M2
U 1 1 5BABD376
P 3925 4250
F 0 "M2" H 3750 5025 50  0000 C CNN
F 1 "POLOLU23201a" H 3906 4934 50  0000 C CNN
F 2 "" H 3925 4450 50  0001 C CNN
F 3 "" H 3925 4450 50  0001 C CNN
	1    3925 4250
	1    0    0    -1  
$EndComp
Text GLabel 4250 4600 2    50   Input ~ 0
+3.3v
Wire Wire Line
	4125 4600 4250 4600
$Comp
L power:GND #PWR04
U 1 1 5BABD408
P 4450 4100
F 0 "#PWR04" H 4450 3850 50  0001 C CNN
F 1 "GND" H 4455 3927 50  0000 C CNN
F 2 "" H 4450 4100 50  0001 C CNN
F 3 "" H 4450 4100 50  0001 C CNN
	1    4450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4125 4100 4450 4100
Wire Wire Line
	4125 3800 4925 3800
Wire Wire Line
	4925 3800 4925 3300
Wire Wire Line
	4925 3300 5525 3300
Wire Wire Line
	4125 3900 5100 3900
Wire Wire Line
	5100 3900 5100 3400
Wire Wire Line
	5100 3400 5525 3400
Wire Wire Line
	4125 4300 4325 4300
Wire Wire Line
	4325 4300 4325 3100
Wire Wire Line
	4325 3100 5525 3100
Wire Wire Line
	4125 4400 4725 4400
Wire Wire Line
	4725 4400 4725 3200
Wire Wire Line
	4725 3200 5525 3200
$Comp
L power:GND #PWR05
U 1 1 5BABD833
P 5525 4750
F 0 "#PWR05" H 5525 4500 50  0001 C CNN
F 1 "GND" H 5530 4577 50  0000 C CNN
F 2 "" H 5525 4750 50  0001 C CNN
F 3 "" H 5525 4750 50  0001 C CNN
	1    5525 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5525 4500 5525 4600
Connection ~ 5525 4600
Wire Wire Line
	5525 4600 5525 4750
$Comp
L power:GND #PWR01
U 1 1 5BABD97D
P 6950 2825
F 0 "#PWR01" H 6950 2575 50  0001 C CNN
F 1 "GND" H 6955 2652 50  0000 C CNN
F 2 "" H 6950 2825 50  0001 C CNN
F 3 "" H 6950 2825 50  0001 C CNN
	1    6950 2825
	1    0    0    -1  
$EndComp
Wire Wire Line
	6525 2800 6950 2800
Wire Wire Line
	6950 2800 6950 2825
Text Notes 5800 5275 0    50   ~ 0
USB connect
Text Notes 5725 1875 0    50   ~ 0
STLINK connect
$Comp
L Personal_KiCAD:SDcardHolder M3
U 1 1 5BABE132
P 3475 5525
F 0 "M3" H 3653 5576 50  0000 L CNN
F 1 "SDcardHolder" H 3653 5485 50  0000 L CNN
F 2 "" H 3475 5525 50  0001 C CNN
F 3 "" H 3475 5525 50  0001 C CNN
	1    3475 5525
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5BABE192
P 3875 5950
F 0 "#PWR07" H 3875 5700 50  0001 C CNN
F 1 "GND" H 3880 5777 50  0000 C CNN
F 2 "" H 3875 5950 50  0001 C CNN
F 3 "" H 3875 5950 50  0001 C CNN
	1    3875 5950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3875 5775 3875 5950
Text GLabel 3925 5275 2    50   Input ~ 0
+3.3v
Wire Wire Line
	3925 5275 3875 5275
Text Label 5250 3100 0    50   ~ 0
CTS_I
Text Label 5250 3200 0    50   ~ 0
RTS_O
Text Label 5250 3300 0    50   ~ 0
TX
Text Label 5250 3400 0    50   ~ 0
RX
Wire Wire Line
	5200 5375 5200 3500
Wire Wire Line
	5200 3500 5525 3500
Wire Wire Line
	3875 5375 5200 5375
Wire Wire Line
	5275 5575 5275 3600
Wire Wire Line
	5275 3600 5525 3600
Wire Wire Line
	3875 5575 5275 5575
Wire Wire Line
	5350 5675 5350 3700
Wire Wire Line
	5350 3700 5525 3700
Wire Wire Line
	3875 5675 4500 5675
Wire Wire Line
	5425 5475 5425 3800
Wire Wire Line
	5425 3800 5525 3800
Wire Wire Line
	3875 5475 5425 5475
$Comp
L conn:Mini-DIN-6 J1
U 1 1 5C265264
P 7975 3550
F 0 "J1" H 7975 3915 50  0000 C CNN
F 1 "PS/2 keyboard" H 7975 3824 50  0000 C CNN
F 2 "" H 7975 3550 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 7975 3550 50  0001 C CNN
	1    7975 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5C26534D
P 8550 3775
F 0 "#PWR03" H 8550 3525 50  0001 C CNN
F 1 "GND" H 8555 3602 50  0000 C CNN
F 2 "" H 8550 3775 50  0001 C CNN
F 3 "" H 8550 3775 50  0001 C CNN
	1    8550 3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	8275 3550 8550 3550
Text GLabel 7675 3550 0    50   Input ~ 0
+5v
$Comp
L device:R R1
U 1 1 5C2658B1
P 8450 3050
F 0 "R1" H 8520 3096 50  0000 L CNN
F 1 "10K" H 8520 3005 50  0000 L CNN
F 2 "" V 8380 3050 50  0001 C CNN
F 3 "" H 8450 3050 50  0001 C CNN
	1    8450 3050
	1    0    0    -1  
$EndComp
$Comp
L device:R R2
U 1 1 5C26597F
P 8850 3050
F 0 "R2" H 8920 3096 50  0000 L CNN
F 1 "10K" H 8920 3005 50  0000 L CNN
F 2 "" V 8780 3050 50  0001 C CNN
F 3 "" H 8850 3050 50  0001 C CNN
	1    8850 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8275 3450 8450 3450
Wire Wire Line
	8450 3450 8450 3200
Wire Wire Line
	8275 3650 8850 3650
Wire Wire Line
	8850 3650 8850 3200
Wire Wire Line
	8550 3550 8550 3775
Wire Wire Line
	8850 2900 8450 2900
Text GLabel 8450 2900 0    50   Input ~ 0
+3.3v
Text Label 8275 3650 0    50   ~ 0
DAT
Text Label 8275 3450 0    50   ~ 0
CLK
Text Label 6525 4000 0    50   ~ 0
DAT
Text Label 6525 4100 0    50   ~ 0
CLK
$Comp
L device:R R5
U 1 1 5C26731A
P 4500 5075
F 0 "R5" H 4570 5121 50  0000 L CNN
F 1 "10K" H 4570 5030 50  0000 L CNN
F 2 "" V 4430 5075 50  0001 C CNN
F 3 "" H 4500 5075 50  0001 C CNN
	1    4500 5075
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5225 4500 5675
Connection ~ 4500 5675
Wire Wire Line
	4500 5675 5350 5675
Text GLabel 4500 4850 2    50   Input ~ 0
+3.3v
Wire Wire Line
	4500 4850 4500 4925
$Comp
L conn:Conn_Coaxial J2
U 1 1 5C2685DF
P 7825 4475
F 0 "J2" H 7924 4451 50  0000 L CNN
F 1 "composite video" H 7924 4360 50  0000 L CNN
F 2 "" H 7825 4475 50  0001 C CNN
F 3 "" H 7825 4475 50  0001 C CNN
	1    7825 4475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C2686CE
P 7825 4750
F 0 "#PWR06" H 7825 4500 50  0001 C CNN
F 1 "GND" H 7830 4577 50  0000 C CNN
F 2 "" H 7825 4750 50  0001 C CNN
F 3 "" H 7825 4750 50  0001 C CNN
	1    7825 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7825 4675 7825 4750
$Comp
L device:R R3
U 1 1 5C268ED3
P 7275 4200
F 0 "R3" V 7068 4200 50  0000 C CNN
F 1 "680R" V 7159 4200 50  0000 C CNN
F 2 "" V 7205 4200 50  0001 C CNN
F 3 "" H 7275 4200 50  0001 C CNN
	1    7275 4200
	0    1    1    0   
$EndComp
$Comp
L device:R R4
U 1 1 5C268F44
P 7275 4425
F 0 "R4" V 7375 4425 50  0000 C CNN
F 1 "120R" V 7450 4425 50  0000 C CNN
F 2 "" V 7205 4425 50  0001 C CNN
F 3 "" H 7275 4425 50  0001 C CNN
	1    7275 4425
	0    1    1    0   
$EndComp
Wire Wire Line
	7425 4200 7425 4425
Wire Wire Line
	7425 4425 7425 4475
Wire Wire Line
	7425 4475 7675 4475
Connection ~ 7425 4425
Wire Wire Line
	6525 4200 7125 4200
Wire Wire Line
	6525 4300 7125 4300
Wire Wire Line
	7125 4300 7125 4425
Text Label 6550 4200 0    50   ~ 0
SYNC
Text Label 6525 4300 0    50   ~ 0
VIDEO
Text Notes 2950 2375 0    197  ~ 0
BPOS\nplatform
$EndSCHEMATC