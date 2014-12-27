
// Contains markov equivalents of the major Traub pyramidal and interneuron
// channels.

// For pyramidal cells, the strongest channels are (in order
//
//
//

float onepS = 1e-12


//========================================================================
//========================================================================
//                Na Hippocampal
//========================================================================
//========================================================================
function make_Na_m
        if (({exists Na_m}))
                return
	end

        create GENvgpores Na_m

                setfield ^ Ek {ENA} Ik 0 Gk 0 Nt 10 Gmax {20.0*{onepS}}

        setfield Na_m malpha_A {320e3*(0.0131 + EREST_ACT)} malpha_B -320e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0131 + EREST_ACT)} malpha_F -0.004  \
            mbeta_A {-280e3*(0.0401 + EREST_ACT)} mbeta_B 280e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0401 + EREST_ACT)} mbeta_F 5.0e-3

        setfield Na_m halpha_A 128.0 halpha_B 0.0 halpha_C 0.0 halpha_D {-1.0*(0.017 + EREST_ACT)}  \
            halpha_F 0.018 hbeta_A 4.0e3 hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.040 + EREST_ACT)} hbeta_F -5.0e-3 \
	    num_Xgate 2 num_Ygate 1

	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield Na_m originalchannel
	setfield Na_m originalchannel Na

end

function make_Na_axon_m
        if (({exists NaA_m}))
                return
	end

        create GENvgpores NaA_m

                setfield ^ Ek {ENA} Ik 0 Gk 0 Nt 10 Gmax {20.0*{onepS}}

        setfield NaA_m malpha_A {800e3*(0.0172 + EREST_ACT)} malpha_B -800e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0172 + EREST_ACT)} malpha_F -0.004  \
            mbeta_A {-700e3*(0.0422 + EREST_ACT)} mbeta_B 700e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0422 + EREST_ACT)} mbeta_F 5.0e-3

        setfield NaA_m halpha_A 320.0 halpha_B 0.0 halpha_C 0.0 \
		halpha_D {-1.0*(0.042 + EREST_ACT)} halpha_F 0.018 \
		hbeta_A 10.0e3 hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.042 + EREST_ACT)} \
		hbeta_F -5.0e-3 \
		num_Xgate 3 num_Ygate 1

	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield NaA_m originalchannel
	setfield NaA_m originalchannel NaA

end

	// Make a sodium channel with 3 gates, but with same rate constants as in soma
function make_Na_axon_m_active
        if (({exists NaA_m}))
                delete NaA_m		//Kill the old channel, we want action!
	end

        create GENvgpores NaA_m

                setfield ^ Ek {ENA} Ik 0 Gk 0 Nt 10 Gmax {20.0*{onepS}}

        setfield NaA_m malpha_A {320e3*(0.0131 + EREST_ACT)} malpha_B -320e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0131 + EREST_ACT)} malpha_F -0.004  \
            mbeta_A {-280e3*(0.0401 + EREST_ACT)} mbeta_B 280e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0401 + EREST_ACT)} mbeta_F 5.0e-3

        setfield NaA_m halpha_A 128.0 halpha_B 0.0 halpha_C 0.0 halpha_D {-1.0*(0.017 + EREST_ACT)}  \
            halpha_F 0.018 hbeta_A 4.0e3 hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.040 + EREST_ACT)} hbeta_F -5.0e-3 \
	    num_Xgate 3 num_Ygate 1


	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield NaA_m originalchannel
	setfield NaA_m originalchannel NaA



	//also make a non-stochastic version of the active channel
        if (({exists ../NaA}))
                delete ../NaA
	end

        create tabchannel ../NaA
                //      V
                //      S
                //      A
                //      S
                setfield ^ Ek {ENA} Gbar 1 Ik 0 Gk 0 Xpower 3 \
                     Ypower 1 Zpower 0

        setupalpha ../NaA X {320e3*(0.0131 + EREST_ACT)} -320e3 -1.0  \
            {-1.0*(0.0131 + EREST_ACT)} -0.004  \
            {-280e3*(0.0401 + EREST_ACT)} 280e3 -1.0  \
            {-1.0*(0.0401 + EREST_ACT)} 5.0e-3

        setupalpha ../NaA Y 128.0 0.0 0.0 {-1.0*(0.017 + EREST_ACT)}  \
            0.018 4.0e3 0.0 1.0 {-1.0*(0.040 + EREST_ACT)} -5.0e-3

