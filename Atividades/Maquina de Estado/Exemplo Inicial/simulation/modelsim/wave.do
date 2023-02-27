onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ex/clk
add wave -noupdate /ex/rst
add wave -noupdate /ex/x
add wave -noupdate /ex/y
add wave -noupdate /ex/pr_state
add wave -noupdate /ex/nx_state
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1680 ps}
