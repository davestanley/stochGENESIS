#!/bin/bash

currpath=`pwd`

## ****************************************** Set Script parameters ******************************************

		# Simulation parameters
scriptmode=1
graphics_on=1
use_difshell=0
scale_difshell_binding_tau=1.0
prox_AHP=1
plot_HPo_channel=0
stochastic_calcium=0
plot_mode=1	# 1=whole-cell currents, 0=current compartment, -1=first subpool incurrent compartment
split_high_and_low_SK2=1

script_chan="allmarkov"

#readcell_file="d_c1d1.p"
#readcell_file="d_c19d125.p"
if (( $use_difshell == 1 )); then
	readcell_file="d_s1d11_KS_difpool.p"		# Note, this assumes the channels are "localized" as well
else
	if (( $prox_AHP == 1 )); then
		readcell_file="d_s1d11_KS_localized.p"
		echo using normal_shell, AHP currents only in PROXIMAL dendrite
	else
		readcell_file="d_s1d11_KS.p"
		echo using normal_shell, AHP currents spread throughout all dendrites
	fi
fi

use_paper_1=1
if (( $use_paper_1 == 1 )); then
	readcell_file="d_s1d11_noNa.p"
	if (( $use_difshell == 1 )); then
		readcell_file="d_s1d11_noNa_difpool.p"
	fi
fi


apply_CaClamp=0
block_dend_Ca=0


							# Force_chan entries --> -1 = unused
force_chan='CaV13'
#force_dens=1.2
force_dens=-1

force_chan2='SK2'
force_dens2=-1

force_chan3='KSDiba'
force_dens3=0.0

force_chan4='NaDiba'
force_dens4_soma=240*2/3
force_dens4_dend=40*2/3
#force_dens4_soma=240
#force_dens4_dend=40

force_chan5='leakDiba'
force_dens5=0.72
#force_dens5=0.0

							# Force_chan_nz entries
force_chan_nz='CaV13'
if (( $prox_AHP==1 )); then force_dens_nz=1.25;  else force_dens_nz=0.60; fi	# Use higher densities if restrict Ca to prox dendrites only
force_chan_nz2='SK2'
if (( $prox_AHP==1 )); then force_dens_nz2=48.0;  else force_dens_nz2=12.0; fi
force_chan_nz3="sAHP"
if (( $prox_AHP==1 )); then force_dens_nz3=3.0;  else force_dens_nz3=1.01; fi
force_chan_nz4="HPo_SK2"
if (( $prox_AHP==1 )); then force_dens_nz4=$force_dens_nz2;  else force_dens_nz4=$force_dens_nz2; fi

disconnect_CaV_Vm=0
CaV_tau=0.0025
HPo_tau=60	# Reduced open time of 600ms, since it doesn't make much difference...

if (( $prox_AHP == 1 )); then scaleB='1.0/1000*3.75/{force_dens_nz}'; 
else scaleB='0.8/1000*1.75*2.68/{force_dens_nz}' #Float --> scale by inverse of CaV13 density to keep [Ca] constant
fi
scaletau=1.0/4 #Float
ca_concen_thickness=1.0e-6 #Float
Ca_conc_timeconst_scale=1.0
if (( $use_paper_1 == 1 )); then		#-- Modify tau and B so that Ca_conc time const corresponds to difpool time constnat
	scaleB=$scaleB'*0.3504'				#-- These values should allow subthreshold conditions to match. Original should work for 
	scaletau=$scaletau'/0.3504'			#-- suprathreshold.
fi
scaleB=$scaleB'/{Ca_conc_timeconst_scale}'	# Large scale value drastically increases time constant
scaletau=$scaletau'*{Ca_conc_timeconst_scale}'

if (( $use_difshell == 1 )); then
	echo Using Difshell
	scaleB='1.0' #Float
	scaletau=1.0 #Float
#	scaleB=$scaleB'*0.3504'
#	scaletau=$scaletau'/0.3504'
#	ca_concen_thickness=0.0e-6 #Float

fi

percent_highPo_SK2=0.035		# 3.5% of SK2 channels in high Po state


pi=3.1415926535
num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'

#num_somapools=1
#num_dendpools=1


