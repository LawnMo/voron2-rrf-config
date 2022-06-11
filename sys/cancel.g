; cancel.g
; called by M25 or from a screen
;

M220 S100							; restore speed to 100%
M221 S100							; restore extrusion flow to 100%
M106 P0 S0							; layer fan off

M98 P"0:/sys/adv/park.g" X349 Y354	; park toolhead and bump Z +5mm

M98 P"0:/sys/adv/turnoff.g" 		; turn off heaters

;echo >>"job-history.csv" """" ^ job.lastFileName ^ """," ^ state.time ^ "," ^ job.lastDuration ^ ",0"