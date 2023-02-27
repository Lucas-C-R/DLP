onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /registered_comp_add_v1/clk
add wave -noupdate -divider Entradas
add wave -noupdate /registered_comp_add_v1/a
add wave -noupdate /registered_comp_add_v1/b
add wave -noupdate -divider Saidas
add wave -noupdate /registered_comp_add_v1/reg_comp
add wave -noupdate /registered_comp_add_v1/reg_sum
add wave -noupdate -radix hexadecimal /registered_comp_add_v1/reg_sum
add wave -noupdate /registered_comp_add_v1/comp
add wave -noupdate /registered_comp_add_v1/sum
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
WaveRestoreZoom {150 ps} {1150 ps}
