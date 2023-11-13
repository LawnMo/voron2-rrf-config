; job-prologue.g
; call from your slicer's start-gcode
; param : T = tool temperature / H = bed temperature
;

M98 R1

if !exists(global.probe_block_detach)
  global probe_block_detach = false
set global.probe_block_detach = false

G21 ;metric values
G90 ;absolute positioning
M83 ;relative extrusion
M107 ;start with the fan off
G92 E0 ;zero the extruded length
;G10 P0 S{param.T} R50; start preheat hotend_0
M140 S{param.H} ; start preheating the bed
M190 S{param.H}

;if param.H >= 100
;  while heat.heaters[0].avgPwm > 0.28
;    echo "Waiting for bed heater to settle"
;    G4 S60

set global.probe_block_detach = true

var need_g32 = false

if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  set var.need_g32 = true
  G28
  if result != 0
    abort "Homing failed"
else
  G28 Z
  if result != 0
    abort "Homing failed"

if var.need_g32
  G32
  if result != 0
    abort "QGL failed"

set global.probe_block_detach = false

G10 P0 S{param.T} R50; start preheat hotend_0

if var.need_g32
  G29
M402

if result != 0
  abort "Mesh failed"

M116 P0

G1 X349 Y354 F9000		; park
G92 E0					; reset extruder pos
G1 E3 F200				; prime extruder
G92 E0					; reset extruder pos