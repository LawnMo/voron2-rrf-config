; homex.g
; called to home the X axis
;

G92 X0					; reset current position to 0

if !move.axes[1].homed
	G91
	G1 H2 Z5 F2400		; raise Z a bit
	G90

G91
G1 Y10 X-10 H2 F9000	; move Y forward to avoid the probe dock
;G1 Y-10 H2 F2400

G1 X355 F6000 H1		; Move quickly to X axis endstop (1st pass)
;M119
G1 X-5 F18000			; Go back a few mm
G1 X10 F360 H1			; Move slowly to X axis endstop (2nd pass)
G1 X-1 F1000			; Move away from endstop
G90