#pulse_width1=0.05; pulse_level1=50.0e-9; pulse_delay2=0.05;
#pulse_width1=0.05; pulse_level1=100.0e-9; pulse_delay2=0.1;
#pulse_width1=0.05; pulse_level1=1600.0e-9; pulse_delay2=1.6; 
#pulse_width1=0.014; pulse_level1=50.0e-9; pulse_delay2=0.014; 
pulse_width1=0.014; pulse_level1=100.0e-9; pulse_delay2=0.028;
#pulse_width1=0.014; pulse_level1=200.0e-9; pulse_delay2=0.056;
#pulse_width1=0.014; pulse_level1=400.0e-9; pulse_delay2=0.112;
#pulse_width1=0.014; pulse_level1=800.0e-9; pulse_delay2=0.224;
#pulse_width1=0.014; pulse_level1=1600.0e-9; pulse_delay2=0.448;

## ****************************************** End set Script parameters ******************************************




## ****************************************** Define Script functions ******************************************

	# Take in a single bash variable and write that variable to 
	# our Neuron hoc parameter file
function wp()
{
	echo $1 = ${!1} >> ${PARAM_FILENAME}	#Use BASH indirection
	#echo $1 = ${!1}
}

	# Same as above, but special treatment for string variables
function wp_str()
{
	echo strdef $1 >> ${PARAM_FILENAME}
	echo $1 = \"${!1}\" >> ${PARAM_FILENAME}
	#echo $1 = \"${!1}\"
}

	# Genesis variable types
function wp_int()
{
	echo int $1 = ${!1} >> ${PARAM_FILENAME}	#Use BASH indirection
}

function wp_float()
{
	echo float $1 = ${!1} >> ${PARAM_FILENAME}	#Use BASH indirection
}

function wp_strgen()
{
	echo str $1 = \"${!1}\" >> ${PARAM_FILENAME}
}

function wp_text()
{
	echo ${!1} >> ${PARAM_FILENAME}
	#echo ${!1}
}


function write_all_params()
{
	echo '//Bash generated parameter file' > ${PARAM_FILENAME}
	wp_int scriptmode
	wp_int graphics_on #Integer
	wp_int use_difshell
	wp_float scale_difshell_binding_tau
	
	wp_strgen script_chan 
	
	wp_strgen readcell_file
	wp_int plot_HPo_channel
	wp_int stochastic_calcium
	wp_int plot_mode
	wp_int split_high_and_low_SK2
	
	wp_int apply_CaClamp 
	wp_int block_dend_Ca 

	
	wp_strgen force_chan 
	wp_float  force_dens 
	wp_strgen force_chan2
	wp_float  force_dens2
	wp_strgen force_chan3
	wp_float  force_dens3
	wp_strgen force_chan4
	wp_float  force_dens4_soma
	wp_float  force_dens4_dend
	wp_strgen force_chan5
	wp_float  force_dens5
	
	wp_strgen force_chan_nz 
	wp_float  force_dens_nz
	wp_strgen force_chan_nz2
	wp_float  force_dens_nz2
	wp_strgen force_chan_nz3
	wp_float  force_dens_nz3
	wp_strgen force_chan_nz4
	wp_float  force_dens_nz4
	
	wp_int disconnect_CaV_Vm
	wp_float CaV_tau
	wp_float HPo_tau
	
	wp_float ca_concen_thickness #Float
	wp_float Ca_conc_timeconst_scale
	wp_float scaleB #Float
	wp_float scaletau #Float

	
	wp_float percent_highPo_SK2
	
	wp_float pi
	wp_int num_somapools
	wp_int num_dendpools
#	wp_float num_somapools2
#	wp_float num_dendpools2

	wp_float pulse_width1
	wp_float pulse_level1
	wp_float pulse_delay2
	
	# Defined below
	wp_strgen fullname_raw #String
	wp_strgen dataoutput_path #String

}

function setup_batch()
{
	if [ $NOSAVE = 1 ]; then		# If we're not worried about saving data,
		dataoutput_path="./dataset_temp/"	# dump to currentdir
	else
		if [ -d $dataoutput_path ]; then		# Check if save directory already exists
			echo Output directory \"${dataoutput_path}\" already exists. Exiting…
			exit 0
		fi
		mkdir $dataoutput_path
		cp ./ssh_script.sh $dataoutput_path
		# cp ${PARAM_FILENAME} $dataoutput_path
	fi
	echo '% List of filenames' > ${dataoutput_path}${MATLAB_FILELIST}file.m
	echo '% List of variable names' > ${dataoutput_path}${MATLAB_VARLIST}file.m
	
	export numprocs=1
}

