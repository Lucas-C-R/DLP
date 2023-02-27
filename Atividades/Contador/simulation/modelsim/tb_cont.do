do contador_0N_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../contador_bidirec_0aN.vhd 
vsim work.contador_bidirec_0an
do wave.do

force -freeze sim:/contador_bidirec_0an/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/contador_bidirec_0an/rst 0 0
force -freeze sim:/contador_bidirec_0an/dir 0 0, 1 1000
run 1600
