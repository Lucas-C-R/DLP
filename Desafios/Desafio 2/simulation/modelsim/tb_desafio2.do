do desafio_2_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../desafio_2.vhd 
vsim work.desafio_2
do wave.do

force -freeze sim:/desafio_2/x 111111111 0, 011111111 100, 011111110 200, 001111110 300, 001111100 400, 000111100 500, 000111000 600, 000011000 700, 000010000 800, 000000000 900
run 1000
