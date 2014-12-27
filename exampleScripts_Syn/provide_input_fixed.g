// genesis 2.2
// Kerstin Menne
// Medical University of Luebeck, 02.10.2001
//      
// build randomspike elements and connect them to network cells

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

//==================================================================
// connections
//==================================================================

// excitations from afferents to pyramidal cells
// AMPA channels

randseed 54321
volumeconnect {aff_input_array_name}{aff_input_name}[] \
	      {pyr_array_name}{pyr_cell_name}[]/bas3_#/AMPA,{pyr_array_name}{pyr_cell_name}[]/ap5#/AMPA,{pyr_array_name}{pyr_cell_name}[]/ap6_#/AMPA \
 	      -relative \
	      -sourcemask box -1 -1 -1 1 1 1 \ // all afferents 
	      -destmask box \
		{aff2pyr_x1} {aff2pyr_y1} {aff2pyr_z1} \
		{aff2pyr_x2} {aff2pyr_y2} {aff2pyr_z2} \
	      -probability {p_aff2pyr_AMPA}

// NMDA channels

randseed 54321 // using of the same seed ensures, that AMPA and NMDA channels
	       // of the same compartments are selected
volumeconnect {aff_input_array_name}{aff_input_name}[] \
	      {pyr_array_name}{pyr_cell_name}[]/bas3_#/NMDA,{pyr_array_name}{pyr_cell_name}[]/ap5#/NMDA,{pyr_array_name}{pyr_cell_name}[]/ap6_#/NMDA \
 	      -relative \
	      -sourcemask box -1 -1 -1 1 1 1 \ // all afferents 
	      -destmask box \
		{aff2pyr_x1} {aff2pyr_y1} {aff2pyr_z1} \
		{aff2pyr_x2} {aff2pyr_y2} {aff2pyr_z2} \
	      -probability {p_aff2pyr_NMDA}




//=====================================================================

// excitation from afferents to ff interneurons
volumeconnect {aff_input_array_name}{aff_input_name}[] \
	      {ff_array_name}{ff_cell_name}[]/ap7_#/AMPA,{ff_array_name}{ff_cell_name}[]/ap8_#/AMPA,{ff_array_name}{ff_cell_name}[]/ap9_#/AMPA \
 	      -relative \
	      -sourcemask box -1 -1 -1 1 1 1 \ // all afferents 
	      -destmask box \
		{aff2ff_x1} {aff2ff_y1} {aff2ff_z1} \
		{aff2ff_x2} {aff2ff_y2} {aff2ff_z2} \
	      -probability {p_aff2ff_AMPA}

// delay for excitation from afferents
volumedelay {aff_input_array_name}{aff_input_name}[] \
		-radial {cond_vel_aff_ax} \
	        -uniform {rand_delay_aff_ax}

// synaptic weights for synapses with afferents on presynaptic site
volumeweight {aff_input_array_name}{aff_input_name}[] \
	-fixed {from_aff_weight} \
	-uniform {rand_from_aff_weight}



