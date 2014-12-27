


// ************************************ Useful functions ************************************

function scalechannel (script_chan, scaleval)

	float currGbar
	str curr_chan
	foreach curr_chan (  {el /#/#/#/{ {script_chan} @ ""}[TYPE=tabchannel],/#/#/#/{ {script_chan} @ "s"}[TYPE=tabchannel] } )
		currGbar = {getfield {curr_chan} Gbar}
		echo Scaling tabchannel {curr_chan} to {{currGbar}*{scaleval}}
		setfield {curr_chan} Gbar {{currGbar}*{scaleval}}
	end
	foreach curr_chan (  {el /#/#/#/{ {script_chan} @ ""}[TYPE=vdep_channel],/#/#/#/{ {script_chan} @ "s"}[TYPE=vdep_channel] } )
		currGbar = {getfield {curr_chan} gbar}
		echo Scaling vdep_channel {curr_chan} to {{currGbar}*{scaleval}}
		setfield {curr_chan} gbar {{currGbar}*{scaleval}}
	end
end


function scalechannel_somadend (script_chan, scaleval, scalesoma, somadia)

	float currGbar
	str curr_chan
	float dia
	foreach curr_chan (  {el /#/#/#/{ {script_chan} @ ""}[TYPE=tabchannel],/#/#/#/{ {script_chan} @ "s"}[TYPE=tabchannel] } )
		currGbar = {getfield {curr_chan} Gbar}
		dia = {getfield {curr_chan}/.. dia}
		if ( {{dia} >= {somadia} && {scalesoma}} || {{dia} < {somadia} && {!scalesoma}} )
			echo Scaling tabchannel {curr_chan} to {{currGbar}*{scaleval}}
			setfield {curr_chan} Gbar {{currGbar}*{scaleval}}
		end
	end
	foreach curr_chan (  {el /#/#/#/{ {script_chan} @ ""}[TYPE=vdep_channel],/#/#/#/{ {script_chan} @ "s"}[TYPE=vdep_channel] } )
		currGbar = {getfield {curr_chan} gbar}
		dia = {getfield {curr_chan}/.. dia}
		if ( {{dia} >= {somadia} && {scalesoma}} || {{dia} < {somadia} && {!scalesoma}} )
			echo Scaling vdep_channel {curr_chan} to {{currGbar}*{scaleval}}
			setfield {curr_chan} gbar {{currGbar}*{scaleval}}
		end
	end
end

function delete_markov_library (script_chan)
	str curr_chan
	foreach curr_chan (  {el /library/markov/{ {script_chan} @ "_m"},/library/markov/{ {script_chan} @ "s_m"} } )
		echo Deleting library channel {curr_chan}
		delete {curr_chan}
	end
end


function deletechannel (path, script_chan)

	str curr_chan
	foreach curr_chan ({el {path}/{script_chan}})
		// echo Deleting {curr_chan}
		delete {curr_chan}
	end
end

function CaClamp (chan_list, val)
	//float val
	str curr_chan
	
//	echo CaClamp value {val}
	
	if ({val} > 0.0)
		// Delete incoming messages to Ca pool, then force all fields to
		//		desired Ca concentration (val)
		foreach curr_chan ({el {chan_list}})
			//echo Clamping channel {curr_chan}
			if ({getmsg {curr_chan} -incoming -count} > 0 )
				deletemsg {curr_chan} 0 -incoming
			end
			setfield {curr_chan} Ca {val} C {val} Ca_base {val} tau 0.00001
		end
	end
end


function CaPulse (chan_list, pulse_width1, pulse_level1, pulse_delay2)
	//float val
	str curr_chan
	float val = 0.0
	
//	echo CaClamp value {val}
	

		// Delete incoming messages to Ca pool, then force all fields to
		//		desired Ca concentration (val)
		foreach curr_chan ({el {chan_list}})
			//echo Clamping channel {curr_chan}
			if ({getmsg {curr_chan} -incoming -count} > 0 )
				deletemsg {curr_chan} 0 -incoming
			end
			setfield {curr_chan} Ca {val} C {val} Ca_base {val} tau 5.0e-5
			create pulsegen {curr_chan}/../pulsee
			setfield {curr_chan}/../pulsee width1 {pulse_width1} delay2 {pulse_delay2} level1 {pulse_level1} 
			addmsg {curr_chan}/../pulsee {curr_chan} BASE output

		end

end

function force_channel_density (force_chan, force_dens, region)
	// Force channel density
	if ( {force_dens} >= 0 )
		str curr_chan
		float area
		float Pi = 3.1415926535
		foreach curr_chan (  {el /#/#/{region}/{ {force_chan} @ ""}[TYPE=tabchannel],/#/#/{region}/{ {force_chan} @ "s"}[TYPE=tabchannel] } )
			area = { {getfield {curr_chan}/.. len} * {getfield {curr_chan}/.. dia} * {Pi} }
			if ({area} == 0)
				area = { {pow {getfield {curr_chan}/.. dia} 2} * {Pi} }		// **Working with diameter removes factor of 4 from area form**
			end
			
	//		echo Setting tabchannel {curr_chan} to value {force_dens} * area {area}
			setfield {curr_chan} Gbar {{force_dens}*{area}}
		end
		foreach curr_chan (  {el /#/#/{region}/{ {force_chan} @ ""}[TYPE=vdep_channel],/#/#/{region}/{ {force_chan} @ "s"}[TYPE=vdep_channel] } )
			area = { {getfield {curr_chan}/.. len} * {getfield {curr_chan}/.. dia} * {Pi} }
			if ({area} == 0)
				area = { {pow {getfield {curr_chan}/.. dia} 2} * {Pi} }
			end
			
	//		echo Setting tabchannel {curr_chan} to value {force_dens} * area {area}
			setfield {curr_chan} gbar {{force_dens}*{area}}
		end
	end
end

function force_channel_density_nz (force_chan_nz, force_dens_nz, region)
	
	//Force channel density of densities that are not currently zero, leaving zero densities the same
//	echo {force_dens_nz} >= 0
//	echo {{force_dens_nz} >= 0}
	if ( {force_dens_nz} >= 0 )
		str curr_chan
		float area
		float Pi = 3.1415926535
		foreach curr_chan (  {el /#/#/{region}/{ {force_chan_nz} @ ""}[TYPE=tabchannel],/#/#/{region}/{ {force_chan_nz} @ "s"}[TYPE=tabchannel] } )
			if ({getfield {curr_chan} Gbar} != 0)
				area = { {getfield {curr_chan}/.. len} * {getfield {curr_chan}/.. dia} * {Pi} }
				if ({area} == 0)
					area = { {pow {getfield {curr_chan}/.. dia} 2} * {Pi} }
				end
				
	//			echo Setting tabchannel {curr_chan} to value {force_dens_nz} * area {area}
				setfield {curr_chan} Gbar {{force_dens_nz}*{area}}
			end
		end
		foreach curr_chan (  {el /#/#/{region}/{ {force_chan_nz} @ ""}[TYPE=vdep_channel],/#/#/{region}/{ {force_chan_nz} @ "s"}[TYPE=vdep_channel] } )
			if ({getfield {curr_chan} gbar} != 0)
				area = { {getfield {curr_chan}/.. len} * {getfield {curr_chan}/.. dia} * {Pi} }
				if ({area} == 0)
					area = { {pow {getfield {curr_chan}/.. dia} 2} * {Pi} }
				end
				
	//			echo Setting tabchannel {curr_chan} to value {force_dens_nz} * area {area}
				setfield {curr_chan} gbar {{force_dens_nz}*{area}}
			end
		end
	end

end

function force_channel_density_z (force_chan_nz, force_dens_nz, region)
	
	//Force channel density of densities that are currently zero, leaving non-zero densities the same
//	echo {force_dens_nz} >= 0
//	echo {{force_dens_nz} >= 0}
	if ( {force_dens_nz} >= 0 )
		str curr_chan
		float area
		float Pi = 3.1415926535
		foreach curr_chan (  {el /#/#/{region}/{ {force_chan_nz} @ ""}[TYPE=tabchannel],/#/#/{region}/{ {force_chan_nz} @ "s"}[TYPE=tabchannel] } )
			if ({getfield {curr_chan} Gbar} == 0)
				area = { {getfield {curr_chan}/.. len} * {getfield {curr_chan}/.. dia} * {Pi} }
				if ({area} == 0)
					area = { {pow {getfield {curr_chan}/.. dia} 2} * {Pi} }
				end
				
	//			echo Setting tabchannel {curr_chan} to value {force_dens_nz} * area {area}
				setfield {curr_chan} Gbar {{force_dens_nz}*{area}}
			end
		end
		foreach curr_chan (  {el /#/#/{region}/{ {force_chan_nz} @ ""}[TYPE=vdep_channel],/#/#/{region}/{ {force_chan_nz} @ "s"}[TYPE=vdep_channel] } )
			if ({getfield {curr_chan} gbar} == 0)
				area = { {getfield {curr_chan}/.. len} * {getfield {curr_chan}/.. dia} * {Pi} }
				if ({area} == 0)
					area = { {pow {getfield {curr_chan}/.. dia} 2} * {Pi} }
				end
				
	//			echo Setting tabchannel {curr_chan} to value {force_dens_nz} * area {area}
				setfield {curr_chan} gbar {{force_dens_nz}*{area}}
			end
		end
	end

end

// ************************************ End functions section ************************************


// Block dendritic Ca channels
if (block_dend_Ca == 1)
	str curr_chan
	float Ca_soma_Gbar
	
	Ca_soma_Gbar = {getfield /pyr_array/pyr/soma/Ca Gbar}
	
	foreach curr_chan ( {el /#/#/#/Ca} )
		setfield {curr_chan} Gbar 0
	end
	setfield /pyr_array/pyr/soma/Ca Gbar {Ca_soma_Gbar}
end

force_channel_density {force_chan} {force_dens} "#"
force_channel_density {force_chan2} {force_dens2} "#"
force_channel_density {force_chan3} {force_dens3} "#"
force_channel_density {force_chan4} {force_dens4_soma} "soma#"
force_channel_density {force_chan4} {force_dens4_dend} "dend#"
force_channel_density {force_chan5} {force_dens5} "#"
force_channel_density_nz {force_chan_nz} {force_dens_nz} "#"
force_channel_density_nz {force_chan_nz2} {force_dens_nz2} "#"
force_channel_density_nz {force_chan_nz3} {force_dens_nz3} "#"
force_channel_density_nz {force_chan_nz4} {force_dens_nz4} "#"






// For curent clamp or voltage clamp, make select channels deterministic
if ( scriptmode == 1 || scriptmode == 2 || scriptmode == 5)
	delete_markov_library {script_chan}
	if ({script_chan} == "NaDiba")
		delete_markov_library "NaA"
	elif ({script_chan} == "KADiba")
		delete_markov_library "K_DRA"
	end
end

// Apply PID, block select channels
if ( scriptmode == 3 )
	str curr_chan
	scalechannel {script_chan} 0.0
	if ({script_chan} == "NaDiba")
		scalechannel "NaA" 0.0
	elif ({script_chan} == "KADiba")
		scalechannel "K_DRA" 0.0
	end
end



// Scale values for B and Tau in Ca_Concen objects
str currchan
float B
float tau
foreach currchan ( {el /#/#/#/#[TYPE=Ca_concen]} )
	B = {getfield {currchan} B}
	tau = {getfield {currchan} tau}
	setfield {currchan} B {{B}*{scaleB}} tau {{tau}*{scaletau}}
end


if ( plot_HPo_channel == 0 )
	deletechannel "/pyr_array/pyr/#" "HPo_SK2"
end


//if ( scriptmode == 5 || scriptmode == 2)
if ( scriptmode == 6 )
	scalechannel NaDiba 0.0
	scalechannel KADiba 0.0
	scalechannel KSDiba 0.0
	scalechannel leakDiba 0.0
	scalechannel K_DR 0.0
end


if ( scriptmode == 5 || scriptmode == 2)
		// function scalechannel_somadend (script_chan, scaleval, scalesoma, somadia)
//	scalechannel_somadend SK2 0.0 1 1.5e-5		// Will only scale compartments greater than this diameter
//	scalechannel_somadend SK2h 0.0 1 1.5e-5
end



// Set ratio of SK2 and SK2h channels
str currcompt
float SK2_gbar
float SK2h_gbar
str name
foreach currcompt ( {el /pyr_array/pyr/#[TYPE=compartment]} )
	if ( {exists {currcompt}/SK2} || {exists {currcompt}/SK2h}  )
		//echo scaling tau
		SK2_gbar = {getfield {currcompt}/SK2 Gbar}
		SK2h_gbar = {getfield {currcompt}/SK2h Gbar}
		// Readjust ratio between the two channel densities, preserving the total
		setfield {currcompt}/SK2 Gbar {   { 1-{percent_highPo_SK2} }*{ {SK2_gbar}+{SK2h_gbar} }   }
		setfield {currcompt}/SK2h Gbar {   {percent_highPo_SK2}*{ {SK2_gbar}+{SK2h_gbar} }   }
	end
end


function scale_channels (channame, field, scale)

	float fieldval
	str currchan
	float scaled_fieldval
	foreach currchan ( {el {channame}} )
		fieldval = {getfield {currchan} {field}}
		scaled_fieldval = {{fieldval}*{scale}}
		if ( {field} == "Nt" )		// If we're dealing with a field that expects an int, make sure to round
			scaled_fieldval = {round {scaled_fieldval} }
		end
		setfield {currchan} {field} {scaled_fieldval}
		//echo setfield {currchan} {field} {scaled_fieldval}, that's (round) {fieldval}*{scale}
		
	end
end

function move_list (channame, dest)
	str currchan
	foreach currchan ( {el {channame}} )
		if ( !{exists {currchan}/{dest}} )
			create neutral {currchan}/{dest}
		end
		move {currchan} {currchan}/{dest}/
	end
end

function duplicate_channels (channame, numcopies)
	str currchan
	int i
	foreach currchan ( {el {channame}} )
		for (i=1; i<= numcopies; i=i+1)
			copy {currchan} {currchan}_{i}
		end
		delete {currchan}
	end
end

	// Batch method of adding messages
function addmsg_destlist ( source, destlist, msg1, msg2 )
	str currchan
	foreach currchan ( {el {destlist}} )
		addmsg {currchan}/{source} {currchan} {msg1} {msg2}
	end
end

function addmsg_srclist ( sourcelist, dest, msg1, msg2, msg3 )
	str currchan
	foreach currchan ( {el {sourcelist}} )
		addmsg {currchan} {currchan}/{dest} {msg1} {msg2} {msg3}
	end
end

function calc_fields ( channame, calname, operation, field )
	str currchan
	foreach currchan ( {el {channame}} )
		if ( !{exists {currchan}/{calname}} )
			create calculator {currchan}/{calname}
		end
		addmsg {currchan} {currchan}/{calname} {operation} {field}
	end
end

function diffamp_scale ( channame, diffname, scalefact )
	str currchan
	foreach currchan ( {el {channame}} )
		if ( !{exists {currchan}/{diffname}} )
			create diffamp {currchan}/{diffname}
		end
		setfield {currchan}/{diffname} gain {scalefact} saturation Inf
		addmsg {currchan} {currchan}/{diffname} PLUS output
		
	end
end

	// Computes the volume of a spherical or cylindrical compartment
function compt_volume ( comptname )
	float vol
	float len = {getfield {comptname} len}
	float dia = {getfield {comptname} dia}
	float rad = {{dia}/2}
	float Pi = 3.1415926535
	
	if ( len == 0 ) // spherical
		vol = { 4.0/3*{Pi}* {pow {rad} 3} }
	else
		vol = { {Pi}*{pow {rad} 2} * {len} }
	end
	
	//echo Compartment {comptname} volume is {vol} meters cubed or {{vol}*1e18} µm cubed.
	return {vol}
end

function volume_weighted_avg ( channame, diffname, parentcompt, numpools, totalvolume )
	str currchan
	foreach currchan ( {el {channame}} )
		if ( !{exists {currchan}/{diffname}} )
			create diffamp {currchan}/{diffname}
		end
								// Divide by numpools to get average Ca2+ concentration in this compartment
								// Then multiply by compt_volume / totalvolume ratio. This is used for later formulation of
								// weighted average calcium concentration in the cell
		setfield {currchan}/{diffname} saturation Inf gain { {{compt_volume {currchan}/{parentcompt}} / {numpools}} / {totalvolume} }
		addmsg {currchan} {currchan}/{diffname} PLUS output		
	end
end




function split_pools (compartments, numpools, totalvolume)
	
//	float totalvolume = 0
//	str currcompt
//	foreach currcompt ({ el /pyr_array/pyr/#/#[TYPE=Ca_concen]})	// Get total volume of entire cell
//		// echo {currcompt} total volume {totalvolume} + {compt_volume {currcompt}/..}
//		totalvolume = { {totalvolume} + {compt_volume {currcompt}/..} }
//	end
//	echo totalvolume {totalvolume}
	
			// Scale relevant parameters appropriately
	scale_channels {compartments}/CaV13#[TYPE=tabchannel] Gbar {1.0/{numpools}}
	scale_channels {compartments}/CaV13#[TYPE=GENVhalf] Nt {1.0/{numpools}}
	scale_channels {compartments}/SK2#[TYPE=tabchannel] Gbar {1.0/{numpools}}	// Includes SK2 and SK2h
	scale_channels {compartments}/SK2#[TYPE=GENsynpores] Nt {1.0/{numpools}}
	scale_channels {compartments}/sAHP#[TYPE=tabchannel] Gbar {1.0/{numpools}}	// Includes SK2 and SK2h
	scale_channels {compartments}/sAHP#[TYPE=GENsynpores] Nt {1.0/{numpools}}
	scale_channels {compartments}/HPo_SK2#[TYPE=tabchannel] Gbar {1.0/{numpools}}
	scale_channels {compartments}/HPo_SK2#[TYPE=GENtabchan] Nt {1.0/{numpools}}
	scale_channels {compartments}/#[TYPE=Ca_concen] B {1.0*{numpools}}
	
	
			// Stack all calcium objects into a single tree and duplicate
	move_list {compartments}/CaV13# ../Capool
	move_list {compartments}/SK2# ../Capool	// Includes SK2 and SK2h
	move_list {compartments}/sAHP# ../Capool
	move_list {compartments}/HPo_SK2# ../Capool
	move_list {compartments}/Ca_conc_r# ../Capool
	move_list {compartments}/Ca_conc_dp# ../Capool
	duplicate_channels {compartments}/Capool {numpools}
	move_list {compartments}/Capool# ../allpools
	
			// Repair broken voltage message from parent compartment
	addmsg_destlist ../../.. {compartments}/allpools/Capool_#/#[TYPE=tabchannel] VOLTAGE Vm
	addmsg_destlist ../../.. {compartments}/allpools/Capool_#/#[TYPE=GENVhalf] VOLTAGE Vm
	addmsg_destlist ../../.. {compartments}/allpools/Capool_#/#[TYPE=GENsynpores] VOLTAGE Vm
	//addmsg_destlist ../../.. {compartments}/allpools/Capool_#/#[TYPE=GENtabchan] VOLTAGE Vm	% This channel requires calcium as input argument
	
			// Sum currents from all pools
	calc_fields {compartments}/allpools/Capool#/CaV13# ../../../CaV13_allpools SUM Ik
	calc_fields {compartments}/allpools/Capool#/SK2# ../../../SK2_allpools SUM Ik	// Combine all low Po and high Po SK2 channels
	if ({split_high_and_low_SK2} == 1)
		calc_fields {compartments}/allpools/Capool#/SK2_m ../../../SK2Low_allpools SUM Ik	// Only Low
		calc_fields {compartments}/allpools/Capool#/SK2h_m ../../../SK2High_allpools SUM Ik	// Only High
	end
	calc_fields {compartments}/allpools/Capool#/sAHP# ../../../sAHP_allpools SUM Ik
	calc_fields {compartments}/allpools/Capool#/HPo_SK2# ../../../HPo_allpools SUM Gk
	calc_fields {compartments}/allpools/Capool#/Ca_conc_r# ../../Ca_allpools SUM Ca	
	calc_fields {compartments}/allpools/Capool#/Ca_conc_dp# ../../Ca_allpools SUM C	
		diffamp_scale {compartments}/allpools/Ca_allpools ../../Ca_average {1.0/{numpools}}		// Provides a weighted average of [Ca]
																								// in each pool

			// Repair broken incoming Ik messages to parent compartment
	addmsg_srclist {compartments}/allpools/Capool_#/#[TYPE=tabchannel] ../../.. CHANNEL Gk Ek
	addmsg_srclist {compartments}/allpools/Capool_#/#[TYPE=GENVhalf] ../../.. CHANNEL Gk Ek
	addmsg_srclist {compartments}/allpools/Capool_#/#[TYPE=GENsynpores] ../../.. CHANNEL Gk Ek
	
	volume_weighted_avg {compartments}/allpools/Ca_allpools ../../volweighted_Ca ../.. {numpools} {totalvolume}
end


function disconnect_channel_Vm (compartments, channelname)
		/* Deletes a specific channel message to a given compartment (i.e. soma). This removes the
		compartment's voltage-dependency on that channel, but still allows it to interact with other
		elements, such as Ca_concs. */
	str currcompt
	str currchan
	int msg_number
	foreach currcompt ( {el {compartments} } )
		foreach currchan ( {el {currcompt}/{channelname}#[TYPE=,{currcompt}/##/{channelname}#} )
//			echo msg_number = {getmsg {currcompt} -in -find {currchan} CHANNEL} {currcompt} {currchan}
			msg_number = {getmsg {currcompt} -in -find {currchan} CHANNEL}
			if (msg_number > 0 )
				deletemsg {currcompt} {msg_number} -in
			end
		end
	end
end


//
//// Scale values for B and Tau in Ca_Concen objects
//function split_pools (channame, numpools)
//	
//	float SK2_gbar
//	float SK2h_gbar
//	float CaV13_gbar
//	float Ca_conc_r_B
//	int i
//	str currchan
//	foreach currchan ( {el {channame}} )
//			// Get compartment original values
//		SK2_gbar = {getfield {currcompt}/SK2 Gbar}
//		SK2h_gbar = {getfield {currcompt}/SK2h Gbar}
//		CaV13_gbar = {getfield {currcompt}/CaV13 Gbar}
//		Ca_conc_r_B = {getfield {currcompt}/Ca_conc_r B}
//		
//			// Scale according to number of compartments, so as to reduce pool size
//		echo setting fields
//		echo setfield {currcompt}/SK2 Gbar {{SK2_gbar} / {numpools}}
//		setfield {currcompt}/SK2 Gbar {{SK2_gbar} / {numpools}}
//		setfield {currcompt}/SK2h Gbar {{SK2_gbar} / {numpools}}
//		setfield {currcompt}/CaV13 Gbar {{CaV13_gbar} / {numpools}}
//		setfield {currcompt}/Ca_conc_r B {{Ca_conc_r_B} * {numpools}}
//		
//			// Stack into a single element tree
//		move {currcompt}/SK2 {currcompt}/Ca_conc_r/
//		move {currcompt}/SK2h {currcompt}/Ca_conc_r/
//		move {currcompt}/CaV13 {currcompt}/Ca_conc_r/
//
//			// Create calculator to sum all pools
//		create calculator {currcompt}/SK2_allpools
//		create calculator {currcompt}/SK2h_allpools
//		create calculator {currcompt}/CaV13_allpools
//		create calculator {currcompt}/Ca_conc_r_allpools
//		
//		
//		for (i=1; i<=numpools; i=i+1 )
//			copy {currcompt}/Ca_conc_r {currcompt}/Ca_conc_r_{i}	// Duplicate reduced calcium pools
//			
//			pushe {currcompt}/Ca_conc_r_{i}
//				move SK2 ../SK2_{i}			//Unstack the tree!
//				move SK2h ../SK2h_{i}
//				move CaV13 ../CaV13_{i}
//			pope
//
//			pushe {currcompt}
//				addmsg SK2_{i} SK2_allpools SUM Ik
//				addmsg SK2h_{i} SK2h_allpools SUM Ik
//				addmsg CaV13_{i} CaV13_allpools SUM Ik
//				addmsg Ca_conc_r_{i} Ca_conc_r_allpools SUM Ca
//			pope
//			
//		end
//		
//		delete {currcompt}/Ca_conc_r
//		
//	end
//end


// ** Make sure this comes AFTER all other modifications and tweaks!! **
//split_pools /pyr_array/pyr/soma#[TYPE=compartment] {num_somapools}






// Silly functions used for debugging

function tally_Nt (channame, field)

	float total_Gk = 0
	foreach curr_chan ({el /pyr_array/pyr/##/{channame}})
		echo Summing channel {curr_chan}
		total_Gk = {getfield {curr_chan} {field}} + total_Gk
	end
	return total_Gk

end

function tally_compartments (channame)

	int num_compartments
	foreach curr_chan ({el /pyr_array/pyr/##/{channame}})
		echo Counting channel {curr_chan}
		num_compartments = num_compartments+1
	end
	return num_compartments

end

function tally_volume (channame)

	float total_vol = 0
	foreach curr_chan ({el /pyr_array/pyr/##/{channame}})
		echo Getting volume for compartment {curr_chan}/../../..
		total_vol = {compt_volume {curr_chan}/../../..} + total_vol
	end
	return total_vol

end

function rtally_Nt_times_volume (channame, field)

	float total_Gk = 0
	foreach curr_chan ({el /pyr_array/pyr/##/{channame}})
		
		if ( {getfield {curr_chan}/../../.. name} == "soma" )
			total_Gk = {{getfield {curr_chan} {field}} * {compt_volume {curr_chan}/../../..} / {num_somapools}} + total_Gk
			echo total_Gk = {{getfield {curr_chan} {field}} * {compt_volume {curr_chan}/../../..} / {num_somapools}} + total_Gk
//			echo Summing channel*volume for soma {curr_chan}
		else
			total_Gk = {{getfield {curr_chan} {field}} * {compt_volume {curr_chan}/../../..} / {num_dendpools}} + total_Gk
			echo total_Gk = {{getfield {curr_chan} {field}} * {compt_volume {curr_chan}/../../..} / {num_dendpools}} + total_Gk
//			echo Summing channel*volume for dend {curr_chan}
		end
	end
	return total_Gk
end

function rtally_volume (channame)

	float total_vol = 0
	foreach curr_chan ({el /pyr_array/pyr/##/{channame}})

		if ( {getfield {curr_chan}/../../.. name} == "soma" )
			total_vol = {{compt_volume {curr_chan}/../../..}/{num_somapools}} + total_vol
			echo total_vol = {compt_volume {curr_chan}/../../..}/{num_somapools} + total_vol
//			echo Getting volume for soma compartment {curr_chan}/../../..
		else
			total_vol = {{compt_volume {curr_chan}/../../..}/{num_dendpools}} + total_vol
			echo total_vol = {compt_volume {curr_chan}/../../..}/{num_dendpools} + total_vol
//			echo Getting volume for dend compartment {curr_chan}/../../..
		end
	end
	return total_vol
end

function calc_B (channame)
	float F= 96485.339
	float z = 2.0
	float vol = {getfield {channame} vol}
	B = {{scaleB} / {z*F*vol}}
	echo B value for channel {channame} is {B}.
end

// Code to test that volumes are calculated correctly (paste this into GENESIS after starting simulation
// Compare to graphs's message from sum_volweighted_Ca pools
//echo {rtally_volume Ca_conc_r}
//echo {tally_Nt Ca_conc_r Ca}
//echo {rtally_Nt_times_volume Ca_conc_r Ca}
//echo {{rtally_Nt_times_volume Ca_conc_r Ca}/{rtally_volume Ca_conc_r}}
//showmsg /graphs1/Ik

function init_HPo
	if (plot_HPo_channel==1)
		str curr_chan
		foreach curr_chan ({el /pyr_array/##/HPo_SK2#})
			setfield {curr_chan} Z {percent_highPo_SK2}
//			echo Setting setfield {curr_chan} Z {percent_highPo_SK2}
		end
	end
end








