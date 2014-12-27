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

			// Scale channel concentrations so that the EPSC's are the correct height
			if( {originalchannel} == "AMPA" ); setfield {new_channel} Nt {round {{getfield {new_channel} Nt} * 2000/1390}}; end
			if( {originalchannel} == "NMDA" ); setfield {new_channel} Nt {round {{getfield {new_channel} Nt} * 2000/500}}; end
			if( {originalchannel} == "GABA_A" ); setfield {new_channel} Nt {round {{getfield {new_channel} Nt} * 2000/1950}}; end


			// Now that the channel is set up, we also need to invoke
			// both spontaneous EPSPs and also neurotransmitter injection
			create logistic {new_channel}/transmitter
			setfield ^ gain -1000 amplitude 5e0 thresh 0
			addmsg {source} {new_channel}/transmitter INPUT Vm	//presynaptic cell informs transmitter object of voltage
			addmsg {new_channel}/transmitter {new_channel} TRANSMITTER state
			addmsg {new_channel} {curr_compt} CHANNEL Gk Ek
			//delete {dest}_old
		end


	else
		echo Cannnot find target channel in markov library {curr_markov}
	end

end

// Create a standard synapse that uses the spike message
function pyrspike_synapse (source, dest)
float weight = 1
float delay = 0

	addmsg {source}/pyr_spikegen {dest} SPIKE
	setfield {dest} synapse[0].weight {weight} synapse[0].delay {delay}

end

// Create a standard synapse that uses the spike message
function fbspike_synapse (source, dest)
float weight = 1
float delay = 0

	addmsg {source}/spikegen {dest} SPIKE
	setfield {dest} synapse[0].weight {weight} synapse[0].delay {delay}

end


//==================================================================
// connections
//==================================================================

//Set some parameters


//Hack
//p_pyr2pyr_NMDA = 0.5
//p_pyr2pyr_AMPA = 0.5

include volumeconnect_general.g
pushe /library/markov
make_AMPA_m_stevens
make_NMDA_m
make_GABA_A_m
pope

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


str synapsetype = "pyrspike_synapse"
// recurrent excitation from pyramidal cells to pyramidal cells
// AMPA channels
randseed 12345
volumeconnect_general {pyr_array_name}{pyr_cell_name}[]/ax \
	      {pyr_array_name}{pyr_cell_name}[]/ap8_#/AMPA,{pyr_array_name}{pyr_cell_name}[]/ap9_#/AMPA,{pyr_array_name}{pyr_cell_name}[]/ap10_#/AMPA,{pyr_array_name}{pyr_cell_name}[]/bas2_#/AMPA 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // rectangular all pyramidal cells 
		0 {pyr2pyr_x1} {pyr2pyr_y1} {pyr2pyr_z1} \ //rectangular
		{pyr2pyr_x2} {pyr2pyr_y2} {pyr2pyr_z2} \
	        {p_pyr2pyr_AMPA} {synapsetype}


// NMDA channels
randseed 12345 // ensures that AMPA and NMDA channels occur paired
volumeconnect_general {pyr_array_name}{pyr_cell_name}[]/ax \
	      {pyr_array_name}{pyr_cell_name}[]/ap8_#/NMDA,{pyr_array_name}{pyr_cell_name}[]/ap9_#/NMDA,{pyr_array_name}{pyr_cell_name}[]/ap10_#/NMDA,{pyr_array_name}{pyr_cell_name}[]/bas2_#/NMDA 1 \	//relative
		0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
		0 {pyr2pyr_x1} {pyr2pyr_y1} {pyr2pyr_z1} \ //rectangular
		{pyr2pyr_x2} {pyr2pyr_y2} {pyr2pyr_z2} \
		{p_pyr2pyr_NMDA} {synapsetype}



str synapsetype = "fbspike_synapse"
// feedback inhibition from fb interneurons to pyramidal cells
volumeconnect_general {fb_array_name}{fb_cell_name}[]/ax \
	      {pyr_array_name}{pyr_cell_name}[]/bas3_#/GABA_A,{pyr_array_name}{pyr_cell_name}[]/soma/GABA_A,{pyr_array_name}{pyr_cell_name}[]/ap5_#/GABA_A 1 \ //relative
		0 -1 -1 -1 1 1 1 \ // rectangular all pyramidal cells 
		1 {fb2pyr_x1} {fb2pyr_y1} {fb2pyr_z1} \ //ellipsoid
		{fb2pyr_x2} {fb2pyr_y2} {fb2pyr_z2} \
		{p_fb2pyr_GABA_A} {synapsetype}

str synapsetype = "markov_synapse"
// excitation from pyramidal cells to fb interneurons
volumeconnect_general {pyr_array_name}{pyr_cell_name}[]/ax \
	      {fb_array_name}{fb_cell_name}[]/bas1_#/AMPA,{fb_array_name}{fb_cell_name}[]/bas2_#/AMPA,{fb_array_name}{fb_cell_name}[]/ap6_#/AMPA,{fb_array_name}{fb_cell_name}[]/ap7_#/AMPA,{fb_array_name}{fb_cell_name}[]/ap8_#/AMPA 1 \ //relative
		0 -1 -1 -1 1 1 1 \ // rectangular, all pyramidal cells 
		0 {pyr2fb_x1} {pyr2fb_y1} {pyr2fb_z1} \ // rectangular
		{pyr2fb_x2} {pyr2fb_y2} {pyr2fb_z2} \
		{p_pyr2fb_AMPA}	{synapsetype}




