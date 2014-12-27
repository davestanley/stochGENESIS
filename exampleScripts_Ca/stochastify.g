

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
		    if ( {originalchannel} == "Ca" || {originalchannel} == "CaV13" )
		    	if (use_difshell)
					addmsg {curr_compt}/{originalchannel}_m {el {curr_compt}/#[TYPE=difshell]} FINFLUX Ik {scaleB}
				else
					addmsg {curr_compt}/{originalchannel}_m {el {curr_compt}/#[TYPE=Ca_concen]} I_Ca Ik
				end

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
		    elif ( {originalchannel} == "SK2" || {originalchannel} == "SK2h" || {originalchannel} == "sAHP")
		    	if (use_difshell)
		    		addmsg {el {curr_compt}/#[TYPE=difshell]} {curr_compt}/{originalchannel}_m TRANSMITTER C
		    	else
		    		addmsg {el {curr_compt}/#[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m TRANSMITTER Ca
		    	end
		    end

			//Note: I usually don't want to create the synaptic channels right now, so I usually leave
			//	them out of the library until after the stochastify command is executed. Then, I
			//	add synapses when executing connections*.g

				if ({is_K_C})					//vdep_channels use a different naming convention
					str gbar_field = "gbar"			//Therefore, we must account for this when setting the field
				else
					str gbar_field = "Gbar"
				end
		    if ( {originalchannel} == "AMPA" || {originalchannel} == "GABA_A" || {originalchannel} == "NMDA" || {originalchannel} == "GABA_B")
				setfield {curr_compt}/{originalchannel}_m  \
				    Nt  {{getfield {curr_channel}_old gmax} / \
				    {getfield {curr_compt}/{originalchannel}_m Gmax}} \
				    Ek {getfield {curr_channel}_old Ek} 
		    else
//				setfield {curr_compt}/{originalchannel}_m  \
//				    Nt  {{getfield {curr_channel}_old {gbar_field}} /  \
//				    {getfield {curr_compt}/{originalchannel}_m Gmax}} \
//				    Ek {getfield {curr_channel}_old Ek} 
				    
    			setfield {curr_compt}/{originalchannel}_m  \
				    Nt  {round {{getfield {curr_channel}_old {gbar_field}} /  \
				    {getfield {curr_compt}/{originalchannel}_m Gmax}}} \
				    Ek {getfield {curr_channel}_old Ek} 
		    end



		    delete {curr_channel}_old
		    //deletemsg {curr_channel}_old 0 -outgoing
		    //disable {curr_channel}_old
		    if ( {originalchannel} == "HPo_SK2" )
		    	if (use_difshell)
				    addmsg {el {curr_compt}/##[TYPE=difshell]} {curr_compt}/{originalchannel}_m VOLTAGE C
			    else
				    addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m VOLTAGE Ca
			    end
		    else
			    addmsg {curr_compt} {curr_compt}/{originalchannel}_m VOLTAGE Vm
		    end
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

