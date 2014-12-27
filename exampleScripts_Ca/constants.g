// genesis 2.2
// Kerstin Menne
// Medical University of Luebeck, 10.05.2001
//
// file defining all global constants 

//=====================================================================
// equilibrium potentials and other important information for channels
//=====================================================================

float EREST_ACT = -0.060 // Volts; resting membrane potential; gets randomized
			 // and is therefore slightly different for different
			 // cells
float ENA = 0.115 + EREST_ACT // 0.055 // Na equilibrium potential
float pyr_EK = -0.015 + EREST_ACT // -0.075; K equilibrium potential for
			          // pyramidal cells			
float int_EK = -0.025 + EREST_ACT // -0.085; K equilibrium potential for
			          // interneurons
float ECA = 0.140 + EREST_ACT // 0.080; Ca equilibrium potential 

float Q10_synapse =  1.0 //  3.0

float E_GABAA = -0.075 // Volt    
float G_GABAA = 1   // Siemens*m^-2
float E_NMDA = 0.0     // equilibrium potentials and gmax-values for 
float G_NMDA =  1    // synchan elements
float E_AMPA = 0.0 	// maximum conductance of synchan elements is defined
float G_AMPA = 1    //   by values in cell descriptor files
float E_GABAB = -0.080
float G_GABAB = 1     // 20


float GABAA_frequency = 0 //  provides input for synchan elements in case
float GABAB_frequency = 0 // 
float AMPA_frequency = 0  //  there are no incoming SPIKE messages
float NMDA_frequency = 0 //   at the moment not used


// all other relevant constants for the cells are defined by means of the cell
// descriptor files

//===========================================================
// cell and network names
//==========================================================

str pyr_cell_name = "/pyr"
str pyr_array_name = "/pyr_array" // array of pyramidal cells

str fb_cell_name = "/fb"
str fb_array_name = "/fb_array" // array of fb interneurons

str ff_cell_name = "/ff"
str ff_array_name = "/ff_array" // array of ff interneurons

str aff_input_name = "/aff" // randomspike object
str aff_input_array_name = "/aff_array" // array for afferent input

//============================================================
// network dimensions
//==========================================================

int pyr_nx = 6 // number of pyramidal cells along x-axis
int pyr_ny = 12 // number of pyramidal cells along y-axis
int n_of_pyr // number of pyramidal cells in array    
n_of_pyr = {pyr_nx}*{pyr_ny} 
float pyr_dx = 40e-6 // distance between pyramidal cells in x-dimension
float pyr_dy = 40e-6 // distance between pyramidal cells in y-dimension
float pyr_origin_x = 0 // x-coordinate for first element in network
float pyr_origin_y = 0 // y-coordinate for first element in network

int fb_nx = 3 // number of feedback interneurons along x-axis
int fb_ny = 3 // 3 number of feedback interneurons along y-axis
int n_of_fb // number of feedback interneurons in array    
n_of_fb = {fb_nx}*{fb_ny} 
float fb_dx = 80e-6 // distance between fb interneurons in x-dimension
float fb_dy = 160e-6 // 60 distance between fb interneurons in y-dimension
float fb_origin_x = 20e-6 // x-coordinate for first element in network
float fb_origin_y = 20e-6 // y-coordinate for first element in network
 
int ff_nx = 3 // number of feedforward interneurons along x-axis
int ff_ny = 3 // 3 number of feedforward interneurons along y-axis
int n_of_ff // number of feedforward interneurons in array    
n_of_ff = {ff_nx}*{ff_ny} 
float ff_dx = 80e-6 // distance between ff interneurons in x-dimension
float ff_dy = 160e-6 // 60 distance between ff interneurons in y-dimension
float ff_origin_x = 20e-6 // x-coordinate for first element in network
float ff_origin_y = 100e-6 // y-coordinate for first element in network

