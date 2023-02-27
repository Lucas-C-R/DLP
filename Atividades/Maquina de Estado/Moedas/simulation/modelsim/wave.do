onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cata_moedas/clk
add wave -noupdate /cata_moedas/rst
add wave -noupdate -divider {Entrada Moedas}
add wave -noupdate /cata_moedas/pag5
add wave -noupdate /cata_moedas/pag10
add wave -noupdate /cata_moedas/pag25
add wave -noupdate -divider Estados
add wave -noupdate /cata_moedas/pr_state
add wave -noupdate /cata_moedas/nx_state
add wave -noupdate -divider Troco
add wave -noupdate /cata_moedas/dev5
add wave -noupdate /cata_moedas/dev10
add wave -noupdate -divider {Saida Produto}
add wave -noupdate /cata_moedas/prod
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
WaveRestoreZoom {0 ps} {10500 ms}
