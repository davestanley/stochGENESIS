


function volumeconnect_general (source, dest, rel, sourceellipse, sx1, sy1, sz1, sx2, sy2, sz2, destellipse, dx1, dy1, dz1, dx2, dy2, dz2, proba, input_function_name)

// A generalized version of the volume connect command
// Input: same as volume connect, and then also include a function name: "input_function_name".
//		This function should provide the code for the specific type of connection
//		you wish to make.
//
// Therefore, the volumeconnect_general function identifies exactly which connections
//	to make from a list of possible source and destination elements. These connections
//	are based on geometry and probability values defined through s and d variables.
//	Set source/dest ellipse variables to 1 to use ellipse; set rel to 1 to use relative.
//	These features work the same as in the standard volumeconnect command.
//
// The final task, then, is to call the input_function_name. This function should expect arguments
// for source and destination compartments, and should establish a connection between these two.


str cs	//current source element
str cd // current dest element
float sx
float sy
float sz
float dx
float dy
float dz
float randvar
int insource
int indest
int connect

//echo {source}
//echo {dest}
cs = 0
foreach cs ({el {source}})
	//echo For loop Cs {cs} Cd {cd}
	cd = 0
	foreach cd ({el {dest}})

		// Extract the coordinates of the current source and destination elements
		sx = {getfield {cs} x}
		sy = {getfield {cs} y}
		sz = {getfield {cs} z}
		if ( rel == 0 )
			dx = {getfield {cd} x}
			dy = {getfield {cd} y}
			dz = {getfield {cd} z}
		else
			dx = {getfield {cd} x} - sx
			dy = {getfield {cd} y} - sy
			dz = {getfield {cd} z} - sz
		end


		// Check to see whether the current source element lies within the specified boundaries
		insource = 0
		if ( sourceellipse == 0 )

			if ( sx>=sx1 && sy>=sy1 && sz>=sz1 && \
			     sx<=sx2 && sy<=sy2 && sz<=sz2 )
				insource = 1
			end
		else
			if ( (({sx}-{sx1})/{sx2})**2 + (({sy}-{sy1})/{sy2})**2 + (({sz}-{sz1})/{sz2})**2 <= 1 )
				insource = 1
			end
		end


		// Check to see whether the current source element lies within the specified boundaries
		indest = 0
		if ( destellipse == 0 )
			if ( dx>=dx1 && dy>=dy1 && dz>=dz1 && \
			     dx<=dx2 && dy<=dy2 && dz<=dz2 )
				indest = 1
			end
		else
			if ( (({dx}-{dx1})/{dx2})**2 + (({dy}-{dy1})/{dy2})**2 + (({dz}-{dz1})/{dz2})**2 <= 1 )
				indest = 1
			end
		end

		// If A) both the source and destination elements are elligable for connection
		// and B) if they pass the probability test, then set up connection
		//echo {cs} {cd} {insource} {indest} {proba}
		randvar = {rand 0 1}
		if ( insource==1 && indest==1 && randvar<=proba ) 
			//echo {input_function_name} {cs} {cd} randvar<={proba}
			callfunc {input_function_name} {cs} {cd}
		end

	end
end


end



function volumeweight_general (src, dest, fixed, uniform)	//Standard form for volumeweight
	str curr_src
	str curr_dest
	str dest_list
	int i
	int num_msg
	float final_weight


	//First, apply weightings to all standard synapses
	foreach curr_src ({el {src}})
		if ( {exists {curr_src} inject} )		// Source is a compartment. Therefore, look @ sub compartment
			volumeweight {curr_src}/##[TYPE=spikegen] {dest} -fixed {fixed} -uniform {uniform}
		elif ( {exists {curr_src} state} )	// Source is a randomspike element
			volumeweight {curr_src} {dest} -fixed {fixed} -uniform {uniform}
		end
	end

	foreach curr_src ({el {src}})	//Look through the outgoing messages of each source element
		num_msg = {getmsg {curr_src} -count -outgoing}
		for (i=0;i<{num_msg};i=i+1)
			curr_dest = {getmsg {curr_src} -outgoing -destination {i}}
			if ( {exists {curr_dest}/.. Nt} )	//Make sure it's a markov element
				foreach dest_list ({el {dest}})
					if ({el {curr_dest}/../..} == {el {dest_list}/..}) //Make sure it's in the destination list
						final_weight = { {fixed} + {rand -{uniform} {uniform}} }
						//echo setfield {curr_dest}/.. Nt {getfield {curr_dest}/.. Nt} * {final_weight}
						setfield {curr_dest}/.. Nt {{getfield {curr_dest}/.. Nt} * {final_weight}}

					end
				end
			end
		end
	end
end

