onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /q2/N
add wave -noupdate /q2/rst_in
add wave -noupdate /q2/clk_in
add wave -noupdate -divider Entradas
add wave -noupdate /q2/OP_in
add wave -noupdate -radix unsigned /q2/IN1_in
add wave -noupdate -radix unsigned /q2/IN2_in
add wave -noupdate -divider Saida
add wave -noupdate -radix unsigned /q2/SUM_reg
add wave -noupdate -divider Sinais
add wave -noupdate -radix binary /q2/IN1_aux
add wave -noupdate /q2/IN2_aux
add wave -noupdate /q2/SUM_aux
add wave -noupdate /q2/OP_aux
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
