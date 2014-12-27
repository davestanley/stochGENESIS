// Test connections

	// feedback inhibition amongst interneurons cells
	str src_fb_array_name = {fb_array_name}
	str src_fb_cell_name = {fb_cell_name}
	str dest_pyr_array_name = {fb_array_name}
	str dest_pyr_cell_name = {fb_cell_name}

	str synapsetype = "spike_synapse"
	str synapsetype = "markov_synapse"
	volumeconnect_general {src_fb_array_name}{src_fb_cell_name}[]/ax \
		      {dest_pyr_array_name}{dest_pyr_cell_name}[]/bas3#/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/bas2_#/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/soma/GABA_A,{dest_pyr_array_name}{dest_pyr_cell_name}[]/ap5_#/GABA_A 1 \ //relative
			0 -1 -1 -1 1 1 1 \ // rectangular all pyramidal cells 
			1 {fb2pyr_x1} {fb2pyr_y1} {fb2pyr_z1} \ //ellipsoid
			{fb2pyr_x2} {fb2pyr_y2} {fb2pyr_z2} \
			{p_fb2fb_GABA_A} {synapsetype}