end



//========================================================================
//========================================================================
//                K_DR Hippocampal
//                	Pyramidal
//========================================================================
//========================================================================
function make_K_DR_m
        if (({exists K_DR_m}))
                return
        end

        create GENvgpores K_DR_m

                setfield ^ Ek {pyr_EK} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}

        setfield K_DR_m malpha_A {16e3*(0.0351 + EREST_ACT)} malpha_B -16e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0351 + EREST_ACT)} malpha_F -0.005 mbeta_A 250 mbeta_B 0.0 mbeta_C 0.0  \
            mbeta_D {-1.0*(0.02 + EREST_ACT)} mbeta_F 0.04 \
	    num_Xgate 2 num_Ygate 0


	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield K_DR_m originalchannel
	setfield K_DR_m originalchannel K_DR
end



function make_K_DR_axon_m
        if (({exists K_DRA_m}))
                return
        end

        create GENvgpores K_DRA_m

                setfield ^ Ek {pyr_EK} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}

        setfield K_DRA_m malpha_A {30e3*(0.0172 + EREST_ACT)} malpha_B -30e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0172 + EREST_ACT)} malpha_F -0.005 \
	    mbeta_A 450 mbeta_B 0.0 mbeta_C 0.0 mbeta_D {-1.0*(0.012 + EREST_ACT)} mbeta_F 0.04 \
	    num_Xgate 4



	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield K_DRA_m originalchannel
	setfield K_DRA_m originalchannel K_DRA
end

//========================================================================
//========================================================================
//                K_DRi Hippocampal
//                	Interneuron
// *In the case of interneurons we have a different equilibrium potential*
//========================================================================
//========================================================================
function make_K_DRi_m
        if (({exists K_DRi_m}))
                return
        end

        create GENvgpores K_DRi_m

                setfield ^ Ek {int_EK} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}

        setfield K_DRi_m malpha_A {16e3*(0.0351 + EREST_ACT)} malpha_B -16e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0351 + EREST_ACT)} malpha_F -0.005 mbeta_A 250 mbeta_B 0.0 mbeta_C 0.0  \
            mbeta_D {-1.0*(0.02 + EREST_ACT)} mbeta_F 0.04 \
	    num_Xgate 2 num_Ygate 0

	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield K_DRi_m originalchannel
	setfield K_DRi_m originalchannel K_DRi

end


function make_K_DR_axoni_m
        if (({exists K_DRAi_m}))
                return
        end

        create GENvgpores K_DRAi_m

                setfield ^ Ek {int_EK} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}

        setfield K_DRAi_m malpha_A {30e3*(0.0172 + EREST_ACT)} malpha_B -30e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0172 + EREST_ACT)} malpha_F -0.005 \
	    mbeta_A 450 mbeta_B 0.0 mbeta_C 0.0 mbeta_D {-1.0*(0.012 + EREST_ACT)} mbeta_F 0.04 \
	    num_Xgate 4



	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield K_DRAi_m originalchannel
	setfield K_DRAi_m originalchannel K_DRAi
end


//========================================================================
//                K_A Hippocampal
//                	Pyramidal
//========================================================================

function make_K_A_m
        if (({exists K_A_m}))
                return
        end

        create GENvgpores K_A_m
                setfield ^ Ek {pyr_EK} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}

        setfield K_A_m malpha_A {20e3*(0.0131 + EREST_ACT)} malpha_B -20e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0131 + EREST_ACT)} malpha_F -0.01  \
            mbeta_A {-17.5e3*(0.0401 + EREST_ACT)} mbeta_B 17.5e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0401 + EREST_ACT)} mbeta_F 0.01

        setfield K_A_m halpha_A 1.6 halpha_B 0.0 halpha_C 0.0 halpha_D {0.013 - EREST_ACT} halpha_F 0.018 hbeta_A 50.0  \
            hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.0101 + EREST_ACT)} hbeta_F -0.005 \
	    num_Xgate 1 num_Ygate 1

	addfield K_A_m originalchannel
	setfield K_A_m originalchannel K_A
end

//========================================================================
//                K_Ai Hippocampal
//                	Interneuron
// same channel for interneuron; different Ek
//========================================================================

