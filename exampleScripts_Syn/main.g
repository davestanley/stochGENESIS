// genesis 2.2
// Kerstin Menne
// menne@isip.mu-luebeck.de
// Medical University of Luebeck, 01.10.2001
//
// main script for the simulation consisting of a network of pyramidal cells
// and interneurons 

include constants.g // file containing global constants

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

// Let's go!
include cell_arrays.g //  creation of cells and cell arrays
include connections.g // creation of connections between cells, 
			 // synaptic weights and delays
include provide_input.g // array of randomspike elements and their connections: 			// afferent input


// exemplary cell bahviour; if you uncomment the following  lines, you have to
// run the simulation in a directory, where you have write permission
// an ascii file pyr28 is created, in the first column there are the
// time steps, in the second the voltage of pyramidal cell 28 axon
// you can visualize the data for example with Matlab or xplot

create asc_file pyr28
setfield ^  flush 0 leave_open 1 append 0 notime 0
useclock ^ 1
addmsg {pyr_array_name}{pyr_cell_name}[28]/ax pyr28 SAVE Vm


include hsolver.g // creation of hsolve-elements

setmethod 11

//check  // only issues warnings that compartments taken over by hsolve do
         // not get issued for simulation
reset







