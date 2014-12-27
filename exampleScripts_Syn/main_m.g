

// genesis 2.2
// Kerstin Menne
// menne@isip.mu-luebeck.de
// Medical University of Luebeck, 01.10.2001
//
// main script for the simulation consisting of a network of pyramidal cells
// and interneurons 


// Automated setting adjustments

int graphics_on = 0
int mode = 3		// 1=ion channels only; 2=gap only; 3=syn only; 4=syn&gap
int stochastic_synapses = 1
int stoch_ion_channels = 1

if (stoch_ion_channels == 1)
	float input_psd_noise = 3.00e-12
else
	float input_psd_noise = 0.00
end

int shift_Na_on = 1

//Disable stuff
int disable_K_AHP = 0
int disable_leak_channel = 0
int disable_AMPA = 0


//Scaling
int scaling_amps = 1
float scl_all_synstr = 4
float scaleAMPA = {1 * {scl_all_synstr}}
float scaleNMDA = {1 * {scl_all_synstr}}
float scaleGABA_A = {0.95 * {scl_all_synstr}}
float scaleGABA_B = {1 * {scl_all_synstr}}
//float scaleAMPA = 1		//Defaults
//float scaleNMDA = 1
//float scaleGABA_A = 0.95
//float scaleGABA_B = 1


//Set rates
int scaling_rate = 0
float scl_aff_rate = 1
float default_aff_rate = {0.35 * {scl_aff_rate}}
float exc_aff_rate = {0.35 * {scl_aff_rate}}
float int_aff_rate = {0.35 * {scl_aff_rate}}
//float exc_aff_rate = 0.35 // defaults
//float int_aff_rate = 0.35 // defaults

float aff_rate_rand = 0.125



float holding_potential
if (mode<3)
	holding_potential = -0.060
elif (mode>=3)
	holding_potential = -0.060
end

str wrdest_save		// Automatic file naming system based on
if (mode==1); wrdest_save = "/fb5"	// NaK ion channels only
elif (mode==2); wrdest_save = "/fb0g"	// With gap junction
elif (mode==3); wrdest_save = "/fb9s"	// Include Synapse
elif (mode==4); wrdest_save = "/fb0sg"	// Include gap junction and synapse
end

if (stochastic_synapses == 1)
	wrdest_save = {{wrdest_save} @ "_stoch"}
else
	wrdest_save = {{wrdest_save} @ "_det"}
end


if (scaling_amps == 1)
	wrdest_save = {{wrdest_save} @ "_scl_amp" @ {{scl_all_synstr}*10} }
end


if (scaling_rate == 1)
	wrdest_save = {{wrdest_save} @ "_scl_rate" @ {{scl_aff_rate}*10} }
end


//Cheap trick to scale conductances
int gbar_scale = 1.0	// Scale factor for ionic channel maximal conductances
int scale_mode = -1
if (scale_mode == 1); gbar_scale = 1.0; wrdest_save = "/fb0_skinner3x"
elif (scale_mode == 2); gbar_scale = 2.0; wrdest_save = "/fb0_skinner2x"
elif (scale_mode == 4); gbar_scale = 4.0; wrdest_save = "/fb0_skinner4x"
elif (scale_mode == 8); gbar_scale = 8.0; wrdest_save = "/fb0_skinner8x"
end

int disable_exec = 0
if (disable_exec == 1); wrdest_save = "/fb0s_noexec"; end

int disable_inh = 0
if (disable_inh == 1); wrdest_save = "/fb0s_noinh"; end

include constants_traub96.g // file containing global constants

//Alter clock
float dt = 2.5e-5             //  default simulation time step in sec 
float dt_save = 2.5e-5
//float dt = 1e-5	            //  simulation time step in sec 
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt_save}            // used for graphical outputs
randseed		//useful for making simulations unique and interesting each time you run

include Na_chan_skinner.g
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