function run_neuron()
{
	fullname_spike=${dataoutput_path}${filename_spike}${filename_suffix}		# Generate filename for rasterplot
	echo fnamearr_spike\{${numprocs}\} = "'"${fullname_spike}"'"';' >> ${dataoutput_path}${MATLAB_FILELIST}.m		# Save filename to Matlab
	
	fullname_count=${dataoutput_path}${filename_counts}${filename_suffix}
	echo fnamearr_count\{${numprocs}\} = "'"${fullname_count}"'"';' >> ${dataoutput_path}${MATLAB_FILELIST}.m
	
	fullname_smooth=${dataoutput_path}${filename_smooth}${filename_suffix}
	echo fnamearr_smooth\{${numprocs}\} = "'"${fullname_smooth}"'"';' >> ${dataoutput_path}${MATLAB_FILELIST}.m

	write_all_params

	if [ $run_mode = 1 ]; then
		echo Opening new command window
		cmd_prefix="xterm -e"
		$cmd_prefix ${EXECPATH}${MODPATH} ${SIMPATH1}${SIMNAME1} ${SIMPATH2}${SIMNAME2} - &
	else
		echo Loading in current command window
		cmd_prefix = ""
		$cmd_prefix ${EXECPATH}${MODPATH} ${SIMPATH1}${SIMNAME1} ${SIMPATH2}${SIMNAME2} -
	fi
	
	numprocs=$(($numprocs+1))
	
#	echo 'echo filenamearr"{"'$[$numprocs + 1]'"}" = '"'"'{datafilename}fb1'"'"' >> matlab_script.m' >> main_script.g

}



function run_genesis()
{
	fullname_raw=${filename_raw}${filename_suffix}		# Generate filename for rasterplot
	echo ${MATLAB_FILELIST}\{${numprocs}\} = "'"${fullname_raw}"'"';' >> ${dataoutput_path}${MATLAB_FILELIST}file.m		# Save filename to Matlab
	echo ${MATLAB_VARLIST}\{${numprocs}\} = "'"${filename_suffix}"'"';' >> ${dataoutput_path}${MATLAB_VARLIST}file.m		# Save variable name to Matlab
																															# for later plotting

	write_all_params


	if [ $run_mode = 1 ]; then
		echo Loading in current command window
		cmd_prefix=""
		$cmd_prefix ${GEN_EXEC} ${GEN_SIMNAME}
	elif [ $run_mode = 2 ]; then
		echo Opening new command window
		cmd_prefix="xterm -e"
		$cmd_prefix ${GEN_EXEC} ${GEN_SIMNAME} &
	elif [ $run_mode = 3 ]; then
		echo Running in SSH on Appliedchaos
		cmd_prefix=""
		ssh appliedchaos.asu.edu "export PATH=$PATH; export TERM=$TERM; cd $currpath; $cmd_prefix ${GEN_EXEC} ${GEN_SIMNAME} > deleteme.out" &
	elif [ $run_mode = 4 ]; then
		cmd_prefix=""
#		if (( $numprocs <= 10 )); then
#			echo Running in SSH on Dominique 1; export SERVER="dominique1.asu.edu"
#		elif (( $numprocs <= 20 )); then
#			echo Running in SSH on Dominique 2; export SERVER="dominique2.asu.edu"
#		elif (( $numprocs <= 30 )); then
#			echo Running in SSH on Dominique 3; export SERVER="dominique3.asu.edu"
#		elif (( $numprocs <= 40 )); then
#			echo Running in SSH on Dominique 4; export SERVER="dominique4.asu.edu"
#		elif (( $numprocs <= 45 )); then
#			echo Running in SSH on Dominique HEAD; export SERVER="dominique.asu.edu"
#		elif (( $numprocs <= 50 )); then
#			echo Running in SSH on Dominique 1; export SERVER="dominique1.asu.edu"
#		elif (( $numprocs <= 55 )); then
#			echo Running in SSH on Dominique 2; export SERVER="dominique2.asu.edu"
#		elif (( $numprocs <= 60 )); then
#			echo Running in SSH on Dominique 3; export SERVER="dominique3.asu.edu"
#		elif (( $numprocs > 60 )); then
#			echo Running in SSH on Dominique 4; export SERVER="dominique4.asu.edu"
#		fi
		if (( $numprocs <= 15 )); then
			echo Running in SSH on Dominique 1; export SERVER="dominique1.asu.edu"
		elif (( $numprocs <= 20 )); then
			echo Running in SSH on Dominique HEAD; export SERVER="dominique.asu.edu"
		elif (( $numprocs <= 1000 )); then
			echo Running in SSH on Dominique 1; export SERVER="dominique1.asu.edu"
		fi
		
		ssh $SERVER "export PATH=$PATH; export TERM=$TERM; cd $currpath; $cmd_prefix ${GEN_EXEC} ${GEN_SIMNAME} > deleteme.out" &
	fi
	
	
	numprocs=$(($numprocs+1))
	
#	echo 'echo filenamearr"{"'$[$numprocs + 1]'"}" = '"'"'{datafilename}fb1'"'"' >> matlab_script.m' >> main_script.g

}


