onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Entrada
add wave -noupdate -radix unsigned /bin2bcd/A
add wave -noupdate -divider Sinais
add wave -noupdate -radix unsigned /bin2bcd/A_uns
add wave -noupdate -radix unsigned /bin2bcd/sm_uns
add wave -noupdate -radix unsigned /bin2bcd/sc_uns
add wave -noupdate -radix unsigned /bin2bcd/sd_uns
add wave -noupdate -radix unsigned /bin2bcd/su_uns
add wave -noupdate -divider Saidas
add wave -noupdate -radix unsigned /bin2bcd/sm
add wave -noupdate -radix unsigned /bin2bcd/sc
add wave -noupdate -radix unsigned /bin2bcd/sd
add wave -noupdate -radix unsigned /bin2bcd/su
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
