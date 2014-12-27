// genesis 2.3
// requires objects GENgap
//
//
// establishs gap junction connections

//==================================================================
// connections
//==================================================================

// This is a supporting function (GENESIS requires it to be first). Scroll down to gapconnect_general....
function pickrandom (elementlist)			// Picks a random element from a list

int num_choices
int randn
int currjunc
str cjunc

	num_choices = {countelementlist {elementlist}}		// First, count the number of potential junction sites
	randn = { trunc {rand 1 { {num_choices} + 1 }} }	// Random number between 1 and num_choices

	currjunc = 1
	foreach cjunc ({el {elementlist}})		// Loop until we reach the randomly chosen compartment
		if (randn == currjunc)
			break
		end
		currjunc = {currjunc} + 1
	end
	return cjunc
end




function gapconnect_general (source, dest, junc_dummy, juncs_per_cell, input_function_name)

// A generalized version of the volume connect command, specifically for gap junctions
// Takes in a list of source and destination elements, the name of the gap junction dummy
// object (marks the compartments that are elligible to receive gap junctions), and the
// number of junctions per cell. Also supply the function name that will actually add the
// gap junction.
//
// Then, this function calls "input_function_name" and specifies at most "juncs_per_cell" connections
// between each and every pair of cells in "source" and "dest"
//
//EXAMPLE:
//See exampleScripts_Syn/gap_junctions_m.g for example code.


str cs	//current source element
str cd // current dest element

int numgapjuncs
int num_source
int num_dest
int num_source_cmpt
int num_dest_cmpt
int i

str csoma
str dsoma
str sourcecell
str sourcejunc
str destcell
str destjunc





for (i = 1; i <= {juncs_per_cell}; i = i + 1)

	//restore the notadded flag to each cell, so that we can start a new round of adding gap junctions
	foreach cs ({el {source}})
		csoma = { {cs} @ "/soma"}
		// Check to see how many active gap junctions this cell presently has
		if (!{exists {csoma} numgapjuncs})	// Create gap junction counter field in the soma of each cell
			addfield {csoma} numgapjuncs
			setfield {csoma} numgapjuncs 0
		end

		numgapjuncs = {getfield {csoma} numgapjuncs}

		if (numgapjuncs < juncs_per_cell)
			if (!{exists {csoma}/notadded})
				create neutral {csoma}/notadded
			end
		else
			if ( {exists {csoma}/notadded} )
				delete {csoma}/notadded
			end
		end
	end

	//restore the notadded flag to each cell, so that we can start a new round of adding gap junctions
	foreach cd ({el {dest}})
		dsoma = { {cd} @ "/soma"}
		// Check to see how many active gap junctions this cell presently has
		if (!{exists {dsoma} numgapjuncs})	// Create gap junction counter field in the soma of each cell
			addfield {dsoma} numgapjuncs
			setfield {dsoma} numgapjuncs 0
		end

		numgapjuncs = {getfield {dsoma} numgapjuncs}

		if (numgapjuncs < juncs_per_cell)
			if (!{exists {dsoma}/notadded})
				create neutral {dsoma}/notadded
			end
		else
			if ( {exists {dsoma}/notadded} )
				delete {dsoma}/notadded
			end
		end
	end

	// Count available source elements
	num_source = {countelementlist {source}/soma/notadded }	//Number of source cells available
	num_dest = {countelementlist {dest}/soma/notadded }
	num_source_cmpt = {countelementlist {source}/#/{junc_dummy} }	//Number of free gap junctions
	num_dest_cmpt = {countelementlist {dest}/#/{junc_dummy} }
	//echo {i}

	while (num_source >=1 && num_dest >=1 && num_source_cmpt>=1 && num_dest_cmpt>=1)	// Here we add one connection to each cell
		//echo numsource {num_source} numdest {num_dest}

		// Pick a random appropriate source cell
		sourcecell = { el { pickrandom {source}/soma/notadded }/../.. }
		//echo Chosen source cell: {source}
		

		// Identify a random compartment in source cell
		sourcejunc = { el { pickrandom {sourcecell}/#/{junc_dummy} }/.. }

		// Clean up source cell
		move {sourcejunc}/{junc_dummy} {sourcejunc}/{junc_dummy}_2
		setfield {sourcecell}/soma numgapjuncs {{getfield {sourcecell}/soma numgapjuncs} + 1} // Increment number of gap junctions
		delete {sourcecell}/soma/notadded			// No more gap junctions can be added during this while loop

		// Pick a random appropriate destination cell
		destcell = { el { pickrandom {dest}/soma/notadded }/../.. }
	
		// Pick a random compartment in dest cell
		destjunc = { el { pickrandom {destcell}/#/{junc_dummy} }/.. }

		// Clean up destination cell
		move {destjunc}/{junc_dummy} {destjunc}/{junc_dummy}_2
		setfield {destcell}/soma numgapjuncs {{getfield {destcell}/soma numgapjuncs} + 1} // Increment the number of junctions in dest cell
		delete {destcell}/soma/notadded


		callfunc {input_function_name} {sourcejunc}/{junc_dummy}_2 {destjunc}/{junc_dummy}_2
		//echo callfunc {input_function_name} {sourcejunc}/{junc_dummy}_2 {destjunc}/{junc_dummy}_2

		// Count available source elements
		num_source = {countelementlist {source}/soma/notadded }
		num_dest = {countelementlist {dest}/soma/notadded }

	end	// Of while loop

end // Of for loop


foreach cd ({el { {source} @ "," @ {dest} } })
	dsoma = { {cd} @ "/soma"}

	// Destroy the evidence
	if ( {exists {dsoma}/notadded} )
		//delete {dsoma}/notadded
		//echo deleting {dsoma}/notadded
	end


end	//foreach

end