## ****************************************** Start Script ***************************************************

	## Neuron Setup
SIMPATH1="/Applications/NEURON-7.1/nrn/share/nrn/"
SIMNAME1="lib/hoc/nrngui.hoc"
SIMPATH2="./"
SIMNAME2="50knet_dav.hoc"
MODFILE_HOME="mod/umac/special"
MODFILE_REMOTE="mod_MB/umac/special"
EXECPATH="./"
if [ $1 = 0 ]; then MODPATH=$MODFILE_HOME
else MODPATH=$MODFILE_REMOTE
fi


	## Genesis Setup
GEN_EXEC="cagenesis"
GEN_SIMNAME="main_script.g"



	## Files
PARAM_FILENAME="ssh_params.g"
MATLAB_FILELIST="fnamelist"
MATLAB_VARLIST="varnamelist"
	## Simflags
run_mode=1
NOSAVE=0
dataoutput_path="./Paper1_d2wholecell"
if (( $plot_mode==-1 )); then dataoutput_path=$dataoutput_path"_sing/"
else dataoutput_path=$dataoutput_path"/"; fi		## Append final forward slash
filename_suffix='_default'
filename_spike=""
filename_counts=""
filename_smooth=""
filename_raw="do"


	## Turn off graphics if running remotely via SSH
if ([ $run_mode = 3 ]||[ $run_mode = 4 ]); then graphics_on=0; fi


if [ $2 = 0 ]; then		# Run under default settings
	NOSAVE=1;
	setup_batch
	filename_suffix="def";
	if (( $prox_AHP == 1 )); then filename_suffix="proxAHP"; fi
	if (( $use_difshell == 1 )); then filename_suffix="difshell"; fi
	
	run_genesis
fi

if [ $2 = 1 ]; then		# Run under default settings
	NOSAVE=0;
	setup_batch
	
	scriptmode=2; filename_raw="doVClamp_"
	script_chan="allmarkov"; num_somapools=1; num_dendpools=1;filename_suffix="pools1"; run_genesis; sleep 10
	script_chan="allmarkov"; num_somapools=2; num_dendpools=2;filename_suffix="pools2"; run_genesis; sleep 10
	script_chan="allmarkov"; num_somapools=4; num_dendpools=4;filename_suffix="pools4"; run_genesis; sleep 10
	script_chan="allmarkov"; num_somapools=8; num_dendpools=8;filename_suffix="pools8"; run_genesis; sleep 10
	script_chan="allmarkov"; num_somapools=30; num_dendpools=20;filename_suffix="pools30"; run_genesis; sleep 10
	script_chan="allmarkov"; num_somapools=45; num_dendpools=30;filename_suffix="pools45"; run_genesis; sleep 10
	script_chan="allmarkov"; num_somapools=69; num_dendpools=39;filename_suffix="pools69"; run_genesis; sleep 10
	
