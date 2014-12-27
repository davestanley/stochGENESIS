



currpath=`pwd`
numprocs=0
export currpath



export block_dend_Ca='int block_dend_Ca = 0;'

export cellnum='str cellnum = "04" '

export force_chan='str force_chan = "K_A"'
export force_dens='float force_dens = -1'

export force_chan_nz='str force_chan_nz = "Na"'
export force_dens_nz='float force_dens_nz = -1'

export scaleB='float scaleB=1.0/1000'
export scaletau='float scaletau=1.0/4'
export ca_concen_thickness='float ca_concen_thickness=1e-6'


if [ $1 = 0 ]
then
	# Testing mode!	
	echo Mode 1

	export scriptmode='int scriptmode = 2;'
	echo $scriptmode
	echo 'str scriptorder = "g"; str script_chan = "allmarkov"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs

#	export scriptmode='int scriptmode = 2;'
#	echo $scriptmode	
#	echo 'str scriptorder = "g"; str script_chan = "allmarkov"; int apply_CaClamp = 0;' > sim_script_temp.g
#	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
#	export scriptmode='int scriptmode = 3;'
#	echo $scriptmode
#	echo 'str scriptorder = "g"; str script_chan = "allunblkd"; int apply_CaClamp = 0;' > sim_script_temp.g
#	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs

	
elif [ $1 = 1 ]
then

	echo Mode 1

	export scriptmode='int scriptmode = 1;'
	echo $scriptmode
		
	echo 'str scriptorder = "a"; str script_chan = "Ca"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs;
	
	echo 'str scriptorder = "b"; str script_chan = "Na"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "c"; str script_chan = "K_DR"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "d"; str script_chan = "K_A"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "e"; str script_chan = "K_C"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "f"; str script_chan = "K_AHP"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "g"; str script_chan = "allmarkov"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "h"; str script_chan = "allmarkov"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "i"; str script_chan = "Ca"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "j"; str script_chan = "K_AHP"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "k"; str script_chan = "allmarkov_highCa"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
elif [ $1 = 2 ]
then
	echo Mode 2
	
	export scriptmode='int scriptmode = 2;'
	echo $scriptmode
	
	echo 'str scriptorder = "e"; str script_chan = "K_C"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "f"; str script_chan = "K_AHP"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "g"; str script_chan = "allmarkov"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
	echo 'str scriptorder = "h"; str script_chan = "allmarkov"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
elif [ $1 = 3 ]
then
	echo Mode 3
	
	export scriptmode='int scriptmode = 3;'
	echo $scriptmode
	
	echo 'str scriptorder = "a"; str script_chan = "Ca"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "b"; str script_chan = "Na"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "c"; str script_chan = "K_DR"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "d"; str script_chan = "K_A"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "e"; str script_chan = "K_C"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "f"; str script_chan = "K_AHP"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "g"; str script_chan = "allunblkd"; int apply_CaClamp = 0;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "h"; str script_chan = "allunblkd"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "i"; str script_chan = "Ca"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "j"; str script_chan = "K_AHP"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	echo 'str scriptorder = "k"; str script_chan = "K_C"; int apply_CaClamp = 1;' > sim_script_temp.g
	./bash_rungen.sh; numprocs=$((numprocs+1)); echo Numprocs $numprocs
	
fi







#x=1
#
#until [ $x = 10 ]
#do
#	echo Current node: $x
#	echo screen -S davie$x
#
#	x=$(($x+1))
#	
#	sed s/"int node = 1"/"int node = $x"/ < sim_script.g > sim_script_temp
#	ssh appliedchaos.asu.edu 'stochgenesis sim_script_temp'
#
#done




