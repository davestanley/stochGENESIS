
// Just clamp the voltage, don't worry
// about measuring injected current

// Based on PID_thresh

function PID_VClamp (location, value, graphics_on, fastclamp, file_name)

float dt = { getclock 0 }
str curr_chan
str local
float original_Em


foreach local ({el {location}})
	
	create PID {local}/pid
	setfield {local}/pid cmd {value} gain {1*{getfield {local} Cm}/{dt}}  tau_d {{dt}/40}  tau_i {{dt}*1e2} saturation 1e-4
	if (fastclamp)
		setfield {local}/pid cmd {value} gain 0.2e-6  tau_d {{dt}/4}  tau_i {{dt}} saturation 1e-4
	end
	addmsg {local} {local}/pid SNS Vm
	addmsg {local}/pid {local} INJECT output

end


// // Plotting
//create xform /formpid
//create xgraph /formpid/graph
//addmsg {local}/pid /formpid/graph PLOT output *value *blue
//xshow /formpid


// Write to file
if ( file_name != "nosave" )
	create asc_file {file_name}
	setfield ^  flush 0 leave_open 1 append 0 notime 0 float_format %0.10g
	useclock ^ 1
	addmsg {local}/pid {file_name} SAVE output
end

//Plotting		// Adds a line to the exisitng "graphs1/Ik" plotting forum
if (graphics_on == 1)
	str dest_plot = "/graphs1"
	addmsg {local}/pid {{dest_plot} @ "/Ik"} PLOT output *PID *red
end


reset
reset

end