#		# Changing pool size does not have any effect when deterministic
	script_chan="CaV13"; num_somapools=1; num_dendpools=1; filename_suffix="CaClamp_pool100"; run_genesis; sleep 10
	script_chan="CaV13"; num_somapools=69; num_dendpools=39; filename_suffix="CaClamp_pool1"; run_genesis; sleep 10
		# Ca2+ markov kinetics do have a very profound effect when multiple pools are used
	script_chan="allmarkov"; filename_suffix="slice_allmrkv"; run_genesis; sleep 10
	script_chan="CaV13"; filename_suffix="slice_CaV13"; run_genesis; sleep 10
	
	scriptmode=1; filename_raw="doIClamp_"
	script_chan="allmarkov"; num_somapools=69; num_dendpools=39;filename_suffix="def"; run_genesis; sleep 10
	script_chan="detSK2"; num_somapools=69; num_dendpools=39;filename_suffix="detSK2"; run_genesis; sleep 10
	
	scriptmode=3; filename_raw="doPID_"
	script_chan="allmarkov"; num_somapools=69; num_dendpools=39;filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba"; num_somapools=69; num_dendpools=39;filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba"; num_somapools=69; num_dendpools=39;filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13"; num_somapools=69; num_dendpools=39;filename_suffix="Ca"; run_genesis; sleep 10
	script_chan="SK2"; num_somapools=69; num_dendpools=39;filename_suffix="SK2"; run_genesis; sleep 10
	
fi


if [ $2 = 2 ]; then		# Trial PID recording
	NOSAVE=1;
	setup_batch
	scriptmode=3; filename_suffix="def";
	script_chan="CaV13"; num_somapools=69; num_dendpools=39;filename_suffix="Ca"; run_genesis; sleep 10
fi


if [ $2 = 3 ]; then		# New mode - Try various SK2 channel densities, disconnect CaV
	NOSAVE=0;
	setup_batch

	disconnect_CaV_Vm=1
	prox_AHP=1
								# Force_chan_nz entries
	force_chan_nz='CaV13'
	if (( $prox_AHP==1 )); then force_dens_nz=1.5;  else force_dens_nz=0.60; fi	# Use higher densities if restrict Ca to prox dendrites only
	force_chan_nz2='SK2'
	if (( $prox_AHP==1 )); then force_dens_nz2=48.0;  else force_dens_nz2=12.0; fi
	force_chan_nz3="sAHP"
	if (( $prox_AHP==1 )); then force_dens_nz3=3.0;  else force_dens_nz3=1.01; fi
	force_chan_nz4="HPo_SK2"
	if (( $prox_AHP==1 )); then force_dens_nz4=$force_dens_nz2;  else force_dens_nz4=$force_dens_nz2; fi

	force_chan3='KSDiba'
	force_dens3=0.0
	force_chan4='NaDiba'
	force_dens4_soma=240*2/3
	force_dens4_dend=40*2/3
	force_chan5='leakDiba'
	force_dens5=0.72

	if (( $prox_AHP == 1 )); then scaleB='1.0/1000*3.75/{force_dens_nz}'; 
	else scaleB='0.8/1000*1.75*2.68/{force_dens_nz}' #Float --> scale by inverse of CaV13 density to keep [Ca] constant
	fi
	
	pi=3.1415926535
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'

	force_chan_nz2='SK2'
	force_dens_nz2=24.0
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
#	script_chan="sAHP";filename_suffix="sAHP"; run_genesis; sleep 10

	force_chan_nz2='SK2'
	force_dens_nz2=36.0
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
#	script_chan="sAHP";filename_suffix="sAHP"; run_genesis; sleep 10


	force_chan_nz2='SK2'
	force_dens_nz2=48.0
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
	script_chan="sAHP";filename_suffix="sAHP"; run_genesis; sleep 10
	
	force_chan_nz2='SK2'
	force_dens_nz2=60.0
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
	script_chan="sAHP";filename_suffix="sAHP"; run_genesis; sleep 10

#	
#	
#	script_chan="SK2#";filename_suffix="SK2"; run_genesis; sleep 10

fi



