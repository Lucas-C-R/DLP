do desafio_4_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../desafio_4.vhd 
vsim work.desafio_4
do wave.do

force -freeze sim:/desafio_4/x 111111111 0
run

force -freeze sim:/desafio_4/x 011111111 0
run

force -freeze sim:/desafio_4/x 001111111 0
run

force -freeze sim:/desafio_4/x 000111111 0
run

force -freeze sim:/desafio_4/x 000011111 0
run

force -freeze sim:/desafio_4/x 000001111 0
run

force -freeze sim:/desafio_4/x 000000111 0
run

force -freeze sim:/desafio_4/x 000000011 0
run

force -freeze sim:/desafio_4/x 000000001 0
run

force -freeze sim:/desafio_4/x 000000000 0
run