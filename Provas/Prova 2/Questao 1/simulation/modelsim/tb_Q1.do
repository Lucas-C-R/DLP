do Q1_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../Q1.vhd 
vsim work.q1
do wave.do

force -freeze sim:/q1/X 00000000 0, 11111111 50, 10010001 100, 01111111 150, 01010101 200

run 250