int aff_nx = 4 // number of randomspike elements along x-axis
int aff_ny = 8 // number of randomspike elements along y-axis
int n_of_aff // number of randomspike elements in array    
n_of_aff = {aff_nx}*{aff_ny} 
float aff_dx = 60e-6 // distance between randomspike elements in x-dimension
float aff_dy = 60e-6 // distance between randomspike elements in y-dimension
float aff_origin_x = 0 // x-coordinate for first element in network
float aff_origin_y = 0 // y-coordinate for first element in network


//===================================================================
// x1,y1,z1, x2,y2,z2 for destination mask of volumeconnect
//==================================================================

float aff2pyr_x1 = -1 // meter
float aff2pyr_y1 = -1 // employment of this huge number ensures, that 
float aff2pyr_z1 = -1 // connections are made from each element in the
float aff2pyr_x2 = 1  // source region to each element in the destination
float aff2pyr_y2 = 1  // region; afferents can have contacts to 
float aff2pyr_z2 = 1  // pyramidal cells everywhere in the network

float aff2ff_x1 = -1 // meter
float aff2ff_y1 = -1 // afferents can have contacts to ff interneurons
float aff2ff_z1 = -1 // everywhere in the network
float aff2ff_x2 = 1  // 
float aff2ff_y2 = 1  //   
float aff2ff_z2 = 1  // 

float pyr2pyr_x1 = -1 // meter
float pyr2pyr_y1 = -1 // employment of this huge number ensures, that 
float pyr2pyr_z1 = -1 // connections are made from each element in the
float pyr2pyr_x2 = 1  // source region to each element in the destination
float pyr2pyr_y2 = 1  // region; pyramidal cells can have contacts to other
float pyr2pyr_z2 = 1  // pyramidal cell everywhere in the network

float pyr2fb_x1 = -1  // pyramidal cells contact fb interneurons everywhere
float pyr2fb_y1 = -1  // in the network
float pyr2fb_z1 = -1
float pyr2fb_x2 = 1
float pyr2fb_y2 = 1
float pyr2fb_z2 = 1

float fb2pyr_x1 = 0   // interneurons are only allowed to contact pyramidal
float fb2pyr_y1 = 0   // cells within a distance of 500microns from the
float fb2pyr_z1 = 0   // respective interneuron; since relative positions 
float fb2pyr_x2 = 1000e-6 // and elipsoidal sourcemask are used, 0,0,0 gives 
float fb2pyr_y2 = 1000e-6 // the position of the interneuron(center of ellipse)
float fb2pyr_z2 = 1000e-6 // x2,y2,z2 specify lengthes of the axis

float ff2pyr_x1 = 0   // this simulation is so small, that still each pyramidal
float ff2pyr_y1 = 0   // is reached
float ff2pyr_z1 = 0
float ff2pyr_x2 = 1000e-6
float ff2pyr_y2 = 1000e-6
float ff2pyr_z2 = 1000e-6


//===================================================================
// connection probabilities
//===================================================================

float aff2pyr_AMPA_targets = 7 // number of potential target synchan elements
				// on a postsynaptic pyramidal cells; level
				// 3,5,6
float n_aff2pyr_AMPA = 48 // each pyramidal cell shall approximately receive
                       // input to n_aff2pyr_AMPA channels; pyramidal cells
		       // receive more recurrent excitation than excitation
		       // from afferents
float p_aff2pyr_AMPA = {n_aff2pyr_AMPA}/({n_of_aff}*{aff2pyr_AMPA_targets})
			// 0.21 

float aff2pyr_NMDA_targets = 7 // number of potential target synchan elements
				// on a postsynaptic pyramidal cells
float n_aff2pyr_NMDA = 48 // each pyramidal cell shall approximately receive
                       // input to n_pyr2pyr_NMDA channels; pyramidal cells
		       // receive more recurrent excitation than excitation
		       // from afferents
float p_aff2pyr_NMDA = {n_aff2pyr_NMDA}/({n_of_aff}*{aff2pyr_NMDA_targets})
			// 0.1
 
