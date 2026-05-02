onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/a
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/ac
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/b
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/cout
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/negative
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/overflow
add wave -noupdate -radix unsigned /sixtyFour_Adder_testbench/result
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/writeQ
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/Qold
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/sel
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/out
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/sb
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/a
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/b
add wave -noupdate /sixtyFour_Adder_testbench/cin
add wave -noupdate /sixtyFour_Adder_testbench/dut/cin
add wave -noupdate /sixtyFour_Adder_testbench/dut/boat/Qold
add wave -noupdate /sixtyFour_Adder_testbench/dut/c_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {118422 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 400
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
WaveRestoreZoom {0 ps} {6450503 ps}
