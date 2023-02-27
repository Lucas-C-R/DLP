vcom -93 -work work ../../semaforo.vhd
vcom -reportprogress 300 -work work semaforo.vht
vsim work.semaforo_vhd_tst
do wave.vht.do

run 120 sec
