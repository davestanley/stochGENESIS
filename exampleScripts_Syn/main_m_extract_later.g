

// genesis 2.2
// Kerstin Menne
// menne@isip.mu-luebeck.de
// Medical University of Luebeck, 01.10.2001
//
// main script for the simulation consisting of a network of pyramidal cells
// and interneurons 


// Automated setting adjustments

int graphics_on = 1
int mode = 1		// 1=ion channels only; 2=gap only; 3=syn only; 4=syn&gap
int disable_K_AHP = 1

float holding_potential
if (mode<3)
	holding_potential = -0.065
elif (mode>=3)
	holding_potential = -0.070
end

str wrdest_save		// Automatic file naming system based on
if (mode==1); wrdest_save = "/fb0"	// NaK ion channels only
elif (mode==2); wrdest_save = "/fb0g"	// With gap junction
elif (mode==3); wrdest_save = "/fb0s"	// Include Synapse
elif (mode==4); wrdest_save = "/fb0sg"	// Include gap junction and synapse
end



include constants_smallnet.g // file containing global constants

//Alter clock
float dt = 2.5e-5             //  default simulation time step in sec 
float dt_save = 2.5e-5
//float dt = 1e-5	            //  simulation time step in sec 
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt_save}            // used for graphical outputs
randseed		//useful for making simulations unique and interesting each time you run

include Ca_chan.g // Ca channel prototype for pyr and interneuron  
include K_AHP_chan_m.g // K_AHP channel prototype for pyr and interneuron
			//K_AHP_chan_m is modified to increase the number of entries in the table for
			//calcium concentration
include K_A_chan.g // K_A channel prototype for pyr and interneuron
include K_C_chan_m.g // K_C channel prototype for pyr and interneuron
			//K_C_chan_m is modified to increase the number of entries in the table for
			//calcium concentration
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
include Ca_pumps.g
include stochastify.g
include volumeconnect_general.g
include write_everything.g
//include write_everything_nographics.g
include save_file.g
include network_m.g // functions for the creation of arrays and randomizations


// Let's go!
//make_pumps
include cell_arrays_m.g


//disable /pyr_array
disable pyr_array/pyr[1]
disable /fb_array
disable /ff_array



//include connections_fixed.g
//include provide_input_fixed.g	//standard connections
include connections_m_general.g	//enables markovian connection commands


/////////////////// Using srcdest2
//pyr_pyr_excite /pyr_array /pyr_array
//pyr_int_excite /pyr_array /fb_array
//int_pyr_inhibit /fb_array /pyr_array
//aff_pyr_excite /aff_array /pyr_array
if (mode>=3)
	aff_fb_excite /aff_array4 /fb_array /fb[0]
	aff_int_inhibit /aff_array2 /fb_array /fb[0]
	aff_fb_excite /aff_array3 /fb_array /fb[1]
	aff_int_inhibit /aff_array1 /fb_array /fb[1]
	fix_scales
end


////////////////// Using srcdest
//connections_m_srcdest /pyr_array /pyr_array /fb_array /fb_array
//afferent_m_srcdest /pyr_array /ff_array /ff


if ((mode==2) || (mode==4))
	include gap_junctions_m.g
end


// TEST: Set up testing connections
//include conn_fb.g
//afferent_m_srcdest /pyr_array /fb_array /fb



//include hsolver.g // creation of hsolve-elements --> comment me out!
//setmethod 11


//addmsg /fb_array/fb/soma /graphsfb/Ik PLOT Im *Im *green
//addmsg /fb_array/fb/soma /graphsfb/Ik PLOT inject *inject *red


if ((mode==1) || (mode==3))
	disable /fb_array/fb[1]/
end



// Optional - disable slow K_AHP channels
if (disable_K_AHP == 1)
	str curr_chan
	foreach curr_chan ({el /pyr_array/pyr[]/#/K_AHPs} {el /pyr_array/pyr/#/K_AHP} {el /pyr_array/pyr[]/#/K_AHPs_m} {el /pyr_array/pyr/#/K_AHP_m})
		disable {curr_chan}
	end
end




//setfield /fb_array/fb[0]/##[TYPE=compartment] Vm {holding_potential}
//setfield /fb_array/fb[1]/##[TYPE=compartment] Vm {holding_potential}



//Alter clock
float dt = 2.5e-3             //  default simulation time step in sec 
float dt_save = 2.5e-3
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt_save}            // used for graphical outputs


reset
reset

include PID_thresh.g
PID_thresh "/pyr_array/pyr[]/soma" {1000*{dt}} {4000*{dt}} {holding_potential} 0
//PID_thresh "/fb_array/fb[]/soma" {1000*{dt}} {4000*{dt}} {holding_potential} 1


//Alter clock
float dt = 2.5e-5             //  default simulation time step in sec 
float dt_save = 2.5e-5            //  simulation time step in sec 
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt_save}            // used for graphical outputs


//setfield /#/#/#[TYPE=compartment] Vm -0.065


delete /library/markov/NMDA_m; delete /library/markov/AMPA_m; delete /library/markov/GABA_A_m; delete /library/markov/GABA_B_m
extract_markov /pyr_array/pyr[0] /pyr_array		//Need to figure out how to put a "reset" into the code
//extract_markov /fb_array/fb[0] /fb_array
//extract_markov /fb_array/fb[1] /fb_array


