do relogio_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../bcd2ssd.vhd 
vsim work.bcd2ssd
do wave_ssd.do

force -freeze sim:/bcd2ssd/bcd_in 0000 0, 0001 50, 0010 100, 0011 150, 0100 200, 0101 250, 0110 300, 0111 350, 1000 400, 1001 450, 1010 500, 1011 550, 1100 600, 1101 650, 1110 700, 1111 750

run 780