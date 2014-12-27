
	//Called by plot_graphs
	//Writes Vm to graph and to file
function write_Vm (source, dest_plot, dest_save, pfield)
str diffampname = {{source} @ "/../soma/diffamp" @ {countelementlist {source}/../soma/#[TYPE=diffamp]}} // Create name & number for diffamp
str dest_info = {"." @ {dest_save} @ "_info"}

	openfile {dest_info} w

	create diffamp {diffampname}
	setfield {diffampname} plus 0 minus 0 gain 1000 saturation inf		// Convert V to mV

	//addmsg {source}/../soma {diffampname} PLUS Vm
	addmsg {source} {diffampname} PLUS Vm
	//addmsg {diffampname} {{dest_plot} @ "/Vm"} PLOT output *Soma_Vm  *blue
	addmsg {diffampname} {dest_save} SAVE output

end



function write_everything (source, dest_plot, dest_save, pfield)
str curr_chan
int col = 15
str dest_info = {"." @ {dest_save} @ "_info"}



openfile {dest_info} w

xcolorscale hot


//foreach curr_chan ({el {source}/##[TYPE=GENvgpores]})
foreach curr_chan ({el {source}/#[TYPE=GENvgpores]} {el {source}/#[TYPE=GENsynpores]} {el {source}/#[TYPE=GENtabchan]})
	if ( {getfield {curr_chan} originalchannel} == "GABA_B" )
		if ( {getfield {curr_chan} mode} == "regular" )
			//addmsg {curr_chan}/G_protein {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name}  *{col}
			//addmsg {curr_chan}/K_pore {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name}  *{col}
			//addmsg {curr_chan}/G_protein {{dest_plot} @ "/Ik"} PLOT Gconcs *{getfield {curr_chan} name}  *{col}


			//addmsg {curr_chan}/G_protein {dest_save} SAVE {pfield}k
			addmsg {curr_chan}/K_pore {dest_save} SAVE {pfield}k
		else
			//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name}  *{col}
			addmsg {curr_chan} {dest_save} SAVE {pfield}k
		end
	else
		//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name}  *{col}
		addmsg {curr_chan} {dest_save} SAVE {pfield}k
	end
	writefile {dest_info} {curr_chan}
	col = col + 7
	if (col > 63)
	        col = col - 60
	end
end


create diffamp {source}/sum_synapses
setfield ^ gain 1 saturation Inf minus 0
int num_channels = 0
foreach curr_chan ({el {source}/##[TYPE=GENsynpores]})
	num_channels = num_channels + 1
	addmsg {curr_chan} {source}/sum_synapses PLUS {pfield}k
end
if (num_channels > 0)
	//addmsg {source}/sum_synapses {{dest_plot} @ "/Ik"} PLOT output *{"sum" @ {getfield {curr_chan} name}}  *{col}
	//addmsg {source}/sum_synapses {dest_save} SAVE output
	//writefile {dest_info} "tot_synaptic_activity"
	col = col + 7
	if (col > 63)
		col = col - 60
	end
end


foreach curr_chan ({el {source}/##[TYPE=GENgap]})
	//echo addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name}  *{col}
	//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name}  *{col}
	addmsg {curr_chan} {dest_save} SAVE {pfield}k
	writefile {dest_info} {curr_chan}

	//create xform /form			//display voltage comparison
	//create xgraph /form/graph
	//xshow /form
	//addmsg {curr_chan} /form/graph PLOT Vk *Vk *blue
	//addmsg {curr_chan} /form/graph PLOT Vk2 *Vk2 *red
	col = col + 7
	if (col > 63)
	        col = col - 60
	end
end


foreach curr_chan ({el {source}/##[TYPE=tabchannel]} {el {source}/##[TYPE=vdep_channel]})
	//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name} *{col}
	addmsg {curr_chan} {dest_save} SAVE {pfield}k
	writefile {dest_info} {curr_chan}
	col = col + 7
	if (col > 63)
	        col = col - 60
	end
end

foreach curr_chan ( {el {source}/##[TYPE=synchan2]} )
	//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT {pfield}k *{getfield {curr_chan} name} *{col}
	addmsg {curr_chan} {dest_save} SAVE {pfield}k
	writefile {dest_info} {curr_chan}
	col = col + 7
	if (col > 63)
	        col = col - 60
	end
end

foreach curr_chan ({el {source}/##[TYPE=Ca_concen]})
	//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT C *{getfield {curr_chan} name} *{col}
	addmsg {curr_chan} {dest_save} SAVE C
	writefile {dest_info} {curr_chan}
	col = col + 7
	if (col > 63)
	        col = col - 60
	end
end

foreach curr_chan ({el {source}/../soma/##[TYPE=PID]})
	//addmsg {curr_chan} {{dest_plot} @ "/Ik"} PLOT output *PID *{col}
	addmsg {curr_chan} {dest_save} SAVE output
	writefile {dest_info} {curr_chan}
	col = col + 7
	if (col > 63)
	        col = col - 60
	end
end



// Include soma current
//addmsg {source}/../soma {{dest_plot} @ "/Ik"} PLOT Im *{getfield {source}/../soma name} *{col}
//addmsg {source}/../soma {dest_save} SAVE Im
//writefile {dest_info} "soma current"



// Calcium concentration
//addmsg {source}/Ca_concs {{dest_plot} @ "/Ik"} PLOT Ca *Calcium *yellow
//addmsg {source}/Ca_concs {{dest_plot} @ "/Ik"} SAVE Ca
//writefile {dest_info} "Calcium Concentration"


closefile {dest_info}

end


function plot_graphs (src_path, graph_name, file_name)

	//create xform {graph_name} [10,10,900,350] -notitle
	//create xlabel {graph_name}/label [10,0,98%,25] -label {src_path}
	//create xgraph {graph_name}/Vm [10,10:label.bottom,50%,90%] -title \
	//    "membrane potential"
	//setfield {graph_name}/Vm XUnits "t (sec)" YUnits "voltage (V)"
	//setfield {graph_name}/Vm xmax 0.03 ymin -150 ymax 40
	//useclock {graph_name}/Vm 1
	//create xgraph {graph_name}/Ik [10:Vm.right,10:label.bottom,49%,90%]  \
	//    -title "channel current"
	//setfield {graph_name}/Ik XUnits "t (sec)" YUnits "current (S)"
	//setfield {graph_name}/Ik xmax 0.03 ymin -1e-7 ymax 9e-7
	//useclock {graph_name}/Ik 1
	//xshow {graph_name}

	create asc_file {file_name}
	setfield ^  flush 0 leave_open 1 append 0 notime 0 float_format %0.12g
	useclock ^ 1

	write_Vm {src_path} {graph_name} {file_name}
	write_everything {src_path} {graph_name} {file_name} G

end


