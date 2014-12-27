

// genesis 2.2
// Kerstin Menne
// menne@isip.mu-luebeck.de
// Medical University of Luebeck, 01.10.2001
//
// main script for the simulation consisting of a network of pyramidal cells
// and interneurons 

include constants_smallnet.g // file containing global constants

//Alter clock
float dt = 1e-4             //  default simulation time step in sec 
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

include afferent_input.g // function to create randomspike element


setmethod 0




// Include Stochastifying code...
include markov_chan.g
include stochastify.g
include volumeconnect_general.g
include write_everything.g
include network_m.g // functions for the creation of arrays and randomizations


// Let's go!
include cell_arrays_m.g

//extract_markov /pyr_array/pyr[0] /pyr_array
extract_markov /fb_array/fb[0] /fb_array
extract_markov /fb_array/fb[1] /fb_array
//disable /pyr_m
//disable /fb_m
disable /pyr_array
//disable /fb_array
disable /ff_array

//include connections_fixed.g
//include provide_input_fixed.g	//standard connections
include connections_m_general.g	//enables markovian connection commands


/////////////////// Using srcdest2
//pyr_pyr_excite /pyr_array /pyr_array
//pyr_int_excite /pyr_array /fb_array
//int_pyr_inhibit /fb_array /pyr_array
//aff_pyr_excite /aff_array /pyr_array
aff_fb_excite /aff_array4 /fb_array /fb[0]
aff_int_inhibit /aff_array2 /fb_array /fb[0]
aff_fb_excite /aff_array3 /fb_array /fb[1]
aff_int_inhibit /aff_array1 /fb_array /fb[1]


////////////////// Using srcdest
//connections_m_srcdest /pyr_array /pyr_array /fb_array /fb_array
//afferent_m_srcdest /pyr_array /ff_array /ff


include gap_junctions_m.g


// TEST: Set up testing connections
//include conn_fb.g
//afferent_m_srcdest /pyr_array /fb_array /fb



//include hsolver.g // creation of hsolve-elements --> comment me out!
//setmethod 11


include save_file.g
str wrdest_save = "/fb0"
str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[0]/soma"}
save_file {wrdest_save} {wrsource}

str wrdest_save = "/fb1"
str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[1]/soma"}
save_file {wrdest_save} {wrsource}



// Create plot for pyramidal cell
//plot_graphs "/pyr_array/pyr[0]/ap5" "/graphs" "/sim_out1"
//plot_graphs "/pyr_array/pyr[0]/ap8_1" "/graphs" "/sim_out2"



// Create plot for interneuron neuron
// Plot the first compartment that contains a gap junction
//str src_fbcell = "/fb_array/fb[0]/soma"
str src_fbcell =  {el /fb_array/fb[]/#/GAP_m/..}
//plot_graphs {src_fbcell} "/graphsfb" "/sim_outfb"

str src_fbcell = "/fb_array/fb[1]/soma"
//plot_graphs {src_fbcell} "/graphsfb1" "/sim_outfb1"

str src_fbcell = "/fb_array/fb[2]/bas2_1"
//plot_graphs {src_fbcell} "/graphsfb2" "/sim_outfb2"



//Output some connection stats
	//Count the number of AMPA, NMDA, and GABA channels input into the cell
str pyr_count = "/pyr_array/pyr[]"
int numAMPA = {countelementlist {pyr_count}/#/AMPA#[TYPE=GENsynpores]/}
int numNMDA = {countelementlist {pyr_count}/#/NMDA#[TYPE=GENsynpores]/}
int numGABA_A = {countelementlist {pyr_count}/#/GABA_A#[TYPE=GENsynpores]/}
echo PYR Markov synapses AMPA {numAMPA} NMDA {numNMDA} GABA {numGABA_A}

str loop_chan
numAMPA = 0
foreach loop_chan ( {el {pyr_count}/#/AMPA/} )
	numAMPA = numAMPA + {getfield {loop_chan} nsynapses}
end

numNMDA = 0
foreach loop_chan ( {el {pyr_count}/#/NMDA/} )
	numNMDA = numNMDA + {getfield {loop_chan} nsynapses}
end

numGABA_A = 0
foreach loop_chan ( {el {pyr_count}/#/GABA_A/} )
	numGABA_A = numGABA_A + {getfield {loop_chan} nsynapses}
end

int numGABA_B = 0
foreach loop_chan ( {el /#/#/#/GABA_B/} )
	numGABA_B = numGABA_B + {getfield {loop_chan} nsynapses}
	//echo {loop_chan} {getfield {loop_chan} nsynapses}
end
echo PYR standard synapses AMPA {numAMPA} NMDA {numNMDA} GABA_A {numGABA_A}

str fb_count = "/fb_array/fb[0]"
int numAMPA = {countelementlist {fb_count}/#/AMPA#[TYPE=GENsynpores]/}
int numNMDA = {countelementlist {fb_count}/#/NMDA#[TYPE=GENsynpores]/}
int numGABA_A = {countelementlist {fb_count}/#/GABA_A#[TYPE=GENsynpores]/}
echo FB Markov synapses AMPA {numAMPA} NMDA {numNMDA} GABA {numGABA_A}

str loop_chan
numAMPA = 0
foreach loop_chan ( {el {fb_count}/#/AMPA/} )
	numAMPA = numAMPA + {getfield {loop_chan} nsynapses}
end

numNMDA = 0
foreach loop_chan ( {el {fb_count}/#/NMDA/} )
	numNMDA = numNMDA + {getfield {loop_chan} nsynapses}
end

numGABA_A = 0
foreach loop_chan ( {el {fb_count}/#/GABA_A/} )
	numGABA_A = numGABA_A + {getfield {loop_chan} nsynapses}
end

int numGABA_B = 0
foreach loop_chan ( {el /#/#/#/GABA_B/} )
	numGABA_B = numGABA_B + {getfield {loop_chan} nsynapses}
	//echo {loop_chan} {getfield {loop_chan} nsynapses}
end
echo FB standard synapses AMPA {numAMPA} NMDA {numNMDA} GABA_A {numGABA_A}


echo p_pyr2pyr_AMPA {p_pyr2pyr_AMPA} p_pyr2fb_AMPA {p_pyr2fb_AMPA} p_fb2pyr_GABA_A {p_fb2pyr_GABA_A}




//addmsg /fb_array/fb/soma /graphsfb/Ik PLOT Im *Im *green
//addmsg /fb_array/fb/soma /graphsfb/Ik PLOT inject *inject *red


reset
reset
step 3

//disable /aff_array2; disable /aff_array4
//disable /fb_array/fb[1]/

setfield /fb_array/fb[0]/soma inject -3.685358114e-11
setfield /fb_array/fb[1]/soma inject -3.685358114e-11
setfield /fb_array/fb[]/##[TYPE=compartment] Vm -0.065


include PID_thresh.g
//PID_thresh "/pyr_array/pyr[0]/soma" {1000*{dt}} {2000*{dt}} -0.065 1
//PID_thresh "/fb_array/fb[0]/soma" {1000*{dt}} {2000*{dt}} -0.065 1

//enable /fb_array/fb[1]/
//enable /aff_array2; enable /aff_array4

setfield /fb_array/fb[0]/soma inject -3.685358114e-11
setfield /fb_array/fb[1]/soma inject -3.685358114e-11
setfield /fb_array/fb[]/##[TYPE=compartment] Vm -0.065

//step {20000 * 2.5e-5 / {dt}}


//Spikes are too large and too rapid. Should be about 0.05 - 0.2 seconds in between, and about 0.5mV in amplitude.


