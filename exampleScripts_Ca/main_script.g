

// genesis 2.2
// Kerstin Menne
// menne@isip.mu-luebeck.de
// Medical University of Luebeck, 01.10.2001
//
// main script for the simulation consisting of a network of pyramidal cells
// and interneurons 


// Automated setting adjustments


int mode = 1		// 1=ion channels only; 2=gap only; 3=syn only; 4=syn&gap

// Some constants



// Temporary constants move to script

include ssh_params.g
//str cellnum = "04"
//str scriptorder = "g"







//end temp constants

float holding_potential
if (mode<3)
	holding_potential = -0.060
elif (mode>=3)
	holding_potential = -0.070
end

str wrdest_save		// Automatic file naming system based on
if (mode==1); wrdest_save = "/fb0"	// NaK ion channels only
elif (mode==2); wrdest_save = "/fb0g"	// With gap junction
elif (mode==3); wrdest_save = "/fb0s"	// Include Synapse
elif (mode==4); wrdest_save = "/fb0sg"	// Include gap junction and synapse
end


int shift_Na_on = 0

//Script automation stuff
int n_timesteps = 7300000
//int n_timesteps = 5200000
//int n_timesteps = 2800000
if ({plot_mode} == -1)
	n_timesteps = 2800000
end
int n_timesteps = 7300
//int n_timesteps = 27300
float CaClamp_soma = -1
float CaClamp_dend = -1
if (apply_CaClamp)
//	CaClamp_soma = 7.97		// For Vclamp @ -65mV
//	CaClamp_dend = 0.112
//	CaClamp_soma = 18.5		// For Vclamp @ -60.1mV
//	CaClamp_dend = 0.30
	CaClamp_soma = 4.531075774e-08	// For Vclamp @ -61mV
	CaClamp_dend = 5.664927357e-08


	if (block_dend_Ca)
		CaClamp_dend = 0
	end
end

//if (scriptmode == 1)		// Measure Vm
//	str pyrname = {"/pyrVm" @ {cellnum} @ {scriptorder} @ "_" @ {script_chan}}
//elif (scriptmode == 2)	// Measure current, clamp voltage
//	str pyrname = {"/pyrIC" @ {cellnum} @ {scriptorder} @ "_" @ {script_chan}}
//elif (scriptmode == 3)	// Measure current when clamped, for channel block
//	str pyrname = {"/pyrPID" @ {cellnum} @ {scriptorder} @ "_" @ {script_chan}}
//else
//	str pyrname = {"/pyrtemp"}
//end
//
//if (apply_CaClamp == 1)
//	pyrname = {{pyrname} @ "_CaClamp"}
//elif ( {scriptmode == 1 || scriptmode == 2} && {strcmp {script_chan} "allmarkov"} )	//strcmp returns 0 when they're equal, else 1
//	pyrname = {{pyrname} @ "_det"}
//end

str pyrname = {"/" @ {fullname_raw}}




include constants_smallnet.g // file containing global constants

//Alter clock
float dt = 2.5e-5             //  default simulation time step in sec 
float dt_save = {dt*10}
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
include write_everything_totals.g
include write_buffer.g
include network_m.g // functions for the creation of arrays and randomizations


// New channels
include new_chan.g


// Let's go!
//make_pumps
include cell_arrays_r.g
include tweaks.g		// Tweaks channel densities, blocks certain channels, etc (according to preferences set in bash_script



extract_markov /pyr_array/pyr[0] /pyr_array
//extract_markov /fb_array/fb[0] /fb_array
//extract_markov /fb_array/fb[1] /fb_array

//include add_psd.g
//add_psd ../matlab/psdnoise_n1_fc1.txt /fb_array/fb/soma {input_psd_noise}


// Optional - shift activation kinetics of Na_m channels if we're using synapses
include Na_shift.g
if (shift_Na_on == 1)
	Na_shift "/pyr_array/pyr/#/Na#" -0.055
end

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


	// split_pools function is part of tweaks.g library
