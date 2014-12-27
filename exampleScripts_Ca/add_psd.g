

function add_psd (sourcefile, dest, scale)

create disk_in /noise
setfield /noise nx 1 ny 1 loop 1 filename {sourcefile} leave_open 1
useclock /noise 0

//Setup diffamp to scale noise
create diffamp /noise/scalenoise
setfield ^ saturation 999.9 gain {scale}
addmsg /noise /noise/scalenoise PLUS val[0][0]


//Setup summer in dest compartment to add the noise
create diffamp {dest}/current_summer
setfield ^ saturation 999.9 gain 1
addmsg /noise/scalenoise {dest}/current_summer PLUS output
addmsg {dest}/current_summer {dest} INJECT output


end
