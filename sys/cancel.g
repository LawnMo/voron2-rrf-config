; cancel.g
; called by M25 or from a screen
;

M220 S100							; restore speed to 100%
M221 S100							; restore extrusion flow to 100%

M106 P0 S0							; layer fan off

M83                                 ; relative extruder moves
G1 E-1 F3600						; retract 1mm before parking

G1 Z{move.axes[2].machinePosition+5} F4800 ; move Z up a bit

; unload filament config
M702

; turn off heaters
G10 P0 S-273.1	; turn off T0
M144
M140 S-273.1	; turn off bed heater
