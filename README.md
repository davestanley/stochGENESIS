stochGENESIS
============

Stochastic ion channels for the GENESIS neural simulator

Adapted from code used for the following publications:

- "Stochastic amplification of calcium-activated potassium currents in Ca2+ microdomains."(J Computational Neurosci.)
http://link.springer.com/article/10.1007/s10827-011-0328-x


- "Synaptic Noise-Like Activity in Hippocampal Interneurons" (T-Space Thesis) https://tspace.library.utoronto.ca/handle/1807/18882



INSTRUCTIONS
------------

### 1. Run stochGENESIS
You can choose to either run the existing binaries, or compile stochGENESIS alongside your GENESIS 2.3 install.

#### To run binaries:
Pre-compiled versions of stochGENESIS for 64-bit Linux and OS X operating systems are available in the bin_linux and bin_Mac folders, respectively.

    $ cd bin_linux
or

    $ cd bin_Mac

Then

    $ ./binsetup 
    $ cp .simrc ~
    $ export PATH=$PATH:`pwd`
    $ ./stochgenesis
You can optionally add the binary directory to your bash path.

#### To compile:
Alternatively, if you wish to compile yourself, follow the instructions in “Customizing GENESIS” section of the GENESIS 2.3 reference manual (http://www.genesis-sim.org/GENESIS/Hyperdoc/Manual-21.html). The pore folder contains the new libraries.

### 2. Test Example Scripts
There are two example scripts, contained in the folders exampleScripts_Ca and exampleScripts_Syn, highlighting the use of stochastic voltage/calcium gated and synaptic channels, respectively.

#### To run the exampleScripts_Ca code

    $ cd exampleScripts_Ca
    $ stochgenesis main_script.g

#### To run the exampleScripts_Syn code

    $ cd exampleScripts_Syn
    $ stochgenesis main_m.g

Note: To run properly, this code also requires a noise file called ../matlab/psdnoise_n1_fc1.txt. This file is large, but can upload it upon request. Without this file, it still should be possible to run the script and view the resulting element tree containin Markov synapses.

### 3. Example Code
To see example code for implementing stochastic voltage gated ion channels, see exampleScripts_Ca/markov_chan.g

To see example code for implementing stochastic voltage gated ion AND synaptic channels, see exampleScripts_Syn/markov_chan.g.

### 4. New GENESIS objects
Type > listobjects to see all newly available objects

- **GENvgpores:** Voltage-gated ion channels with stochastic gating; supports variable numbers of gates ( 0-4 activating gates and 0-1 inactivating gates); HH-based rate constants

- **GENgap:** 4-state gap junction with stochastic gating

- **GENsynpores:** Generalized transmitter-gated synapses with stochastic gating

- **GENtabchan:** Same as GENvgpores, but rate constants are based on tables

- **GEN_Gprotein:** Stochastic simulations of G-protein concentrations

*Note*: I am using Chow and White's algorithm to govern the evolution of the
markov chain. See Mino et al 2002 - Comparison of algorithms for
the simulation of action potentials with stochastic sodium channels, Annals
of Biomedical Engineering.


### 5. New GENEIS functions (under development)
GENESIS functions for object manipulation. These are located in the funcs_GENESIS folder.

- **stochastify:** Function to search through element trees and automatically convert deterministic channels to stochastic channels (assumes existing library of Markovian ion channels)

- **volumeconnect_general:**	Generalized version of volumeconnect command to work with either deterministic or stochastic synapses

- **markov_synapse:** Specialized function to form a synaptic connection to an existing deterministic synapse, and then automagically flip that to a stochastic synapses (can pass to volumeconnect_general).

- **spike_synapse:** Creates a deterministic synaptic connection. Can pass to volumeconnect_general to cause it to behave as the standard volumeconnect command.

- **gapconnect_general:** Similar to volumeconnect_general, except for forming gap junction connections.



### 5. Notes
- stochgenesis was historically called cagenesis
- GENESIS scripting functions are under development and still need to be customized to your given simulation. If you are interested in contributing, please email stanleyd a_t bu d0t edu.
