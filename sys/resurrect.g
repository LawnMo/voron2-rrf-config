; File "0:/gcodes/[a]_Buffer_Wheel.gcode" resume print after print paused at 2022-04-30 21:24
G21
M140 P0 S110.0
G29 S1
G92 X297.000 Y50.000 Z0.180
G60 S1
G10 P0 S240 R50
T0 P0
M98 P"resurrect-prologue.g"
M116
M290 X0.000 Y0.000 Z0.020 R0
T-1 P0
T0 P6
; Workplace coordinates
G10 L2 P1 X0.00 Y0.00 Z0.00
G10 L2 P2 X0.00 Y0.00 Z0.00
G10 L2 P3 X0.00 Y0.00 Z0.00
G10 L2 P4 X0.00 Y0.00 Z0.00
G10 L2 P5 X0.00 Y0.00 Z0.00
G10 L2 P6 X0.00 Y0.00 Z0.00
G10 L2 P7 X0.00 Y0.00 Z0.00
G10 L2 P8 X0.00 Y0.00 Z0.00
G10 L2 P9 X0.00 Y0.00 Z0.00
G54
M106 S0.00
M106 P0 S0.00
M116
G92 E0.00000
M83
M486 S0 A""
M486 S1 A""
M486 S2 A""
M486 S3 A""
M486 S4 A""
M486 S5 A""
M486 S6 A""
M486 S7 A""
M486 S8 A""
M486 S9 A""
M486 S10 A""
M486 S11 A""
M486 S12 A""
M486 S13 A""
M486 S14 A""
M486 S15 A""
M486 S16 A""
M486 S17 A""
M486 S18 A""
M486 S19 A""
M486 S20 A""
M486 S-1
G17
M23 "0:/gcodes/[a]_Buffer_Wheel.gcode"
M26 S5374
G0 F6000 Z2.200
G0 F6000 X297.000 Y50.000
G0 F6000 Z0.200
G1 F3000.0 P0
G21
M24
