

function save_file (wrdest_save, wrsource)
// Write fb0 to file
//str wrdest_save = "/fb0"
//str wrsource = {{fb_array_name} @ {fb_cell_name} @ "[0]/soma"}
str wrdiffampname = {{wrsource} @ "/../soma/diffamp" @ {countelementlist {wrsource}/../soma/#[TYPE=diffamp]}} // Create name & number for diffamp

create asc_file {wrdest_save}
setfield ^  flush 0 leave_open 1 append 0 notime 0 float_format %0.10g
useclock ^ 1

create diffamp {wrdiffampname}
setfield {wrdiffampname} plus 0 minus 0 gain 1000 saturation inf	// Convert V to mV

addmsg {wrsource}/../soma {wrdiffampname} PLUS Vm
addmsg {wrdiffampname} {wrdest_save} SAVE output

end