if [ $2 = 4 ]; then		# New mode - Try various CaV channel densities, block SK2
	NOSAVE=0;
	setup_batch

	disconnect_CaV_Vm=0
	prox_AHP=1


	force_chan_nz2='SK2'
	force_dens_nz2=0.0;
	force_chan_nz3="sAHP"
	force_dens_nz3=0.0;
	force_chan3='KSDiba'
	force_dens3=0.0
	force_chan4='NaDiba'
	force_dens4_soma=240*2/3
	force_dens4_dend=40*2/3
	force_chan5='leakDiba'
	force_dens5=0.72

	if (( $prox_AHP == 1 )); then scaleB='1.0/1000*3.75/{force_dens_nz}'; 
	else scaleB='0.8/1000*1.75*2.68/{force_dens_nz}' #Float --> scale by inverse of CaV13 density to keep [Ca] constant
	fi
	
	pi=3.1415926535
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'

	force_chan_nz='CaV13'
	force_dens_nz=0.5
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
	
	force_chan_nz='CaV13'
	force_dens_nz=1.0
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
	
	force_chan_nz='CaV13'
	force_dens_nz=1.5
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
	
	force_chan_nz='CaV13'
	force_dens_nz=2.0
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10
	
	force_chan_nz='CaV13'
	force_dens_nz=2.5
	scriptmode=1; filename_raw="do"$numprocs"_IClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	scriptmode=3; filename_raw="do"$numprocs"_PID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="CaV13";filename_suffix="CaV13"; run_genesis; sleep 10

fi


if [ $2 = 5 ]; then		# Run under default settings
	NOSAVE=1;
	setup_batch
	
	scriptmode=3; filename_raw="doPID_"
	script_chan="allmarkov"; force_chan='CaV13'; force_dens=0.10; force_chan2='SK2'; force_dens2=4.0; filename_suffix="defvSK1"; run_genesis; sleep 10

fi




if [ $2 = 6 ]; then		# Run Diba's original model

	force_chan='CaV13'		# Disable new channels, and enable old Diba channels
	force_dens=0.0
	force_chan2='SK2'
	force_dens2=0.0	
	force_chan3='KSDiba'
	force_dens3=90.0
	force_chan4='Na#'
	force_dens4_soma=240
	force_dens4_dend=40
	scaleB='0.8/1000'	# Some random value (shouldn't matter since no Ca)
	num_somapools=1
	num_dendpools=1


	NOSAVE=0;
	setup_batch

	scriptmode=1; filename_raw="doIClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	
	scriptmode=2; filename_raw="doVClamp_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10

	scriptmode=3; filename_raw="doPID_"
	script_chan="allmarkov";filename_suffix="def"; run_genesis; sleep 10
	script_chan="NaDiba";filename_suffix="Na"; run_genesis; sleep 10
	script_chan="KADiba";filename_suffix="KA"; run_genesis; sleep 10
	script_chan="KSDiba";filename_suffix="KS"; run_genesis; sleep 10
	script_chan="leakDiba";filename_suffix="leak"; run_genesis; sleep 10

fi



if [ $2 = 7 ]; then		# Vary values of CaV13 cutoff frequency
	NOSAVE=0;
	setup_batch
	
	force_chan4='Na#'
	force_dens4_soma=240*2/3
	force_dens4_dend=40*2/3

	readcell_file="d_s1d11_KS_HPo.p"
	plot_HPo_channel=1

	scriptmode=2; filename_raw="do"$numprocs"_VClamp_"
	script_chan="allmarkov";filename_suffix="def"; CaV_tau=0.0045; run_genesis; sleep 10
	script_chan="allmarkov";filename_suffix="tau35"; CaV_tau=0.0035; run_genesis; sleep 10
	script_chan="allmarkov";filename_suffix="tau25"; CaV_tau=0.0025; run_genesis; sleep 10
	script_chan="allmarkov";filename_suffix="tau15"; CaV_tau=0.0015; run_genesis; sleep 10
	script_chan="allmarkov";filename_suffix="tau05"; CaV_tau=0.0005; run_genesis; sleep 10
fi







######################################## Paper 1 Scripts ########################################

