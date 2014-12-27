

function spike_synapse (source, dest)
// OVERVIEW
// Creates a connection between source and dest, a standard deterministic synapse. Can pass this function
// to volumeconnect_general as the input_function_name to cause it to behave as the standard volumeconnect command.
//
// EXAMPLES
// see exampleScripts_Syn/connections_m_general.g

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
