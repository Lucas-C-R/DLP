do relogio_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../contador_bcd.vhd 
vsim work.contador_bcd
do wave_contador.do

force -freeze sim:/contador_bcd/clk 1 0, 0 {0.5 sec} -r {1 sec}
force -freeze sim:/contador_bcd/rst 1 0, 0 10
force -freeze sim:/contador_bcd/ena 0 0, 1 10 sec

run 120 sec
