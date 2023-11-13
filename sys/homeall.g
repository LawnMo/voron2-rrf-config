; homeall.g
; called to home all axes
;

M98 P"/sys/homex.g"
M98 P"/sys/homey.g"
M98 P"/sys/homez.g"

; move to the center of the bed after home all
G90
G1 X175 Y177.5 F18000