onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /relogio_hhmmss_v0/clk_placa
add wave -noupdate /relogio_hhmmss_v0/rst_sw
add wave -noupdate /relogio_hhmmss_v0/ligar_sw
add wave -noupdate /relogio_hhmmss_v0/clk_1sec
add wave -noupdate -divider Segundos
add wave -noupdate /relogio_hhmmss_v0/clk_sec
add wave -noupdate -radix unsigned /relogio_hhmmss_v0/bcd_uSS
add wave -noupdate /relogio_hhmmss_v0/ssd_uSS
add wave -noupdate -radix unsigned /relogio_hhmmss_v0/bcd_dSS
add wave -noupdate /relogio_hhmmss_v0/ssd_dSS
add wave -noupdate -divider Minutos
add wave -noupdate /relogio_hhmmss_v0/clk_min
add wave -noupdate -radix unsigned /relogio_hhmmss_v0/bcd_uMM
add wave -noupdate /relogio_hhmmss_v0/ssd_uMM
add wave -noupdate -radix unsigned /relogio_hhmmss_v0/bcd_dMM
add wave -noupdate /relogio_hhmmss_v0/ssd_dMM
add wave -noupdate -divider Horas
add wave -noupdate /relogio_hhmmss_v0/clk_hr
add wave -noupdate -radix unsigned /relogio_hhmmss_v0/bcd_uHH
add wave -noupdate /relogio_hhmmss_v0/ssd_uHH
add wave -noupdate -radix unsigned /relogio_hhmmss_v0/bcd_dHH
add wave -noupdate /relogio_hhmmss_v0/ssd_dHH
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits hr
update
WaveRestoreZoom {0 ps} {2946344410876132 ps}
