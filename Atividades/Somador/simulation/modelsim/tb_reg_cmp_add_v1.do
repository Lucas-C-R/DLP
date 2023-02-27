vlib rtl_work
vmap work rtl_work
vcom -93 -work work {/home/lucas.cr2001/DLP/Somador/registered_comp_add_v1.vhdl}
vsim work.registered_comp_add_v1
do wave.do
force -freeze sim:/registered_comp_add_v1/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/registered_comp_add_v1/a 1 0
force -freeze sim:/registered_comp_add_v1/b 5 0
run
run 800
force -freeze sim:/registered_comp_add_v1/b 7 0
run
run