function make_K_Ai_m
        if (({exists K_Ai_m}))
                return
        end

        create GENvgpores K_Ai_m
                setfield ^ Ek {int_EK} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}

        setfield K_Ai_m malpha_A {20e3*(0.0131 + EREST_ACT)} malpha_B -20e3 malpha_C -1.0  \
            malpha_D {-1.0*(0.0131 + EREST_ACT)} malpha_F -0.01  \
            mbeta_A {-17.5e3*(0.0401 + EREST_ACT)} mbeta_B 17.5e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0401 + EREST_ACT)} mbeta_F 0.01

        setfield K_Ai_m halpha_A 1.6 halpha_B 0.0 halpha_C 0.0 halpha_D {0.013 - EREST_ACT} halpha_F 0.018 hbeta_A 50.0  \
            hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.0101 + EREST_ACT)} hbeta_F -0.005 \
	    num_Xgate 1 num_Ygate 1

	addfield K_Ai_m originalchannel
	setfield K_Ai_m originalchannel K_Ai
end

//========================================================================
//                Ca Channel Hippocampal
//========================================================================

function make_Ca_m
        if (({exists Ca_m}))
                return
        end

        create GENvgpores Ca_m

                setfield ^ Ek {ECA} Ik 0 Gk 0 Nt 10 Gmax {25.0*{onepS}}

        setfield Ca_m malpha_A 1.6e3 malpha_B 0 malpha_C 1.0 malpha_D {-1.0*(0.065 + EREST_ACT)}  \
            malpha_F -0.01389 mbeta_A {-20e3*(0.0511 + EREST_ACT)} mbeta_B 20e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0511 + EREST_ACT)} mbeta_F 5.0e-3 \
	    num_Xgate 2 num_Ygate 0


	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield Ca_m originalchannel
	setfield Ca_m originalchannel Ca

end



