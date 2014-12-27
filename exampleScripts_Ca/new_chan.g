
// Contains markov equivalents of the major Traub pyramidal and interneuron
// channels.

// For pyramidal cells, the strongest channels are (in order
//
//
//

float onepS = 1.0e-12
int num_xdivs = 2001


float EK_new = -0.0857	// From Diba, Koch et al, 2004
float ENa_new = 0.0665	// From Diba, Koch et al, 2004
float ECa_new = 0.025	// From Avery et al, 1996 -- this low ECa might reflect an unmeasured inactivation gate



//========================================================================
//                CaV1.3 Channel (Low-voltage activated)
//========================================================================

// Markov version
function make_CaV13_m
        if (({exists CaV13_m}))
                return
        end

        create GENVhalf CaV13_m
        								// Signle channel conductance estimate: Navedo, Sinnegger-Brauns, Santanta 2007
        								// see also:							Thibault, Landfield 1996
                setfield ^ Ek {ECa_new} Ik 0 Gk 0 Nt 10 Gmax {20.0*{onepS}}

		// The malphas and mbetas described here are irrelevant, since we use V1/2 formalism
        setfield CaV13_m malpha_A 1.6e3 malpha_B 0 malpha_C 1.0 malpha_D {-1.0*(0.065 + EREST_ACT)}  \
            malpha_F -0.01389 mbeta_A {-20e3*(0.0511 + EREST_ACT)} mbeta_B 20e3 mbeta_C -1.0  \
            mbeta_D {-1.0*(0.0511 + EREST_ACT)} mbeta_F 5.0e-3 \
            Vhalf -0.030 Vslope 0.006 tau {CaV_tau}  \
	    	num_Xgate 2 num_Ygate 0
//    	setfield CaV13_m Vslope 0.0075 tau {CaV_tau}	// Slope increased from Avery et al to replicate subthreshold activation
	    		// Slope from Avery, Johnston 1996; Tau from Helton, Lipscombe 2005 - Neuronal l-type calcium channels


	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield CaV13_m originalchannel
	setfield CaV13_m originalchannel CaV13

end


// Non-markov version
function make_CaV13
        if (({exists CaV13}))
                return
        end

		int ngates = 2
        create tabchannel CaV13
                setfield ^ Ek {ECa_new} Gbar 1 Ik 0 Gk 0 Xpower {ngates}  \
                    Ypower 0 Zpower 0

                // Allocate space in the Z gate A and B tables, covering a concentration
                // range from xmin = 0 to xmax = 1000, with 50 divisions
        float xmin = -0.100
        float xmax = 0.100
        int xdivs = 20000		// should increase this further for subthreshold accuracy
        float Vhalf, Vslope, tau, boltz, boltz_part

		Vhalf = -0.030; Vslope = 0.006; tau = {CaV_tau};
//		Vhalf = -0.030; Vslope = 0.0075; tau = {CaV_tau};	// Slope increased from Avery et al to replicate subthreshold activation
		
        call CaV13 TABCREATE X {xdivs} {xmin} {xmax}
        int i
        float x, dx, y_A, y_B, dum
        dx = (xmax - xmin)/xdivs
        x = xmin
        for (i = 0; i <= (xdivs); i = i + 1)
			dum = -(x-{Vhalf})/{Vslope}
			boltz = 1.0 / ( 1 + {exp  {dum} }  )
			boltz_part = {  pow {boltz} {1.0/{ngates}}  } 
			
			// echo x={x} boltz={boltz} boltz_part={boltz_part} X_B={1.0/{tau}}
			
            setfield CaV13 X_A->table[{i}] {{boltz_part}/{tau}}
            setfield CaV13 X_B->table[{i}] {1.0/{tau}}
            x = x + dx
        end
        
        // For speed during execution, set the calculation mode to "no interpolation"
        // and use TABFILL to expand the table to 90000 entries.
        setfield CaV13 X_A->calc_mode 0 X_B->calc_mode 0
        call CaV13 TABFILL X 90000 0

end


//========================================================================
//                SK2 channel
//========================================================================

function make_SK2_m


	if (({exists SK2_m}))
	        return
	end


	// Single channel conductance estimated from Hirschberg et al 1999
	create GENsynpores SK2_m
	setfield ^ Ek {EK_new} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}
	setfield SK2_m Trans 0e0 \
		S11_S12 0 TCoef1 30e6	\
		S12_S11 80				\
		S12_S13 0 TCoef2 24e6	\
		S13_S12 80				\
		S13_S14 0 TCoef3 12e6	\
		S14_S13 200				\
		S11_S21 0 S21_S11 0 S12_S22 0 S22_S12 0	\
		S13_S23 160 S23_S13 1000	\
		S14_S24 1200 S24_S14 100	\
		openstate1 23 openstate2 24


		addfield SK2_m originalchannel
		setfield SK2_m originalchannel SK2
