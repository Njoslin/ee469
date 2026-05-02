# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./two_one_mux.sv"
vlog "./four_one_mux.sv"
vlog "./eight_one_mux.sv"
vlog "./sixteen_one_mux.sv"
vlog "./thirtyTwo_mux.sv"
vlog "./sixtyFour_one_mux.sv"
vlog "./register_genr.sv"
vlog "./d_ff.sv"
vlog "./enable_dff.sv"
vlog "./decoderLogic.sv"
vlog "./sixteen_one_mux.sv"
vlog "./regfile.sv"
vlog "./regstim.sv"
vlog "./zero.sv"
vlog "./bitwiseAnd.sv"
vlog "./bitwiseOr.sv"
vlog "./bitwiseXOR.sv"
vlog "./passB.sv"
vlog "./oneBitAdder.sv"
vlog "./negative.sv"
vlog "./aluAdder.sv"
vlog "./sixtyFour_adder.sv"
vlog "./alu.sv"
vlog "./alustim.sv"
vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./PC.sv"
vlog "./sixTFourBit_dff.sv"
vlog "./decoderForSignExten.sv"
vlog "./signextension.sv"
vlog "./basic64BitAdder.sv"
vlog "./shifter.sv"
vlog "./flag_register.sv"
vlog "./ALUCONTROL.sv"
vlog "./CPU.sv"
vlog "./CONTROL.sv"
vlog "./readRegister2Mux.sv"
vlog "./two_to_one_64mux.sv"
vlog "./CPU_testbench.sv"
vlog "./two_to_one_writeRegisterMux.sv"
vlog "./three_to_one_64mux.sv"





# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work CPU_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do CPU_testbench_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
