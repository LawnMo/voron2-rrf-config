; deployprobe.g
; called to deploy a physical Z probe
;

if sensors.probes[0].value[0] == 1000
  M564 H1
  G90
  G1 X35 Y330 F12000
  G1 Y355 F7200
  G1 Y330 F7200
  M400
  if sensors.probes[0].value[0] == 1000
    abort "Probe attach failed"