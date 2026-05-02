onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/ClockDelay
add wave -noupdate /CPU_testbench/reset
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/dut/sequentialInstructionUpdate
add wave -noupdate /CPU_testbench/dut/RegisterFile/ReadRegister1
add wave -noupdate /CPU_testbench/dut/RegisterFile/ReadRegister2
add wave -noupdate /CPU_testbench/dut/RegisterFile/WriteRegister
add wave -noupdate /CPU_testbench/dut/RegisterFile/WriteData
add wave -noupdate /CPU_testbench/dut/RegisterFile/RegWrite
add wave -noupdate /CPU_testbench/dut/RegisterFile/clk
add wave -noupdate /CPU_testbench/dut/RegisterFile/ReadData1
add wave -noupdate /CPU_testbench/dut/RegisterFile/ReadData2
add wave -noupdate /CPU_testbench/dut/RegisterFile/regEn
add wave -noupdate /CPU_testbench/dut/RegisterFile/regDataOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {260596862 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {548625 ns}