//========================================================================
//  Ca-dependent K Channel - K(C) - (GENtabchan with table and tabgate)
//========================================================================
function make_K_C_m (location)

	str location
	int mode = 1	// mode = 0 for instantaneous Ca gating (default)
			// mode = 1 for dynamic Ca gating
	float scaling = 3000.0

	if (location == "1"); str KCname = "K_C"
	elif (location == "2"); str KCname = "K_Cs"
	elif (location == "3"); str KCname = "K_Ci"
	elif (location == "4"); str KCname = "K_Csi"
	end

        if (({exists {KCname}_m}))
                return
        end

        create GENtabchan {KCname}_m
                //      V
                //      S
                //      A
                //      S
		if ((location == "1") || (location == "2"))
	                setfield ^ Ek {pyr_EK} Nt 10 Gmax {180.0*{onepS}} Ik 0 Gk 0
		elif ((location == "3") || (location == "4"))
	                setfield ^ Ek {int_EK} Nt 10 Gmax {180.0*{onepS}} Ik 0 Gk 0
		end

        float xmin = 0.0
        float xmax = 1000.0
        int xdivs = 50
        if (!{exists {KCname}_m sendmsg1})
            addfield {KCname}_m sendmsg1
        end
	if (mode == 0)
		create table {KCname}_m/tab
		call {KCname}_m/tab TABCREATE {xdivs} {xmin} {xmax}
		int i
		float x, dx, y
		dx = (xmax - xmin)/xdivs
		x = xmin
		for (i = 0; i <= (xdivs); i = i + 1)
		    if (x < 250.0)
		        y = x/250.0
		    else
		        y = 1.0
		    end
		    setfield {KCname}_m/tab table->table[{i}] {y}
		    x = x + dx
		end
		setfield {KCname}_m/tab table->calc_mode 0
		call {KCname}_m/tab TABFILL 90000 0
		addmsg {KCname}_m/tab {KCname}_m CA_BINDING_SCALING output
        	//setfield  {KCname}_m sendmsg1 "../Ca_conc  tab INPUT Ca"

		setfield {KCname}_m num_Xgate 1 num_Ygate 0 malpha 0 mbeta 1 use_Ca_binding_scaling 1

	else
		create table {KCname}_m/tab_alpha
		create table {KCname}_m/tab_beta
		call {KCname}_m/tab_alpha TABCREATE {xdivs} {xmin} {xmax}
		call {KCname}_m/tab_beta TABCREATE {xdivs} {xmin} {xmax}

		int i
		float x, dx, alpha, beta
		dx = (xmax - xmin)/xdivs
		x = xmin
		for (i = 0; i <= (xdivs); i = i + 1)
		    if (x < 250)
		        alpha = scaling*x/250.0	//Make sure equilibrium distribution is the same as above
			beta = scaling*(1 - (x/250.0))
		    else
			alpha = scaling*1.0
			beta = 0
		    end
		    setfield {KCname}_m/tab_alpha table->table[{i}] {alpha}
		    setfield {KCname}_m/tab_beta table->table[{i}] {beta}
		    x = x + dx
		end

		setfield {KCname}_m/tab_alpha table->calc_mode 0
		setfield {KCname}_m/tab_beta table->calc_mode 0
		call {KCname}_m/tab_alpha TABFILL 90000 0
		call {KCname}_m/tab_beta TABFILL 90000 0
		addmsg {KCname}_m/tab_alpha {KCname}_m HALPHA output
		addmsg {KCname}_m/tab_beta {KCname}_m HBETA output
        	//setfield  {KCname}_m sendmsg1 "../Ca_conc  tab VOLTAGE Ca"

		setfield {KCname}_m num_Xgate 1 num_Ygate 1 malpha 0 mbeta 1 halpha 0 hbeta 1 use_Ca_binding_scaling 0
	end


        float xmin = -0.1
        float xmax = 0.05
        int xdivs = 49
        create table {KCname}_m/X_alpha
	create table {KCname}_m/X_beta
        call {KCname}_m/X_alpha TABCREATE {xdivs} {xmin} {xmax}
        call {KCname}_m/X_beta TABCREATE {xdivs} {xmin} {xmax}

        int i
        float x, dx, alpha, beta
        dx = (xmax - xmin)/xdivs
        x = xmin
        for (i = 0; i <= (xdivs); i = i + 1)
            if (x < EREST_ACT + 0.05)
                alpha = ({exp {53.872*(x - EREST_ACT) - 0.66835}})/0.018975
		beta = 2000*({exp {(EREST_ACT + 0.0065 - x)/0.027}}) - alpha
            else
		alpha = 2000*({exp {(EREST_ACT + 0.0065 - x)/0.027}})
		beta = 0.0
            end
            setfield {KCname}_m/X_alpha table->table[{i}] {alpha}
            setfield {KCname}_m/X_beta table->table[{i}] {beta}
            x = x + dx
        end

	setfield {KCname}_m/X_alpha table->calc_mode 0
	setfield {KCname}_m/X_beta table->calc_mode 0
	call {KCname}_m/X_alpha TABFILL 3000 0
	call {KCname}_m/X_beta TABFILL 3000 0

	addmsg {KCname}_m/X_alpha {KCname}_m MALPHA output
	addmsg {KCname}_m/X_beta {KCname}_m MBETA output

        if (!{exists {KCname}_m sendmsg2})
            addfield {KCname}_m sendmsg2
        end
        //setfield  {KCname}_m sendmsg2 "..  X  VOLTAGE Vm"

	addfield {KCname}_m originalchannel
	setfield {KCname}_m originalchannel {KCname}

end



