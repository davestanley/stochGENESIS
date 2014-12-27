

function convert_markov (cellpath, markovlib)
//This function is used for taking a deterministic GENESIS model and
//automatically converting it to an equivalent stochastic model.
//
//INPUTS:
//	cellpath - the GENESIS element path to the original model
//	markovlib - the GENESIS element path to the library of
//                equivalent Markov elements.
//
//DETAILS:
//	This function assumes that you have already created a library
//	of Markovian ion channels (given by markovlib). It will
//	search through your current model and replace any ion channel
//	with a channel from the Markov library that has a matching
//	name. Only channels with matching versions in markovlib will
//	be replaced. New channels imported from markovlib will have an
//	"_m" appended to their element names.
//	
//	This algorithm will also set certain field values in the new
//	Markovian channel (such as Nt and Ek) to produce equivalent
//	maximal conductances based on Gbar of the original channel.
//	It will also add VOLTAGE and CHANNEL messages between the ion
//	channel and the compartment.
//	
//	A more complex version of this function, called
//	stochastify_complex.g, which contains specialized cases
//	for adding messages for calcium and calcium-dependent ion
//	channels. Stochastify_complex.g should be treated as example
//	code and the if statements will likely need to be tweaked to
//	match the specific ion channel names you are using.
//
//	
//EXAMPLE:
//convert_markov {source} "/library/markov"
//
//See exampleScripts_Ca/main_m.g
//and extract_markov (below)
//
//
//ALGORITHM:
//	This function searches through all the compartments
//	in the current model (cellpath). For each compartment, it then
//	searches through all the elements in markovlib and determines
//	whether there are any ion channels in the current compartment
//	that can be replaced with their Markov equivalents. For the
//	channels it finds, it will add messages. 



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
		    
		    
		    // ////////////////////// ADD CUSTOM CODE HERE ////////////////////////
		    // This could be tweaks to add custom messages and settings for specific
		    // channel types. For example, for a calcium dependent K channel. Alternatively,
		    // you can run a custom script at this point specific to the channel name (akin
		    // to passing a function handle).
		    //
		    // if ( {originalchannel} == "K_AHP" )
			//	addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab_alpha INPUT Ca
			//	addmsg {el {curr_compt}/##[TYPE=Ca_concen]} {curr_compt}/{originalchannel}_m/tab_beta INPUT Ca
			// end
			//
		    // ////////////////////// END ADD CUSTOM CODE HERE ////////////////////		    
		    
			// Set the fields of the new channel to match those of the old channel	    
   			setfield {curr_compt}/{originalchannel}_m  \
			    Nt  {round {{getfield {curr_channel}_old {gbar_field}} /  \
			    {getfield {curr_compt}/{originalchannel}_m Gmax}}} \
			    Ek {getfield {curr_channel}_old Ek} 

			// Delete old channel
		    delete {curr_channel}_old
		    //deletemsg {curr_channel}_old 0 -outgoing
		    //disable {curr_channel}_old
		    
		    
		    // Reconnect new channel by adding appropriate messages
		    addmsg {curr_compt} {curr_compt}/{originalchannel}_m VOLTAGE Vm
		    addmsg {curr_compt}/{originalchannel}_m {curr_compt} CHANNEL Gk Ek

		end

	    end
    end
end

end



function extract_markov (source, dest)
//EXAMPLES:
//extract_markov /pyr_array/pyr[0] /pyr_array
//extract_markov /fb_array/fb[0] /fb_array
//extract_markov /fb_array/fb[1] /fb_array

str curr_loop

	if (!{exists {dest}})
		create neutral {dest}
	end

	convert_markov {source} "/library/markov"
	move {source} {dest}


end

