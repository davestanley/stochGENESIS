


function PID_thresh (location, settle, duration, value)

float dt = { getclock 0 }
float to_inject
float curr_pid_value
str curr_chan
str local
int reset_trick = 1


foreach local ({el {location}})
	
	create PID {local}/pid
	setfield {local}/pid cmd {value} gain {1*{getfield {local} Cm}/{dt}}  tau_d {{dt}/40}  tau_i {{dt}*1e2} saturation 1e-4
	addmsg {local} {local}/pid SNS Vm

	if ({exists {local}/current_summer})	// Incase we are injecting white noise already, we need to sum the injections since Genesis can't handle
		addmsg {local}/pid {local}/current_summer PLUS output
	else
		addmsg {local}/pid {local} INJECT output
	end



	create compartment {local}/integral
	setfield {local}/integral Vm 0 Em 0 Cm 1 Rm {{duration}*1000}	// Make sure decay constant is 10 times duration (very low)
	addmsg {local}/pid {local}/integral INJECT output		// This will integrate the total output

end

//create xform /formpid
//create xgraph /formpid/graph
//addmsg {local}/pid /formpid/graph PLOT output *value *blue
//addmsg {local}/integral /formpid/graph PLOT Vm *integral *red
//xshow /formpid



if ( reset_trick )			// Generally good not to use this, since
					// it produces an unexplainable kink in the
					// output.... (probably a bug)
	setfield /#/#/#[TYPE=compartment] Em {value}
	reset
	reset	// Get channels into correct equilibrium state
	setfield /#/#/#[TYPE=compartment] Em {value} Vm {value}

	//From looking at the Im plot, it appears that this
	//kink is caused by some abrupt change in the axial
	//current, possibly caused by a discontinuity in a
	//dendrite upstream of the soma (integrator problem)

else
	reset
	reset
end


//foreach local ({el {location}})
	//setfield {local} Vm {value}
//end


step {round { {settle}/{dt} }}
foreach local ({el {location}})
	setfield {local}/integral Vm 0
end
step {round { {duration}/{dt} }}


foreach local ({el {location}})
	curr_pid_value = {getfield {local}/pid output}
	to_inject = {{getfield {local}/integral Vm} / {duration}}
	//echo Injecting {to_inject} A into {local} to bring holding potential to an average of {value} V.
	echo Current PID value {curr_pid_value}
	echo Injection value {to_inject}

	setfield {local} inject {to_inject}

	create neutral {local}/I_clamp
		addfield ^ I_inject
		setfield ^ I_inject {to_inject}


	
	if ({exists {local}/current_summer}) // Incase we are injecting white noise already, we need to sum the injections since Genesis can't handle
		addmsg {local}/I_clamp {local}/current_summer PLUS I_inject
	else
		addmsg  {local}/I_clamp {local} INJECT I_inject
	end



	//setfield /fb_array/fb[1]/soma inject {{getfield {local}/integral Vm} / {duration}}
	//setfield {local} inject {getfield {local}/pid output}
	delete {local}/pid
	delete {local}/integral
end



//reset
//reset

end
