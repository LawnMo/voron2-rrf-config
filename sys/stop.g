; stop.g
; called by M0
;

M106 P0 S0							; layer fan off
M220 S100							; reset speed factor to 100%
M221 D0 S100						; reset extrude factor to 100%

G1 E-3 F3600						; retract 3mm before parking

; park toolhead and bump Z +5mm
G1 Z{move.axes[2].machinePosition+5} F4800	; move Z up a bit
G1 X349 Y354 F9000							; park X/Y

; unload filament config
M702

; turn off heaters
G10 P0 S-273.1	; turn off T0
M144
M140 S-273.1	; turn off bed heater

;M84									; stop all motors