float totalvolume = 0
str currcompt
foreach currcompt ({ el /pyr_array/pyr/#/#[TYPE=Ca_concen],/pyr_array/pyr/#/#[TYPE=difshell]})	// Get total volume of entire cell
	// echo {currcompt} total volume {totalvolume} + {compt_volume {currcompt}/..}
	totalvolume = { {totalvolume} + {compt_volume {currcompt}/..} }
end
split_pools /pyr_array/pyr/soma#[TYPE=compartment] {num_somapools} {totalvolume}		// Do not comment out when using difpools, unless fix the line
split_pools /pyr_array/pyr/dend#[TYPE=compartment] {num_dendpools} {totalvolume}		// Where you normalize len = len / numpools

if ({plot_mode} == -1)		// If only plotting one pool, delete the other ones to increase efficiency
	str curr_chan
	foreach curr_chan ({el /##/Capool#})
		if ({{getfield {curr_chan} name} != "Capool_1"}); delete {curr_chan}; end
	end
end


if ( disconnect_CaV_Vm )
	disconnect_channel_Vm /pyr_array/pyr/# CaV13
end


// Create plot for pyramidal cell
if ( scriptmode == 1 || scriptmode == 2 || scriptmode == 4 || scriptmode == 5 || scriptmode == 6 || scriptmode == 7 || scriptmode == 8)
plot_graphs "/pyr_array/pyr[0]/dend__Extra_1" "/graphs1" {pyrname} {graphics_on} {plot_mode}
//plot_graphs "/pyr_array/pyr[0]/dend__Extra_1" "/graphs2" /deleteme2 {graphics_on} -1
//plot_buffer "/pyr_array/pyr[0]/dend__Extra_1" "/graphs2" {pyrname}_buff {graphics_on} 0

end

if ( {scriptmode} == 3 && {graphics_on} )
	plot_graphs "/pyr_array/pyr[0]/soma" "/graphs1" "/deleteme" {graphics_on} 1
//	plot_graphs "/pyr_array/pyr[0]/dend__Extra_4" "/graphs2" "/deleteme2" {graphics_on} 1
//	plot_graphs "/pyr_array/pyr[0]/dend" "/graphs3" "/deleteme3" {graphics_on} 1
	
end

//str wrsource = {{pyr_array_name} @ {pyr_cell_name} @ "[0]/soma"}
//save_file {pyrname} {wrsource}


// Clamp calcium concentration if input values are non-negative
CaClamp "/pyr_array/pyr/soma#/Ca_conc_r" {CaClamp_soma}
CaClamp "/pyr_array/pyr/dend#/Ca_conc_r" {CaClamp_dend}



reset
reset
//step 3


//setfield /fb_array/fb[0]/##[TYPE=compartment] Vm {holding_potential}
//setfield /fb_array/fb[1]/##[TYPE=compartment] Vm {holding_potential}


if ((mode==1) || (mode==3))
	disable /fb_array/fb[1]/
end



if (plot_HPo_channel==1)
	str curr_chan
	foreach curr_chan ({el /pyr_array/##/HPo_SK2#})
		setfield {curr_chan} Z {percent_highPo_SK2}
		//echo Setting setfield {curr_chan} Z {percent_highPo_SK2}
	end
end


include PID_thresh.g
include PID_VClamp.g
//include PID_thresh2.g
//include PID_thresh2_plot.g
if (scriptmode == 1)
	//Alter clock
	setclock  0  2.5e-5             // set the simulation clock
	setclock 1 2.5e-5            // used for graphical outputs
	
	PID_thresh "/pyr_array/pyr[0]/soma" 0.1 {4000*{dt}} {holding_potential} 1 {graphics_on} 0 "nosave"
	
	//Alter clock
	setclock  0  {dt}             // set the simulation clock
	setclock 1 {dt_save}            // used for graphical outputs
	
	step {n_timesteps}
	
elif (scriptmode == 2)

	// To implement VClamp, delete voltage feedback messages to compartment
	str curr_compt
	int num_msg
	foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} )
		num_msg = {getmsg {curr_compt} -incoming -count} 
		for (i = 1; i <= num_msg; i=i+1 )
			deletemsg {curr_compt} 0 -incoming
		end
		setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}
	end
	
//	holding_potential = 0.010; foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} ); setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}; end
//	step {0.15/{dt}}
	
	holding_potential = -0.060; foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} ); setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}; end
	step {n_timesteps}

elif (scriptmode == 3)
	//Alter clock
	PID_thresh "/pyr_array/pyr[0]/soma" {1000*{dt}} {{n_timesteps}*{dt}} {holding_potential} 1 {graphics_on} 1 {pyrname}
	
