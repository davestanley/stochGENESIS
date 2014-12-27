// genesis 2.2
// Kerstin Menne
// Medical University of Luebeck, 23.10.2001
//
// cell parameter file for the 1994 Traub CA3 hippocampal cell
// synaptically activated channels added
// distribution of synapses orientated on
// Cellular mechanisms of 4-aminopyridine-induced synchronized after-
// discharge in the rat hippocampal slice, Traub et al., 1995, Journal of
// Physiology, 489.1, pp.127-140

*cartesian
*relative     
*asymmetric

*set_compt_param RM 5.0		// ohm*m^2
*set_compt_param RA 2.0		// ohm*m
*set_compt_param CM 0.0075      // F/m^2

     
// The format for each compartment parameter line is :
// name  parent  x       y       z       d       ch      dens ...
// For channels, "dens" =  maximum conductance per unit area of compartment

// The compartment numbering corresponds to that in the paper, with soma = 4

*spherical
//   soma	none	     0    0   25.5  30.0  Ca_concs -24.0e12 Na 1000 Ca 10 K_DR 1350 K_AHPs 8 K_Cs 200 K_A 5 GABA_A -0.67e-9 AMPA -0.55e-9 NMDA -0.736e-9 

   soma	none	     0    0   25.5  30.0  Na 1000 K_DR 1350
