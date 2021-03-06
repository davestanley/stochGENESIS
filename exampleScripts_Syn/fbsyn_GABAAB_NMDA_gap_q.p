// genesis 2.2
// Kerstin Menne
// Medical University of Luebeck, 23.10.2001
//
// cell descriptor file for feedback inhibitory interneurons with input from 
// pyramidal cells; incorporation of synaptically activated channels
//
// data taken from: Pyramidal Cell-to-Inhibitory Cell Spike Transduction
// Explicable by Active Dendritic Conductances in Inhibitory Cell; R.D.Traub,
// R. Miles; (1995) Journal of Computational Neuroscience, 2, 291-298
// information about synapses from:
// Cellular mechanisms of 4-aminopyridine-induced synchronized after-
// discharge in the rat hippocampal slice, Traub et al., 1995, Journal of
// Physiology, 489.1, pp.127-140 
// and
// On the Mechanisms of the gamma->beta Frequency Shift in Neuronal 
// Oscillations Induced in Rat Hippocampal Slices by Tetanic Stimulation
// Traub et al, 1999, The Journal of Neuroscience, 19(3), pp. 1088-1105

*cartesian
// use cartesian coordinates
*relative	
// coordinates are relative to each other
*asymmetric
// use asymmetric compartments

*set_compt_param RM 5.0
// ohm*m^-2
*set_compt_param RA 2.0
// ohm*m^-1
*set_compt_param CM 0.0075
// F/m^-2
//*****************************************I commented out the ELEAK parameter
//*set_compt_param ELEAK -0.06
// V

// The format for each compartment parameter line is :
// name  parent  x       y       z       diameter       [channel      dens]
// For channels, "dens" =  maximum conductance per unit area of compartment

// The compartment numbering corresponds to that in the paper, with soma = 4

*spherical
//soma is a sphere (in paper: cylinder); radius adjusted to have
//same area

soma	none	0	0	20	17.4   Ca_concsi -24.0e12   Na 0   Ca 10   K_DRi 1350   K_AHPsi 0.1   K_Csi 200   K_Ai 5 GABA_A -0.67e-9 				

*cylindrical
//axon segments and dendrites are cylindrical; dendrites without
//spines -> no changes in RM and CM
ap5_1	soma	-50	0	0	3.00   Ca_conc -18.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   GABA_A -0.67e-9

ap5_2	soma	-45.83	0	20	3.00   Ca_conc -18.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5  GABA_A -0.67e-9 

ap5_3	soma	-41.5	0	27.89	3.00   Ca_conc -18.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   GABA_A -0.67e-9

ap5_4	soma	0	41.5	27.89	3.00   Ca_conc -18.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   GABA_A -0.67e-9

ap5_5	soma	0	45.83	20	3.00   Ca_conc -18.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   GABA_A -0.67e-9

ap5_6	soma	0	50	0	3.00   Ca_conc -18.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   GABA_A -0.67e-9


ap6_1	ap5_3	-50	0	0	1.88   Ca_conc -29.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   AMPA -2.0e-9 NMDA -0.20e-9

ap6_2	ap5_4	0	50	0	1.88   Ca_conc -29.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   AMPA -2.0e-9 NMDA -0.20e-9

ap6_3	ap5_5	0	50	0	1.88   Ca_conc -29.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   AMPA -2.0e-9 NMDA -0.20e-9

ap6_4	ap5_6	0	50	0	1.88   Ca_conc -29.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 80   K_Ai 5   AMPA -2.0e-9 NMDA -0.20e-9


ap7_1	ap6_1	-50	0	0	1.88   Ca_conc -37.0e12    Na 0    Ca 10   K_DRi 500    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9

ap7_2	ap6_2	0	50	0	1.88   Ca_conc -37.0e12    Na 0    Ca 10   K_DRi 500    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9

ap7_3	ap6_3	0	50	0	1.20   Ca_conc -37.0e12    Na 0    Ca 10   K_DRi 500    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9

ap7_4	ap6_3	-48	0	14	1.20   Ca_conc -37.0e12    Na 0    Ca 10   K_DRi 500    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9

