// genesis 2.3
// requires objects GENgap
//
//
// establishs gap junction connections



function det_gap (source, dest)			//Standard deterministic gap junction connection
	float avg_conductance
	str src_cmpt = {el {source}/..}
	str dest_cmpt = {el {dest}/..}

	avg_conductance = {{getfield {source} gmax} + {getfield {dest} gmax}} / 2
	
	addmsg {src_cmpt} {dest_cmpt} CHANNEL {avg_conductance} Vm
	addmsg {dest_cmpt} {src_cmpt} CHANNEL {avg_conductance} Vm

end


function markov_gap (source, dest)			//Stochastic gap junction connection
	str markov_lib = "/library/gap"
	str markov_name = "GAP_m"

	float avg_conductance
	str src_cmpt = {el {source}/..}
	str dest_cmpt = {el {dest}/..}

	avg_conductance = {{getfield {source} gmax} + {getfield {dest} gmax}} / 2

	if ( {exists {markov_lib}/{markov_name}} )

		copy {markov_lib}/{markov_name} {src_cmpt}

		setfield {src_cmpt}/{markov_name} Nt {avg_conductance / {getfield {src_cmpt}/{markov_name} Gmax}}

		addmsg {src_cmpt} {src_cmpt}/{markov_name} VOLTAGE1 Vm
		addmsg {dest_cmpt} {src_cmpt}/{markov_name} VOLTAGE2 Vm
		addmsg {src_cmpt}/{markov_name} {src_cmpt} CHANNEL Gk Vk2
		addmsg {src_cmpt}/{markov_name} {dest_cmpt} CHANNEL Gk Vk

	else
		echo Markovian gap junction {markov_name} not found in {markov_lib}
	end

end


//==================================================================
// connections
//==================================================================

include gapconnect_general.g


//Test!
gapconnect_general /fb_array/fb[]/ /fb_array/fb[]/ GAP_dummy 2 markov_gap // 2 junctions per cell

//markov_gap /fb_array/fb/ap9_4/GAP_dummy /fb_array/fb[1]/ap9_6/GAP_dummy
//markov_gap /fb_array/fb/ap8_5/GAP_dummy /fb_array/fb[1]/ap9_1/GAP_dummy


//callfunc markov_gap /fb_array/fb[1]/ap9_1/GAP_dummy /fb_array/fb/ap9_1/GAP_dummy
//callfunc markov_gap /fb_array/fb[1]/ap9_2/GAP_dummy /fb_array/fb/ap9_4/GAP_dummy

//callfunc markov_gap /fb_array/fb[1]/ap8_1/GAP_dummy /fb_array/fb/ap9_6/GAP_dummy
//callfunc markov_gap /fb_array/fb[1]/ap9_5/GAP_dummy /fb_array/fb/ap9_4/GAP_dummy



