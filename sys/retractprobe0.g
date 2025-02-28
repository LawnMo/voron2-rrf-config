; retractprobe.g
; called to retract a physical Z probe
;

if !exists(global.probe_block_detach)
  global probe_block_detach = false

if !global.probe_block_detach && sensors.probes[0].value[0] == 0
  M564 H1
  G90
  G1 X35 Y330 F12000
  G1 Y355 F7200
  G1 X90 F12000
  M400
  if sensors.probes[0].value[0] == 0
    abort "Probe detach failed"
