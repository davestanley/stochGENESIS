static char rcsid[] = "$Id: GENsynpore3D.c,v 1.2 2005/07/01 10:03:07 svitak Exp $";

/*
** $Log: GENERALsynpore.c,v $
** REVISION HISTORY
**
**
**
*/

/***************************************************************/
/*David Arthur Stanley*/
/*Tuesday, November 18, 2008*/
/*GENsynpore3D.c contains the defining action function*/
/*for the GENsyn pore population object*/
/***************************************************************/

#include <math.h>
#include "pore_ext.h"

#define Ss(field) GENsynpore3D->field

void GENsynPore3DPop(GENsynpore3D, action)

struct   GENsyn_pore3D_type *GENsynpore3D;
Action   *action; 

{
	MsgIn    *msg;
	double   dt, tdest, t1, tcurr;
	double lambda, lambda_orig;
	double T;
	double randn;
	long int      Sn11, Sn12, Sn13, Sn14, Sn15, Sn21, Sn22, Sn23, Sn24, Sn25;
	float S11_S21, S11_S12, S21_S11, S21_S22, S12_S11, S12_S22, S12_S13, S22_S21, S22_S12, S22_S23;
	float S13_S12, S13_S23, S13_S14, S23_S22, S23_S13, S23_S24, S14_S13, S14_S24, S14_S15;
	float S24_S23, S24_S14, S24_S25, S15_S14, S15_S25, S25_S24, S25_S15;
	float TCoef1, TCoef2, TCoef3, TCoef4, TCoef5, TCoef6, TCoef7, TCoef8;
	int k, kk;
	double n[27];
	double ns[27];
	int 	 i;

	/* Using shorthand here */
	S11_S21 = Ss(S11_S21);
	S11_S12 = Ss(S11_S12);

	S21_S11 = Ss(S21_S11);
	S21_S22 = Ss(S21_S22);

	S12_S11 = Ss(S12_S11);
	S12_S22 = Ss(S12_S22);
	S12_S13 = Ss(S12_S13);

	S22_S21 = Ss(S22_S21);
	S22_S12 = Ss(S22_S12);
	S22_S23 = Ss(S22_S23);

	S13_S12 = Ss(S13_S12);
	S13_S23 = Ss(S13_S23);
	S13_S14 = Ss(S13_S14);
	
	S23_S22 = Ss(S23_S22);
	S23_S13 = Ss(S23_S13);
	S23_S24 = Ss(S23_S24);

	S14_S13 = Ss(S14_S13);
	S14_S24 = Ss(S14_S24);
	S14_S15 = Ss(S14_S15);

	S24_S23 = Ss(S24_S23);
	S24_S14 = Ss(S24_S14);
	S24_S25 = Ss(S24_S25);

	S15_S14 = Ss(S15_S14);
	S15_S25 = Ss(S15_S25);

	S25_S24 = Ss(S25_S24);
	S25_S15 = Ss(S25_S15);

	/*Update Transmitter concentration and rates*/
	T = Ss(Trans);
	TCoef1 = Ss(TCoef1);
	TCoef2 = Ss(TCoef2);
	TCoef3 = Ss(TCoef3);
	TCoef4 = Ss(TCoef4);
	TCoef5 = Ss(TCoef5);
	TCoef6 = Ss(TCoef6);
	TCoef7 = Ss(TCoef7);
	TCoef8 = Ss(TCoef8);


	if (debug > 1)
		ActionHeader("GENsynPore3DPop", GENsynpore3D, action);

	SELECT_ACTION(action) {

        /**************************************************************************/
	case INIT:
		break;
        /**************************************************************************/

        /**************************************************************************/
	case PROCESS:
		dt = Clockrate(GENsynpore3D);

	/*Update state*/
		MSGLOOP(GENsynpore3D, msg)
			{case 0:
				Ss(Vk) = MSGVALUE(msg, 0);
				break;
			 case 1:
				Ss(Trans) = MSGVALUE(msg, 0);
				break;}

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

		tdest = 0;	//Start at time 0
		tcurr = 0;
		while (tdest < dt){

		/* Define array of transition probabilities */
			//n[0] = 0;		// probably kill this
			n[1] = Sn11 * (S11_S12 + T*TCoef1);
			n[2] = Sn11 * S11_S21;

			n[3] = Sn12 * S12_S11;
			n[4] = Sn12 * S12_S22;
			n[5] = Sn12 * (S12_S13 + T*TCoef2);

			n[6] = Sn13 * S13_S12;
			n[7] = Sn13 * S13_S23;
			n[8] = Sn13 * (S13_S14 + T*TCoef3);

			n[9] = Sn14 * S14_S13;
			n[10] = Sn14 * S14_S24;
			n[11] = Sn14 * (S14_S15 + T*TCoef4);

			n[12] = Sn15 * S15_S14;
			n[13] = Sn15 * S15_S25;

			n[14] = Sn21 * S21_S11;
			n[15] = Sn21 * (S21_S22 + T*TCoef5);

			n[16] = Sn22 * S22_S21;
			n[17] = Sn22 * S22_S12;
			n[18] = Sn22 * (S22_S23 + T*TCoef6);

			n[19] = Sn23 * S23_S22;
			n[20] = Sn23 * S23_S13;
			n[21] = Sn23 * (S23_S24 + T*TCoef7);

			n[22] = Sn24 * S24_S23;
			n[23] = Sn24 * S24_S14;
			n[24] = Sn24 * (S24_S25 + T*TCoef8);

			n[25] = Sn25 * S25_S24;
			n[26] = Sn25 * S25_S15;

			//printf ("term1 %f; term2 %f; n[11] %f \n", S14_S15, T*TCoef4, n[11]);
			
			lambda = 0;
			for (k=1;k<=26;k++){
				lambda = lambda + n[k];
			}


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
							/**** actually occured!!  ****/

			/* Figure out which transition it will be */
				ns[1] = n[1]/lambda;
				for (k=2;k<=26;k++)
				{
					ns[k] = ns[k-1] + (n[k]/lambda);
				}


				randn = RAN();
				if (randn <= ns[1]) { Sn11--; Sn12++; }
				else if (randn <= ns[2]) { Sn11--; Sn21++; }

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

				//printf ("randn %f, ns[1] %f, ns[3] %f\n", randn, ns[1], ns[3]);
				//printf ("****************Entering for loop*************************\n");
			} /* end of if statement */

		} /* of while loop */
		/* If we overshoot the value of dt, then we will abort for now */
		/* However, we will store how close we got to dt for next time  */
		/* That way, we can factor this elapsed time into our next evaluation  */
		Ss(telapsed) = dt - tcurr + Ss(telapsed);



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

	/*Select which state to use as the "open" state. First checks the "openstate" variables; failing this, look
	to the first state on the top row of the chain that is farthest to the right and active*/
		if (Ss(openstate1) != 0){
			if (Ss(openstate1) == 11) Ss(No_os1) = Ss(S11); else if (Ss(openstate1) == 21) Ss(No_os1) = Ss(S21);
			else if (Ss(openstate1) == 12) Ss(No_os1) = Ss(S12); else if (Ss(openstate1) == 22) Ss(No_os1) = Ss(S22);
			else if (Ss(openstate1) == 13) Ss(No_os1) = Ss(S13); else if (Ss(openstate1) == 23) Ss(No_os1) = Ss(S23);
			else if (Ss(openstate1) == 14) Ss(No_os1) = Ss(S14); else if (Ss(openstate1) == 24) Ss(No_os1) = Ss(S24);
			else if (Ss(openstate1) == 15) Ss(No_os1) = Ss(S15); else if (Ss(openstate1) == 25) Ss(No_os1) = Ss(S25);
			else { printf ("Invalid entry for openstate1"); Ss(No_os1) = Ss(S11); }
			if (Ss(openstate2) != 0){
				if (Ss(openstate2) == 11) Ss(No_os2) =  Ss(S11); else if (Ss(openstate2) == 21) Ss(No_os2) =  Ss(S21);
				else if (Ss(openstate2) == 12) Ss(No_os2) =  Ss(S12); else if (Ss(openstate2) == 22) Ss(No_os2) =  Ss(S22);
				else if (Ss(openstate2) == 13) Ss(No_os2) =  Ss(S13); else if (Ss(openstate2) == 23) Ss(No_os2) =  Ss(S23);
				else if (Ss(openstate2) == 14) Ss(No_os2) =  Ss(S14); else if (Ss(openstate2) == 24) Ss(No_os2) =  Ss(S24);
				else if (Ss(openstate2) == 15) Ss(No_os2) =  Ss(S15); else if (Ss(openstate2) == 25) Ss(No_os2) =  Ss(S25);
				else { printf ("Invalid entry for openstate1"); Ss(No_os1) = Ss(S11); }
			}
		}

		else if ((S15_S14 + S15_S25) > 0) Ss(No_os1) = Ss(S15);
		else if ((S14_S13 + S14_S24) > 0) Ss(No_os1) = Ss(S14);
		else if ((S13_S12 + S13_S23) > 0) Ss(No_os1) = Ss(S13);
		else if ((S12_S11 + S12_S22) > 0) Ss(No_os1) = Ss(S12);
		else{
			printf ("Cannot identify open state. Make sure your rate constants are \n set correctly \
				so that the open state resides in the top row of the \n markov chain. Alternatively, set openstate1\n");
			Ss(No_os1) = Ss(S11);}

	/*Update Current*/
		Ss(No) = Ss(No_os1) + Ss(No_os2);
		if (Ss(Gmax_2) == 0){
			Ss(Gk) = Ss(Gmax)*Ss(No);}
		else{
			Ss(Gk) = Ss(Gmax)*Ss(No_os1) + Ss(Gmax_2)*Ss(No_os2);
		}
		
 		Ss(Ik) = (Ss(Ek) - Ss(Vk)) * Ss(Gk);

		break;
        /**************************************************************************/

        /**************************************************************************/
	case RESET:
	/*Seed Random Number generator*/	
#ifdef OLDVERSION
		srandom(time(0));
#endif
	/*Update state*/
		MSGLOOP(GENsynpore3D, msg)
			{case 0:
				Ss(Vk) = MSGVALUE(msg, 0);
				break;
			 case 1:
				Ss(Trans) = MSGVALUE(msg, 0);
				break;}

	/*Update Transmitter concentration and rates*/
		T = Ss(Trans);

	/*Set initial distribution of the pore population so that all channels are in the
			in the upper-left most state.*/
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
		if ((S11_S12 + S12_S11 + S11_S21 + S21_S11 + TCoef1) > 0) Ss(S11) = (int) ( Ss(Nt) * 1.0 );
		else if ((S12_S22 + S22_S12 + S12_S13 + S13_S12 + TCoef2) > 0) Ss(S12) = (int) ( Ss(Nt) * 1.0 );
		else if ((S13_S23 + S23_S13 + S13_S14 + S14_S13 + TCoef3) > 0) Ss(S13) = (int) ( Ss(Nt) * 1.0 );
		else if ((S14_S24 + S24_S14 + S14_S15 + S15_S14 + TCoef4) > 0) Ss(S14) = (int) ( Ss(Nt) * 1.0 );
		else Ss(S15) = (int) ( Ss(Nt) * 1.0 );


		/*tempsum = Ss(n0) + Ss(n1) + Ss(n2) + Ss(n3) + Ss(n4);
		if (Ss(Nt) > tempsum) Ss(n0) += (Ss(Nt) - tempsum); */
	/*Makes sure that total population equals Nt
	enforce the constraint of an integer population*/

	/*Select which state to use as the "open" state. First checks the "openstate" variables; failing this, look
	to the first state on the top row of the chain that is farthest to the right and active*/
		if (Ss(openstate1) != 0){
			if (Ss(openstate1) == 11) Ss(No_os1) = Ss(S11); else if (Ss(openstate1) == 21) Ss(No_os1) = Ss(S21);
			else if (Ss(openstate1) == 12) Ss(No_os1) = Ss(S12); else if (Ss(openstate1) == 22) Ss(No_os1) = Ss(S22);
			else if (Ss(openstate1) == 13) Ss(No_os1) = Ss(S13); else if (Ss(openstate1) == 23) Ss(No_os1) = Ss(S23);
			else if (Ss(openstate1) == 14) Ss(No_os1) = Ss(S14); else if (Ss(openstate1) == 24) Ss(No_os1) = Ss(S24);
			else if (Ss(openstate1) == 15) Ss(No_os1) = Ss(S15); else if (Ss(openstate1) == 25) Ss(No_os1) = Ss(S25);
			else { printf ("Invalid entry for openstate1"); Ss(No_os1) = Ss(S11); }
			if (Ss(openstate2) != 0){
				if (Ss(openstate2) == 11) Ss(No_os2) =  Ss(S11); else if (Ss(openstate2) == 21) Ss(No_os2) =  Ss(S21);
				else if (Ss(openstate2) == 12) Ss(No_os2) =  Ss(S12); else if (Ss(openstate2) == 22) Ss(No_os2) =  Ss(S22);
				else if (Ss(openstate2) == 13) Ss(No_os2) =  Ss(S13); else if (Ss(openstate2) == 23) Ss(No_os2) =  Ss(S23);
				else if (Ss(openstate2) == 14) Ss(No_os2) =  Ss(S14); else if (Ss(openstate2) == 24) Ss(No_os2) =  Ss(S24);
				else if (Ss(openstate2) == 15) Ss(No_os2) =  Ss(S15); else if (Ss(openstate2) == 25) Ss(No_os2) =  Ss(S25);
				else { printf ("Invalid entry for openstate1"); Ss(No_os1) = Ss(S11); }
			}
		}

		else if ((S15_S14 + S15_S25) > 0) Ss(No_os1) = Ss(S15);
		else if ((S14_S13 + S14_S24) > 0) Ss(No_os1) = Ss(S14);
		else if ((S13_S12 + S13_S23) > 0) Ss(No_os1) = Ss(S13);
		else if ((S12_S11 + S12_S22) > 0) Ss(No_os1) = Ss(S12);
		else{
			printf ("Cannot identify open state. Make sure your rate constants are \n set correctly \
				so that the open state resides in the top row of the \n markov chain. Alternatively, set openstate1\n");
			Ss(No_os1) = Ss(S11);}

	/* Set initial conditions*/
		Ss(telapsed) = 0;
		Ss(randn) = RAN();

	/*Update Current*/
		Ss(No) = Ss(No_os1) + Ss(No_os2);
		if (Ss(Gmax_2) == 0){
			Ss(Gk) = Ss(Gmax)*Ss(No);}
		else{
			Ss(Gk) = Ss(Gmax)*Ss(No_os1) + Ss(Gmax_2)*Ss(No_os2);
		}
		
 		Ss(Ik) = (Ss(Ek) - Ss(Vk)) * Ss(Gk);

		break;
        /**************************************************************************/

        /**************************************************************************/
	case CHECK:
		break;
	}
}
#undef Ss
