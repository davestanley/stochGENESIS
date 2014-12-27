
// Contains calcium pumps

float onepS = 1e-12


//========================================================================
//========================================================================
//                NaCa Exchanger
//========================================================================
//========================================================================
function make_NaCa_exch (location)

	if (location == "1"); str NaCa_name = "NaCa"
	elif (location == "2"); str NaCa_name = "NaCas"
	end

        if (({exists {NaCa_name}}))
                return
	end


		// Soma Ca+ resting concentration should be about 0.70µM. Traub's
		//	arbitrary units lists it as 8
	float encode_gain = {0.70e-3 / 8}
	float decode_gain = {-2}


        create tabcurrent {NaCa_name}
                setfield ^ Ek -1 Ik -1 Gk -1 Gbar -1

		// Converts the [Ca2+] from Traub's arbitrary units to actual concentrations
	create diffamp {NaCa_name}/encode
		setfield ^ plus 0 minus 0 gain {encode_gain} saturation 999
	create diffamp {NaCa_name}/decode
		setfield ^ plus 0 minus 0 gain {decode_gain} saturation 999

	setfield {NaCa_name} Gindex {VOLT_C1_INDEX}
	//setfield {NaCa_name} Gbar {1.4e-5} // kCaNa = 1.4e-5 Amp/(mM^4)/m^2

	setupNaCa {NaCa_name} 0.38 37 0 2.4 10 125 -xsize 100 -xrange -0.1 0.05 \
	    -ysize 100 -yrange 0 0.300


	addmsg {NaCa_name}/encode {NaCa_name} CONCEN1 output
	addmsg {NaCa_name} {NaCa_name}/decode PLUS Ik

        if (!{exists {NaCa_name} sendmsg1})
            addfield {NaCa_name} sendmsg1
        end
        if (!{exists {NaCa_name} sendmsg2})
            addfield {NaCa_name} sendmsg2
        end

	if (location == "1")
        	setfield  {NaCa_name} sendmsg1 "../Ca_conc ./encode PLUS Ca"
        	setfield  {NaCa_name} sendmsg2 "./decode ../Ca_conc I_Ca output"
	elif (location == "2")
        	setfield  {NaCa_name} sendmsg1 "../Ca_concs ./encode PLUS Ca"
        	setfield  {NaCa_name} sendmsg2 "./decode ../Ca_concs I_Ca output"
	end

end


function make_pumps
	if (!({exists /library}))
		create neutral /library
	end

	pushe /library

	make_NaCa_exch 1
	make_NaCa_exch 2
	pope

end




//****************************************************************//
//				Run the pumps
//****************************************************************//