elif (scriptmode == 4)		// Run vClamp through test mAHP protocol

	
	// To implement VClamp, delete voltage feedback messages to compartment
	str curr_compt
	int num_msg	
	foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} )
		num_msg = {getmsg {curr_compt} -incoming -count} 
		for (i = 1; i <= num_msg; i=i+1 )
			deletemsg {curr_compt} 0 -incoming
		end
		setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}
	end
	step {4.0/{dt}}
	
	holding_potential = 0.010; foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} ); setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}; end
	step {0.1/{dt}}
	
	holding_potential = -0.060; foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} ); setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}; end
	step {0.3/{dt}}

elif (scriptmode == 5)		// Run CaClamp through test mAHP protocol

	
	// To implement VClamp, delete voltage feedback messages to compartment
	str curr_compt
	int num_msg	
	foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} )
		num_msg = {getmsg {curr_compt} -incoming -count} 
		for (i = 1; i <= num_msg; i=i+1 )
			deletemsg {curr_compt} 0 -incoming
		end
		setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}
	end
	CaClamp "/pyr_array/pyr/##/Ca_conc_r" 750e-9
	
	step {5.0/{dt}}
	
//	holding_potential = 0.010; foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} ); setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}; end
//	CaClamp "/pyr_array/pyr/##/Ca_conc_r" 750e-9
//	step {0.1/{dt}}
	
	holding_potential = -0.060; foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} ); setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}; end
	CaClamp "/pyr_array/pyr/##/Ca_conc_r" 75e-9
	step {5.0/{dt}}

elif (scriptmode == 6)	// Clamp to get mAHP amplitude right
	PID_VClamp "/pyr_array/pyr[0]/soma" {holding_potential} {graphics_on} 1 "/deleteme"
	reset; reset
	
	step {0.1/{dt}}
	setfield /pyr_array/pyr/soma/pid cmd 0.010
	step {0.1/{dt}}
	setfield /pyr_array/pyr/soma/pid cmd -0.060
	step {0.1/{dt}}
	
elif (scriptmode == 7)	// Active conditions
	PID_thresh "/pyr_array/pyr[0]/soma" 0.1 {4000*{dt}} {holding_potential} 1 {graphics_on} 0 "nosave"
	float temp_inj = {getfield /pyr_array/pyr/soma inject}
//	setfield /pyr_array/pyr/soma inject 4e-10
//	step {0.005/{dt}}
//	setfield /pyr_array/pyr/soma inject {temp_inj}
	setfield /pyr_array/pyr/soma inject 2e-10
//	setfield /pyr_array/pyr/soma inject 1.75e-10
//	setfield /pyr_array/pyr/soma inject 1.5e-10
	step {n_timesteps}
	
elif (scriptmode == 8)		// CaClamp pulses

	str curr_compt
	int num_msg	
	foreach curr_compt ( {el /pyr_array/##[TYPE=compartment]} )
		num_msg = {getmsg {curr_compt} -incoming -count} 
		for (i = 1; i <= num_msg; i=i+1 )
			deletemsg {curr_compt} 0 -incoming
		end
		setfield {curr_compt} Em {holding_potential} initVm {holding_potential} Vm {holding_potential}
	end
	CaPulse "/pyr_array/pyr/##/Ca_conc_r" {pulse_width1} {pulse_level1} {pulse_delay2}
	
	reset; reset;
	init_HPo
	
	step {n_timesteps}

end

echo Complete simulation

//showfield #/Na Gbar gbar



//showfield ../sum_SK2_m output
//showfield ../sum_SK2h_m output
//showfield /pyr_array/pyr/soma/CaV13# Gbar Gk Nt No Gmax 




mv .{pyrname} {dataoutput_path}
if ( scriptmode != 3 )
	mv .{pyrname}_info {dataoutput_path}
end

echo Complete copying files

ce /pyr_array/pyr/dend__Extra_1

//echo num somapools {num_somapools}
//showfield allpools/Capool_1/CaV13_m Nt

//ce ../dend__Extra_2
//echo num dendpools {num_dendpools}
//showfield allpools/Capool_1/CaV13_m Nt

ce allpools/Capool_1

//showfield /pyr_array/pyr/#/Na# Nt


//exit
