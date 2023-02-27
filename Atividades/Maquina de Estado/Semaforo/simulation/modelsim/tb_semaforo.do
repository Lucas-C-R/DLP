do semaforo_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../semaforo.vhd 
vsim work.semaforo
do wave.do

force -freeze sim:/semaforo/rst 1 0, 0 10
force -freeze sim:/semaforo/clk 1 0, 0 {0.5 sec} -r {1 sec}
force -freeze sim:/semaforo/ativar 0 0, 1 10.3sec, 0 55.5sec, 1 70sec, 0 106.22sec, 1 120sec

run 150sec