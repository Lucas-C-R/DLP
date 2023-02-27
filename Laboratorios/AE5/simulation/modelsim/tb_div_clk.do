do relogio_run_msim_rtl_vhdl.do
vcom -reportprogress 300 -93 -work work ../../div_clk_v0.vhd 
vsim work.div_clk_v0
do div_clk.do
add wave -position 2  /div_clk_v0/L1/contador

force -freeze sim:/div_clk_v0/rst 1 0, 0 10

# Para uma frequencia de 5 Hz
# force -freeze sim:/div_clk_v0/clk_in 1 0, 0 {100 ms} -r {200 ms}

# Para uma frequencia de 50 Hz
force -freeze sim:/div_clk_v0/clk_in 1 0, 0 {10 ms} -r {20 ms}
force -freeze sim:/div_clk_v0/ena 0 0, 1 1 sec
run 5 sec
