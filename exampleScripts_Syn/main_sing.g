// genesis 2.2
// Kerstin Menne
// menne@isip.mu-luebeck.de
// Medical University of Luebeck, 01.10.2001
//
// main script for the simulation consisting of a network of pyramidal cells
// and interneurons 

include constants_m.g // file containing global constants

//Alter clock
float dt = 2.5e-5             //  default simulation time step in sec 
//float dt = 1e-5	            //  simulation time step in sec 
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt}            // used for graphical outputs
randseed		//useful for making simulations unique and interesting each time you run

include Ca_chan.g // Ca channel prototype for pyr and interneuron  
include K_AHP_chan.g // K_AHP channel prototype for pyr and interneuron
include K_A_chan.g // K_A channel prototype for pyr and interneuron
include K_C_chan.g // K_C channel prototype for pyr and interneuron
include K_DR_chan.g // K_DR channel prototype for pyr and interneuron
include Na_chan.g // Na channel prototype for pyr and interneuron

include AMPA_chan.g // AMPA channel for pyr and interneuron
include NMDA_chan.g // NMDA channel for pyr
include GABA_A_chan.g // GABA_A channel for pyr
include GABA_B_chan.g // GABA_B channel for pyr

include spikegenpyr.g // spikegenerator for pyramidal cell axon
include spikegenint.g // spikegenerator for interneuron axon

include make_pyramidal.g // prototype elements for pyramidal cell
include make_interneuron.g // prototype elements for interneurons

include network.g // functions for the creation of arrays and randomizations
include afferent_input.g // function to create randomspike element


setmethod 0




// Include Stochastifying code...
include markov_chan.g
include stochastify.g
include write_everything.g

// Test
make_pyramidal // make_pyramidal.g
float old_EREST = -0.060
float new_EREST = -0.055
EREST_ACT = {new_EREST}
readcell CA3.p {pyr_cell_name} // CA3 pyramidal cells
EREST_ACT = {old_EREST}

// Let's go!
//include cell_arrays.g
//include connections.g
//include gap_junctions_m.g
//include provide_input.g

//include hsolver.g // creation of hsolve-elements --> comment me out!
//setmethod 11




// Create plot for pyramidal neuron
str src_cmpt = "ap5"
str src_cell = {"/pyr/" @ {src_cmpt}}


create xform /graphs [10,10,900,350] -notitle
create xlabel /graphs/label [10,0,98%,25] -label {src_cell}
create xgraph /graphs/Vm [10,10:label.bottom,50%,90%] -title \
    "membrane potential"
setfield /graphs/Vm XUnits "t (sec)" YUnits "voltage (V)"
setfield /graphs/Vm xmax 0.03 ymin -0.15 ymax 0.04
create xgraph /graphs/Ik [10:Vm.right,10:label.bottom,49%,90%]  \
    -title "channel current"
setfield /graphs/Ik XUnits "t (sec)" YUnits "current (S)"
setfield /graphs/Ik xmax 0.03 ymin -1e-7 ymax 9e-7
xshow /graphs

create asc_file /sim_out
setfield ^  flush 0 leave_open 1 append 0 notime 0 float_format %0.12g
useclock ^ 1
addmsg {src_cell}/../soma /graphs/Vm PLOT Vm *Soma_Vm *blue
addmsg {src_cell}/../soma /sim_out SAVE Vm
write_everything {src_cell} /graphs /sim_out





//setfield {src_fbcell}/../soma inject -1e-10


reset
reset


//step {4000 * 2.5e-5 / {dt}}




