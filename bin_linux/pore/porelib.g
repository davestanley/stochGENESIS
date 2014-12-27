//genesis
//
// $Id: porelib.g,v 1.1.1.1 2005/06/14 04:38:28 svitak Exp $
// $Log: porelib.g,v $
// Revision 1.1.1.1  2005/06/14 04:38:28  svitak
// Import from snapshot of CalTech CVS tree of June 8, 2005
//
// Revision 1.1  1992/12/11 19:03:54  dhb
// Initial revision
//

//genesis

//*************************************************************************
//Adam Franklin Strassberg
//March 15, 1991
//strass@cns.caltech.edu
//
//Ion Pore Populations represented through Markov Processes
//
//Strassberg and DeFelice, 1992, Neural Computation (in Press)
//Strassberg and DeFelice, 1992, CNS Memo
//*************************************************************************

//*************************************************************************
//Sodium Pore Population Object Type
object	Napores2	Na_pore_type2	NaPorePop2	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
		-author			"Adam Strassberg" \
		-description		"Sodium pore population represented through eight state Markov kinetic scheme (see Strassberg and DeFelice, 1992)."
//*************************************************************************

//*************************************************************************
//Potassium Pore Population Object Type
object	Kpores2	K_pore_type2	KPorePop2	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
		-author			"Adam Strassberg" \
		-description		"Potassium pore population represented through five state Markov kinetic scheme (see Strassberg and DeFelice, 1992)."
//*************************************************************************

//*************************************************************************
//GENERAL Synaptic Pore Population Object Type
object	GENsynpores	GENsyn_pore_type	GENsynPorePop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
					TRANSMITTER 1 	1 T \
		-author			"David Stanley" \
		-description		"GENERAL synaptic pore population represented through a 5x2 state Markov kinetic scheme (see Koch, Methods in Neuronal Modeling, 2nd Edition). T=transmitter in units of mols"
//*************************************************************************

//*************************************************************************
//GENERAL Voltage Gated Pore Population Object Type
object	GENvgpores	GENvg_pore_type	GENvgPorePop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
		-author			"David Stanley" \
		-description		"GENERAL voltage gated pore population represented through a 5x2 state Markov kinetic scheme."
//*************************************************************************

//*************************************************************************
//GENERAL Tabchannel Population Object Type
object	GENtabchan	GEN_tabchan_type	GENtabchanPop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		MALPHA	0	1	malpha	\
					MBETA	1	1	mbeta	\
					HALPHA	2	1	halpha	\
					HBETA	3	1	hbeta	\
					CA_BINDING_SCALING	4	1	Ca_binding_scaling	\
					VOLTAGE	5	1	Vm	\
		-author			"David Stanley" \
		-description		"GENERAL voltage gated pore population represented through a 5x2 state Markov kinetic \
		scheme. Alpha/beta rates are sent as messages from tables."
//*************************************************************************

//*************************************************************************
//GENERAL GABA_B Object: G-Protein Only + (K_pore output is approximated assuming instantaneous dynamics)
object	GENGprotein	GEN_GPROTEIN_type	GENGproteinPop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
					TRANSMITTER 1 	1 T \
		-author			"David Stanley" \
		-description		"Markov pore to simulate GABA_B G-protein (see Koch, Methods in Neuronal Modeling, 2nd Edition). T=[Receptor] Normalized 0..1"
//*************************************************************************

//*************************************************************************
//GENERAL Rectifying Gap Junction Population Object Type
object	GENgap	GEN_gap_type	GENgapPop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE1 0	1 Vm1 \
		-messages		VOLTAGE2 1	1 Vm2 \
		-author			"David Stanley" \
		-description		"Voltage gated gap junction population"
//*************************************************************************


//*************************************************************************
//Logistic function object (an alternative to sigmoidal)

object	logistic	logistic_type	LogisticEvent	buffer 	segment \
		-actions		PROCESS RESET *COPY BufferCopy *CREATE BufferCreate \
		-fields			thresh amplitude input state gain \
		-messages		INPUT	0	1 input \
		-messages		THRESH	1	1 thresh \
		-messages		GAIN	2	1 gain \
		-messages		AMPLITUDE	3	1 amplitude \
		-author			"David Stanley" \
		-description		"Logistic function - basically the same as sigmoidal function, except is of the form (amplitude * 1/(1+exp(gain*(input-thresh)/2)))."
//*************************************************************************


//*************************************************************************
//Voltage Gated Channel described in terms of Vhalf
object	GENVhalf	GENVhalf_type	GENVhalfPop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
		-author			"David Stanley" \
		-description		"GENERAL voltage gated pore population represented through a 5x2 state Markov kinetic scheme."
//*************************************************************************


//*************************************************************************
//3D general markov chain (used for channels with nonstationary gating)
object	GENsynpores3D	GENsyn_pore3D_type	GENsynPore3DPop	segment \
		-actions		INIT PROCESS RESET CHECK \
		-messages		VOLTAGE 0	1 Vm \
					TRANSMITTER 1 	1 T \
		-author			"David Stanley" \
		-description		"GENERAL synaptic pore population represented through a 5x2 state Markov kinetic scheme (see Koch, Methods in Neuronal Modeling, 2nd Edition). T=transmitter in units of mols"
//*************************************************************************


