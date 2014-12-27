static char rcsid[] = "$Id: GENsynpore.c,v 1.2 2005/07/01 10:03:07 svitak Exp $";

/*
** $Log: GENgappop.c,v $
** REVISION HISTORY
**
**
**
*/

/***************************************************************/
/*David Arthur Stanley*/
/*Sunday February 23, 2009*/
/*GENgappop.c contains the defining action function*/
/*for the GENgap population object*/
/*    For reference see: Harris, Spray, Bennet 1981 - Kinetic Properties */
/*    of Voltage-dependent Junctional Conductance */
/***************************************************************/

#include <math.h>
#include "pore_ext.h"

#define Ss(field) GENgap->field

void GENgapPop(GENgap, action)

struct   GEN_gap_type *GENgap;
Action   *action; 

{
	MsgIn    *msg;
	double   dt, tdest, t1, tcurr;
	double lambda, lambda_orig;
	double randn;
	int      Sn11, Sn12, Sn13;
	double   alpha, beta, inf;
	double alphas[2];
	double betas[2];
	double Vk;
	int choose[5][5];
	int numrow, numcol;
	int k, kk;
	double n[5];
	double ns[5];
	int 	 i;



	/*Update state*/
	MSGLOOP(GENgap, msg)
		{case 0:
			Ss(Vk) = MSGVALUE(msg, 0);
			break;
		 case 1:
			Ss(Vk2) = MSGVALUE(msg, 0);
			break;}

	/* Figure out relative voltage */
	Vk = Ss(Vk) - Ss(Vk2);

	/*Update Rate Constants for new Vk*/
	alphas[0] = RATE(Vk,Ss(alpha_A),Ss(alpha_B),Ss(alpha_C),
		     Ss(alpha_D),Ss(alpha_F));
	betas[0] = RATE(Vk,Ss(beta_A),Ss(beta_B),Ss(beta_C),
		     Ss(beta_D),Ss(beta_F));

	alphas[1] = RATE(-1.0 * Vk,Ss(alpha_A),Ss(alpha_B),Ss(alpha_C),
		     Ss(alpha_D),Ss(alpha_F));
	betas[1] = RATE(-1.0 * Vk,Ss(beta_A),Ss(beta_B),Ss(beta_C),
		     Ss(beta_D),Ss(beta_F));



	if (debug > 1)
		ActionHeader("GENgapPop", GENgap, action);

	SELECT_ACTION(action) {

        /**************************************************************************/
	case INIT:
		break;
        /**************************************************************************/

        /**************************************************************************/
	case PROCESS:
		dt = Clockrate(GENgap);

 		/* Define new states */ 
		Sn11 = Ss(S11);
		Sn12 = Ss(S12);
		Sn13 = Ss(S13);

		tdest = 0;	//Start at time 0
		tcurr = 0;
		while (tdest < dt){

			/* Define array of transition probabilities */
			//n[0] = 0;		// probably kill this
			n[1] = Sn11 * alphas[0];
			n[2] = Sn12 * betas[0];
			n[3] = Sn12 * betas[1];
			n[4] = Sn13 * alphas[1];
			
			lambda = 0;
			for (k=1;k<=4;k++){
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
									/**** actually occured!!  ****/

				/* Figure out which transition it will be */
				ns[1] = n[1]/lambda;
				for (k=2;k<=4;k++)
				{
					ns[k] = ns[k-1] + (n[k]/lambda);
				}
				//printf ("A: S14->S15 transition prob is %f. \Reverse is %f. Lambda is %f \n", n[11]/lambda, n[12]/lambda, lambda);
				//printf ("B: S14->S15 transition prob is %f. Reverse is %f. Lambda is %f \n", ns[11], ns[12], lambda);

				randn = RAN();
				if (randn <= ns[1]) { Sn11--; Sn12++; }
				else if (randn <= ns[2]) { Sn12--; Sn11++; }

				else if (randn <= ns[3]) { Sn12--; Sn13++; }
				else if (randn <= ns[4]) { Sn13--; Sn12++; }
			} /* end of if statement */
		} /* of while loop */
		/* If we overshoot the value of dt, then we will abort for now */
		/* However, we will store how close we got to dt for next time  */
		/* That way, we can factor this elapsed time into our next evaluation  */
		Ss(telapsed) = dt - tcurr + Ss(telapsed);
	
		//for (k=1; k<=26; k++){
		//	printf ("n(%d)=%f ",k,n[k]);
		//}
		//printf("\n");


	/*Update the old states to the new states*/
		Ss(S11) = Sn11;
		Ss(S12) = Sn12;
		Ss(S13) = Sn13;

		
	/*Select open state*/
		Ss(No) = Ss(S12);

	/*Update Current*/
		Ss(Gk) = Ss(Gmax)*Ss(No);
 		Ss(Ik) = (Ss(Vk2) - Ss(Vk)) * Ss(Gk);	//injection current to cell1
		Ss(Ik2) = (Ss(Vk) - Ss(Vk2)) * Ss(Gk); //injection current to cell2

		break;
        /**************************************************************************/

        /**************************************************************************/
	case RESET:
	/*Seed Random Number generator*/	
#ifdef OLDVERSION
		srandom(time(0));
#endif

		/*    Equilibrium distribution taken from: Harris, Spray, Bennet 1981 - Kinetic Properties */
		/*    of Voltage-dependent Junctional Conductance */
		Ss(S11) = (int) ( Ss(Nt) *  (betas[0]/alphas[0]) / (1 + betas[0]/alphas[0] + betas[1]/alphas[1]) );
		Ss(S12) = (int) ( Ss(Nt) *  1 / (1 + betas[0]/alphas[0] + betas[1]/alphas[1]) );
		Ss(S13) = (int) ( Ss(Nt) *  (betas[1]/alphas[1]) / (1 + betas[0]/alphas[0] + betas[1]/alphas[1]) );

		Ss(No) = Ss(S12);

	/* Set initial conditions */
		Ss(telapsed) = 0;
		Ss(randn) = RAN();

	/*Update Current*/
		Ss(Gk) = Ss(Gmax)*Ss(No);
 		Ss(Ik) = (Ss(Vk2) - Ss(Vk)) * Ss(Gk);	//injection current to cell1
		Ss(Ik2) = (Ss(Vk) - Ss(Vk2)) * Ss(Gk); //injection current to cell2

		break;
        /**************************************************************************/

        /**************************************************************************/
	case CHECK:
		break;
	}	//end of select action
}
#undef Ss