float aff2ff_AMPA_targets = 16 // level 7-9
float n_aff2ff_AMPA = 20 // 
float p_aff2ff_AMPA = {n_aff2ff_AMPA}/({n_of_aff}*{aff2ff_AMPA_targets})
 			// 0.04

float pyr2pyr_AMPA_targets = 20 // number of potential target synchan elements
				// on postsynaptic pyramidal cells
float n_pyr2pyr_AMPA = 70 // each pyramidal cell shall approximately receive
                       // input to n_pyr2pyr_AMPA channels 
float p_pyr2pyr_AMPA = {n_pyr2pyr_AMPA}/({n_of_pyr}*{pyr2pyr_AMPA_targets})
			// 0.049

float pyr2pyr_NMDA_targets = 20 // level 2 and 8-10
float n_pyr2pyr_NMDA = 70
float p_pyr2pyr_NMDA = {n_pyr2pyr_NMDA}/({n_of_pyr}*{pyr2pyr_NMDA_targets})
			// 0.049

float pyr2fb_AMPA_targets = 18 // level 1,2 and 6-8
float n_pyr2fb_AMPA = 60
float p_pyr2fb_AMPA = {n_pyr2fb_AMPA}/({n_of_pyr}*{pyr2fb_AMPA_targets})
			// 0.06

float fb2pyr_GABA_A_targets = 6 // level 3-5
float n_fb2pyr_GABA_A = 35
float p_fb2pyr_GABA_A = {n_fb2pyr_GABA_A}/({n_of_fb}*{fb2pyr_GABA_A_targets})
			// 0.65

float ff2pyr_GABA_B_targets = 8 // level 1 and 9,10
float n_ff2pyr_GABA_B = 7
float p_ff2pyr_GABA_B = {n_ff2pyr_GABA_B}/({n_of_ff}*{ff2pyr_GABA_B_targets})
			// 0.097

//=================================================================
// conduction velocities and percentage of randomization for delay
//=================================================================

float cond_vel_pyr_ax = 0.5 // m*s^-1; pyramidal cell axons are supposed to be
		            // myelinated
float cond_vel_fb_ax = 0.2  // unmyelinated
float cond_vel_ff_ax = 0.2  // unmyelinated
float cond_vel_aff_ax = 0.2  // mossy fibers are unmyelinated (Shepherd)

float rand_delay_pyr_ax = 0.15 // calculated delay +/- upto 15%
float rand_delay_fb_ax = 0.15
float rand_delay_ff_ax = 0.15
float rand_delay_aff_ax = 0.15


//================================================
// synaptic weights used in volumeweight-function
//===============================================

float from_aff_weight = 1 // gmax defined by values in cell descriptor files
float from_pyr_weight = 1 // pyramidal cell on presynaptic site
float from_fb_weight = 1  // fb interneuron on presynaptic site
float from_ff_weight = 1  // ff interneuron on presynaptic site

float rand_from_aff_weight = 0.15 // calculated weight +/- up to 15%
float rand_from_pyr_weight = 0.15
float rand_from_fb_weight = 0.15
float rand_from_ff_weight = 0.15


//==============================================================
// spike generator and randomspike parameters
//==============================================================

float int_thresh = 0 // V; threshold for interneuronal spike-generator
float int_refract = 0.001 // sec; refractory-period
float int_amplitude = 1

float pyr_thresh = 0 // V; amplitude of spikes in axonal compartment is crucial
float pyr_refract = 0.001 // sec
float pyr_amplitude = 1

float aff_min_amp = 1 // parameters for randomspike
float aff_max_amp = 1 // all spikes have unit amplitude
float aff_rate = 40 // spikes per second
float aff_abs_refract = 0.007 

 


//====================================================================
// simulation parameter
//====================================================================

float dt = 2.5e-5             //  simulation time step in sec 
setclock  0  {dt}             // set the simulation clock
setclock 1 {dt}            // used for graphical outputs


//====================================================================
// hines solver
//====================================================================

int chanmode = 1 


