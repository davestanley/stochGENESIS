
function markov_synapse (source, dest)
// OVERVIEW
// Forms a synaptic connection between source and dest elements.
// In addition, it replaces the destination element with an equivalent
// Markovian channel, as pulled from /library/markov. (Note that the element
// names must match).
// This code is meant to be viewed as an example and should be customized to the specific
// ion channels in your library.
//
// EXAMPLES
// see exampleScripts_Syn/connections_m_general.g

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