// Optional - disable slow K_AHP channels
if (disable_K_AHP == 1)
	str curr_chan
	foreach curr_chan ({el /pyr_array/pyr[]/#/K_AHPs} {el /pyr_array/pyr/#/K_AHP} {el /pyr_array/pyr[]/#/K_AHPs_m} {el /pyr_array/pyr/#/K_AHP_m})
		disable {curr_chan}
	end
end



// Create plot for pyramidal cell
plot_graphs "/pyr_array/pyr[0]/soma" "/graphs1" "/sim_out1"
//plot_graphs "/pyr_array/pyr[0]/ap9_2" "/graphs2" "/sim_out2"

str wrsource = {{pyr_array_name} @ {pyr_cell_name} @ "[0]/soma"}
save_file pyr0 {wrsource}





// Save fb cell data
str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[0]/soma"}
//save_file {wrdest_save} {wrsource}

	str src_fbcell = "/fb_array/fb[0]/ap6_1"
	//str src_fbcell = "/fb_array/fb[0]/ap7_1"
	//str src_fbcell = "/fb_array/fb[0]/ap9_2"
	str src_fbcell = "/fb_array/fb[0]/soma"
	//str src_fbcell = {el /fb_array/fb[0]/#/NMDA#_m/..}
	//str src_fbcell =  {el /fb_array/fb[]/#/GABA_B#_m/..}



if (graphics_on)
	// Create plot for interneuron neuron


	// Plot graphsfb -- Plot first cell's gap junction compartment
	if ((mode == 2) || (mode == 4))		//search out location of a gap junction & view
		//str src_fbcell =  {el /fb_array/fb[]/#/GAP_m/..}
	end
	//plot_graphs {src_fbcell} "/graphsfb" "/sim_outfb"

	// Plot graphsfb1 -- plot SECOND CELL if there's a gap junction
	if ((mode == 2) || (mode == 4))
		str src_fbcell = "/fb_array/fb[1]/soma"
		//plot_graphs {src_fbcell} "/graphsfb1" "/sim_outfb1"
	end

	// Plot graphsfb2 -- plot a compartment with both NMDA and AMPA channels
	str search_cmpt
	foreach search_cmpt ({el /fb_array/fb[0]/#})
		if (({countelementlist {search_cmpt}/AMPA#_m} > 0) && ({countelementlist {search_cmpt}/NMDA#_m} > 0))
			str src_fbcell = {search_cmpt}
			//echo {src_fbcell}; echo {countelementlist {src_fbcell}/AMPA#_m}; echo {countelementlist {src_fbcell}/NMDA#_m}
		end
	end
	//plot_graphs {src_fbcell} "/graphsfb2" "/sim_outfb2"
end








//Output some connection stats
	//Count the number of AMPA, NMDA, and GABA channels input into the cell
str pyr_count = "/pyr_array/pyr[]"
int numAMPA = {countelementlist {pyr_count}/#/AMPA#[TYPE=GENsynpores]/}
int numNMDA = {countelementlist {pyr_count}/#/NMDA#[TYPE=GENsynpores]/}
int numGABA_A = {countelementlist {pyr_count}/#/GABA_A#[TYPE=GENsynpores]/}
int numGABA_B = {countelementlist {pyr_count}/#/GABA_B#[TYPE=GENsynpores]/}
echo PYR Markov synapses AMPA {numAMPA} NMDA {numNMDA} GABA_A {numGABA_A} GABA_B {numGABA_B}

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

foreach loop_chan ( {el /#/#/#/GABA_B/} )
	numGABA_B = numGABA_B + {getfield {loop_chan} nsynapses}
	//echo {loop_chan} {getfield {loop_chan} nsynapses}
end
echo PYR standard synapses AMPA {numAMPA} NMDA {numNMDA} GABA_A {numGABA_A} GABA_B {numGABA_B}

str fb_count = "/fb_array/fb[0]"
int numAMPA = {countelementlist {fb_count}/#/AMPA#[TYPE=GENsynpores]/}
int numNMDA = {countelementlist {fb_count}/#/NMDA#[TYPE=GENsynpores]/}
int numGABA_A = {countelementlist {fb_count}/#/GABA_A#[TYPE=GENsynpores]/}
int numGABA_B = {countelementlist {fb_count}/#/GABA_B#[TYPE=GENsynpores]/}
echo FB Markov synapses AMPA {numAMPA} NMDA {numNMDA} GABA_A {numGABA_A} GABA_B {numGABA_B}

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
echo FB standard synapses AMPA {numAMPA} NMDA {numNMDA} GABA_A {numGABA_A} GABA_B {numGABA_B}


echo p_pyr2pyr_AMPA {p_pyr2pyr_AMPA} p_pyr2fb_AMPA {p_pyr2fb_AMPA} p_fb2pyr_GABA_A {p_fb2pyr_GABA_A}






setfield /#/#/#[TYPE=compartment] Em -0.065
reset
reset	// Get channels into correct equilibrium state
setfield /#/#/#[TYPE=compartment] Em -0.060
setfield /#/#/#[TYPE=compartment] Vm -0.065
//setfield /pyr_array/pyr/soma/Ca_concs Ca 8 C 8



//step 6000

//setfield /fb_array/fb[0]/soma inject -6.837106396e-11
//setfield /fb_array/fb[1]/soma inject -6.837106396e-11
//setfield /fb_array/fb[]/##[TYPE=compartment] Vm {holding_potential}

//step {20000 * 2.5e-5 / {dt}}


//Spikes are too large and too rapid. Should be about 0.05 - 0.2 seconds in between, and about 0.5mV in amplitude.













