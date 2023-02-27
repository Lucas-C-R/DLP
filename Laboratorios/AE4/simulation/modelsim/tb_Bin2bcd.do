do bin2bcd_run_msim_rtl_vhdl.do

vcom -reportprogress 300 -93 -work work ../../bin2bcd.vhd 

do wave.do

force -freeze sim:/bin2bcd/A 10#9999 0
run

force -freeze sim:/bin2bcd/A 10#999 0
run

force -freeze sim:/bin2bcd/A 10#99 0
run

force -freeze sim:/bin2bcd/A 10#9 0
run

force -freeze sim:/bin2bcd/A 10#2378 0
run

force -freeze sim:/bin2bcd/A 10#0 0
run

force -freeze sim:/bin2bcd/A 10#7134 0
run
