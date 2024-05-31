; homez.g
; called to home the Z axis
;

; tune stealthchop
M18 Z
M17 Z
G4 P150

G91							; relative positioning
G1 H2 Z5 F6000				; raise Z 5mm
G90							; absolute positioning
M401 P0						; deploy probe
G1 X175 Y177.5 F18000		; move to the center of bed
G30 K0 Z-99999				; probe Z
M402 P0						; retract probe
