do contador_BCD_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../contador_BCD.vhd 
vsim work.contador_bcd
do wave.do

force -freeze sim:/contador_bcd/rst 1 0, 0 100
force -freeze sim:/contador_bcd/clk 1 0, 0 {500000000000 ps} -r 1sec

run 200sec