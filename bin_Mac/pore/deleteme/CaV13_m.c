static char rcsid[] = "$Id: GENsynpore.c,v 1.2 2005/07/01 10:03:07 svitak Exp $";

/*
** $Log: CaV13_m.c,v $
** REVISION HISTORY
**
**
**
*/

/***************************************************************/
/*David Arthur Stanley*/
/*Sunday January 18, 2009*/
/*CaV13_m.c contains the defining action function*/
/*for the GENvg pore population object*/
/***************************************************************/

#include <math.h>
#include "pore_ext.h"

#define Ss(field) CaV13_m->field

void CaV13_mPop(CaV13_m, action)

struct   GENvg_pore_type *CaV13_m;
Action   *action; 

{
	MsgIn    *msg;
	double   dt, tdest, t1, tcurr;
	double lambda, lambda_orig;
	double randn;
	int      Sn11, Sn12, Sn13, Sn14, Sn15, Sn21, Sn22, Sn23, Sn24, Sn25;
	double   malpha, mbeta, minf;
	double   halpha, hbeta, hinf;
	double malphas[2][4];
	double mbetas[2][4];
	double halphas[5];
	double hbetas[5];
	int choose[5][5];
	int numrow, numcol;
	int k, kk;
	double n[27];
	double ns[27];
	int 	 i;
	
	// Conversion from V1/2 format
	double Vhalf, Vslope, tau, boltz, boltz_sqrt;
	

	//Calculate the number of rows and columns in our markov process
	numrow = Ss(num_Ygate + 1);
	numcol = Ss(num_Xgate + 1);

	// Display an error message if they don't enter the correct number of gates
	if ((Ss(num_Ygate) > 1) || (Ss(num_Ygate) < 0)) 
		printf ("Number of Y gates (the inactivating gate) must be 0 or 1");
	else if ((Ss(num_Xgate) > 4) || (Ss(num_Xgate) < 0)) 
		printf ("Number of X gates (the activating gate) must be between 0 and 4");
	else{	/*If the above is okay, then proceed with executing the rest of the code */


	/*Update state*/
	MSGLOOP(CaV13_m, msg)
		{case 0:
			Ss(Vk) = MSGVALUE(msg, 0);
			break;}

	/*Update Rate Constants for new Vk*/
	malpha = RATE(Ss(Vk),Ss(malpha_A),Ss(malpha_B),Ss(malpha_C),
		     Ss(malpha_D),Ss(malpha_F));
	mbeta = RATE(Ss(Vk),Ss(mbeta_A),Ss(mbeta_B),Ss(mbeta_C),
		     Ss(mbeta_D),Ss(mbeta_F));
	halpha = RATE(Ss(Vk),Ss(halpha_A),Ss(halpha_B),Ss(halpha_C),
		      Ss(halpha_D),Ss(halpha_F));
	hbeta = RATE(Ss(Vk),Ss(hbeta_A),Ss(hbeta_B),Ss(hbeta_C),
		     Ss(hbeta_D),Ss(hbeta_F));
   

    Vhalf = -0.030;		// V
    Vslope = 0.006;		// V
    tau = 0.0045;		// s
    boltz = 1/( 1 + exp(-(Ss(Vk)-Vhalf)/Vslope)  );
    boltz_sqrt = pow(boltz, 0.5);
    
    malpha = boltz_sqrt/tau;
    mbeta = (1-boltz_sqrt)/tau;

	Ss(malpha) = malpha;
	Ss(mbeta) = mbeta;
	Ss(halpha) = halpha;
	Ss(hbeta) = hbeta;

	//printf ("malpha %f, mbeta %f, halpha %f, hbeta %f\n",malpha,mbeta,halpha,hbeta);


	if (debug > 1)
		ActionHeader("CaV13_mPop", CaV13_m, action);

	SELECT_ACTION(action) {

        /**************************************************************************/
	case INIT:
		break;
        /**************************************************************************/

        /**************************************************************************/
	case PROCESS:
		dt = Clockrate(CaV13_m);

		/*Set all not-used transition rates to zero!*/
		for (k=0;k<4;k++){
			for (kk=0;kk<2;kk++){
				malphas[kk][k] = 0;
				mbetas[kk][k] = 0;
			}
		}
		for (k=0;k<5;k++){
			halphas[k]=0;
			hbetas[k]=0;
		}

		/*Calculate transition rates for the markov process*/
		for(k=1;k<=(Ss(num_Xgate));k++){
			for (kk=1;kk<=numrow;kk++){
				malphas[kk-1][k-1] = malpha * (Ss(num_Xgate) - (k-1));
				mbetas[kk-1][k-1] = mbeta * (k);
			}
		}

		
		if (numrow>1){
			for (k=1;k<=numcol;k++){
				halphas[k-1] = halpha;
				hbetas[k-1] = hbeta;}
		}

 		/* Define new states */ 
		Sn11 = Ss(S11);
		Sn12 = Ss(S12);
		Sn13 = Ss(S13);
		Sn14 = Ss(S14);
		Sn15 = Ss(S15);
		Sn21 = Ss(S21);
		Sn22 = Ss(S22);
		Sn23 = Ss(S23);
		Sn24 = Ss(S24);
		Sn25 = Ss(S25);

		/* Start at time zero */
		tdest = 0;
		tcurr = 0;
		while (tdest < dt){

			/* Define array of transition probabilities */
			//n[0] = 0;		// probably kill this
			n[1] = Sn11 * hbetas[0];
			n[2] = Sn11 * malphas[0][0];

			n[3] = Sn12 * mbetas[0][0];
			n[4] = Sn12 * hbetas[1];
			n[5] = Sn12 * malphas[0][1];

			n[6] = Sn13 * mbetas[0][1];
			n[7] = Sn13 * hbetas[2];
			n[8] = Sn13 * malphas[0][2];

			n[9] = Sn14 * mbetas[0][2];
			n[10] = Sn14 * hbetas[3];
			n[11] = Sn14 * malphas[0][3];

			n[12] = Sn15 * mbetas[0][3];
			n[13] = Sn15 * hbetas[4];

			n[14] = Sn21 * halphas[0];
			n[15] = Sn21 * malphas[1][0];

			n[16] = Sn22 * mbetas[1][0];
			n[17] = Sn22 * halphas[1];
			n[18] = Sn22 * malphas[1][1];

			n[19] = Sn23 * mbetas[1][1];
			n[20] = Sn23 * halphas[2];
			n[21] = Sn23 * malphas[1][2];

			n[22] = Sn24 * mbetas[1][2];
			n[23] = Sn24 * halphas[3];
			n[24] = Sn24 * malphas[1][3];

			n[25] = Sn25 * mbetas[1][3];
			n[26] = Sn25 * halphas[4];

			//printf ("n[5] = %f = %d * %f \n",n[5],Sn12,malphas[0][1]);			
			//printf ("Sn12 = %d \n", Sn12);
			
			lambda = 0;
			for (k=1;k<=26;k++){
				lambda = lambda + n[k];
			}
			
			//printf ("lambda value is %f ", lambda);

			/* Calculate mini-time step until the next transition */
			t1 = -1 * log(Ss(randn))/lambda;
			tdest = tcurr + t1;
			//printf ("tdest = %f\n", tdest);

			if ( (tdest-Ss(telapsed)) < dt ){

				/* Reset parameters, set current time to min(tdest, 0) */
					if ( (tdest-Ss(telapsed))>=0 ) tcurr = tdest - Ss(telapsed);
					else tcurr = 0;
					Ss(telapsed) = 0;
					Ss(randn) = RAN();	/**** This is important -- we only want to update the random ****/
								/**** variable used for determining the timestep IF a transition has ****/
								/**** actually occured!! Otherwise we will bias the random variable ****/


				/* Figure out which transition it will be */
				ns[1] = n[1]/lambda;
				for (k=2;k<=26;k++)
				{
					ns[k] = ns[k-1] + (n[k]/lambda);
				}
				//printf ("A: S14->S15 transition prob is %f. \Reverse is %f. Lambda is %f \n", n[11]/lambda, n[12]/lambda, lambda);
				//printf ("B: S14->S15 transition prob is %f. Reverse is %f. Lambda is %f \n", ns[11], ns[12], lambda);

				randn = RAN();
				if (randn <= ns[1]) { Sn11--; Sn21++; }
				else if (randn <= ns[2]) { Sn11--; Sn12++; }

				else if (randn <= ns[3]) { Sn12--; Sn11++; }
				else if (randn <= ns[4]) { Sn12--; Sn22++; }
				else if (randn <= ns[5]) { Sn12--; Sn13++; }

				else if (randn <= ns[6]) { Sn13--; Sn12++; }
				else if (randn <= ns[7]) { Sn13--; Sn23++; }
				else if (randn <= ns[8]) { Sn13--; Sn14++; }

				else if (randn <= ns[9]) { Sn14--; Sn13++; }
				else if (randn <= ns[10]) { Sn14--; Sn24++; }
				else if (randn <= ns[11]) { Sn14--; Sn15++; }

				else if (randn <= ns[12]) {Sn15--; Sn14++; }
				else if (randn <= ns[13]) {Sn15--; Sn25++; }

				else if (randn <= ns[14]) {Sn21--; Sn11++; }
				else if (randn <= ns[15]) {Sn21--; Sn22++; }

				else if (randn <= ns[16]) {Sn22--; Sn21++; }
				else if (randn <= ns[17]) {Sn22--; Sn12++; }
				else if (randn <= ns[18]) {Sn22--; Sn23++; }

				else if (randn <= ns[19]) {Sn23--; Sn22++; }
				else if (randn <= ns[20]) {Sn23--; Sn13++; }
				else if (randn <= ns[21]) {Sn23--; Sn24++; }

				else if (randn <= ns[22]) {Sn24--; Sn23++; }
				else if (randn <= ns[23]) {Sn24--; Sn14++; }
				else if (randn <= ns[24]) {Sn24--; Sn25++; }

				else if (randn <= ns[25]) {Sn25--; Sn24++; }
				else if (randn <= ns[26]) {Sn25--; Sn15++; }
			} /* end of if statement */

		} /* of while loop */

		/* Store the amount by which we have "overshot" the timestep */
		Ss(telapsed) = dt - tcurr + Ss(telapsed);
	
		//for (k=1; k<=26; k++){
		//	printf ("n(%d)=%f ",k,n[k]);
		//}
		//printf("\n");


	/*Update the old states to the new states*/
		Ss(S11) = Sn11;
		Ss(S12) = Sn12;
		Ss(S13) = Sn13;
		Ss(S14) = Sn14;
		Ss(S15) = Sn15;
		Ss(S21) = Sn21;
		Ss(S22) = Sn22;
		Ss(S23) = Sn23;
		Ss(S24) = Sn24;
		Ss(S25) = Sn25;

	/*Select open state based on chain topology*/
		switch (numcol){
			case 1: {Ss(No) = Ss(S11); break;}
			case 2: {Ss(No) = Ss(S12); break;}
			case 3: {Ss(No) = Ss(S13); break;}
			case 4: {Ss(No) = Ss(S14); break;}
			case 5: {Ss(No) = Ss(S15); break;}
		}
	/*Update Current*/
		Ss(Gk) = Ss(Gmax)*Ss(No);
 		Ss(Ik) = (Ss(Ek) - Ss(Vk)) * Ss(Gk);

		break;
        /**************************************************************************/

        /**************************************************************************/
	case RESET:
	/*Seed Random Number generator*/	
#ifdef OLDVERSION
		srandom(time(0));
#endif


	/*Set initial distribution of the pore population into the various
	kinetic states based upon the equilbrium solution of the Markov matrix*/

		choose[0][0] = 1;		
		choose[1][0] = 1;		//Fill out a table for choose notation
		choose[1][1] = 1;		//(this is simpler than calculating it)
		choose[2][0] = 1;
		choose[2][1] = 2;
		choose[2][2] = 1;
		choose[3][0] = 1;
		choose[3][1] = 3;
		choose[3][2] = 3;
		choose[3][3] = 1;
		choose[4][0] = 1;
		choose[4][1] = 4;
		choose[4][2] = 6;
		choose[4][3] = 4;
		choose[4][4] = 1;

		//Calculate the probably that a gate type will be open after infinite amount of time
		minf = malpha / (malpha + mbeta);
		if (numrow > 1) hinf = halpha / (halpha + hbeta);
		else	hinf = 1;

		Ss(S11) = 0;
		Ss(S12) = 0;
		Ss(S13) = 0;
		Ss(S14) = 0;
		Ss(S15) = 0;
		Ss(S21) = 0;
		Ss(S22) = 0;
		Ss(S23) = 0;
		Ss(S24) = 0;
		Ss(S25) = 0;

		//Set the first row of the state distribution based upon the markov matrix solution
		Ss(S11)=(int) ( round(Ss(Nt) * (hinf)
			*choose[Ss(num_Xgate)][0]*pow(minf,0.0)*pow((1.0-minf),(float) Ss(num_Xgate)-0)) );

		if (numcol >= 2) Ss(S12)=(int) ( round(Ss(Nt) * (hinf)
			*choose[Ss(num_Xgate)][1]*pow(minf,1.0)*pow((1.0-minf),(float) Ss(num_Xgate)-1)) );

		if (numcol >= 3) Ss(S13)=(int) ( round(Ss(Nt) * (hinf)
			*choose[Ss(num_Xgate)][2]*pow(minf,2.0)*pow((1.0-minf),(float) Ss(num_Xgate)-2)) );

		if (numcol >= 4) Ss(S14)=(int) ( round(Ss(Nt) * (hinf)
			*choose[Ss(num_Xgate)][3]*pow(minf,3.0)*pow((1.0-minf),(float) Ss(num_Xgate)-3)) );

		if (numcol >= 5) Ss(S15)=(int) ( round(Ss(Nt) * (hinf)
			*choose[Ss(num_Xgate)][4]*pow(minf,4.0)*pow((1.0-minf),(float) Ss(num_Xgate)-4)) );

		// Here we fill out the second row of the markov process. If there is no second row, set to 0

		if (numrow >1){
		Ss(S21)=(int) ( round(Ss(Nt) * (1-hinf)
			*choose[Ss(num_Xgate)][0]*pow(minf,0.0)*pow((1.0-minf),(float) Ss(num_Xgate)-0)) );

		if (numcol >= 2) Ss(S22)=(int) ( round(Ss(Nt) * (1-hinf)
			*choose[Ss(num_Xgate)][1]*pow(minf,1.0)*pow((1.0-minf),(float) Ss(num_Xgate)-1)) );

		if (numcol >= 3) Ss(S23)=(int) ( round(Ss(Nt) * (1-hinf)
			*choose[Ss(num_Xgate)][2]*pow(minf,2.0)*pow((1.0-minf),(float) Ss(num_Xgate)-2)) );

		if (numcol >= 4) Ss(S24)=(int) ( round(Ss(Nt) * (1-hinf)
			*choose[Ss(num_Xgate)][3]*pow(minf,3.0)*pow((1.0-minf),(float) Ss(num_Xgate)-3)) );

		if (numcol >= 5) Ss(S25)=(int) ( round(Ss(Nt) * (1-hinf)
			*choose[Ss(num_Xgate)][4]*pow(minf,4.0)*pow((1.0-minf),(float) Ss(num_Xgate)-4)) );}



		/*tempsum = Ss(n0) + Ss(n1) + Ss(n2) + Ss(n3) + Ss(n4);
		if (Ss(Nt) > tempsum) Ss(n0) += (Ss(Nt) - tempsum); */
	/*Makes sure that total population equals Nt
	enforce the constraint of an integer population*/

	/*Select open state based on topology*/
		switch (numcol){
			case 1: {Ss(No) = Ss(S11); break;}
			case 2: {Ss(No) = Ss(S12); break;}
			case 3: {Ss(No) = Ss(S13); break;}
			case 4: {Ss(No) = Ss(S14); break;}
			case 5: {Ss(No) = Ss(S15); break;}
		}

	/* Set initial conditions */
		Ss(telapsed) = 0;
		Ss(randn) = RAN();

	/*Update Current*/
		Ss(Gk) = Ss(Gmax)*Ss(No);
 		Ss(Ik) = (Ss(Ek) - Ss(Vk)) * Ss(Gk);

		break;
        /**************************************************************************/

        /**************************************************************************/
	case CHECK:
		break;
	}	//end of select action
	}	//end of else statement
}
#undef Ss
