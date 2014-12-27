


echo $scriptmode >> sim_script_temp.g
echo $block_dend_Ca >> sim_script_temp.g
echo $cellnum >> sim_script_temp.g
echo $force_chan >> sim_script_temp.g
echo $force_dens >> sim_script_temp.g
echo $force_chan_nz >> sim_script_temp.g
echo $force_dens_nz >> sim_script_temp.g
echo $scaleB >> sim_script_temp.g
echo $scaletau >> sim_script_temp.g
echo $ca_concen_thickness >> sim_script_temp.g


echo 'main_script' >> sim_script_temp.g
#echo 'exit' >> sim_script_temp.g
#ssh appliedchaos.asu.edu "export PATH=$PATH; export TERM=$TERM; cd $currpath; cagenesis sim_script_temp.g > deleteme.out" &
cagenesis sim_script_temp.g

echo Currpath = $currpath
#sleep 5







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


