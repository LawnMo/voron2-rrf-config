; mesh creation

G90				;
G1 Z10 F2400	; move Z up
M401			; deploy klicky
G29 S2			; disable mesh bed compensation
G29 S0			; probe and save mesh
if result != 0
  abort "Mesh probing failed"
M402			; retract klicky