if [ $2 = 8 ]; then		# New mode - Try various SK2 channel densities, disconnect CaV
	NOSAVE=0;
	setup_batch
	
								# Force_chan_nz entries
	force_chan_nz='CaV13'
	if (( $prox_AHP==1 )); then force_dens_nz=1.25;  else force_dens_nz=0.60; fi	# Use higher densities if restrict Ca to prox dendrites only
	force_chan_nz2='SK2'
	if (( $prox_AHP==1 )); then force_dens_nz2=60.0;  else force_dens_nz2=12.0; fi
	force_chan_nz3="sAHP"
	if (( $prox_AHP==1 )); then force_dens_nz3=2.6;  else force_dens_nz3=1.01; fi
	force_chan_nz4="HPo_SK2"
	if (( $prox_AHP==1 )); then force_dens_nz4=$force_dens_nz2;  else force_dens_nz4=$force_dens_nz2; fi
	
	pi=3.1415926535
	use_paper_1=1
	plot_HPo_channel=1
	plot_mode=1

	############################## No buffer ##############################
	use_difshell=0
	if (( $use_paper_1 == 1 )); then
		readcell_file="d_s1d11_noNa.p"
		if (( $use_difshell == 1 )); then
			readcell_file="d_s1d11_noNa_difpool.p"
		fi
	fi
	############ Set ScaleB and Tau ############
	if (( $prox_AHP == 1 )); then scaleB='1.0/1000*3.75/{force_dens_nz}'; 
	else scaleB='0.8/1000*1.75*2.68/{force_dens_nz}' #Float --> scale by inverse of CaV13 density to keep [Ca] constant
	fi
	scaletau=1.0/4 #Float
	ca_concen_thickness=1.0e-6 #Float
	Ca_conc_timeconst_scale=1.0
	if (( $use_paper_1 == 1 )); then		#-- Modify tau and B so that Ca_conc time const corresponds to difpool time constnat
		scaleB=$scaleB'*0.3504'				#-- These values should allow subthreshold conditions to match. Original should work for 
		scaletau=$scaletau'/0.3504'			#-- suprathreshold.
	fi
	scaleB=$scaleB'/{Ca_conc_timeconst_scale}'	# Large scale value drastically increases time constant
	scaletau=$scaletau'*{Ca_conc_timeconst_scale}'
	############ End Set ScaleB and Tau ############
	
		
	
	# Deterministic model
	percent_highPo_SK2=0.000331284855205		# This % of SK2 channels in high Po state
	stochastic_calcium=0
	num_somapools=1
	num_dendpools=1
	scriptmode=2; 
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="HH"; run_genesis; sleep 10
	
	# Stochastic model
	percent_highPo_SK2=0.001803343698470		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools=1
	num_dendpools=1
	scriptmode=2;
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="markov"; run_genesis; sleep 10
	
	# Pooled stochastic model
	percent_highPo_SK2=0.043953145346348		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'
	scriptmode=2;
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="pool_1"; run_genesis; sleep 10
	
	
	
	####################### Remove SK2_h
	# Deterministic model
	percent_highPo_SK2=0.00		# This % of SK2 channels in high Po state
	stochastic_calcium=0
	num_somapools=1
	num_dendpools=1
	scriptmode=2; 
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="HH"; run_genesis; sleep 10
	
	# Stochastic model
	percent_highPo_SK2=0.00		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools=1
	num_dendpools=1
	scriptmode=2;
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="markov"; run_genesis; sleep 10
	
	# Pooled stochastic model
	percent_highPo_SK2=0.00		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'
	scriptmode=2;
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="pool_1"; run_genesis; sleep 10
	##########################
	
	
	# Pooled stochastic model - play with tau
	stochastic_calcium=1
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'
	scriptmode=2;
	percent_highPo_SK2=0.043953145346348		# This % of SK2 channels in high Po state
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	Ca_conc_timeconst_scale=0.1; script_chan="allmarkov";filename_suffix="pool_01"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	Ca_conc_timeconst_scale=1.0; script_chan="allmarkov";filename_suffix="pool_1"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	Ca_conc_timeconst_scale=3.0; script_chan="allmarkov";filename_suffix="pool_3"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	Ca_conc_timeconst_scale=9.0; script_chan="allmarkov";filename_suffix="pool_9"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	Ca_conc_timeconst_scale=100.0; script_chan="allmarkov";filename_suffix="pool_100"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	Ca_conc_timeconst_scale=1000.0; script_chan="allmarkov";filename_suffix="pool_1000"; run_genesis; sleep 10
	Ca_conc_timeconst_scale=1.0; 
	
	plot_mode=-1;
	script_chan="allmarkov"; scriptmode=8;
	num_somapools=1
	num_dendpools=1
	percent_highPo_SK2=0.043953145346348		# This % of SK2 channels in high Po state
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=75.0e-9; pulse_delay2=0.014; filename_suffix="pulse1"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=150.0e-9; pulse_delay2=0.028; filename_suffix="pulse2"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=300.0e-9; pulse_delay2=0.056; filename_suffix="pulse4"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi	
#	pulse_width1=0.014; pulse_level1=600.0e-9; pulse_delay2=0.112; filename_suffix="pulse8"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=1200.0e-9; pulse_delay2=0.224; filename_suffix="pulse16"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=2400.0e-9; pulse_delay2=0.448; filename_suffix="pulse32"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=4800.0e-9; pulse_delay2=0.896; filename_suffix="pulse64"; run_genesis; sleep 10
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	pulse_width1=0.014; pulse_level1=9600.0e-9; pulse_delay2=1.792; filename_suffix="pulse128"; run_genesis; sleep 10


	plot_mode=-1;
	# Deterministic model
	percent_highPo_SK2=0.000331284855205		# This % of SK2 channels in high Po state
	stochastic_calcium=0
	num_somapools=1
	num_dendpools=1
	scriptmode=2; 
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="HH"; run_genesis; sleep 10
	
	# Stochastic model
	percent_highPo_SK2=0.001803343698470		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools=1
	num_dendpools=1
	scriptmode=2;
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="markov"; run_genesis; sleep 10
	
	# Pooled stochastic model
	percent_highPo_SK2=0.043953145346348		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'
	scriptmode=2;
	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="markov_pool_1"; run_genesis; sleep 10
	

	plot_mode=1;	
