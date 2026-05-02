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
vlog "./sixtyFour_Adder_testbench.sv"
vlog "./alu.sv"
vlog "./alustim.sv"





# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work alustim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do alustim_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