end


function make_SK2		// Dummy placeholder SK2 channel for readcell

	if (({exists SK2}))
		return
	end
        
     create tabchannel SK2

     setfield ^ Ek {pyr_EK} Gbar 1 Ik 0 Gk 0 Xpower 1 \
          Ypower 0 Zpower 0

// Some random numbers
     setupalpha SK2 X 0 0 0  \
         0 1e9  \
         0.167e3 0 0  \
         0 1e9

end


//========================================================================
//                SK2h channel High Open Probability (Po)
//========================================================================

function make_SK2h_m


	if (({exists SK2h_m}))
	        return
	end


	// Single channel conductance estimated from Hirschberg et al 1999
	create GENsynpores SK2h_m
	setfield ^ Ek {EK_new} Ik 0 Gk 0 Nt 10 Gmax {10.0*{onepS}}
	setfield SK2h_m Trans 0e0 \
		S11_S12 0 TCoef1 200e6	\
		S12_S11 80				\
		S12_S13 0 TCoef2 160e6	\
		S13_S12 80				\
		S13_S14 0 TCoef3 80e6	\
		S14_S13 200				\
		S11_S21 0 S21_S11 0 S12_S22 0 S22_S12 0	\
		S13_S23 160 S23_S13 1000	\
		S14_S24 1200 S24_S14 100	\
		openstate1 23 openstate2 24


		addfield SK2h_m originalchannel
		setfield SK2h_m originalchannel SK2h
end


function make_SK2h		// Dummy placeholder SK2h channel for readcell

	if (({exists SK2h}))
		return
	end
        
     create tabchannel SK2h

     setfield ^ Ek {pyr_EK} Gbar 1 Ik 0 Gk 0 Xpower 1 \
          Ypower 0 Zpower 0

// Some random numbers
     setupalpha SK2h X 0 0 0  \
         0 1e9  \
         0.167e3 0 0  \
         0 1e9

end





//========================================================================
//                      SK2 High open probability
//========================================================================

