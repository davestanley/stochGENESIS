


Available Binaries:
Pre-compiled versions of stochGENESIS on 64-bit Linux and OS X operating systems are available in the bin_linux and bin_Mac folders, respectively.

To Compile:
Alternatively, if you wish to compile yourself, follow the instructions in “Customizing GENESIS” section of the GENESIS 2.3 reference manual (http://www.genesis-sim.org/GENESIS/Hyperdoc/Manual-21.html).

To run:
Change to the appropriate binary directory and type ./cagenesis (after running ./binsetup). You can optionally add the binary directory to your path.

Example code:
There are two example scripts, contained in the folders exampleScripts_Ca and exampleScripts_Syn, highlighting the use of stochastic voltage/calcium gated and synaptic channels, respectively.

To run the exampleScripts_Ca code, change to exampleScripts_Ca and enter
$ cagenesis main_script.g

To run the exampleScripts_Syn code, change to exampleScripts_Syn and enter
$ cagenesis main_m.g

To specifically see example code for implementing stochastic voltage gated ion channels, see exampleScripts_Ca/markov_chan.g

To specifically see example code for implementing stochastic voltage gated ion AND synaptic channels, see exampleScripts_Syn/markov_chan.g.






