vcom -reportprogress 300 -93 -work work ../../contador_bcd.vhd 
vcom -reportprogress 300 -93 -work work ../../relogio_HHMMSS_v0.vhd 
vcom -reportprogress 300 -93 -work work ../../div_clk_v0.vhd 
vcom -reportprogress 300 -93 -work work ../../bcd2ssd.vhd 
vsim work.relogio_hhmmss_v0
do wave_relogio.do

force -freeze sim:/relogio_hhmmss_v0/rst_sw 1 0, 0 10
force -freeze sim:/relogio_hhmmss_v0/clk_placa 1 0, 0 {10 ms} -r {20 ms}
force -freeze sim:/relogio_hhmmss_v0/ligar_sw 1 0, 0 12 hr, 1 15 hr

run 48 hr
