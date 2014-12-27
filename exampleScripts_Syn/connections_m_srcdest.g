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



	if ( {exists {curr_markov}} )

		//Calculate current number to assign
		elementcount = {{countelementlist {curr_compt}/#[TYPE=GENsynpores]} + 1}
		new_channel = {{dest} @ {elementcount} @ "_m"}
		//echo {source} {dest} {new_channel}

		//echo "Matchup: " {dest} "    " {curr_markov}
		copy {curr_markov} {new_channel}

		if ( {originalchannel} == "AMPA" || {originalchannel} == "GABA_A" || {originalchannel} == "NMDA" )
			setfield {new_channel}  \
			    Nt  {{getfield {dest} gmax} / \
			    {getfield {new_channel} Gmax}} \
			    Ek {getfield {dest} Ek}

			// Scale channel concentrations so that the PSC's are the correct height
			if( {originalchannel} == "AMPA" ); setfield {new_channel} Nt {round {{getfield {new_channel} Nt} * 2000/1390}}; end
			if( {originalchannel} == "NMDA" ); setfield {new_channel} Nt {round {{getfield {new_channel} Nt} * 2000/500}}; end
			if( {originalchannel} == "GABA_A" ); setfield {new_channel} Nt {round {{getfield {new_channel} Nt} * 2000/1950}}; end


			// Now that the channel is set up, we also need to invoke
			// both spontaneous PSPs (to be completed) and also neurotransmitter injection


				// First, create a diffamp to represent the baseline concentration of neurotransmitter
			create diffamp {new_channel}/trans_baseline
			setfield ^ gain 1 saturation Inf minus {-1.0*{base_conc}}


				// Next set up appropriate connection depending on whether the source of the spike is a presynaptic cell
				// or a spike generator
			if ( {exists {source} inject} )		// This indicates source is compartment
				create logistic {new_channel}/transmitter
				setfield ^ gain -1000 amplitude {peak_conc} thresh 0

				addmsg {source} {new_channel}/transmitter INPUT Vm	//presynaptic cell --> transmitter concentration
				addmsg {new_channel}/transmitter {new_channel}/trans_baseline PLUS state	//transmitter concentration --> baseline adder

			elif ( {exists {source} state} )	// The source is a spike generator
				create pulsegen {new_channel}/transpulse
				setfield ^ width1 0.001 level1 {peak_conc} trig_mode 1 baselevel 0

				addmsg {source} {new_channel}/transpulse INPUT state	//presynaptic cell --> transmitter concentration
				addmsg {new_channel}/transpulse {new_channel}/trans_baseline PLUS output	//transmitter concentration --> baseline adder
			else
				echo Cannot identify type of source compartment.
			end

			addmsg {new_channel}/trans_baseline {new_channel} TRANSMITTER output	//transmitter baseline adder --> channel
			addmsg {curr_compt} {new_channel} VOLTAGE Vm	//current voltage --> channel
			addmsg {new_channel} {curr_compt} CHANNEL Gk Ek	//channel --> current compartment

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



function connections_m_srcdest (src_pyr_array_name, dest_pyr_array_name, src_fb_array_name, dest_fb_array_name)

	str src_pyr_cell_name = {pyr_cell_name}
	str dest_pyr_cell_name = {pyr_cell_name}
	str src_fb_cell_name = {fb_cell_name}
	str dest_fb_cell_name = {fb_cell_name}


	str synapsetype = "spike_synapse"
	str synapsetype = "markov_synapse"


	//str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"
	// recurrent excitation from pyramidal cells to pyramidal cells
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

	//str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"
	// excitation from pyramidal cells to fb interneurons
	volumeconnect_general {src_pyr_array_name}{src_pyr_cell_name}[]/ax \
		      {dest_fb_array_name}{dest_fb_cell_name}[]/bas1_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/bas2_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/ap6_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/ap7_#/AMPA,{dest_fb_array_name}{dest_fb_cell_name}[]/ap8_#/AMPA 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
			0 {pyr2fb_x1} {pyr2fb_y1} {pyr2fb_z1} \ // rectangular
			{pyr2fb_x2} {pyr2fb_y2} {pyr2fb_z2} \
			{p_pyr2fb_AMPA}	{synapsetype}



	//str synapsetype = "spike_synapse"
	//str synapsetype = "markov_synapse"
	// feedback inhibition from fb interneurons to pyramidal cells
	volumeconnect_general {src_fb_array_name}{src_fb_cell_name}[]/ax \
		      {dest_pyr_array_name}{dest_pyr_cell_name}[]/bas3_#/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/soma/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap5#/GABA_A 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular all pyramidal cells 
			1 {fb2pyr_x1} {fb2pyr_y1} {fb2pyr_z1} \ //ellipsoid
			{fb2pyr_x2} {fb2pyr_y2} {fb2pyr_z2} \
			{p_fb2pyr_GABA_A} {synapsetype}



end


function afferent_m_srcdest (dest_pyr_array_name, dest_int_array_name, dest_int_cell_name)

	str src_pyr_cell_name = {pyr_cell_name}
	str dest_pyr_cell_name = {pyr_cell_name}
	str src_int_cell_name = {dest_int_cell_name}
	//str dest_int_cell_name = {dest_int_cell_name}

	if ( !{exists {aff_input_array_name}} )
		echo Building afferents
		// create prototype randomspike element
		make_afferent // afferent_input.g

		// create array of randomspike elements
		// network.g: create_array(array_name,cell_name,nx,ny,dx,dy,origin_x,origin_y)
		create_array {aff_input_array_name} {aff_input_name} {aff_nx} {aff_ny} \
			     	 {aff_dx} {aff_dy} {aff_origin_x} {aff_origin_y}

		disable {aff_input_name}

		// randomize positions and firing rate
		// network.g: randomize_afferents(array_name,cell_name,inumber_cells)
		randomize_afferents {aff_input_array_name} {aff_input_name} {n_of_aff}
	end



	str synapsetype = "spike_synapse"
	str synapsetype = "markov_synapse"

// excitations from afferents to pyramidal cells
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


// excitation from afferents to ff interneurons
volumeconnect_general {aff_input_array_name}{aff_input_name}[] \
	      {dest_int_array_name}{dest_int_cell_name}[]/ap7_#/AMPA,{dest_int_array_name}{dest_int_cell_name}[]/ap8_#/AMPA,{dest_int_array_name}{dest_int_cell_name}[]/ap9_#/AMPA 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // all afferents 
		0 {aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \
		{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
		{p_aff2ff_AMPA} {synapsetype}


end




//==================================================================
// connections
//==================================================================


// Initialize markov synapses
pushe /library/markov
make_AMPA_m_stevens
make_NMDA_m
make_GABA_A_m
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