ap7_5	ap6_4	0	50	0	1.88   Ca_conc -37.0e12    Na 0    Ca 10   K_DRi 500    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9


ap8_1	ap7_1	-49.5	0	7.05	1.88   Ca_conc -13.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GAP_dummy -0.00666666667e-6

ap8_2	ap7_2	0	49.5	7.05	1.88   Ca_conc -13.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GAP_dummy -0.00666666667e-6

ap8_3	ap7_3	0	50	0	1.20   Ca_conc -13.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GAP_dummy -0.00666666667e-6

ap8_4	ap7_4	-48	0	14	1.20   Ca_conc -13.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GAP_dummy -0.00666666667e-6

ap8_5	ap7_5	0	50	0	1.88   Ca_conc -13.0e12    Na 0    Ca 10   K_DRi 250    K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GAP_dummy -0.00666666667e-6

// Traub says GABA_B should range from 0 to 3.0e-9 nS
ap9_1	ap8_1	-49.5	0	7.05	1.88   Ca_conc -16.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GABA_B -1e-9 GAP_dummy -0.00666666667e-6 

ap9_2	ap8_2	0	49.5	7.05	1.88   Ca_conc -16.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GABA_B -1e-9 GAP_dummy -0.00666666667e-6

ap9_3	ap8_3	-45.83	0	20	0.76   Ca_conc -16.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GABA_B -1e-9 GAP_dummy -0.00666666667e-6 

ap9_4	ap8_3	0	50	0	0.76   Ca_conc -16.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GABA_B -1e-9 GAP_dummy -0.00666666667e-6 

ap9_5	ap8_4	-48	0	14	1.20   Ca_conc -16.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GABA_B -1e-9 GAP_dummy -0.00666666667e-6 

ap9_6	ap8_5	0	50	0	1.88   Ca_conc -16.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9 GABA_B -1e-9 GAP_dummy -0.00666666667e-6 


ap10_1	ap9_1	-45.83	0	20	1.20   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9

ap10_2	ap9_1	0	45.83	20	1.20   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9

ap10_3	ap9_2	0	49.5	7.05	1.88   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9

ap10_4	ap9_3	-50	0	0	0.76   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9

ap10_5	ap9_4	0	48	14	0.76   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9

ap10_6	ap9_5	-48	0	14	1.20   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9

ap10_7	ap9_6	0	50	0	1.88   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 GABA_B -1e-9



ap11_1	ap10_1	-50	0	0	1.20   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

ap11_2	ap10_2	0	50	0	1.20   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

ap11_3	ap10_3	0	49.5	7.05	1.88   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

ap11_4	ap10_4	-50	0	0	0.76   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

ap11_5	ap10_5	0	48	14	0.76   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

ap11_6	ap10_6	-48	0	14	1.20   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

ap11_7	ap10_7	0	50	0	1.88   Ca_conc -25.0e12    Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 

bas3	soma	0	0	-50	3.00   Ca_conc -123.0e12   Na 0     Ca 10   K_DRi 150    K_AHPi 0.1   K_Ci 80   K_Ai 5 GABA_A -0.67e-9


bas2_1	bas3	45.83	0	-20	1.88   Ca_conc -164.0e12   Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 5 AMPA -2.0e-9 NMDA -0.20e-9

bas2_2	bas3	0	-45.83	-20	1.88   Ca_conc -164.0e12   Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 5 AMPA -2.0e-9 NMDA -0.20e-9


bas1_1	bas2_1	0	-45.83	-20	1.20   Ca_conc -148.0e12   Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9	

bas1_2	bas2_1	0	45.83	-20	1.20   Ca_conc -148.0e12   Na 0      Ca 10   K_DRi 0      K_AHPi 0.1   K_Ci 40   K_Ai 0 AMPA -2.0e-9 NMDA -0.20e-9

// for the axonal compartments, RM and RA have different values
*set_compt_param RM 0.1
//ohm*m^-2
*set_compt_param RA 1.0
//ohm*m^-1
axonIS	soma	-75	0	0	2.00   Na 0  K_DRAi 2500   

ax	axonIS	0	-75	0	1.00   Na 0  K_DRAi 2500    spikegen 0
// in the case of the spike-generator spikegen "0"V  is the threshold
  
  







