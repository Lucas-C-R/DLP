do Q_erro_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../Q_erro.vhd 
vsim work.q_erro
do wave.do

force -freeze sim:/q_erro/gin 000 0, 001 100, 011 200, 010 300, 110 400, 111 500, 101 600

force -freeze sim:/q_erro/oe 1 0, 0 80, 1 100, 0 180, 1 200, 0 280, 1 300, 0 380, 1 400, 0 480, 1 500, 0 580, 1 600

run 700