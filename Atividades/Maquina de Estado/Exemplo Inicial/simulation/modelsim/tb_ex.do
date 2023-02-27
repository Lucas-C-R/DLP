do ex_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../ex.vhd 
vsim work.ex
do wave.do

force -freeze sim:/ex/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/ex/rst 1 0, 0 10

force -freeze sim:/ex/x 0 0, 1 200, 2 400, 0 600, 2 800, 1 1000, 2 1200, 1 1400
run 1600
