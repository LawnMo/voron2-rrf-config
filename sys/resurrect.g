; File "0:/gcodes/Pot_-_Hex_-_Body.gcode" resume print after print paused at 2022-02-14 16:39
G21
M140 P0 S70.0
G29 S1
T-1 P0
G92 X297.000 Y150.000 Z1.020
G60 S1
G10 P0 S205 R50
T0 P0
M98 P"resurrect-prologue.g"
M116
M290 X0.000 Y0.000 Z-0.020 R0
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
M106 P3 S0.20
M116
G92 E0.00000
M83
M486 S0 A""
M486 S-1
G17
M23 "0:/gcodes/Pot_-_Hex_-_Body.gcode"
M26 S528
G0 F6000 Z3.000
G0 F6000 X297.000 Y150.000
G0 F6000 Z1.000
G1 F500.0 P0
G21
M24
