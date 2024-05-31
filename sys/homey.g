; homey.g
; called to home the Y axis
;

G92 Y0				; reset current position to 0

if !move.axes[0].homed
	G91
	G1 H2 Z5 F2400	; raise Z a bit
	G90

G91
G1 Y365 F6000 H1	; Move quickly to Y axis endstop (1st pass)
G1 Y-5 F18000		; Go back a few mm
G1 Y10 F360 H1		; Move slowly to Y axis endstop (2nd pass)
G1 Y-1 F1000		; Move away from endstop
G90