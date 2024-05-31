; Configuration file for BTT Octopus Pro v1.0 F429 (firmware version 3)
; executed by the firmware on start-up
;

; ---------
; General preferences
; ---------
G90														; send absolute coordinates...
M83														; ...but relative extruder moves
M550 P"Mr Garrison"										; set printer name
M669 K1													; select CoreXY mode


; ---------
; Network
; ---------
;M551 P"azerty"											; set password
M552 S1													; enable network
M586 P0 S1												; enable HTTP
M586 P1 S0												; disable FTP
M586 P2 S0												; disable Telnet


; ---------
; Drives
; ---------
M569 P0 S0 D2											; physical drive 0 goes backwards using default driver timings
M569 P1 S0 D2											; physical drive 1 goes forwards using default driver timings
M569 P2 S0 D3 V0										; physical drive 2 goes backwards using default driver timings
M569 P3 S1 D3 V0										; physical drive 3 goes forwards using default driver timings
M569 P4 S0 D3 V0										; physical drive 4 goes backwards using default driver timings
M569 P5 S1 D3 V0										; physical drive 5 goes forwards using default driver timings
M569 P124.0 S1 D2										; toolboard drive 124.0 goes forwards using default driver timings
M584 X0 Y1 Z2:3:4:5 E124.0								; set drive mapping
M350 X16 Y16 Z16 E16 I1									; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E710  						; set steps per mm
M566 X600.00 Y600.00 Z240.00 E600.00					; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z2400.00 E5000.00				; set maximum speeds (mm/min)
M201 X5000.00 Y5000.00 Z120.00 E3200.00					; set accelerations (mm/s^2)
M201.1 X1000.00 Y1000.00 Z100.00 E250.00				; set homing accelerations (mm/s^2)
M906 X1200 Y1200 Z1200 E800 I40							; set motor currents (mA) and motor idle factor in per cent
M84 S30													; Set idle timeout

; Axis Limits
M208 X0:350 Y0:355 Z0:330								; set axis limits

; ---------
; Endstops
; ---------
M574 X2 S1 P"124.io1.in"								; configure switch-type (e.g. microswitch) endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"										; configure switch-type (e.g. microswitch) endstop for high end on Y via pin ystop

; ---------
; Z-Probes
; ---------
M558 K0 P8 C"^124.io0.in" T18000 F600:180 H2 A10 S0.01	; set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z2.5										; set Z probe trigger value, offset and trigger height
G31 K0 P500 X-2.5 Y24.5 Z6.25

M558 K1 P8 C"^zstop" T18000 F600:180 H1 A10 S0.005 R0	; Z endstop
G31 K1 P500 X0 Y0 Z0									; for auto Z

M557 X30:320 Y30:320 P5									; define mesh grid
M671 X-60:-60:410:410 Y-10:420:420:-10 S10.0			; Define Z belts locations (Front_Left, Back_Left, Back_Right, Front_Right)

; ---------
; Heaters
; ---------
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092			; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"e1heat" Q10 T0								; create bed heater output on e1heat and map it to sensor 0
M307 H0 B0 S1.00										; disable bang-bang mode for the bed heater and set PWM limit
M140 H0													; map heated bed to heater 0
M143 H0 S115											; set temperature limit for heater 0 to 115C
M308 S1 P"124.temp0" Y"pt1000" T100000 B4092 R1000		; configure sensor 1 as thermistor on pin 124.e0temp
M950 H1 C"124.out0" T1									; create nozzle heater output on 124.out0 and map it to sensor 1
M307 H1 B0 S1.00										; disable bang-bang mode for heater  and set PWM limit
M143 H1 S300											; set temperature limit for heater 1 to 300C

M308 S3 A"MCU" Y"mcu-temp"								; mcu temp for electronics fans

; ---------
; Fans
; ---------

M950 F0 C"124.out1" Q50									; create fan 0 on pin fan1 and set its frequency
M106 P0 C"Hotend Fan" S255 H1 T45						; set fan 0 value. Thermostatic control is turned on

M950 F1 C"124.out2" Q50									; create fan 1 on pin fan0 and set its frequency
M106 P1 C"Part-Cooling Fan" S0 H-1						; set fan 1 value. Thermostatic control is turned off

M950 F2 C"fan2" Q50										; create fan 2 on pin fan2 and set its frequency
M106 P2 C"Motherboard Fan" X0.45 H3 T40				    ; set fan 2 value. Thermostatic control is turned on

M950 F3 C"fan3" Q50										; create fan 3 on pin fan3 and set its frequency
M106 P3 C"PSU Fan" X0.40 H3 T40 					    ; set fan 3 value. Thermostatic control is turned on

M950 F4 C"fan4" Q50										; create fan 4 on pin fan4 and set its frequency
M106 P4 C"Extraction Fan" X0.35 H3 T40  				; set fan 4 value. Thermostatic control is turned on

M950 F5 C"fan5" Q50										; create fan 0 on pin fan0 and set its frequency
M106 P5 C"Nevermore" S0 H-1								; set fan 0 value. Thermostatic control is turned off

; ---------
; dht22
; ---------
M308 S10 P"B.8" Y"dht22" A"Chbr Temp[C]"
M308 S11 P"S10.1" Y"dhthumidity" A"Chbr Hum[%]"

; ---------
; 12864
; ---------
M98 P"screen.g"											; load screen and leds init

; ---------
; LEDS
; ---------

; strip 0 is defined in screen.g

M950 E1 C"B.0" T1										; create strip 1 on pin B.0 and set it to RGB
M150 E1 R255 U255 B255 P128	S24							; set strip 1 to white by default - 24 leds total

M950 E2 C"124.rgbled" T1								; create strip 1 on pin 124.rgbled and set it to RGB
M150 E2 R255 U255 B255 P128 S3							; set strip 2 to white by default - 3 leds total

; lis2dw ccelerometer
M955 P124.0 I10
M593 P"zvdd" F42 S0.1

; pressure advance
M572 D0 S0.034

; ---------
; Tools
; ---------
M563 P0 D0 H1											; define tool 0
G10 P0 X0 Y0 Z0											; set tool 0 axis offsets
G10 P0 R0 S0											; set initial tool 0 active and standby temperatures to 0C


; ---------
; Miscellaneous
; ---------
M501													; load saved parameters from non-volatile memory
T0														; select first tool
