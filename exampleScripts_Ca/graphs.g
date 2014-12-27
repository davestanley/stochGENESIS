//genesis
//*************************************************************************
//Adam Franklin Strassberg
//March 15, 1992
//Modified by Dave

//Graphing Functions and Graph Objects
//*************************************************************************



//*************************************************************************
//Create Graph Objects

//Initialize Graphics Clock
//setclock 1 0.1

//Object to hold all four graphs
create xform /graphs [10,550,1000,550] -notitle
create xlabel /graphs/label [10,0,98%,25] -label "Patch of Membrane"
str gpath

//Membrane Potential Graph
gpath = "/graphs/Vm"
create xgraph {gpath} [10,10:label.bottom,49%,45%] -title \
    "membrane potential"
setfield {gpath} XUnits "t (sec)" YUnits "voltage (V)"
setfield {gpath} xmax 0.100 ymin -20 ymax 120
//useclock {gpath} 1

//Injection Neurotransmitter Graph
gpath = "/graphs/injTrans"
create xgraph {gpath}  [10,10:Vm.bottom,49%,45%] \
	-title  "neurotransmitter injected"
setfield {gpath} XUnits "t (sec)" YUnits "amount (Mols/L)"
setfield {gpath} xmax 0.100 ymin -0.5 ymax 0.5
//useclock {gpath} 1

    //Channel Conductance Graph
gpath = "/graphs/Gk"
create xgraph {gpath} [10:Vm.right,10:label.bottom,49%,45%]  \
    -title "channel conductance"
setfield {gpath} XUnits "t (sec)" YUnits "conductance (S)"
setfield {gpath} xmax 0.100 ymin 0.0 ymax 500.0
//useclock {gpath} 1

//Channel Currents Graph
gpath = "/graphs/Ik"
create xgraph {gpath} [10:injTrans.right,10:Gk.bottom,49%,45%] -title  \
    "channel current"
setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 0.100 ymin -10000.0 ymax 10000.0
//useclock {gpath} 1

xshow /graphs
//*************************************************************************

