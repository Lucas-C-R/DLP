do desafio_1_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../desafio_1.vhd 
vsim work.desafio_1
do wave.do

force -freeze sim:/desafio_1/x 111111111 0
run

force -freeze sim:/desafio_1/x 011111111 0
run

force -freeze sim:/desafio_1/x 101111111 0
run

force -freeze sim:/desafio_1/x 110111111 0
run

force -freeze sim:/desafio_1/x 111011111 0
run

force -freeze sim:/desafio_1/x 111101111 0
run

force -freeze sim:/desafio_1/x 111110111 0
run

force -freeze sim:/desafio_1/x 111111011 0
run

force -freeze sim:/desafio_1/x 111111101 0
run

force -freeze sim:/desafio_1/x 111111110 0
run