# Look at Afterhyperpolarization
	# Unpooled
	percent_highPo_SK2=0.043953145346348		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools=1
	num_dendpools=1
	scriptmode=5; 
	filename_raw="do"$numprocs"_CaClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="AHP"; run_genesis; sleep 10
	
	# Pooled
	percent_highPo_SK2=0.043953145346348		# This % of SK2 channels in high Po state
	stochastic_calcium=1
	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'
	scriptmode=5; 
	filename_raw="do"$numprocs"_CaClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
	script_chan="allmarkov";filename_suffix="AHP_pooled"; run_genesis; sleep 10

	
	############################## End no buffer ##############################

	############################## Buffer ##############################
	# Buffered & pooled stochastic model
#	use_difshell=1
#	if (( $use_difshell == 1 )); then
#		echo Using Difshell
#		scaleB='1.0' #Float
#		scaletau=1.0 #Float
#	fi
#	if (( $use_difshell == 1 )); then
#		readcell_file="d_s0d1_difpool.p"
#	fi
#
#	percent_highPo_SK2=0.025531		# 3.5% of SK2 channels in high Po state
#	stochastic_calcium=1
#	num_somapools='{  round {4.0*{pi}*{pow {1.595759932e-05/2} 2}*{force_dens_nz} / 20.0e-12}}'	#Ensures that there is only one Ca channel per pool!
#	num_dendpools='{  round {{pi}*3.99999999e-06*3.636362817e-05*{force_dens_nz} / 20.0e-12}}'
##	num_somapools=1;
##	num_dendpools=1
#	scriptmode=2;

#	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	scale_difshell_binding_tau=0.1; script_chan="allmarkov";filename_suffix="buff"; run_genesis; sleep 10
#	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	scale_difshell_binding_tau=0.3; script_chan="allmarkov";filename_suffix="buff"; run_genesis; sleep 10
#	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	scale_difshell_binding_tau=1.0; script_chan="allmarkov";filename_suffix="buff"; run_genesis; sleep 10
#	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	scale_difshell_binding_tau=3.0; script_chan="allmarkov";filename_suffix="buff"; run_genesis; sleep 10
#	filename_raw="do"$numprocs"_VClamp_"; if (( $plot_mode==-1 )); then filename_raw=$filename_raw"sing_"; fi
#	scale_difshell_binding_tau=10.0; script_chan="allmarkov";filename_suffix="buff"; run_genesis; sleep 10
	############################## End buffer ##############################


fi


######################################## End Paper 1 Scripts ########################################



