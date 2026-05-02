onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /aluAdder_testbench/a
add wave -noupdate /aluAdder_testbench/b
add wave -noupdate /aluAdder_testbench/cin
add wave -noupdate /aluAdder_testbench/cout
add wave -noupdate /aluAdder_testbench/sum
add wave -noupdate /aluAdder_testbench/ac
add wave -noupdate /aluAdder_testbench/dut/fullAdd/a
add wave -noupdate /aluAdder_testbench/dut/fullAdd/b
add wave -noupdate /aluAdder_testbench/dut/fullAdd/cin
add wave -noupdate /aluAdder_testbench/dut/fullAdd/cout
add wave -noupdate /aluAdder_testbench/dut/fullAdd/sum
add wave -noupdate /aluAdder_testbench/dut/fullAdd/x
add wave -noupdate /aluAdder_testbench/dut/fullAdd/p
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {742918 ps} 0}
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
WaveRestoreZoom {0 ps} {32768 ns}
