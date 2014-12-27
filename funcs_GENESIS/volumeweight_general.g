
function volumeweight_general (src, dest, fixed, uniform)
// Input: same as volumeweight, but for Markov synapses
//
// EXAMPLE:
//See exampleScripts_Syn/connections_m_general.g for example code.
//


	str curr_src
	str curr_dest
	str dest_list
	int i
	int num_msg
	float final_weight


	//First, apply weightings to all standard synapses
	foreach curr_src ({el {src}})
		if ( {exists {curr_src} inject} )		// Source is a compartment. Therefore, look @ sub compartment
			volumeweight {curr_src}/##[TYPE=spikegen] {dest} -fixed {fixed} -uniform {uniform}
		elif ( {exists {curr_src} state} )	// Source is a randomspike element
			volumeweight {curr_src} {dest} -fixed {fixed} -uniform {uniform}
		end
	end

	foreach curr_src ({el {src}})	//Look through the outgoing messages of each source element
		num_msg = {getmsg {curr_src} -count -outgoing}
		for (i=0;i<{num_msg};i=i+1)
			curr_dest = {getmsg {curr_src} -outgoing -destination {i}}
			if ( {exists {curr_dest}/.. Nt} )	//Make sure it's a markov element
				foreach dest_list ({el {dest}})
					if ({el {curr_dest}/../..} == {el {dest_list}/..}) //Make sure it's in the destination list
						final_weight = { {fixed} + {rand -{uniform} {uniform}} }
						//echo setfield {curr_dest}/.. Nt {getfield {curr_dest}/.. Nt} * {final_weight}
						setfield {curr_dest}/.. Nt {{getfield {curr_dest}/.. Nt} * {final_weight}}

					end
				end
			end
		end
	end
end

