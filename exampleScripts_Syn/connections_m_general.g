// genesis 2.3
// David Stanley
// University of Toronto, 03.25.2009
//
// establish markov synatpic connections 


// genesis 2.2
// Kerstin Menne
// Medical University of Luebeck, 02.10.2001
//
// establish synatpic connections 



// Create a markov synapse
function markov_synapse (source, dest)
	str new_channel
	str originalchannel = {getfield {dest} name}
	str curr_compt = {el {dest}/..}
	str markov_lib = "/library/markov"
	str curr_markov = {{markov_lib} @ "/" @ {originalchannel} @ "_m"}
	int elementcount

	//if ({exists {dest} parent_cell_type})			//For interneuron AMPA channels
	//	if ({getfield {dest} parent_cell_type} == "Interneuron")
	//		str curr_markov = {{markov_lib} @ "/" @ {originalchannel} @ "i_m"}
	//		str originalchannel = {getfield {dest} defaultname}
	//	end
	//end



	if ( {exists {curr_markov}} )

		//Calculate current number to assign
		elementcount = {{countelementlist {curr_compt}/#[TYPE=GENsynpores]} + 1}
		new_channel = {{dest} @ {elementcount} @ "_m"}
		//echo {source} {dest} {new_channel}

		//echo "Matchup: " {dest} "    " {curr_markov}
		copy {curr_markov} {new_channel}

		if ( {originalchannel} == "AMPA" || {originalchannel} == "GABA_A" || {originalchannel} == "NMDA" || {originalchannel} == "GABA_B")
			//float Nt_temp = {trunc {{getfield {dest} gmax} / {getfield {new_channel} Gmax}}}
			float Nt_temp =  {{getfield {dest} gmax} / {getfield {new_channel} Gmax}}
			//echo {new_channel} {getfield {dest} gmax} / {getfield {new_channel} Gmax} =  {Nt_temp}

			setfield {new_channel}  \
			    Nt  { round {Nt_temp}} \
			    Ek {getfield {dest} Ek}

			// Scale channel concentrations so that the EPSC's are the correct height
			if( {originalchannel} == "AMPA" ); setfield {new_channel} Nt {round {{Nt_temp} * 2000/1200}}; end	//The appropriate normalization for AMPA_stevens
			if( {originalchannel} == "NMDA" ); setfield {new_channel} Nt {round {{Nt_temp} * 2000/570}}; end
			if( {originalchannel} == "GABA_A" ); setfield {new_channel} Nt {round {{Nt_temp} * 2000/1770}}; end
			if( {originalchannel} == "GABA_B" )
				if ( {getfield {new_channel} mode} == "regular" )
						// Set the correct max conductance of the Gprotein driven K channels
						// Also set the number of G-proteins to zero, since they increase freely
						// based upon the number of receptors present
						// (Note: each G_protein, when active, is assumed to 
						// instantaneously find a channel to which to bind
					// Gprotein max
					setfield {new_channel}/G_protein Gbar {{getfield {dest} gmax} * 100000/300} Nt 0
					// K_pore max
					if ( {getfield {new_channel} k_pore_mode} == 1 )
						setfield {new_channel}/K_pore Nt {round {{{getfield {dest} gmax} / \
							{getfield {new_channel}/K_pore Gmax}} * 100000/100}}
					else
						setfield {new_channel}/K_pore Nt {round {{{getfield {dest} gmax} / \
							{getfield {new_channel}/K_pore Gmax}} * 2000/200}}
					end


						// Make sure there are the same number of receptors as G_proteins (this is approximately correct)
						// and that the total "value" of the receptors is one. (Actually, so long as this curve is smooth, it's fine.)
					setfield {new_channel} Nt 10000
					setfield {new_channel} Gmax { 1/{getfield {new_channel} Nt} }

				else	// Inverted NMDA
					setfield {new_channel} Nt {round {{Nt_temp} * 2000/1000}};
				end
			end

			// Now that the channel is set up, we also need to invoke
			// both spontaneous PSPs (to be completed) and also neurotransmitter injection


				// First, create a diffamp to represent the baseline concentration of neurotransmitter
			create diffamp {new_channel}/trans_baseline
			if ( {originalchannel} == "AMPA" || {originalchannel} == "NMDA"); setfield ^ gain 1 saturation Inf minus {-1.0*{base_conc_pyr}}
			elif ( {originalchannel} == "GABA_A" || {originalchannel} == "GABA_B"); setfield ^ gain 1 saturation Inf minus {-1.0*{base_conc_int}}; end


				// Next set up appropriate connection depending on whether the source of the spike is a presynaptic cell
				// or a spike generator
			if ( {exists {source} inject} )		// This indicates source is compartment
				create logistic {new_channel}/transmitter
				setfield ^ gain -1000 amplitude {peak_conc} thresh 0

				addmsg {source} {new_channel}/transmitter INPUT Vm	//presynaptic cell --> transmitter concentration
				addmsg {new_channel}/transmitter {new_channel}/trans_baseline PLUS state	//transmitter concentration --> baseline adder

			elif ( {exists {source} state} )	// The source is a spike generator
				create pulsegen {new_channel}/transpulse
				setfield ^ width1 {conc_width} level1 {peak_conc} trig_mode 1 baselevel 0

				addmsg {source} {new_channel}/transpulse INPUT state	//presynaptic cell --> transmitter concentration
				addmsg {new_channel}/transpulse {new_channel}/trans_baseline PLUS output	//transmitter concentration --> baseline adder
			else
				echo Cannot identify type of source compartment.
			end

			addmsg {new_channel}/trans_baseline {new_channel} TRANSMITTER output	//transmitter baseline adder --> channel
			addmsg {curr_compt} {new_channel} VOLTAGE Vm	//current voltage --> channel

			if( {originalchannel} == "GABA_B" )	// Take into account GABA_B's use of G-protein
				if ( {getfield {new_channel} mode} == "regular" )
					//addmsg {new_channel} {new_channel}/G_protein TRANSMITTER Gk
					addmsg {new_channel}/K_pore {curr_compt} CHANNEL Gk Ek	//channel --> current compartment
				else	// Inverted NMDA
					addmsg {new_channel} {curr_compt} CHANNEL Gk Ek	//channel --> current compartment
				end
			else
				addmsg {new_channel} {curr_compt} CHANNEL Gk Ek	//channel --> current compartment
			end

			//delete {dest}_old
		end


	else
		echo Cannnot find target channel in markov library {curr_markov}
	end

end

// Create a standard synapse that uses the spike message
function spike_synapse (source, dest)
float weight = 1
float delay = 0

	if ( {exists {source} inject} )		// Source is a compartment. Therefore, look @ sub compartment
		addmsg {el {source}/##[TYPE=spikegen]} {dest} SPIKE
		setfield {dest} synapse[0].weight {weight} synapse[0].delay {delay}
	elif ( {exists {source} state} )	// Source is a randomspike element
		addmsg {source} {dest} SPIKE
		setfield {dest} synapse[0].weight {weight} synapse[0].delay {delay}
	end

end


///////////////////////////////////////////////////////// Functions adding Cell-Cell Connections ///////////////////////////

// recurrent excitation from pyramidal cells to pyramidal cells
function pyr_pyr_excite (src_pyr_array_name, dest_pyr_array_name)
	str src_pyr_cell_name = {pyr_cell_name}
	str dest_pyr_cell_name = {pyr_cell_name}


	str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"

	// AMPA channels
	randseed 12345
	volumeconnect_general {src_pyr_array_name}{src_pyr_cell_name}[]/ax \
		      {dest_pyr_array_name}{dest_pyr_cell_name}[]/ap8_#/AMPA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap9_#/AMPA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap10_#/AMPA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/bas2_#/AMPA 1 \	//relative
			0 -1 -1 -1 1 1 1 \ // rectangular all pyramidal cells 
			0 {pyr2pyr_x1} {pyr2pyr_y1} {pyr2pyr_z1} \ //rectangular
			{pyr2pyr_x2} {pyr2pyr_y2} {pyr2pyr_z2} \
			{p_pyr2pyr_AMPA} {synapsetype}

	// NMDA channels
	randseed 12345 // ensures that AMPA and NMDA channels occur paired
	volumeconnect_general {src_pyr_array_name}{src_pyr_cell_name}[]/ax \
		      {dest_pyr_array_name}{dest_pyr_cell_name}[]/ap8_#/NMDA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap9_#/NMDA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap10_#/NMDA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/bas2_#/NMDA 1 \	//relative
			0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
			0 {pyr2pyr_x1} {pyr2pyr_y1} {pyr2pyr_z1} \ //rectangular
			{pyr2pyr_x2} {pyr2pyr_y2} {pyr2pyr_z2} \
			{p_pyr2pyr_NMDA} {synapsetype}

end


// excitation from pyramidal cells to fb interneurons
function pyr_int_excite (src_pyr_array_name, dest_fb_array_name)
	str src_pyr_cell_name = {pyr_cell_name}
	str dest_fb_cell_name = {fb_cell_name}


	str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"
	volumeconnect_general {src_pyr_array_name}{src_pyr_cell_name}[]/ax \
		      {dest_fb_array_name}{dest_fb_cell_name}[]/bas1_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/bas2_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/ap6_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/ap7_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/ap8_#/AMPA 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
			0 {pyr2fb_x1} {pyr2fb_y1} {pyr2fb_z1} \ // rectangular
			{pyr2fb_x2} {pyr2fb_y2} {pyr2fb_z2} \
			{p_pyr2fb_AMPA}	{synapsetype}
end

// feedback inhibition from fb interneurons to pyramidal cells
function int_pyr_inhibit (src_fb_array_name, dest_pyr_array_name)
	str dest_pyr_cell_name = {pyr_cell_name}
	str src_fb_cell_name = {fb_cell_name}


	str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"
	volumeconnect_general {src_fb_array_name}{src_fb_cell_name}[]/ax \
		      {dest_pyr_array_name}{dest_pyr_cell_name}[]/bas3_#/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/soma/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap5#/GABA_A 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular all pyramidal cells 
			1 {fb2pyr_x1} {fb2pyr_y1} {fb2pyr_z1} \ //ellipsoid
			{fb2pyr_x2} {fb2pyr_y2} {fb2pyr_z2} \
			{p_fb2pyr_GABA_A} {synapsetype}
end










///////////////////////////////////////// Afferents //////////////////////////////////////////


function build_afferents (aff_input_array_name)		// Support function for afferent construction
	echo Building afferents
	// create prototype randomspike element
	make_afferent // afferent_input.g
	enable {aff_input_name}

	// create array of randomspike elements
	// network.g: create_array(array_name,cell_name,nx,ny,dx,dy,origin_x,origin_y)
	create_array {aff_input_array_name} {aff_input_name} {aff_nx} {aff_ny} \
		     	 {aff_dx} {aff_dy} {aff_origin_x} {aff_origin_y}
	setfield {aff_input_array_name}/##[TYPE=randomspike] min_amp {aff_min_amp} max_amp {aff_max_amp} rate {aff_rate}\
		   abs_refract {aff_abs_refract}
	disable {aff_input_name}
	// randomize positions and firing rate
	// network.g: randomize_afferents(array_name,cell_name,inumber_cells)
	randseed 54321
	randomize_afferents {aff_input_array_name} {aff_input_name} {n_of_aff}
end


// excitations from afferents to pyramidal cells
function aff_pyr_excite (aff_input_array_name, dest_pyr_array_name)
	str src_pyr_cell_name = {pyr_cell_name}
	str dest_pyr_cell_name = {pyr_cell_name}

	if ( !{exists {aff_input_array_name}} )
		aff_rate = {exc_aff_rate}
		build_afferents {aff_input_array_name}
		aff_rate = {default_aff_rate}
	end

	str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"


// AMPA channels
randseed 54321
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
	      {dest_pyr_array_name}{dest_pyr_cell_name}[]/bas3_#/AMPA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap5#/AMPA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap6_#/AMPA 1 \	//relative
	      0 -1 -1 -1 1 1 1 \ // all afferents ; box
		0 {aff2pyr_x1} {aff2pyr_y1} {aff2pyr_z1} \
		{aff2pyr_x2} {aff2pyr_y2} {aff2pyr_z2} \	//box
		{p_aff2pyr_AMPA} {synapsetype}

// NMDA channels
randseed 54321 // using of the same seed ensures, that AMPA and NMDA channels
	       // of the same compartments are selected
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
	      {dest_pyr_array_name}{dest_pyr_cell_name}[]/bas3_#/NMDA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap5#/NMDA,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap6_#/NMDA 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // all afferents 
		0 {aff2pyr_x1} {aff2pyr_y1} {aff2pyr_z1} \
		{aff2pyr_x2} {aff2pyr_y2} {aff2pyr_z2} \	//box
		{p_aff2pyr_NMDA} {synapsetype}
end

// excitation from afferents to ff interneurons
function aff_ff_excite (aff_input_array_name, dest_int_array_name, dest_int_cell_name)
	str src_int_cell_name = {dest_int_cell_name}

	if ( !{exists {aff_input_array_name}} )
		aff_rate = {exc_aff_rate}
		build_afferents {aff_input_array_name}
		aff_rate = {default_aff_rate}
	end
	str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"


volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
	      {dest_int_array_name}{dest_int_cell_name}[]/ap7_#/AMPA,{dest_int_array_name}{dest_int_cell_name}[]/ap8_#/AMPA,{dest_int_array_name}{dest_int_cell_name}[]/ap9_#/AMPA 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // all afferents 
		0 {aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \
		{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
		{p_aff2ff_AMPA} {synapsetype}



end

//////////////////////////////////////////////// Daveadd //////////////////////////////////////////////////

// excitation from afferents to fb interneurons
function aff_fb_excite (aff_input_array_name, dest_int_array_name, dest_int_cell_name)
	str src_int_cell_name = {dest_int_cell_name}

	if ( !{exists {aff_input_array_name}} )
		aff_rate = {exc_aff_rate}
		build_afferents {aff_input_array_name}
		aff_rate = {default_aff_rate}
	end
	str synapsetype = "spike_synapse"
	str synapsetype = "markov_synapse"


// AMPA channels
randseed 54327
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
		{dest_int_array_name}{dest_int_cell_name}[]/#/AMPA 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
			0 {aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \	//rectangular
			{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
			{p_aff2fb_AMPA} {synapsetype}

//NMDA channels
randseed 54327
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
		{dest_int_array_name}{dest_int_cell_name}[]/#/NMDA 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
			0 {aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \	//rectangular
			{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
			{p_aff2fb_NMDA} {synapsetype}


	// Randomize weights ** Cannot group NMDA and AMPA channels together, otherwise it will start counting things twice! **
	volumeweight_markov {aff_input_array_name}{aff_input_name}[] \
		{dest_int_array_name}{dest_int_cell_name}[]/#/AMPA#_m	\
		1.0 {rand_from_aff_weight}

	volumeweight_markov {aff_input_array_name}{aff_input_name}[] \
		{dest_int_array_name}{dest_int_cell_name}[]/#/NMDA#_m	\
		1.0 {rand_from_aff_NMDA_weight}


end


// inhibition from afferents to fb interneurons
function aff_int_inhibit (aff_input_array_name, dest_int_array_name, dest_int_cell_name)
	str src_int_cell_name = {dest_int_cell_name}

	if ( !{exists {aff_input_array_name}} )
		aff_rate = {int_aff_rate}
		build_afferents {aff_input_array_name}
		aff_rate = {default_aff_rate}
	end
	str synapsetype = "spike_synapse"
	str synapsetype = "markov_synapse"

//GABA_A
randseed 54321
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
	      {dest_int_array_name}{dest_int_cell_name}[]/bas3#/GABA_A,{dest_int_array_name}{dest_int_cell_name}[]/soma/GABA_A,{dest_int_array_name}{dest_int_cell_name}[]/ap5_#/GABA_A 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // all afferents 
		0 {aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \
		{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
		{p_aff2fb_GABA_A} {synapsetype}


	//str synapsetype = "spike_synapse"
//GABA_B
randseed 54329
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
	      {dest_int_array_name}{dest_int_cell_name}[]/#/GABA_B 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // rectangle, all afferents 
		0 {aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \
		{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
		{p_aff2fb_GABA_B} {synapsetype}


volumeweight_markov {aff_input_array_name}{aff_input_name}[] \
      {dest_int_array_name}{dest_int_cell_name}[]/#/GABA_A#_m 1.0 {rand_from_aff_weight}

end


	//Removes the annoying feature of the synchan2 object that scale down the effective
	//gmax as nsynapses increases.
function fix_scales
	str curr_chan
	foreach curr_chan ({el /#/#/#/##[TYPE=synchan2]})
		setfield {curr_chan} gmax { {getfield {curr_chan} gmax} * {getfield {curr_chan} nsynapses} }
	end
end

//==================================================================
// connections
//==================================================================


// Initialize markov synapses
pushe /library/markov
make_AMPA_m_stevens
make_NMDA_m
make_GABA_A_m
////make_GABA_B_m_NMDAinvert
make_GABA_B_m
pope





//Set some parameters
//Hack
//p_pyr2pyr_NMDA = 0.5
//p_pyr2pyr_AMPA = 0.5



//Test
//volumeconnect_general /fb_array/fb[]/ax /pyr_array/pyr[]/##/AMPA 0 	\ //absolute
//					0 -1 -1 -1 1 1 1 \ //rectangular
//					0 -1 -1 -1 1 1 1 \ //rectangular
//					1.0 {synapsetype} //probability & function to build markov synapses

//volumeconnect_general /fb_array/fb[]/ax /pyr_array/pyr[]/##/NMDA 0 	\ //absolute
//					0 -1 -1 -1 1 1 1 \ //rectangular
//					0 -1 -1 -1 1 1 1 \ //rectangular
//					1.0 {synapsetype} //probability & function to build markov synapses



//build_synapse /fb_array/fb[0]/ax /pyr_array/pyr[0]/ap6_1/NMDA
//addmsg /fb_array/fb[0]/ax/spikegen /pyr_array/pyr[0]/ap6_1/NMDA SPIKE





// Actual connections

//volumeconnect_general /fb_array/fb[]/ax /pyr_array/pyr[]/##/NMDA 0 	\ //absolute
//					0 -1 -1 -1 1 1 1 \ //rectangular
//					0 -1 -1 -1 1 1 1 \ //ellipse
//					1.0 {synapsetype} //probability & function to build markov synapses



