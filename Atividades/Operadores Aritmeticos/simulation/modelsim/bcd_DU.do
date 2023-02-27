do bin2bcd_run_msim_rtl_vhdl.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
# vlib rtl_work
# vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 2020.1 Lib Mapping Utility 2020.02 Feb 28 2020
# vmap work rtl_work 
# Copying /opt/intelFPGA/20.1/modelsim_ae/linuxaloem/../modelsim.ini to modelsim.ini
# Modifying modelsim.ini
# 
# vcom -93 -work work {/home/lucas.cr2001/DLP/Operadores_aritmeticos/bin2bcd.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 2020.1 Compiler 2020.02 Feb 28 2020
# Start time: 08:57:19 on Sep 28,2022
# vcom -reportprogress 300 -93 -work work /home/lucas.cr2001/DLP/Operadores_aritmeticos/bin2bcd.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Loading package NUMERIC_STD
# -- Compiling entity bin2bcd
# -- Compiling architecture ifsc_v1 of bin2bcd
# -- Compiling architecture ifsc_v2 of bin2bcd
# -- Loading entity bin2bcd
# -- Compiling configuration bin2bcd_cfg
# -- Loading entity bin2bcd
# -- Loading architecture ifsc_v1 of bin2bcd
# End time: 08:57:19 on Sep 28,2022, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# 
# stdin: <EOF>
vsim work.bin2bcd(ifsc_v1)
# vsim work.bin2bcd(ifsc_v1) 
# Start time: 08:57:23 on Sep 28,2022
# //  ModelSim - Intel FPGA Edition 2020.1 Feb 28 2020 Linux 4.19.0-21-amd64
# //
# //  Copyright 1991-2020 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  ModelSim - Intel FPGA Edition and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.bin2bcd(ifsc_v1)
do wave.do
add wave -position insertpoint sim:/bin2bcd/*
force -freeze sim:/bin2bcd/A 10#43 0
run
force -freeze sim:/bin2bcd/A 10#98 0
run
force -freeze sim:/bin2bcd/A 10#102 0
run
force -freeze sim:/bin2bcd/A 10#172 0
run
force -freeze sim:/bin2bcd/A 10#127 0
run


