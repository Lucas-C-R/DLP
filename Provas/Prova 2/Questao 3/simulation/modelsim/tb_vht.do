vcom -93 -work work ../../Q3.vhd
vcom -reportprogress 300 -work work Q3.vht
vsim work.Q3_vhd_tst
do wave_vht.do

run 300 ns