//========================================================================
// GENTabchan Ca-dependent K AHP Channel
//========================================================================
function make_K_AHP_m (location)



	str location
	float scaling = 3000.0

	if (location == "1"); str KAHPname = "K_AHP"
	elif (location == "2"); str KAHPname = "K_AHPs"
	elif (location == "3"); str KAHPname = "K_AHPi"
	elif (location == "4"); str KAHPname = "K_AHPsi"
	end


        if (({exists {KAHPname}_m}))
                return
        end

        create GENtabchan {KAHPname}_m
                //      V
                //      S
                //      A
                //      S
		if ((location == "1") || (location == "2"))
	                setfield ^ Ek {pyr_EK} Nt 10 Gmax {15.0*{onepS}} Ik 0 Gk 0 num_Xgate 1 
		elif ((location == "3") || (location == "4"))
	                setfield ^ Ek {int_EK} Nt 10 Gmax {15.0*{onepS}} Ik 0 Gk 0 num_Xgate 1
		end
		setfield ^ assume_tabchannel_type_ODE 1


                // Allocate space in the Z gate A and B tables, covering a concentration
                // range from xmin = 0 to xmax = 1000, with 50 divisions
        float xmin = 0.0
        float xmax = 1000.0
        int xdivs = 50

	create table {KAHPname}_m/tab_alpha
	create table {KAHPname}_m/tab_beta
        call {KAHPname}_m/tab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call {KAHPname}_m/tab_beta TABCREATE {xdivs} {xmin} {xmax}
        int i
        float x, dx, y
        dx = (xmax - xmin)/xdivs
        x = xmin
        for (i = 0; i <= (xdivs); i = i + 1)
            if (x < 500.0)
                y = 0.02*x
            else
                y = 10.0
            end
            setfield {KAHPname}_m/tab_alpha table->table[{i}] {y}
            setfield {KAHPname}_m/tab_beta table->table[{i}] {y + 1.0}
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        // and use TABFILL to expand the table to 3000 entries.
        setfield {KAHPname}_m/tab_alpha table->calc_mode 0
        setfield {KAHPname}_m/tab_beta table->calc_mode 0
        call {KAHPname}_m/tab_alpha TABFILL 90000 0
        call {KAHPname}_m/tab_beta TABFILL 90000 0
	addmsg {KAHPname}_m/tab_alpha {KAHPname}_m MALPHA output
	addmsg {KAHPname}_m/tab_beta {KAHPname}_m MBETA output


        // Use an environment variable to tell the cell reader to set up the
        // CONCEN message from the Ca_concen element
        if (!{exists {KAHPname}_m sendmsg1})
            addfield {KAHPname}_m sendmsg1
        end
        //setfield  {KAHPname}_m sendmsg1 "../Ca_conc . CONCEN Ca"

	addfield {KAHPname}_m originalchannel
	setfield {KAHPname}_m originalchannel {KAHPname}	

end




//========================================================================
// 		Leak channel
//		Based on leak channel included in 2004 paper by 
//		Diba & Koch - Intrinsic noise in cultured hippocampal neurons...
//========================================================================
function make_leak_m (location)
	// location = 1 -- pyramidal leak
	// location = 2 -- interneuron leak

	if (location == "1"); str leakname = "leak_m"
	elif (location == "2"); str leakname = "leaki_m"
	end


        if (({exists {leakname}}))
                return		//Kill the old channel, we want action!
	end

        create GENvgpores {leakname}		//Use synpores object since it's
						//not voltage dependent anyways

	if (location == "1")
                setfield ^ Ek {pyr_EK} Ik 0 Gk 0 Nt 10 Gmax {60.0*{onepS}}
	elif (location == "2")
                setfield ^ Ek {int_EK} Ik 0 Gk 0 Nt 10 Gmax {60.0*{onepS}}
	end

        setfield {leakname} malpha_A 8.17e3 malpha_B 0 malpha_C 0 malpha_D 0 malpha_F 1e9	\
			mbeta_A 0.167e3 mbeta_B 0 mbeta_C 0 mbeta_D 0 mbeta_F 1e9	\
			num_Xgate 1 num_Ygate 0



	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield {leakname} originalchannel

	if (location == "1"); setfield {leakname} originalchannel leak
	elif (location == "2"); setfield {leakname} originalchannel leaki
	end

end

function make_leak (location)


	if (location == "1"); str leakname = "leak"
	elif (location == "2"); str leakname = "leaki"
	end


	//also make a non-stochastic version of the active channel
        if (({exists {leakname}}))
		return
	end

        create tabchannel {leakname}
                //      V
                //      S
                //      A
                //      S
	if (location == "1")
                setfield ^ Ek {pyr_EK} Gbar 1 Ik 0 Gk 0 Xpower 1 \
                     Ypower 0 Zpower 0
	elif (location == "2")
                setfield ^ Ek {int_EK} Gbar 1 Ik 0 Gk 0 Xpower 1 \
                     Ypower 0 Zpower 0
	end

        setupalpha {leakname} X 8.17e3 0 0  \
            0 1e9  \
            0.167e3 0 0  \
            0 1e9
end





//========================================================================
//                AMPA Channel
// AMPA pore population represented through six state Markov kinetic
// scheme (see Koch, Methods in Neuronal Modeling, 2nd Edition).
// Individual channel conductance from: Stevens et al 2003, "Independent
// Sources of Quantal Variability at Single Glutamatergic Synapses"
//
//========================================================================

