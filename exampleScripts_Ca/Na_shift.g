

function Na_shift (chan_list, EREST_ACT)
//shift the activation kinetics of all Na channels assuming
//the new resting potential EREST_ACT


str curr_chan

foreach curr_chan ({el {chan_list}})

	//echo current chan {curr_chan}

	if ({getfield {curr_chan} name} == "Na_m")
		setfield {curr_chan} malpha_A {320e3*(0.0131 + EREST_ACT)} malpha_B -320e3 malpha_C -1.0  \
		    malpha_D {-1.0*(0.0131 + EREST_ACT)} malpha_F -0.004  \
		    mbeta_A {-280e3*(0.0401 + EREST_ACT)} mbeta_B 280e3 mbeta_C -1.0  \
		    mbeta_D {-1.0*(0.0401 + EREST_ACT)} mbeta_F 5.0e-3

		setfield {curr_chan} halpha_A 128.0 halpha_B 0.0 halpha_C 0.0 halpha_D {-1.0*(0.017 + EREST_ACT)}  \
		    halpha_F 0.018 hbeta_A 4.0e3 hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.040 + EREST_ACT)} hbeta_F -5.0e-3


	elif ({getfield {curr_chan} name} == "Na")
		setupalpha {curr_chan} X {320e3*(0.0131 + EREST_ACT)} -320e3 -1.0  \
		    {-1.0*(0.0131 + EREST_ACT)} -0.004  \
		    {-280e3*(0.0401 + EREST_ACT)} 280e3 -1.0  \
		    {-1.0*(0.0401 + EREST_ACT)} 5.0e-3

		setupalpha {curr_chan} Y 128.0 0.0 0.0 {-1.0*(0.017 + EREST_ACT)}  \
		    0.018 4.0e3 0.0 1.0 {-1.0*(0.040 + EREST_ACT)} -5.0e-3


	elif ({getfield {curr_chan} name} == "NaA_m")

		//Normal channel dynamics
		setfield {curr_chan} malpha_A {800e3*(0.0172 + EREST_ACT)} malpha_B -800e3 malpha_C -1.0  \
		    malpha_D {-1.0*(0.0172 + EREST_ACT)} malpha_F -0.004  \
		    mbeta_A {-700e3*(0.0422 + EREST_ACT)} mbeta_B 700e3 mbeta_C -1.0  \
		    mbeta_D {-1.0*(0.0422 + EREST_ACT)} mbeta_F 5.0e-3

		setfield {curr_chan} halpha_A 320.0 halpha_B 0.0 halpha_C 0.0 \
			halpha_D {-1.0*(0.042 + EREST_ACT)} halpha_F 0.018 \
			hbeta_A 10.0e3 hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.042 + EREST_ACT)} \
			hbeta_F -5.0e-3


        if (({exists {curr_chan} isactive}))
			if ({getfield {curr_chan} isactive} == "active")
				setfield {curr_chan} malpha_A {320e3*(0.0131 + EREST_ACT)} malpha_B -320e3 malpha_C -1.0  \
				    malpha_D {-1.0*(0.0131 + EREST_ACT)} malpha_F -0.004  \
				    mbeta_A {-280e3*(0.0401 + EREST_ACT)} mbeta_B 280e3 mbeta_C -1.0  \
				    mbeta_D {-1.0*(0.0401 + EREST_ACT)} mbeta_F 5.0e-3

				setfield {curr_chan} halpha_A 128.0 halpha_B 0.0 halpha_C 0.0 halpha_D {-1.0*(0.017 + EREST_ACT)}  \
				    halpha_F 0.018 hbeta_A 4.0e3 hbeta_B 0.0 hbeta_C 1.0 hbeta_D {-1.0*(0.040 + EREST_ACT)} hbeta_F -5.0e-3

			end
		end


	elif ({getfield {curr_chan} name} == "NaA")


		// Normal channel dynamics
		setupalpha {curr_chan} X {800e3*(0.0172 + EREST_ACT)} -800e3 -1.0  \
		    {-1.0*(0.0172 + EREST_ACT)} -0.004  \
		    {-700e3*(0.0422 + EREST_ACT)} 700e3 -1.0  \
		    {-1.0*(0.0422 + EREST_ACT)} 5.0e-3

		setupalpha {curr_chan} Y 320.0 0.0 0.0 {-1.0*(0.042 + EREST_ACT)}  \
		    0.018 10.0e3 0.0 1.0 {-1.0*(0.042 + EREST_ACT)} -5.0e-3


		if (({exists {curr_chan} isactive}))	//"Active" channel dynamics
			if ({getfield {curr_chan} isactive} == "active")
				setupalpha {curr_chan} X {320e3*(0.0131 + EREST_ACT)} -320e3 -1.0  \
				    {-1.0*(0.0131 + EREST_ACT)} -0.004  \
				    {-280e3*(0.0401 + EREST_ACT)} 280e3 -1.0  \
				    {-1.0*(0.0401 + EREST_ACT)} 5.0e-3

				setupalpha {curr_chan} Y 128.0 0.0 0.0 {-1.0*(0.017 + EREST_ACT)}  \
				    0.018 4.0e3 0.0 1.0 {-1.0*(0.040 + EREST_ACT)} -5.0e-3
			end
		end




	end

end



end