function make_HPo_SK2_m

	if (({exists HPo_SK2_m}))
	        return
	end

	create GENtabchan HPo_SK2_m
	setfield ^ Ek {EK_new} Nt 10 Gmax {10.0*{onepS}} Ik 0 Gk 0 num_Xgate 1 num_Ygate 0	\
		use_Ca_binding_scaling 0
	setfield ^ assume_tabchannel_type_ODE 1


	float xmin = 0.0e-9
	float xmax = 10000e-9
	int xdivs = 10000

	create table HPo_SK2_m/mtab_alpha
	create table HPo_SK2_m/mtab_beta
        call HPo_SK2_m/mtab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call HPo_SK2_m/mtab_beta TABCREATE {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float ninf, ntau
        for (i = 0; i <= (xdivs); i = i + 1)

			
			ninf = {pow {x} 4.1} / { {pow {x} 4.1} +  {pow {520e-9} 4.1} }
			ntau = {HPo_tau}
			
//            echo x= {x} ninf={ninf}, ntau={ntau}, linf={linf}, ltau={ltau}
//            echo {am} {1/({am} + {bm})}  {{hinf}/{htau}} {1/{htau}}			
//            echo {ah} {bh} {hinf}
            setfield HPo_SK2_m/mtab_alpha table->table[{i}] {{ninf}/{ntau}}
            setfield HPo_SK2_m/mtab_beta table->table[{i}] {1/{ntau}}
            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield HPo_SK2_m/mtab_alpha table->calc_mode 0
        setfield HPo_SK2_m/mtab_beta table->calc_mode 0
        call HPo_SK2_m/mtab_alpha TABFILL 90000 0
        call HPo_SK2_m/mtab_beta TABFILL 90000 0
        
		addmsg HPo_SK2_m HPo_SK2_m/mtab_alpha INPUT Vk
		addmsg HPo_SK2_m HPo_SK2_m/mtab_beta INPUT Vk
        
		addmsg HPo_SK2_m/mtab_alpha HPo_SK2_m MALPHA output
		addmsg HPo_SK2_m/mtab_beta HPo_SK2_m MBETA output

        
   	addfield HPo_SK2_m originalchannel
	setfield HPo_SK2_m originalchannel HPo_SK2
end


function make_HPo_SK2

	if (({exists HPo_SK2}))
	        return
	end

	create tabchannel HPo_SK2
	setfield ^ Ek {EK_new} Gbar 1 Ik 0 Gk 0 Xpower 0  \
	Ypower 0 Zpower 1

	//From here onward, this code should be exactly the same as the markov version
	float xmin = 0.0e-9
	float xmax = 10000e-9
	int xdivs = 10000

  call HPo_SK2 TABCREATE Z {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float ninf, ntau
        for (i = 0; i <= (xdivs); i = i + 1)

			ninf = {pow {x} 4.1} / { {pow {x} 4.1} +  {pow {520e-9} 4.1} }
			ntau = {HPo_tau}
			
//			echo x={x} am={am} bm={bm} ah={ah} bh={bh}

            setfield HPo_SK2 Z_A->table[{i}] {{ninf}/{ntau}}
            setfield HPo_SK2 Z_B->table[{i}] {1/{ntau}}
            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield HPo_SK2 Z_A->calc_mode 0 Z_B->calc_mode 0
        call HPo_SK2 TABFILL Z 90000 0
        
		if (!{exists HPo_SK2 sendmsg1})
            addfield HPo_SK2 sendmsg1
        end
//        if (use_difshell); setfield  HPo_SK2 sendmsg1 { "{el ../#[TYPE=difshell]} . CONCEN C"}
        if (use_difshell); setfield  HPo_SK2 sendmsg1 {"../Ca_conc_dp . CONCEN C"}
        else; setfield  HPo_SK2 sendmsg1 "../Ca_conc_r . CONCEN Ca"; end
end



//========================================================================
//                sAHP channel
//========================================================================

function make_sAHP_m

	float rate_scale = 1.0
//	float rb = 10e6	// (Mol-sec)^-1
	float rb = {{10e6*300/750}*rate_scale}	// (Mol-sec)^-1	//davedit_sahp -- shift 40% activation of sAHP from 300nM up to 750nM (to be ~ inline with mAHP)
	float ru = {0.5*rate_scale}	// sec^-1
	float ro = {600*rate_scale}	// sec^-1
	float rc = {400*rate_scale}	// sec^-1


	if (({exists sAHP_m}))
	        return
	end


	// Single channel conductance estimated from Hirschberg et al 1999
	create GENsynpores sAHP_m
	setfield ^ Ek {EK_new} Ik 0 Gk 0 Nt 10 Gmax {5.0*{onepS}}
	setfield sAHP_m Trans 0e0 \
		S11_S12 0 TCoef1 {4*{rb}}	\
		S12_S11 {ru}				\
		S12_S13 0 TCoef2 {3*{rb}}	\
		S13_S12 {2*{ru}}			\
		S13_S14 0 TCoef3 {2*{rb}}	\
		S14_S13 {3*{ru}}			\
		S14_S15 0 TCoef4 {rb}		\
		S15_S14 {4*{ru}}			\
		S15_S25 {ro} S25_S15 {rc}	\
		openstate1 25


		addfield sAHP_m originalchannel
		setfield sAHP_m originalchannel sAHP
end


function make_sAHP		// Dummy placeholder sAHP channel for readcell

	if (({exists sAHP}))
		return
	end
        
     create tabchannel sAHP

     setfield ^ Ek {pyr_EK} Gbar 1 Ik 0 Gk 0 Xpower 1 \
          Ypower 0 Zpower 0

// Some random numbers
     setupalpha sAHP X 0 0 0  \
         0 1e9  \
         0.167e3 0 0  \
         0 1e9

end

//========================================================================
//                      Ca concentration for reduced model
//========================================================================

function make_Ca_conc_r
        if (({exists Ca_conc_r}))
                return
        end
        create Ca_concen Ca_conc_r
        // 0.01333 sec
        // Curr to conc for soma
        //setfield Ca_conc_r tau 0.020 B 17.402e12 Ca_base 0.0
        setfield Ca_conc_r tau 0.02 Ca_base 0e-9 thick {ca_concen_thickness}
        if (!{exists Ca_conc_r sendmsg1})
            addfield Ca_conc_r sendmsg1
        end
        setfield  Ca_conc_r sendmsg1 "../CaV13 . I_Ca Ik"
end


function calc_volume (rad, len)
	float Pi = 3.1415926535
	float vol = 4.0/3*{Pi}*{pow {rad} 3}
	if (len>0)
		float vol = {Pi*{pow {rad} 2}*len}
	end
	return {vol}
end
function calc_area (rad, len)
	float Pi = 3.1415926535
	float area = 4.0*{Pi}*{pow {rad} 2}
	if (len>0)
		float area = {2.0*Pi*rad*len}
	end
	return {area}
end

//========================================================================
//                      Ca concentration using difshell
//========================================================================
function make_Ca_conc_dp
        if (({exists Ca_conc_dp}))
                return
        end
        float CCaI = 1e-9
               	    /* Fast immobile buffer params */ /* Taken from spinedemo (De Schutter et al); Copyright E. De Schutter BBF-UIA Oct 1998 */
	    float FBuf = 0.1 // total buffer concentration in mM
	    float FBuf0 = 0.2 // total buffer concentration in mM in first shell
	    float kfFBuf = 5.0e5  // forward binding rate in 1/(mM.sec) 
	    float kbFBuf = 500  // backward binding rate in 1/sec
	    float FBuf_M = 1.2 // Total buffer in mM, taken from Migliore et al, 1995
	    		// Convert from mM to M
	    float kfFBuf = 5.0e8/{scale_difshell_binding_tau}  // forward binding rate in 1/(M.sec) 
	    float kbFBuf = 500e-0/{scale_difshell_binding_tau}  // backward binding rate in 1/sec
	    float FBuf_M = 1.2e-3 // Total buffer in M, taken from Migliore et al, 1995
		float DCa = 6.0e-10   // diffusion constant in m^2/sec
//        float DCa = 0.0   // diffusion constant in m^2/sec
	    
	    str curr_shell
	    str prev_shell
	    float shell_vol
	    float shell_vol_next
	    float shell_del_volume
	    float top_area
	    float bottom_area
	    int nshells = 1
//	    float dia = 15.9576e-6; float len=-1.0		// Soma
	    float dia = 4.0e-6; float len= 36.36364e-6		// Dendrite actual
//	    float dia = 12.0e-6; float len= 36.36364e-6			// Dendrite (can justify using a value here > 4.0 because of lateral diffusion into soma)
	    float rad = {{dia}/2}
	    float len = len / {num_dendpools}
	    float del_rad = {{rad}-{ca_concen_thickness}}/{nshells}
	    
		// echo Expected total volume = {{calc_volume {rad} {len}} - {calc_volume {ca_concen_thickness} {len}}}
		float tot_volume = 0
		int i;
	    for (i = 1; i <= {nshells}; i = i + 1)
			if (i==1)
				curr_shell = "Ca_conc_dp"
			else
				curr_shell = {"Ca_conc_dp/Ca_conc_dp" @ {i}}
				if (i==2); prev_shell = "Ca_conc_dp"
				else; prev_shell = {"Ca_conc_dp/Ca_conc_dp" @ {i-1}}
				end
			end
		    shell_vol = {calc_volume {rad-del_rad*{i-1}} {len} }
		    shell_vol_next = {calc_volume {rad-del_rad*{i}} {len} }
		    top_area = {calc_area {rad-del_rad*{i-1}} {len} }
		    bottom_area = {calc_area {rad-del_rad*{i}} {len} }

	        create difshell {curr_shell}
	        shell_del_volume = {shell_vol - shell_vol_next}
	        setfield {curr_shell} Ceq {CCaI} D {DCa} val 2.0 leak 0.0 \
	        	shape_mode 3 vol {shell_del_volume}	\
	        	surf_up {top_area} surf_down {bottom_area} thick {del_rad}
	        	
        	// echo Creating compartment {i} with volume {shell_del_volume}
        	tot_volume = {{tot_volume} + {shell_del_volume}}
        	
        	if (i>1)
        		addmsg {curr_shell} {prev_shell} DIFF_UP prev_C thick
        		addmsg {prev_shell} {curr_shell} DIFF_DOWN prev_C thick
			end
        	
	
	       	create fixbuffer {curr_shell}/Cabuff
	       	setfield ^ Btot {FBuf_M} kBf {kfFBuf} kBb {kbFBuf}
			addmsg {curr_shell}/Cabuff {curr_shell} BUFFER kBf kBb Bfree Bbound
			addmsg {curr_shell} {curr_shell}/Cabuff CONCEN C
	       	
	       	/* attach the pump */ /* Taken from spinedemo (De Schutter et al); Copyright E. De Schutter BBF-UIA Oct 1998 */
			create taupump {curr_shell}/tau
			setfield {curr_shell}/tau Ceq {CCaI} T_C {0.000013*{scaletau}}
			if (i > 1)
//				setfield {curr_shell}/tau Ceq {CCaI} T_C {0.000002*{scaletau}}
			end
//			setfield {curr_shell}/tau Ceq {CCaI} T_C {0.02*{scaletau}}
			addmsg {curr_shell}/tau {curr_shell} TAUPUMP kP Ceq
		
		end
		// echo Total volume is {tot_volume}
       	
        if (!{exists Ca_conc_dp sendmsg1})
            addfield Ca_conc_dp sendmsg1
        end
        setfield  Ca_conc_dp sendmsg1 {"../CaV13 . FINFLUX Ik " @ {scaleB}}
end



//===================================================================================================
//  			              Other channels from Diba et al
//					** Diba, Koch 2004 - Intrinsic Noise in Cultured Hippocampal Neurons **
//===================================================================================================



//========================================================================
//                      Sodium channel (Mainen et al 1995)
//========================================================================

function make_NaDiba_m

	if (({exists NaDiba_m}))
	        return
	end

	create GENtabchan NaDiba_m
	setfield ^ Ek {ENa_new} Nt 10 Gmax {20.0*{onepS}} Ik 0 Gk 0 num_Xgate 3 num_Ygate 1	\
		use_Ca_binding_scaling 0
	setfield ^ assume_tabchannel_type_ODE 1


	float xmin = -0.100
	float xmax = 0.100
	int xdivs = {num_xdivs}

	create table NaDiba_m/mtab_alpha
	create table NaDiba_m/mtab_beta
	create table NaDiba_m/htab_alpha
	create table NaDiba_m/htab_beta
        call NaDiba_m/mtab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call NaDiba_m/mtab_beta TABCREATE {xdivs} {xmin} {xmax}
        call NaDiba_m/htab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call NaDiba_m/htab_beta TABCREATE {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float am, bm, ah, bh, dum, htau, hinf
        for (i = 0; i <= (xdivs); i = i + 1)
			dum = ({x}+0.035)/9e-3
			am = -0.182e6*({x} + 0.035) / ({exp {-dum}} - 1)
			bm = 0.124e6*({x}+0.035) / ( {exp {dum}} - 1)
			dum = ({x}+0.050)/5e-3
			ah = -0.025e6*({x}+0.050) / ({exp {-dum}} - 1)
			dum = ({x}+0.075)/5e-3
			bh = 0.0091e6*({x}+0.075) / ({exp {dum}} -1)
			
			dum = ({x}+0.065)/6.2e-3
			htau = 1/({ah}+{bh})
			hinf = 1/( 1 + {exp {dum}} )
			
//			echo x={x} am={am} bm={bm} ah={ah} bh={bh}

//            echo x= {x}
//            echo {am} {1/({am} + {bm})}  {{hinf}/{htau}} {1/{htau}}			
//            echo {ah} {bh} {hinf}
            setfield NaDiba_m/mtab_alpha table->table[{i}] {am}
            setfield NaDiba_m/mtab_beta table->table[{i}] {{am} + {bm}}
            setfield NaDiba_m/htab_alpha table->table[{i}] {{hinf}/{htau}}
            setfield NaDiba_m/htab_beta table->table[{i}] {1/{htau}}

            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield NaDiba_m/mtab_alpha table->calc_mode 0
        setfield NaDiba_m/mtab_beta table->calc_mode 0
        setfield NaDiba_m/htab_alpha table->calc_mode 0
        setfield NaDiba_m/htab_beta table->calc_mode 0
        call NaDiba_m/mtab_alpha TABFILL 90000 0
        call NaDiba_m/mtab_beta TABFILL 90000 0
        call NaDiba_m/htab_alpha TABFILL 90000 0
        call NaDiba_m/htab_beta TABFILL 90000 0

		addmsg NaDiba_m NaDiba_m/mtab_alpha INPUT Vk
		addmsg NaDiba_m NaDiba_m/mtab_beta INPUT Vk
		addmsg NaDiba_m NaDiba_m/htab_alpha INPUT Vk
		addmsg NaDiba_m NaDiba_m/htab_beta INPUT Vk
        
		addmsg NaDiba_m/mtab_alpha NaDiba_m MALPHA output
		addmsg NaDiba_m/mtab_beta NaDiba_m MBETA output
		addmsg NaDiba_m/htab_alpha NaDiba_m HALPHA output
		addmsg NaDiba_m/htab_beta NaDiba_m HBETA output
        
   	addfield NaDiba_m originalchannel
	setfield NaDiba_m originalchannel NaDiba
end


function make_NaDiba

	if (({exists NaDiba}))
	        return
	end

	create tabchannel NaDiba
	setfield ^ Ek {ENa_new} Gbar 1 Ik 0 Gk 0 Xpower 3  \
	Ypower 1 Zpower 0

	//From here onward, this code should be exactly the same as the markov version
	float xmin = -0.100
	float xmax = 0.100
	int xdivs = {num_xdivs}

  call NaDiba TABCREATE X {xdivs} {xmin} {xmax}
  call NaDiba TABCREATE Y {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float am, bm, ah, bh, dum, htau, hinf
        for (i = 0; i <= (xdivs); i = i + 1)
			dum = ({x}+0.035)/9e-3
			am = -0.182e6*({x} + 0.035) / ({exp {-dum}} - 1)
			bm = 0.124e6*({x}+0.035) / ( {exp {dum}} - 1)
			dum = ({x}+0.050)/5e-3
			ah = -0.025e6*({x}+0.050) / ({exp {-dum}} - 1)
			dum = ({x}+0.075)/5e-3
			bh = 0.0091e6*({x}+0.075) / ({exp {dum}} -1)
			
			dum = ({x}+0.065)/6.2e-3
			htau = 1/({ah}+{bh})
			hinf = 1/( 1 + {exp {dum}} )
			
//			echo x={x} am={am} bm={bm} ah={ah} bh={bh}

            setfield NaDiba X_A->table[{i}] {am}
            setfield NaDiba X_B->table[{i}] {{am} + {bm}}
            setfield NaDiba Y_A->table[{i}] {{hinf}/{htau}}
            setfield NaDiba Y_B->table[{i}] {1/{htau}}
            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield NaDiba X_A->calc_mode 0 X_B->calc_mode 0
        setfield NaDiba Y_A->calc_mode 0 Y_B->calc_mode 0
        call NaDiba TABFILL X 90000 0
        call NaDiba TABFILL Y 90000 0
end





//========================================================================
//                      Fast K+ Channel (Korngreen, Sakmann 2000)
//========================================================================

function make_KADiba_m

	if (({exists KADiba_m}))
	        return
	end

	create GENtabchan KADiba_m
	setfield ^ Ek {EK_new} Nt 10 Gmax {10.0*{onepS}} Ik 0 Gk 0 num_Xgate 4 num_Ygate 1	\
		use_Ca_binding_scaling 0
	setfield ^ assume_tabchannel_type_ODE 1


	float xmin = -0.100
	float xmax = 0.100
	int xdivs = {num_xdivs}

	create table KADiba_m/mtab_alpha
	create table KADiba_m/mtab_beta
	create table KADiba_m/htab_alpha
	create table KADiba_m/htab_beta
        call KADiba_m/mtab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call KADiba_m/mtab_beta TABCREATE {xdivs} {xmin} {xmax}
        call KADiba_m/htab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call KADiba_m/htab_beta TABCREATE {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float ninf, ntau, linf, ltau, dum
        for (i = 0; i <= (xdivs); i = i + 1)
			
			dum = ({x}+0.047)/29e-3
			ninf= 1/(1+ {exp {-dum}})
			dum = {pow {{x}+0.071} 2} / {pow 59e-3 2}
			ntau= 0.34e-3 + 0.92e-3*{exp {-dum}}
			
			dum = ({x}+0.066)/10e-3
			linf=1/(1 + {exp {dum}} )
			dum = {pow {({x}+0.073)/23e-3} 2}
			ltau=8e-3+ 49e-3 * {exp {-dum}}
			
			
			
//            echo x= {x} ninf={ninf}, ntau={ntau}, linf={linf}, ltau={ltau}
//            echo {am} {1/({am} + {bm})}  {{hinf}/{htau}} {1/{htau}}			
//            echo {ah} {bh} {hinf}
            setfield KADiba_m/mtab_alpha table->table[{i}] {{ninf}/{ntau}}
            setfield KADiba_m/mtab_beta table->table[{i}] {1/{ntau}}
            setfield KADiba_m/htab_alpha table->table[{i}] {{linf}/{ltau}}
            setfield KADiba_m/htab_beta table->table[{i}] {1/{ltau}}

            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield KADiba_m/mtab_alpha table->calc_mode 0
        setfield KADiba_m/mtab_beta table->calc_mode 0
        setfield KADiba_m/htab_alpha table->calc_mode 0
        setfield KADiba_m/htab_beta table->calc_mode 0
        call KADiba_m/mtab_alpha TABFILL 90000 0
        call KADiba_m/mtab_beta TABFILL 90000 0
        call KADiba_m/htab_alpha TABFILL 90000 0
        call KADiba_m/htab_beta TABFILL 90000 0
        
		addmsg KADiba_m KADiba_m/mtab_alpha INPUT Vk
		addmsg KADiba_m KADiba_m/mtab_beta INPUT Vk
		addmsg KADiba_m KADiba_m/htab_alpha INPUT Vk
		addmsg KADiba_m KADiba_m/htab_beta INPUT Vk
        
		addmsg KADiba_m/mtab_alpha KADiba_m MALPHA output
		addmsg KADiba_m/mtab_beta KADiba_m MBETA output
		addmsg KADiba_m/htab_alpha KADiba_m HALPHA output
		addmsg KADiba_m/htab_beta KADiba_m HBETA output
        
   	addfield KADiba_m originalchannel
	setfield KADiba_m originalchannel KADiba
end


function make_KADiba

	if (({exists KADiba}))
	        return
	end

	create tabchannel KADiba
	setfield ^ Ek {EK_new} Gbar 1 Ik 0 Gk 0 Xpower 4  \
	Ypower 1 Zpower 0

	//From here onward, this code should be exactly the same as the markov version
	float xmin = -0.100
	float xmax = 0.100
	int xdivs = {num_xdivs}

  call KADiba TABCREATE X {xdivs} {xmin} {xmax}
  call KADiba TABCREATE Y {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float ninf, ntau, linf, ltau, dum
        for (i = 0; i <= (xdivs); i = i + 1)
			
			dum = ({x}+0.047)/29e-3
			ninf= 1/(1+ {exp {-dum}})
			dum = {pow {{x}+0.071} 2} / {pow 59e-3 2}
			ntau= 0.34e-3 + 0.92e-3*{exp {-dum}}
			
			dum = ({x}+0.066)/10e-3
			linf=1/(1 + {exp {dum}} )
			dum = {pow {({x}+0.073)/23e-3} 2}
			ltau=8e-3+ 49e-3 * {exp {-dum}}
			
			
			
//			echo x={x} am={am} bm={bm} ah={ah} bh={bh}

            setfield KADiba X_A->table[{i}] {{ninf}/{ntau}}
            setfield KADiba X_B->table[{i}] {1/{ntau}}
            setfield KADiba Y_A->table[{i}] {{linf}/{ltau}}
            setfield KADiba Y_B->table[{i}] {1/{ltau}}
            
            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield KADiba X_A->calc_mode 0 X_B->calc_mode 0
        setfield KADiba Y_A->calc_mode 0 Y_B->calc_mode 0
        call KADiba TABFILL X 90000 0
        call KADiba TABFILL Y 90000 0
end



//========================================================================
//                      Slow K+ Channel (Korngreen, Sakmann 2000)
//========================================================================

function make_KSDiba_m

	if (({exists KSDiba_m}))
	        return
	end

	create GENtabchan KSDiba_m
	setfield ^ Ek {EK_new} Nt 10 Gmax {15.0*{onepS}} Ik 0 Gk 0 num_Xgate 2 num_Ygate 1	\
		use_Ca_binding_scaling 0
	setfield ^ assume_tabchannel_type_ODE 1


	float xmin = -0.100
	float xmax = 0.100
	int xdivs = {num_xdivs}

	create table KSDiba_m/mtab_alpha
	create table KSDiba_m/mtab_beta
	create table KSDiba_m/htab_alpha
	create table KSDiba_m/htab_beta
        call KSDiba_m/mtab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call KSDiba_m/mtab_beta TABCREATE {xdivs} {xmin} {xmax}
        call KSDiba_m/htab_alpha TABCREATE {xdivs} {xmin} {xmax}
        call KSDiba_m/htab_beta TABCREATE {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float aalpha, abeta, atau, ainf, btau, binf, dum
        for (i = 0; i <= (xdivs); i = i + 1)
			
			dum = ({x}-0.0111)/13.1e-3
			aalpha = (5.0/3.0) * 0.0052e6*({x}-0.0111) / (1 - {exp {-dum}} )
			dum = ({x}+0.00127)/71e-3
			abeta = (5.0/3.0)*(0.01938 * {exp {-dum}} - 0.0053)*1e3
			
			ainf = {aalpha}/({aalpha}+{abeta})
//			atau = 1.0/({aalpha} + {abeta}) - 10e-3
			atau = 1.0/({aalpha} + {abeta}) - 0
			
			dum =({x}+0.058)/11e-3
			binf = 1.0/(1+ {exp {dum}})
			dum = {pow { ({x}+0.075)/48e-3   } 2}
			btau = (   360 + (1010 + 23.7e3*({x} + 0.054))*{exp {-dum}}   ) * 1e-3



//            echo x= {x} ainf={ainf}, atau={atau}, binf={binf}, btau={btau}
            setfield KSDiba_m/mtab_alpha table->table[{i}] {{ainf}/{atau}}
            setfield KSDiba_m/mtab_beta table->table[{i}] {1/{atau}}
            setfield KSDiba_m/htab_alpha table->table[{i}] {{binf}/{btau}}
            setfield KSDiba_m/htab_beta table->table[{i}] {1/{btau}}

            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield KSDiba_m/mtab_alpha table->calc_mode 0
        setfield KSDiba_m/mtab_beta table->calc_mode 0
        setfield KSDiba_m/htab_alpha table->calc_mode 0
        setfield KSDiba_m/htab_beta table->calc_mode 0
        call KSDiba_m/mtab_alpha TABFILL 90000 0
        call KSDiba_m/mtab_beta TABFILL 90000 0
        call KSDiba_m/htab_alpha TABFILL 90000 0
        call KSDiba_m/htab_beta TABFILL 90000 0
        
		addmsg KSDiba_m KSDiba_m/mtab_alpha INPUT Vk
		addmsg KSDiba_m KSDiba_m/mtab_beta INPUT Vk
		addmsg KSDiba_m KSDiba_m/htab_alpha INPUT Vk
		addmsg KSDiba_m KSDiba_m/htab_beta INPUT Vk
        
		addmsg KSDiba_m/mtab_alpha KSDiba_m MALPHA output
		addmsg KSDiba_m/mtab_beta KSDiba_m MBETA output
		addmsg KSDiba_m/htab_alpha KSDiba_m HALPHA output
		addmsg KSDiba_m/htab_beta KSDiba_m HBETA output
        
   	addfield KSDiba_m originalchannel
	setfield KSDiba_m originalchannel KSDiba
end


function make_KSDiba

	if (({exists KSDiba}))
	        return
	end

	create tabchannel KSDiba
	setfield ^ Ek {EK_new} Gbar 1 Ik 0 Gk 0 Xpower 2  \
	Ypower 1 Zpower 0

	//From here onward, this code should be exactly the same as the markov version
	float xmin = -0.100
	float xmax = 0.100
	int xdivs = {num_xdivs}

  call KSDiba TABCREATE X {xdivs} {xmin} {xmax}
  call KSDiba TABCREATE Y {xdivs} {xmin} {xmax}
        int i
        float x, dx
        dx = (xmax - xmin)/xdivs
        x = xmin
		float aalpha, abeta, ainf, atau, binf, btau, dum
        for (i = 0; i <= (xdivs); i = i + 1)
			
			
			dum = ({x}-0.0111)/13.1e-3
			aalpha = (5.0/3.0) * 0.0052e6*({x}-0.0111) / (1 - {exp {-dum}} )
			dum = ({x}+0.00127)/71e-3
			abeta = (5.0/3.0)*(0.01938 * {exp {-dum}} - 0.0053)*1e3
			
			ainf = {aalpha}/({aalpha}+{abeta})
//			atau = 1.0/({aalpha} + {abeta}) - 10e-3
			atau = 1.0/({aalpha} + {abeta}) - 0
			
			dum =({x}+0.058)/11e-3
			binf = 1.0/(1+ {exp {dum}})
			dum = {pow { ({x}+0.075)/48e-3   } 2}
			btau = (   360 + (1010 + 23.7e3*({x} + 0.054))*{exp {-dum}}   ) * 1e-3

			
//			echo x={x} am={am} bm={bm} ah={ah} bh={bh}

            setfield KSDiba X_A->table[{i}] {{ainf}/{atau}}
            setfield KSDiba X_B->table[{i}] {1/{atau}}
            setfield KSDiba Y_A->table[{i}] {{binf}/{btau}}
            setfield KSDiba Y_B->table[{i}] {1/{btau}}
            
            
            x = x + dx
        end
        // For speed during execution, set the calculation mode to "no interpolation"
        setfield KSDiba X_A->calc_mode 0 X_B->calc_mode 0
        setfield KSDiba Y_A->calc_mode 0 Y_B->calc_mode 0
        call KSDiba TABFILL X 90000 0
        call KSDiba TABFILL Y 90000 0
end



//========================================================================
// 		LeakDiba channel - with new reversal potential
//		Based on leak channel included in 2004 paper by 
//		Diba & Koch - Intrinsic noise in cultured hippocampal neurons...
//========================================================================
function make_leakDiba_m

	str leakname = "leakDiba_m"

        if (({exists {leakname}}))
                return		//Kill the old channel, we want action!
		end

        create GENvgpores {leakname}		//Use synpores object since it's
						//not voltage dependent anyways

        setfield ^ Ek {EK_new} Ik 0 Gk 0 Nt 10 Gmax {60.0*{onepS}}

        setfield {leakname} malpha_A 8.17e0 malpha_B 0 malpha_C 0 malpha_D 0 malpha_F 1e9	\
			mbeta_A 0.167e0 mbeta_B 0 mbeta_C 0 mbeta_D 0 mbeta_F 1e9	\
			num_Xgate 1 num_Ygate 0



	//Name of the equivalent non-markov channel that this is meant
	//to replace
	addfield {leakname} originalchannel
	setfield {leakname} originalchannel leakDiba

end


function make_leakDiba
	str leakname = "leakDiba"

	//also make a non-stochastic version of the active channel
        if (({exists {leakname}}))
		return
	end

        create tabchannel {leakname}

        setfield ^ Ek {EK_new} Gbar 1 Ik 0 Gk 0 Xpower 1 \
             Ypower 0 Zpower 0

        setupalpha {leakname} X 8.17e0 0 0  \
            0 1e9  \
            0.167e0 0 0  \
            0 1e9
end



function make_pyramidal_new
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
	
	if ({stochastic_calcium})
		make_CaV13_m
	end
	make_SK2_m
	make_SK2h_m
//	make_HPo_SK2_m
	make_sAHP_m

//	make_Na_axon_m_active
//	make_K_DR_axon_m
//	make_NaDiba_m
//	make_KADiba_m
//	make_KSDiba_m
//	make_leakDiba_m
	pope


	pushe /library/
		make_CaV13
		make_Ca_conc_r
		make_Ca_conc_dp
		make_SK2
		make_SK2h
		make_HPo_SK2
		make_sAHP
		make_NaDiba
		make_KADiba
		make_KSDiba
		make_leakDiba
	pope


end

function make_interneuron_new
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

//	make_KADiba_m

	pope


	pushe /library/
	pope

end


