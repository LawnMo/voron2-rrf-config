; park.g
; check if axis are homed then move to park spot
; M98 P"/sys/adv/park.g" Xnnn Ynnn

G90 ; absolute positioning

if {move.axes[0].homed || move.axes[1].homed || move.axes[2].homed} ; check if the machine is homed
	if {(move.axes[2].machinePosition) < (move.axes[2].max - 10)} ; check if there's sufficient space to raise head
		G1 Z{move.axes[2].machinePosition+5} F4800 ; move Z up a bit

	; park XY
	G1 X{param.X}, Y{param.Y} F9000
	M400 ; wait for current moves to finish