function make_AMPA_m

	float Rb = 13e6 //M^-1 * sec^-1
	//all units below are in seconds^-1
	float Ru1 = 5.9
	float Ru2 = 8.6e4
	float Rd = 900
	float Rr = 64
	float Ro = 2.7e3
	float Rc = 200

		if (({exists AMPA_m}))
		        return
		end

	//Create Channel
	create GENsynpores AMPA_m
	setfield AMPA_m Ek {E_AMPA} Nt 10 Gmax {10*{onepS}} Trans 5e-2	\
		S11_S12 0 TCoef2 {Rb}	\
		TCoef3 {Rb} S14_S15 {Ro}	\
		S13_S12 {Ru1} S14_S13 {Ru2} S15_S14 {Rc}	\
		S13_S23 {Rd} S23_S13 {Rr}	\
		S14_S24 {Rd} S24_S14 {Rr} \
		S11 0

	addfield AMPA_m originalchannel
	setfield AMPA_m originalchannel AMPA
end


//========================================================================
//                AMPA Channel - Stevens
// AMPA pore population and individual channel conductance taken from
// Stevens et al 2003, "Independent Sources of Quantal Variability at
// Single Glutamatergic Synapses"
// This channel is recommended over the channel proposed in Koch's text
// because Koch's version takes excessively long to recover from desensitization.
//
//========================================================================

function make_AMPA_m_stevens

	float c0c1 = 4.59e6
	float c1c0 = 4.26e3
	float c1c2 = 2.84e7
	float c2c1 = 3.26e3
	float c2o = 4.24e3
	float oc2 = 900
	float c1c3 = 2.89e3
	float c3c1 = 39.2
	float c3c4 = 1.27e6
	float c4c3 = 45.7
	float c2c4 = 172
	float c4c2 = 0.727
	float c4c5 = 16.8
	float c5c4 = 190.4
	float oc5 = 17.7
	float c5o = 4


	if (({exists AMPA_m}))
	        return
	end

	//Create Channel
	create GENsynpores AMPA_m
	setfield AMPA_m Ek {E_AMPA} Nt 10 Gmax {10*{onepS}} Trans 5e-2	\
		S11_S12 0 S12_S13 0 S13_S14 {c2o} TCoef1 {c0c1} TCoef2 {c1c2} \
		S12_S11 {c1c0} S13_S12 {c2c1} S14_S13 {oc2} \
		S12_S22 {c1c3} S22_S12 {c3c1} S13_S23 {c2c4} S23_S13 {c4c2} S14_S24 {oc5} S24_S14 {c5o} \
		S22_S23 0 S23_S22 {c4c3} S23_S24 {c4c5} S24_S23 {c5c4} \
		TCoef5 {c3c4} openstate1 14

	addfield AMPA_m originalchannel
	setfield AMPA_m originalchannel AMPA
end


//========================================================================
//                NMDA Channel
// NMDA pore population represented through six state Markov kinetic
// scheme (see Koch, Methods in Neuronal Modeling, 2nd Edition).
// Individual channel conductance from: Stevens et al 2003, "Independent
// Sources of Quantal Variability at Single Glutamatergic Synapses"
//
//========================================================================

function make_NMDA_m

float Rb = 5e6 //M^-1 * sec^-1
// All units below are in sec^-1
float Ru = 12.9
float Rd = 8.4
float Rr = 6.8
float Ro = 46.5
float Rc = 73.8




		if (({exists NMDA_m}))
		        return
		end


	//Create Channel
	create GENsynpores NMDA_m
	setfield NMDA_m Ek {E_NMDA} Nt 10 Gmax {45*{onepS}} Trans 9.3e-6 \
				TCoef1 {Rb} TCoef2 {Rb} S12_S11 {Ru} S13_S12 {Ru} \
				S13_S23 {Rr} S23_S13 {Rd} S13_S14 {Ro} S14_S13 {Rc} \
				openstate1 14

	addfield NMDA_m originalchannel
	setfield NMDA_m originalchannel NMDA
end



//========================================================================
//                GABA Channel
//		  GABA pore population represented through six state
//		  Markov kinetic scheme (see Koch, Methods in Neuronal
//		  Modeling, 2nd Edition).
//
//		  Estimated single channel conductance of 20pS based
//		  on article by Kaneda, Farrant, Cull-Candy 1995
//		  "While-cell and single channel currents..."
//========================================================================


