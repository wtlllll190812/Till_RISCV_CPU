onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_top_tb/cpu_inst/clk
add wave -noupdate /cpu_top_tb/cpu_inst/addrPc
add wave -noupdate /cpu_top_tb/cpu_inst/inst
add wave -noupdate /cpu_top_tb/cpu_inst/ImmSel
add wave -noupdate /cpu_top_tb/cpu_inst/imm
add wave -noupdate -radix decimal /cpu_top_tb/cpu_inst/dataA
add wave -noupdate -radix decimal /cpu_top_tb/cpu_inst/dataB
add wave -noupdate -radix decimal /cpu_top_tb/cpu_inst/dataD
add wave -noupdate /cpu_top_tb/cpu_inst/aluSel
add wave -noupdate /cpu_top_tb/cpu_inst/bSel
add wave -noupdate /cpu_top_tb/cpu_inst/wDataSel
add wave -noupdate /cpu_top_tb/cpu_inst/aluDataB
add wave -noupdate /cpu_top_tb/cpu_inst/aluDataOut
add wave -noupdate /cpu_top_tb/cpu_inst/RamOut
add wave -noupdate /cpu_top_tb/cpu_inst/regs_inst/regs
add wave -noupdate -radix binary /cpu_top_tb/cpu_inst/ram_inst/data
add wave -noupdate /cpu_top_tb/cpu_inst/ram_inst/addr
add wave -noupdate /cpu_top_tb/cpu_inst/ram_inst/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {112800 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
configure wave -valuecolwidth 326
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2100 ns}
