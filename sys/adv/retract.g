; retract.g
;

G1 E2 F3600		; unretract previous amount before parking
G1 E5 F400		; extrude 5mm
G1 E-15 F3600	; retract 15mm
G92 E0			; reset extrusion position