/////////////////////////////////////////////////////////////////////////////////////////// Random hacks


// Delete unwanted pyramidal channels (optional)
str curr_chan
foreach curr_chan (  {el /#/#/#/Ca} {el /#/#/#/K_DR}  {el /#/#/#/K_AHP} {el /#/#/#/K_AHPs} {el /#/#/#/NaA} {el /#/#/#/K_DRA})
	//echo {curr_chan}
	//setfield {curr_chan} Gbar 0
end
foreach curr_chan ({el /#/#/#/K_C} {el /#/#/#/K_Cs} )
	//echo {curr_chan}
	//setfield {curr_chan} gbar 0
end // {el /#/#/#/K_A} {el /#/#/#/Na}


// Delete unwanted compartments!
str curr_chan
foreach curr_chan ({el /#/#/ap#} {el /#/#/bas#} {el /#/#/ax#})
	//echo {curr_chan}
	//delete {curr_chan} 
end // 



//Scale ion channel conductance densities
str curr_chan

///////////////////////////////////////////////////////////Fooling around (more random hacks)
// Scale all channels
foreach curr_chan (  {el /#/#/#/Na} {el /#/#/#/Ca} {el /#/#/#/K_DR} {el /#/#/#/K_DRi} {el /#/#/#/K_AHP#}  {el /#/#/#/K_A} {el /#/#/#/K_Ai})
	//setfield {curr_chan} Gbar {{gbar_scale} * {getfield {curr_chan} Gbar}}
end

foreach curr_chan (  {el /#/#/#/K_C#} )
	//setfield {curr_chan} gbar {{gbar_scale} * {getfield {curr_chan} gbar}}
end

// Set axon to zero
foreach curr_chan (  {el /#/#/#/NaA} )
	//setfield {curr_chan} Gbar 0
end

// Scale only sodium
foreach curr_chan (  {el /#/#/#/Na})
	setfield {curr_chan} Gbar {{gbar_scale} * {getfield {curr_chan} Gbar}}
end



// Set Skinner to zero
foreach curr_chan (  {el /#/#/#/NaS_skinner} )
	//setfield {curr_chan} Gbar {{gbar_scale} * 3 * {getfield {curr_chan} Gbar}}
end





///////////////////////////////////////////////////////////////// Actual functionality
// Disable leak
if (disable_leak_channel == 1)
	foreach curr_chan (  {el /#/#/#/leaki#})
		setfield {curr_chan} Gbar 0
	end
end



foreach curr_chan ( {el /#/#/#/AMPA#} )
	setfield {curr_chan} gmax {{getfield {curr_chan} gmax} * {scaleAMPA}}
end

foreach curr_chan ( {el /#/#/#/NMDA#} )
	setfield {curr_chan} gmax {{getfield {curr_chan} gmax} * {scaleNMDA}}
end

foreach curr_chan ( {el /#/#/#/GABA_A#} )
	setfield {curr_chan} gmax {{getfield {curr_chan} gmax} * {scaleGABA_A}}
end

foreach curr_chan ( {el /#/#/#/GABA_B#} )
	setfield {curr_chan} gmax {{getfield {curr_chan} gmax} * {scaleGABA_B}}
end





if (disable_AMPA == 1)
	foreach curr_chan (  {el /#/#/#/AMPA#} )
		setfield {curr_chan} gmax 0
	end
end

if (disable_exec == 1)
	foreach curr_chan (  {el /#/#/#/AMPA#,/#/#/#/NMDA#} )
//	foreach curr_chan (  {el /#/#/#/NMDA#} )
		setfield {curr_chan} gmax 0
	end
end

if (disable_inh == 1)
	foreach curr_chan (  {el /#/#/#/GABA_A#,/#/#/#/GABA_B#} )
		setfield {curr_chan} gmax 0
	end
end

if (stoch_ion_channels == 1)
	//move /pyr_array/pyr/soma /; move /pyr_array/pyr/axonIS /; move /pyr_array/pyr/ax /
	//extract_markov /pyr_array/pyr[0] /pyr_array
	extract_markov /fb_array/fb[0] /fb_array
	//extract_markov /fb_array/fb[1] /fb_array

	//move /soma /pyr_array/pyr/; move /axonIS /pyr_array/pyr/; move /ax /pyr_array/pyr/
else
	input_psd_noise = { 1.598119122 * {input_psd_noise}}	// Scale up the noise to compensate for lack of channels
end


include add_psd.g
add_psd ../matlab/psdnoise_n1_fc1.txt /fb_array/fb/soma {input_psd_noise}

// Optional - shift activation kinetics of Na_m channels if we're using synapses
include Na_shift.g
if (shift_Na_on == 1)
	Na_shift "/fb_array/fb/#/Na#" -0.053
end

// Optional - disable slow K_AHP channels
if (disable_K_AHP == 1)
	str curr_chan
	foreach curr_chan ({el /pyr_array/pyr[]/#/K_AHPs} {el /pyr_array/pyr/#/K_AHP} {el /pyr_array/pyr[]/#/K_AHPs_m} {el /pyr_array/pyr/#/K_AHP_m})
		disable {curr_chan}
	end
end

disable /pyr_array
disable pyr_array/pyr[1]
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
if (mode>=3)
	aff_fb_excite /aff_array4 /fb_array /fb[0]
	aff_int_inhibit /aff_array2 /fb_array /fb[0]
	aff_fb_excite /aff_array3 /fb_array /fb[1]
	aff_int_inhibit /aff_array1 /fb_array /fb[1]
	fix_scales
end
convert_AMPA_to_AMPAi /fb_array/fb/#/AMPA#	//Increase rate constants of AMPA synapses in inhibitory neurons in accordance with Destexhe

// Make synapses deterministic if need be
if (stochastic_synapses != 1)

	foreach curr_chan (  {el /#/#/#/AMPA#_m} )
		setfield {curr_chan} Nt {{getfield {curr_chan} Nt} * 100} Gmax {{getfield {curr_chan} Gmax} / 100}
	end

	foreach curr_chan (  {el /#/#/#/GABA_A#_m} )
		setfield {curr_chan} Nt {{getfield {curr_chan} Nt} * 100} Gmax {{getfield {curr_chan} Gmax} / 100}
	end

	foreach curr_chan (  {el /#/#/#/NMDA#_m} )
		setfield {curr_chan} Nt {{getfield {curr_chan} Nt} * 1000} Gmax {{getfield {curr_chan} Gmax} / 1000}
	end

	foreach curr_chan (  {el /#/#/#/GABA_B#_m} )
		setfield {curr_chan}/K_pore Nt {{getfield {curr_chan}/K_pore Nt} * 100} Gmax {{getfield {curr_chan}/K_pore Gmax} / 100}
	end
end


if ((mode==2) || (mode==4))
	include gap_junctions_m.g
end


// TEST: Set up testing connections
//include conn_fb.g
//afferent_m_srcdest /pyr_array /fb_array /fb



//include hsolver.g // creation of hsolve-elements --> comment me out!
//setmethod 11


//// Save interneuron data
str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[0]/soma"}
save_file {wrdest_save} {wrsource}


str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[0]/bas1_2"}
//save_file {{wrdest_save} @ "_bas1_2"} {wrsource}

str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[0]/ap11_5"}
//save_file {{wrdest_save} @ "_ap11_5"} {wrsource}









//str wrdest_save = "/fb1"
//str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[1]/soma"}
//save_file {wrdest_save} {wrsource}



// Create plot for pyramidal cell
//plot_graphs "/pyr_array/pyr[0]/soma" "/graphs1" "/sim_out1"
//plot_graphs "/pyr_array/pyr[0]/ap7_1" "/graphs2" "/sim_out2"
//plot_graphs "/pyr_array/pyr[0]/bas2_1" "/graphs3" "/sim_out3"

//str wrsource = {{pyr_array_name} @ {pyr_cell_name} @ "[0]/soma"}
//save_file pyr0 {wrsource}




	str src_fbcell = "/fb_array/fb[0]/ap6_1"
	//str src_fbcell = "/fb_array/fb[0]/ap7_1"

	
	//str src_fbcell = {el /fb_array/fb[0]/#/NMDA#_m/..}
	//str src_fbcell =  {el /fb_array/fb[]/#/GABA_B#_m/..}

if (graphics_on)
	// Create standard plot for interneuron neuron (soma & GABA_A)
	str src_fbcell = "/fb_array/fb[0]/ap9_1"
	str src_fbcell = "/fb_array/fb[0]/soma"
	plot_graphs {src_fbcell} "/graphsfb0" "/sim_outfb0a"


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
	str src_fbcell = "/fb_array/fb[0]/bas2_1"
	//plot_graphs {src_fbcell} "/graphsfb2" "/sim_outfb0b"


	// Plot graphsfb3 -- plots GABA_B channels
	str src_fbcell = "/fb_array/fb[0]/ap9_1"
	//plot_graphs {src_fbcell} "/graphsfb3" "/sim_outfb0c"

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
echo {el {fb_count}/#/NMDA#[TYPE=GENsynpores]/}

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



//addmsg /fb_array/fb/bas1_2/AMPA1_m /graphsfb0/Ik PLOT Trans *transmitter *red
//addmsg /fb_array/fb/soma /graphsfb/Ik PLOT Im *Im *green
//addmsg /fb_array/fb/soma /graphsfb/Ik PLOT inject *inject *red

setfield /#/#/#[TYPE=compartment] Em {holding_potential} Vm {holding_potential} initVm {holding_potential}

reset
reset
//step 3


//setfield /fb_array/fb[0]/##[TYPE=compartment] Vm {holding_potential}
//setfield /fb_array/fb[1]/##[TYPE=compartment] Vm {holding_potential}


if ((mode==1) || (mode==3))
	disable /fb_array/fb[1]/
end


//Alter clock
if (disable_K_AHP == 0)
	//float dt = 2.5e-3             //  default simulation time step in sec 
	//float dt_save = 2.5e-3
	//setclock  0  {dt}             // set the simulation clock
	//setclock 1 {dt_save}            // used for graphical outputs
end


include PID_thresh.g
//PID_thresh "/pyr_array/pyr[]/soma" {1000*{dt}} {4000*{dt}} {holding_potential} 1
PID_thresh "/fb_array/fb[]/soma" {1000*{dt}} {4000*{dt}} {holding_potential} 1
//PID_thresh "/fb_array/fb[]/soma" {1000*{dt}} {320000*{dt}} {holding_potential} 1		//Voltage clamp time!



//Alter clock
float dt = 2.5e-5             //  default simulation time step in sec 
float dt_save = 2.5e-5            //  simulation time step in sec 
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt_save}            // used for graphical outputs




//setfield /fb_array/fb[0]/soma inject -6.837106396e-11
//setfield /fb_array/fb[1]/soma inject -6.837106396e-11
//setfield /fb_array/fb[]/##[TYPE=compartment] Vm {holding_potential}

//step {20000 * 2.5e-5 / {dt}}


//Spikes are too large and too rapid. Should be about 0.05 - 0.2 seconds in between, and about 0.5mV in amplitude.

showfield /fb_array/fb/ap9_1/AMPA#_m Nt
showfield /fb_array/fb/ap9_1/NMDA#_m Nt
showfield /fb_array/fb/soma/GABA_A1_m Nt
showfield /fb_array/fb/ap10_1/GABA_B#_m/K_pore Nt



//step 80000
//showfield /aff_array4/aff[] rate

