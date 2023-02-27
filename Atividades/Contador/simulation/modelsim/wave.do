onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /contador_bidirec_0an/clk
add wave -noupdate /contador_bidirec_0an/rst
add wave -noupdate /contador_bidirec_0an/dir
add wave -noupdate -radix unsigned /contador_bidirec_0an/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {1450 ps} {2450 ps}
