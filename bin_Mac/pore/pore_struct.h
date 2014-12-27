/*
** $Id: pore_struct.h,v 1.1.1.1 2005/06/14 04:38:28 svitak Exp $
** $Log: pore_struct.h,v $
** Revision 1.1.1.1  2005/06/14 04:38:28  svitak
** Import from snapshot of CalTech CVS tree of June 8, 2005
**
** Revision 1.1  1992/12/11 19:03:53  dhb
** Initial revision
**
*/

/*************************************************************************/
/*Adam Franklin Strassberg*/
/*March 15, 1992*/
/*Header file pore_ext.h*/
/*************************************************************************/

#include "struct_defs.h"

struct	K_pore_type2 {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax;
	int	Nt;
	int 	No;
	int 	n0,n1,n2,n3,n4;
	float  alpha_A;
	float  alpha_B;
	float  alpha_C;
	float  alpha_D;
	float  alpha_F;
	float  beta_A;
	float  beta_B;
	float  beta_C;
	float  beta_D;
	float  beta_F;
};

struct	Na_pore_type2 {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax;
	int	Nt;
	int 	No;
	int 	m0h0,m1h0,m2h0,m3h0;
	int 	m0h1,m1h1,m2h1,m3h1;
	float  malpha_A;
	float  malpha_B;
	float  malpha_C;
	float  malpha_D;
	float  malpha_F;
	float  mbeta_A;
	float  mbeta_B;
	float  mbeta_C;
	float  mbeta_D;
	float  mbeta_F;
	float  halpha_A;
	float  halpha_B;
	float  halpha_C;
	float  halpha_D;
	float  halpha_F;
	float  hbeta_A;
	float  hbeta_B;
	float  hbeta_C;
	float  hbeta_D;
	float  hbeta_F;
};


struct	GENsyn_pore_type {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax, Gmax_2;
	int	Nt;
	int 	No, No_os1, No_os2;
	int      S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
	float S11_S21, S11_S12, S21_S11, S21_S22, S12_S11, S12_S22, S12_S13, S22_S21, S22_S12, S22_S23;
	float S13_S12, S13_S23, S13_S14, S23_S22, S23_S13, S23_S24, S14_S13, S14_S24, S14_S15;
	float S24_S23, S24_S14, S24_S25, S15_S14, S15_S25, S25_S24, S25_S15;
	float Trans;
	float TCoef1, TCoef2, TCoef3, TCoef4, TCoef5, TCoef6, TCoef7, TCoef8;
	int openstate1;
	int openstate2;
	double telapsed;
	double randn;

};

struct	GENsyn_pore3D_type {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax, Gmax_2;
	int	Nt;
	int 	No, No_os1, No_os2;
	int      S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
	float S11_S21, S11_S12, S21_S11, S21_S22, S12_S11, S12_S22, S12_S13, S22_S21, S22_S12, S22_S23;
	float S13_S12, S13_S23, S13_S14, S23_S22, S23_S13, S23_S24, S14_S13, S14_S24, S14_S15;
	float S24_S23, S24_S14, S24_S25, S15_S14, S15_S25, S25_S24, S25_S15;
	float Trans;
	float TCoef1, TCoef2, TCoef3, TCoef4, TCoef5, TCoef6, TCoef7, TCoef8;
	int openstate1;
	int openstate2;
	double telapsed;
	double randn;

};


struct	GENvg_pore_type {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax;
	int	Nt;
	int 	No;
	int      S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
	float  malpha_A;
	float  malpha_B;
	float  malpha_C;
	float  malpha_D;
	float  malpha_F;
	float  mbeta_A;
	float  mbeta_B;
	float  mbeta_C;
	float  mbeta_D;
	float  mbeta_F;
	float  halpha_A;
	float  halpha_B;
	float  halpha_C;
	float  halpha_D;
	float  halpha_F;
	float  hbeta_A;
	float  hbeta_B;
	float  hbeta_C;
	float  hbeta_D;
	float  hbeta_F;
	float malpha;
	float mbeta;
	float halpha;
	float hbeta;
	int num_Xgate;
	int num_Ygate;
	double telapsed;
	double randn;

};


struct	GEN_GPROTEIN_type {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	int	Nt;
	int 	No;
	float Gconcs;
	float UnitG;
	float Gbar;
	int      S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
	float S11_S21, S11_S12, S21_S11, S21_S22, S12_S11, S12_S22, S12_S13, S22_S21, S22_S12, S22_S23;
	float S13_S12, S13_S23, S13_S14, S23_S22, S23_S13, S23_S24, S14_S13, S14_S24, S14_S15;
	float S24_S23, S24_S14, S24_S25, S15_S14, S15_S25, S25_S24, S25_S15;
	float Trans;
	float TCoef1, TCoef2, TCoef3, TCoef4, TCoef5, TCoef6, TCoef7, TCoef8;
	int openstate1;
	int openstate2;
	float  Kd;
	int nbinding_sites;

	double telapsed;
	double randn;

};

struct	GEN_gap_type {
	SEGMENT_TYPE
	float	Vk;
	float	Vk2;
	float	Ik;
	float	Ik2;
	double	Gk;
	float	Gmax;
	int	Nt;
	int 	No;
	int      S11, S12, S13;
	float  alpha_A;
	float  alpha_B;
	float  alpha_C;
	float  alpha_D;
	float  alpha_F;
	float  beta_A;
	float  beta_B;
	float  beta_C;
	float  beta_D;
	float  beta_F;
	double telapsed;
	double randn;

};


struct	GEN_tabchan_type {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax;
	int	Nt;
	int 	No;
	int      S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
	float malpha;
	float mbeta;
	float halpha;
	float hbeta;
	double Ca_binding_scaling;
	int use_Ca_binding_scaling;
	int assume_tabchannel_type_ODE;
	int num_Xgate;
	int num_Ygate;
	double telapsed;
	double randn;
};

struct logistic_type {
    BUFFER_TYPE
    float	input;
    float	state;
    float 	gain;
    float 	amplitude;
    float 	thresh;
};




struct	GENVhalf_type {
	SEGMENT_TYPE
	float	Vk;
	float	Ek;
	float	Ik;
	double	Gk;
	float	Gmax;
	int	Nt;
	int 	No;
	int      S11, S12, S13, S14, S15, S21, S22, S23, S24, S25;
	float  malpha_A;
	float  malpha_B;
	float  malpha_C;
	float  malpha_D;
	float  malpha_F;
	float  mbeta_A;
	float  mbeta_B;
	float  mbeta_C;
	float  mbeta_D;
	float  mbeta_F;
	float  halpha_A;
	float  halpha_B;
	float  halpha_C;
	float  halpha_D;
	float  halpha_F;
	float  hbeta_A;
	float  hbeta_B;
	float  hbeta_C;
	float  hbeta_D;
	float  hbeta_F;
	float malpha;
	float mbeta;
	float halpha;
	float hbeta;
	int num_Xgate;
	int num_Ygate;
	double telapsed;
	double randn;
	
	double Vhalf;
	double Vslope;
	double tau;

};
