; job-prologue.g - call from your slicer's start-gcode
; When using a macro as custom gcode, do not use G, M, N or T as parameters in a custom 'G' gcode file
; param.A is the first layer bed temperature
; param.B is filament type
; param.C is first layer temperature
; param.D is the filament standby temperature
; param.E is the nozzle diameter the model was sliced for


M98 R1

if !exists(global.probe_block_detach)
  global probe_block_detach = false
set global.probe_block_detach = false

if exists(param.B)
  M702
  M701 S{param.B}
  M703
else
  echo "filament type is undefined"

G21 ;metric values
G90 ;absolute positioning
M83 ;relative extrusion
M107 ;start with the fan off
G92 E0 ;zero the extruded length
G10 P0 S{param.D} R{param.D}; preheat hotend_0 to standby temp
M140 S{param.A} ; start preheating the bed
M190 S{param.A}

;if param.H >= 100
;  while heat.heaters[0].avgPwm > 0.28
;    echo "Waiting for bed heater to settle"
;    G4 S60

set global.probe_block_detach = true

; check axis home all or just Z already homed
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28
  if result != 0
    abort "Homing failed"
else
  G28 Z
  if result != 0
    abort "Homing failed"


G32						; QGL
if result != 0
  abort "QGL failed"

set global.probe_block_detach = false


G29						; MBL
M402					; retract probe
if result != 0
  abort "Mesh failed"


G10 P0 S{param.A} R{param.D}; heat hotend_0 to print temp
M116 P0					; wait for hotend_0 to reach temp

G1 X349 Y354 F9000		; park
G92 E0					; reset extruder pos
G1 E3 F200				; prime extruder
G92 E0					; reset extruder pos