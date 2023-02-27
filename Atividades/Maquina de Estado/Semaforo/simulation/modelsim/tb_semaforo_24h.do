do semaforo_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../semaforo.vhd 
vsim work.semaforo
do wave.do

force -freeze sim:/semaforo/rst 1 0, 0 10
force -freeze sim:/semaforo/clk 1 0, 0 {0.5 sec} -r {1 sec}
force -freeze sim:/semaforo/ativar 0 0, 1 6hr, 0 22hr -r 24hr

run 24hr