function make_GABA_A_m

	float Rb1 = 2e7 //M^-1 * sec^-1
	float Ru1 = 4.6e3 //sec^-1
	float Rb2 = 1e7 //M^-1 * sec^-1
	float Ru2 = 9.2e3 //sec^-1
			//All units below are in seconds^-1
	float Ro1 = 3.3e3
	float Rc1 = 9.8e3
	float Ro2 = 10.6e3
	float Rc2 = 410


	if (({exists GABA_A_m}))
	        return
	end

	//Create Channel
	create GENsynpores GABA_A_m
	setfield GABA_A_m Ek {E_GABAA} Gmax {20*{onepS}} Trans 9.2e-5 \
			TCoef1 {Rb1} TCoef2 {Rb2} S12_S11 {Ru1} S13_S12 {Ru2} \
			S12_S22 {Ro1} S22_S12 {Rc1} S13_S23 {Ro2} S23_S13 {Rc2} \
			openstate1 22 openstate2 23

	addfield GABA_A_m originalchannel
	setfield GABA_A_m originalchannel GABA_A
	//GABA_A: fix this!!!
	//note: some of these channels are different for interneurons!
	//Also, something is wrong with the calcium concentration
end



function make_GABA_B_m

float Kd = 100e-24 //M^4
float Kd_root4 = 3.162e-6	//M
float K1 = 6.6e5 //M-1sec-1
float K2 = 20
float K3 = 5.3
float K4 = 17
float K5 = 8.3e-5	//Msec-1
float K6 = 7.9
float UnitG = 1e-9	//M
int n = 4
float r1 = 18	//sec-1 mM-1	[the units of the Gprotein are renormalized, so these units don't matter]
float r2 = 50	//sec-1
float r3 = 10	//sec-1
float r4 = 2	//sec-1
float rate_per_mols = 1e7	// M-1 * sec-1
float Gprotein_renormalization = 1e6	// unitless

int k_pore_mode = 1
	// 1: Model as K channel as 4 independent channels (voltage-dependent model)
	// 2: Model K channel as 4 sequential binding events (synaptic model)
	// 3: Model as channel with deactivation (as per Destexhe eq 24)

	if (({exists GABA_B_m}))
	        return
	end

	create GENsynpores GABA_B_m
	setfield GABA_B_m Ek 0 Gmax 1 Trans 9.2e-5 \
		TCoef1 {K1} S12_S11 {K2} S12_S22 {K4} S22_S12 {K3} \
			openstate1 12

	create GENGprotein GABA_B_m/G_protein
	setfield GABA_B_m/G_protein Ek {E_GABAB} UnitG {UnitG} Trans 9.2e-5 \
		TCoef1 {{K5}/{UnitG}} S11_S12 0 S12_S11 {K6} Kd {Kd} nbinding_sites {n} \
		Gbar 1 openstate1 12


	if (k_pore_mode == 1)
	// Model K_pore as 4 independent binding events
		create GENvgpores GABA_B_m/K_pore
		setfield GABA_B_m/K_pore Ek {E_GABAB} Gmax {20*{onepS}} malpha_A 0 malpha_B {rate_per_mols} malpha_C 0 malpha_D 0 malpha_F 1e9	\
				mbeta_A {{rate_per_mols}*{Kd_root4}} mbeta_B 0 mbeta_C 0 mbeta_D 0 mbeta_F 1e9	\
				num_Xgate 4 num_Ygate 0
	end
	

	if (k_pore_mode == 2)
	// Model K_pore as 4 squential binding events (binding sites are specific with specific order)
		create GENsynpores GABA_B_m/K_pore
		setfield GABA_B_m/K_pore Ek {E_GABAB} Gmax {20*{onepS}} TCoef1 {rate_per_mols} S12_S11 {{rate_per_mols}*{Kd_root4}}	\
				TCoef2 {rate_per_mols} TCoef3 {rate_per_mols} TCoef4 {rate_per_mols}					\
				S13_S12 {{rate_per_mols}*{Kd_root4}} S14_S13 {{rate_per_mols}*{Kd_root4}} S15_S14 {{rate_per_mols}*{Kd_root4}}	\
				Trans 9.2e-5 openstate1 15
	end

	if (k_pore_mode == 3)
	//Model as channel with deactivation (as per Destexhe eq 24)
		create GENsynpores GABA_B_m/K_pore
		setfield GABA_B_m/K_pore Ek {E_GABAB} Gmax {20*{onepS}} TCoef1 {{Gprotein_renormalization}*{r1}} S12_S11 {r2}	\
				S12_S22 {r3} S22_S12 {r4}	\
				Trans 9.2e-5 openstate1 12

	end

	
	addmsg GABA_B_m GABA_B_m/G_protein TRANSMITTER Gk
	if (k_pore_mode == 1); addmsg GABA_B_m/G_protein GABA_B_m/K_pore VOLTAGE Gconcs; end
	if ((k_pore_mode == 2) || (k_pore_mode == 3)); addmsg GABA_B_m/G_protein GABA_B_m/K_pore TRANSMITTER Gconcs; end

	addfield GABA_B_m originalchannel
		setfield GABA_B_m originalchannel GABA_B
	addfield GABA_B_m mode
		setfield GABA_B_m mode regular
	addfield GABA_B_m k_pore_mode
		setfield GABA_B_m k_pore_mode {k_pore_mode}

