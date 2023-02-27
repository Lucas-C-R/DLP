do Q2_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../Q2.vhd 
vsim work.q2
do wave.do

force -freeze sim:/q2/rst_in 1 0, 0 10
force -freeze sim:/q2/clk_in 1 0, 0 {50 ps} -r 100
force -freeze sim:/q2/IN1_in 0100 0, 1111 400, 0001 700
force -freeze sim:/q2/IN2_in 0100 0, 1111 500, 0101 700
force -freeze sim:/q2/OP_in 0 0, 1 200, 0 250, 1 600, 0 750

run 1000