

// ############# Like write_everything.g, except
// ############# display the total current from all
// ############# compartments, rather than just the
// ############# present compartment
// ## Dave Stanley Feb 10 2010




function write_Ca_conc (source, dest_plot, dest_save, pfield, graphics_on, sum_currents)
	str curr_chan
	int col = 15
	str dest_info = {"." @ {dest_save} @ "_info"}
	
	
	
	openfile {dest_info} w
	
	xcolorscale hot
	
		
	foreach curr_chan ({el {source}/##[TYPE=Ca_concen]})
		if (graphics_on); addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT Ca *{getfield {curr_chan} name} *{col}; end
		addmsg {curr_chan} {dest_save} SAVE C
		writefile {dest_info} {curr_chan}
		col = col + 7
		if (col > 63)
		        col = col - 60
		end
	end
	
	str curr_plot
	foreach curr_chan ({el {source}/##[TYPE=difshell]})
		if (graphics_on); addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT C *{getfield {curr_chan} name} *{col}; end
		foreach curr_plot ({el {curr_chan}/#[TYPE=fixbuffer]})
			if (graphics_on); addmsg {curr_plot} {{dest_plot} @ "/Vm"} PLOT Bbound *{getfield {curr_chan} name}_buff *{col}; end
		end
		addmsg {curr_chan} {dest_save} SAVE C
		writefile {dest_info} {curr_chan}
		col = col + 7
		if (col > 63)
		        col = col - 60
		end
	end
		

	
	closefile {dest_info}

end


function plot_buffer (src_path, graph_name, file_name, graphics_on, sum_currents)

	if (graphics_on)
		create xform {graph_name} [10,10,900,350] -notitle
		create xlabel {graph_name}/label [10,0,98%,25] -label {src_path}
		create xgraph {graph_name}/Vm [10,10:label.bottom,50%,90%] -title \
		    "membrane potential"
		setfield {graph_name}/Vm XUnits "t (sec)" YUnits "voltage (V)"
		setfield {graph_name}/Vm xmax 0.03 ymin -150 ymax 40
		useclock {graph_name}/Vm 1
		create xgraph {graph_name}/Ik [10:Vm.right,10:label.bottom,49%,90%]  \
		    -title "channel current"
		setfield {graph_name}/Ik XUnits "t (sec)" YUnits "current (S)"
		setfield {graph_name}/Ik xmax 0.03 ymin -1e-7 ymax 9e-7
		useclock {graph_name}/Ik 1
		xshow {graph_name}
	end
	
		create asc_file {file_name}
		setfield ^  flush 0 leave_open 1 append 0 notime 0 float_format %0.12g
		useclock ^ 1


	write_Ca_conc {src_path} {graph_name} {file_name} I {graphics_on} {sum_currents}

end


