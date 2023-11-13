; ST7567 Init for FYSETC Mini12864 Panel V2.1

M950 E0 C"LCD_D5"				; create strip 0 on pin LCD_D5 and set it to RGB
M150 E0 R0 U0 B0 S3 F0			; Turn off backlight

M950 P1 C"LCD_D4"				; Configure reset pin

; hardware reset of LCD
M42 P1 S0
G4 P500
M42 P1 S1

M918 P2 C30 F100000 E4			; Turn display on

M150 E0 R255 U0 B64 P255 S1 F1	; display led
M150 E0 R255 U0 B0 P255 S1 F1	; left encoder led
M150 E0 R255 U0 B0 P255 S1 F0	; right encoder led
;M150 K0 R255 U0 B0 P255		; full green