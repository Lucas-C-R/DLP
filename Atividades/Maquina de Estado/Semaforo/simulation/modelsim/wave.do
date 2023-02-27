onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /semaforo/rst
add wave -noupdate /semaforo/clk
add wave -noupdate /semaforo/timer
add wave -noupdate /semaforo/line__26/count
add wave -noupdate /semaforo/ativar
add wave -noupdate /semaforo/nx_state
add wave -noupdate -divider {Estado Atual}
add wave -noupdate -color Blue /semaforo/pr_state
add wave -noupdate -divider {Sinal 1}
add wave -noupdate -color Red /semaforo/Lvm1
add wave -noupdate -color Gold /semaforo/Lam1
add wave -noupdate /semaforo/Lvd1
add wave -noupdate -divider {Sinal 2}
add wave -noupdate -color Red /semaforo/Lvm2
add wave -noupdate -color Gold /semaforo/Lam2
add wave -noupdate /semaforo/Lvd2
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
configure wave -timelineunits sec
update
WaveRestoreZoom {0 ps} {21 sec}
