M106 P0 S0		; layer fan off
M220 S100		; reset speed factor to 100%
M221 D0 S100	; reset extrude factor to 100%
M572 D0 S0		; reset pressure advance setting
T0
;M703			; run /filaments/<filament name>/config.g if loaded