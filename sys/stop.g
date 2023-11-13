; stop.g
; called by M0
;

M106 P0 S0							; layer fan off
M220 S100							; reset speed factor to 100%
M221 D0 S100						; reset extrude factor to 100%

G1 E-2 F3600						; retract 2mm before parking

M98 P"0:/sys/adv/park.g" X349 Y177.5; park toolhead and bump Z +5mm

M98 P"0:/sys/adv/turnoff.g"			; turn off heaters

M84									; stop all motors
