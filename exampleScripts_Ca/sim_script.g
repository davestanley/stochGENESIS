

int node = 1

if (node == 1)
	deleteall -force; int scriptmode = 1; str scriptorder = "a"; str script_chan = "Ca"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "b"; str script_chan = "Na"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "c"; str script_chan = "K_DR"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
elif (node == 2)
	deleteall -force; int scriptmode = 1; str scriptorder = "d"; str script_chan = "K_A"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "e"; str script_chan = "K_C"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "f"; str script_chan = "K_AHP"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
elif (node == 3)
	deleteall -force; int scriptmode = 1; str scriptorder = "g"; str script_chan = "allmarkov"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "h"; str script_chan = "allmarkov"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "i"; str script_chan = "Ca"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 1; str scriptorder = "j"; str script_chan = "K_AHP"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script

elif (node == 4)
	deleteall -force; int scriptmode = 1; str scriptorder = "k"; str script_chan = "allmarkov_highCa"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
	
	deleteall -force; int scriptmode = 2; str scriptorder = "e"; str script_chan = "K_C"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 2; str scriptorder = "f"; str script_chan = "K_AHP"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
elif (node == 5)
	deleteall -force; int scriptmode = 2; str scriptorder = "g"; str script_chan = "allmarkov"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 2; str scriptorder = "h"; str script_chan = "allmarkov"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
	
	
elif (node == 6)
	deleteall -force; int scriptmode = 3; str scriptorder = "a"; str script_chan = "Ca"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "b"; str script_chan = "Na"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "c"; str script_chan = "K_DR"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
elif (node == 7)
	deleteall -force; int scriptmode = 3; str scriptorder = "d"; str script_chan = "K_A"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "e"; str script_chan = "K_C"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "f"; str script_chan = "K_AHP"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
elif (node == 8)
	deleteall -force; int scriptmode = 3; str scriptorder = "g"; str script_chan = "allunblkd"; int apply_CaClamp = 0; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "h"; str script_chan = "allunblkd"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "i"; str script_chan = "Ca"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
elif (node == 9)
	deleteall -force; int scriptmode = 3; str scriptorder = "j"; str script_chan = "K_AHP"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
	deleteall -force; int scriptmode = 3; str scriptorder = "k"; str script_chan = "K_C"; int apply_CaClamp = 1; int block_dend_Ca = 1; main_script
end
	
	
exit
	
