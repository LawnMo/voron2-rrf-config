; deployprobe.g
; called to deploy a physical Z probe
;

if sensors.probes[0].value[0] == 1000
  M564 H1
  G90
  G1 X40 Y330 F18000
  G1 Y355
  G1 Y330
  M400
  if sensors.probes[0].value[0] == 1000
    abort "Probe attach failed"