end

function make_GABA_B_m_NMDAinvert

float Rb = 5e6 //M^-1 * sec^-1
// All units below are in sec^-1
float Ru = 12.9
float Rd = 8.4
float Rr = 6.8
float Ro = 46.5
float Rc = 73.8




		if (({exists GABA_B_m}))
		        return
		end


	//Create Channel
	create GENsynpores GABA_B_m
	setfield GABA_B_m Ek {E_GABAB} Nt 10 Gmax {20*{onepS}} Trans 9.3e-6 \
				TCoef1 {Rb} TCoef2 {Rb} S12_S11 {Ru} S13_S12 {Ru} \
				S13_S23 {Rr} S23_S13 {Rd} S13_S14 {Ro} S14_S13 {Rc} \
				openstate1 14

	addfield GABA_B_m originalchannel
		setfield GABA_B_m originalchannel GABA_B
	addfield GABA_B_m mode
		setfield GABA_B_m mode inverted_NMDA


end



//========================================================================
//                Dummy gap junction; carries the conductance info
//		  for readcell to look up. This simply stores the
//		  max conductance of the gap junction
//========================================================================
function make_GAP_dummy
        if (({exists GAP_dummy}))
                return
	end

	create manuelconduct GAP_dummy
	disable GAP_dummy

end

function make_GAP_m
        if (({exists GAP_m}))
                return
	end

	create GENgap GAP_m
	setfield GAP_m Gmax {55*{onepS}} \
		alpha_A 1.3 alpha_B 0 alpha_C 0 alpha_D -0.0147 alpha_F 0.012987 \
		beta_A 1.3 beta_B 0 beta_C 0 beta_D -0.0147 beta_F -0.0071429

end


function make_pyramidal_m
	if (!({exists /library}))
		create neutral /library
	end
	if (!({exists /library/markov}))
		create neutral /library/markov
	end
	if (!({exists /library/gap}))
		create neutral /library/gap
	end

	pushe /library/markov

	make_Na_m 
	make_K_DR_m 
	make_K_A_m  
	make_Ca_m
	make_K_C_m 2; make_K_C_m 1
	make_K_AHP_m 2; make_K_AHP_m 1;
	make_leak_m 1

	////make_Na_axon_m
	//make_Na_axon_m_active
	//make_K_DR_axon_m

	//We don't need these until we actually make the synaptic connections
//	make_AMPA_m  
//	make_NMDA_m
//	make_GABA_A_m
//	make_GABA_B_m


	pope


	pushe /library/
	make_GAP_dummy
	make_leak 1
	pope

	pushe /library/gap
	make_GAP_m
	pope
end

function make_interneuron_m
	if (!({exists /library}))
		create neutral /library
	end
	if (!({exists /library/markov}))
		create neutral /library/markov
	end
	if (!({exists /library/gap}))
		create neutral /library/gap
	end

	pushe /library/markov

	//make_Na_m 
	//make_K_DRi_m 
	//make_K_Ai_m  
	//make_Ca_m
	//make_leak_m 2

//	make_Na_axon_m
//	make_Na_axon_m_active
	//make_K_DR_axoni_m

	//We don't need these until we actually make the synaptic connections
//	make_AMPA_m  
//	make_NMDA_m
//	make_GABA_A_m
//	make_GABA_B_m



	pope


	pushe /library/
	make_GAP_dummy
	//make_leak 2
	pope

	pushe /library/gap
	make_GAP_m
	pope

end


