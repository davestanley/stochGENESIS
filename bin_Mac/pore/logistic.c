static char rcsid[] = "$Id: logistic.c,v 1.3 2005/07/20 20:01:58 svitak Exp $";

/*
** David Stanley March 4 2009
** University of Toronto
*/

#include <math.h>
#include "buf_ext.h"
#include "pore_ext.h"

int	DEBUG_LogisticEvent = 0;

/* 
** LogisticEvent intended for unit types
*/
/* M.Wilson Caltech 6/88 */
void LogisticEvent(logistic,action)
register struct logistic_type 	*logistic;
Action				*action;
{
MsgIn	*msg;

    if(Debug(DEBUG_LogisticEvent) > 1){
	ActionHeader("LogisticEvent",logistic,action);
    }
    SELECT_ACTION(action){
    case PROCESS:
	MSGLOOP(logistic,msg){
	case 0:				/* input */
	    logistic->input = MSGVALUE(msg,0);
	    break;
	case 1:				/* threshold */
	    logistic->thresh = MSGVALUE(msg,0);
	    break;
	case 2:				/* gain */
	    logistic->gain = MSGVALUE(msg,0);
	    break;
	case 3:				/* peak amplitude */
	    logistic->amplitude = MSGVALUE(msg,0);
	    break;
	}
	/*
	** the buffer state is the value of the logistic
	*/
	//logistic->state = logistic->amplitude* (tanh(logistic->gain*(logistic->input - logistic->thresh)) + 1)/2.0;
	logistic->state = logistic->amplitude * 1 / (1 + exp( logistic->gain*(logistic->input - logistic->thresh)/2.0 ));

	PutEvent(logistic, logistic->state, NULL, WRAP);
	break;
    case RESET:
	ClearBuffer(logistic);
	break;
    default:
	InvalidAction("LogisticEvent",logistic,action);
	break;
    }
}
