

function convert_markov (cellpath, markovlib)
str curr_compt
str curr_markov
str curr_channel
str s4
str originalchannel


// For each compartment in our cell...
foreach curr_compt ({el {cellpath}/##[TYPE=compartment]})
    //echo {curr_compt}

    // Look through our list of substitute markov channels
    foreach curr_markov ({el {markovlib}/#})
	originalchannel = {getfield {curr_markov} originalchannel}

	    // Look through our current compartment's channels
	    // to see if they match originalchannel
	    foreach curr_channel ({el {curr_compt}/#})
		s4 = { {curr_compt} @ "/" @ {originalchannel} }
		//echo {s4} == {curr_channel}

	        if ( {s4} == {curr_channel} )
			//echo "Matchup: " {curr_channel} "    " {curr_markov}
		    move {curr_channel} {curr_channel}_old
		    copy {curr_markov} {curr_compt}/{originalchannel}_m


		    int is_K_C = 0
		    // Exceptional messages for Calcium dependencies
		    if ( {originalchannel} == "Ca" )
			addmsg {curr_compt}/{originalchannel}_m {el {curr_compt}/##[TYPE=Ca_concen]} I_Ca Ik
		    elif ( {originalchannel} == "K_C" || {originalchannel} == "K_Ci" || {originalchannel} == "K_Cs" || {originalchannel} == "K_Csi")
			int is_K_C = 1
			if ({exists {curr_compt}/{originalchannel}_m/tab_alpha})
				addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab_alpha INPUT Ca
				addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab_beta INPUT Ca
			elif ({exists {curr_compt}/{originalchannel}_m/tab})
				addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab INPUT Ca
			end

			addmsg {curr_compt} {curr_compt}/{originalchannel}_m/X_alpha INPUT Vm
			addmsg {curr_compt} {curr_compt}/{originalchannel}_m/X_beta INPUT Vm
		    elif ( {originalchannel} == "K_AHP" || {originalchannel} == "K_AHPi" || {originalchannel} == "K_AHPs" || {originalchannel} == "K_AHPsi")
				addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab_alpha INPUT Ca
				addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab_beta INPUT Ca
		    end

			//Note: I usually don't want to create the synaptic channels right now, so I usually leave
			//	them out of the library until after the stochastify command is executed. Then, I
			//	add synapses when executing connections*.g

				if ({is_K_C})					//vdep_channels use a different naming convention
					str gbar_field = "gbar"			//Therefore, we must account for this when setting the field
				else
					str gbar_field = "Gbar"
				end
		    if ( {originalchannel} == "AMPA" || {originalchannel} == "GABA_A" || {originalchannel} == "NMDA" || {originalchannel} == "GABA_B" )
			setfield {curr_compt}/{originalchannel}_m  \
			    Nt  {{getfield {curr_channel}_old gmax} / \
			    {getfield {curr_compt}/{originalchannel}_m Gmax}} \
			    Ek {getfield {curr_channel}_old Ek} 
		    else
			setfield {curr_compt}/{originalchannel}_m  \
			    Nt  {round {{getfield {curr_channel}_old {gbar_field}} /  \
			    {getfield {curr_compt}/{originalchannel}_m Gmax}}} \
			    Ek {getfield {curr_channel}_old Ek} 
		    end



		    delete {curr_channel}_old
		    //deletemsg {curr_channel}_old 0 -outgoing
		    //disable {curr_channel}_old
		    
		    addmsg {curr_compt} {curr_compt}/{originalchannel}_m VOLTAGE Vm
		    addmsg {curr_compt}/{originalchannel}_m {curr_compt} CHANNEL Gk Ek

		end

	    end
    end
end

end



function extract_markov (source, dest)
str curr_loop

	if (!{exists {dest}})
		create neutral {dest}
	end

	convert_markov {source} "/library/markov"
	move {source} {dest}


end


function convert_AMPA_to_AMPAi (channels)
	float c0c1 = {4.59e6 * 2}
	float c1c0 = {4.26e3 * 2}
	float c1c2 = {2.84e7 * 2}
	float c2c1 = {3.26e3 * 2}
	float c2o = {4.24e3 * 2}
	float oc2 = {900 * 2}
	float c1c3 = {2.89e3 * 2}
	float c3c1 = {39.2 * 2}
	float c3c4 = {1.27e6 * 2}
	float c4c3 = {45.7 * 2}
	float c2c4 = {172 * 2}
	float c4c2 = {0.727 * 2}
	float c4c5 = {16.8 * 2}
	float c5c4 = {190.4 * 2}
	float oc5 = {17.7 * 2}
	float c5o = {4 * 2}



	str curr_chan
	foreach curr_chan ({el {channels}})	//Double the time constants of each channel
		if ({exists {curr_chan} originalchannel})	// It's a markov channel
			setfield {curr_chan} 	\
				S11_S12 0 S12_S13 0 S13_S14 {c2o} TCoef1 {c0c1} TCoef2 {c1c2} \
				S12_S11 {c1c0} S13_S12 {c2c1} S14_S13 {oc2} \
				S12_S22 {c1c3} S22_S12 {c3c1} S13_S23 {c2c4} S23_S13 {c4c2} S14_S24 {oc5} S24_S14 {c5o} \
				S22_S23 0 S23_S22 {c4c3} S23_S24 {c4c5} S24_S23 {c5c4} \
				TCoef5 {c3c4} openstate1 14
		else						// It's a synchan
		    	setfield {curr_chan} tau2 {0.045e-3  / Q10_synapse} \
				              tau1 {0.75e-3   / Q10_synapse}
		end

		if (!{exists {curr_chan} parent_cell})
			addfield {curr_chan} parent_cell
		end
		setfield {curr_chan} parent_cell interneuron
	end


end








