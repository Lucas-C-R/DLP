do cata_moeadas_run_msim_rtl_vhdl.do
vsim work.cata_moedas
do wave.do

force -freeze sim:/cata_moedas/clk 1 0, 0 {0.5 sec} -r 1sec
force -freeze sim:/cata_moedas/rst 1 0, 0 10

force -freeze sim:/cata_moedas/pag5 0 0
force -freeze sim:/cata_moedas/pag10 0 0
force -freeze sim:/cata_moedas/pag25 0 0
