//genesis
// kkit Version 2 dumpfile
 
// Saved on Thu Jun 26 10:49:11 1997
 
include kkit
 
FASTDT = 0.005
SIMDT = 0.005
CONTROLDT = 1
PLOTDT = 1
MAXTIME = 100
kparms
 
//genesis

initdump -version 3 -ignoreorphans 1
simobjdump table input output alloced step_mode stepsize
simobjdump xtree path script namemode sizescale
simobjdump xcoredraw xmin xmax ymin ymax
simobjdump xtext editable
simobjdump xgraph xmin xmax ymin ymax overlay
simobjdump xplot pixflags flags script fg ysquish do_slope wy
simobjdump kpool CoTotal CoInit Co CoRemaining n nInit nTotal nMin vol \
  slave_enable keepconc notes xtree_fg_req xtree_textfg_req
simobjdump xtab input output alloced step_mode stepsize notes editfunc \
  xtree_fg_req xtree_textfg_req plotfield manageclass baselevel last_x last_y \
  is_running
simobjdump group notes editfunc xtree_fg_req xtree_textfg_req plotfield \
  manageclass expanded movealone
simobjdump kreac A B kf kb is_active notes editfunc xtree_fg_req \
  xtree_textfg_req plotfield manageclass
simobjdump kenz CoComplexInit CoComplex nComplexInit nComplex vol sA pA eA B \
  k1 k2 k3 keepconc usecomplex ksum notes editfunc xtree_fg_req \
  xtree_textfg_req plotfield manageclass link_to_manage
simobjdump stim output level1 width1 delay1 level2 width2 delay2 baselevel \
  trig_time trig_mode previous_input notes editfunc xtree_fg_req \
  xtree_textfg_req plotfield manageclass is_running
simundump group /kinetics/EGF_Receptor 1 "" edit_group blue black x group 0 0
simundump kpool /kinetics/EGF_Receptor/EGFR 1 0.3 0.3 0.3 1.9465e-10 1.8e+05 \
  1.8e+05 1.8e+05 0 6e+05 0 0 \
  "Lauffenburger and Linderman pg 255, refer to Starbuck and\nLauffenburger 1992. They also say (pg 256) that about\n3K surface complexes should give mitogenic response." \
  red blue
simundump kreac /kinetics/EGF_Receptor/activate_EGFR 1 0.00030727 0 \
  0.00016667 1 1 \
  "This happens pretty fast. We see a response in the\ntyr phosph of Shc within 30 sec.\nSee Sasaoka et al JBC 269:51 pp 32621 1994 fig 1.\n\n Lets treat this as \na standard rec-ligand interaction, acting in under a\nsec, and give the phosphorylation a bit of time.\nAffinity should be about 1 nM, from Lauffenburger and\nLinderman pg 257. \nSims show 10x lower would be better." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/EGF 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 4 \
  0 \
  "Mitogenic response occurs at about 2nM EGF according to fig\nin Lauffenburger and Linderman pg 257." \
  red blue
simundump kpool /kinetics/EGF_Receptor/L.EGFR 1 1.6667e-06 0 0 2.777e-12 0 0 \
  1 0 6e+05 0 0 "" red blue
simundump kreac /kinetics/EGF_Receptor/dimerize_EGFR 1 0.00015235 1.5736e-14 \
  1.6667e-07 0.02 1 \
  "This step has to be quite strongly forward. We will bundle\nin a lot of more complex things for now, such as the\ndephosphorylation and release of ligand. The time course\nis estimated around 1 min for the forward step, and perhaps\n10 min for the backwards. Even tighter constraint: \nShc is well phosphorylated within 30 sec. So this step should\nbe about 10 sec. See Sasaoka et al JBC 269:51 3...." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/SHC 1 1 1 1 1.8687e-07 6e+05 6e+05 \
  6e+05 0 6e+05 0 0 \
  "There are 2 isoforms: 52 KDa and 46 KDa (See Okada et al\nJBC 270:35 pp 20737 1995). They are acted up on by the EGFR\nin very similar ways, and apparently both bind Grb2 similarly,\nso we'll bundle them together here.\nSasaoka et al JBC 269:51 pp 32621 1994 show immunoprecs where\nit looks like there is at least as much Shc as Grb2. So\nwe'll tentatively say there is 1 uM of Shc." \
  orange blue
simundump kpool /kinetics/EGF_Receptor/SHC* 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 \
  0 0 "" orange blue
simundump kreac /kinetics/EGF_Receptor/dephosph_Shc 1 0 91.004 0.0016667 0 1 \
  "Time course of decline of phosph is 20 min. Part of this is\nthe turnoff time of the EGFR itself. Lets assume a tau of\n10 min for this dephosph. It may be wildly off." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/EGFR* 1 1.6667e-06 0 0 2.7567e-12 0 0 \
  1 0 6e+05 0 0 "" red blue
simundump kenz /kinetics/EGF_Receptor/EGFR*/phosph_Shc 1 0 0 0 0 6e+05 \
  0.036127 0.0090318 0.045159 0.045085 1.111e-05 4 1 0 0 5 \
  "Rates from Okada et al JBC 270:35 pp 20737 1995\nKm = 0.70 to 0.85 uM, Vmax = 4.4 to 5.0 pmol/min. Unfortunately\nthe amount of enzyme is not known, the prep is only\npartially purified.\nTime course of phosph is max within 30 sec, falls back within\n20 min. Ref: Sasaoka et al JBC 269:51 32621 1994.\nAs enzyme is much less abundant than Shc or Grb, it needs\na turnover # of at least 1/sec." \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/EGF_Receptor/Shc_bind_EGFR 1 3.6281e-05 2.3107e-05 \
  5.5556e-08 0.03333 1 \
  "Sasaoka et al JBC 269:51 pp 32621 1994 estimate that\nabout 55% of EGFR is attached to Shc at the peak, between\n1 and 3 min after stim. Falls off fast after that, nearly\nbaseline by 10 min. I judge that the falloff is largely \nlimited by EGFR inactivation. Lets keep the rates fairly \nfast, say 30 sec. This gives kb = 0.033 and kf scaled down\nby 6e5 to keep units happy." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/SHC*.EGFR* 1 1.6667e-06 0 0 2.7748e-12 \
  0 0 1 0 6e+05 0 0 \
  "Perhaps we should have the EGFR kinase activity on this." purple blue
simundump kreac /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 1 1271.3 1257.2 \
  8.333e-07 0.1 1 \
  "Sasaoka et al JBC 269:51 pp 32621 1994, table on pg\n32623 indicates that this pathway accounts for about \n50% of the GEF activation. (88% - 39%). Error is large,\nabout 20%. Fig 1 is most useful in constraining rates.\n\nChook et al JBC 271:48 pp 30472, 1996 say that the Kd is\n0.2 uM for Shc binding to EGFR. The Kd for Grb direct binding\nis 0.7, so we'll ignore it." \
  edit_reac white blue A group
simundump kreac /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 1 2.7668e-05 \
  2.5064e-05 8.333e-07 0.1 1 \
  "Sasaoka et al JBC 269:51 pp 32621 1994 indicate that this\nis an important component of the EGFR-Grb2\nsignalling pathway. The independent activatition by Shc* \nmay be even more important. By precipitating out EGFR\nthey indicate that about 40% of activity comes through\nthe current pathway. From Chook et al JBC 271:48 pp30472 1996\nwe estimate a Kd of about 0.2." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/Sos*.Grb2 1 1.6667e-06 0 0 2.7778e-12 \
  0 0 1 0 6e+05 0 0 "" orange blue
simundump kreac /kinetics/EGF_Receptor/Grb2_bind_Sos* 1 0 0 4.1667e-08 0.0168 \
  1 \
  "Same rates as Grb2_bind_Sos: Porfiri and McCormick JBC\n271:10 pp 5871 1996 show that the binding is not affected\nby the phosph." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/Grb2 1 1 1 1 1.1208e-07 6e+05 6e+05 \
  6e+05 0 6e+05 0 0 \
  "There is probably a lot of it in the cell: it is also known\nas Ash (abundant src homology protein I think). Also \nWaters et al JBC 271:30 18224 1996 say that only a small\nfraction of cellular Grb is precipitated out when SoS is\nprecipitated. As most of the Sos seems to be associated\nwith Grb2, it would seem like there is a lot of the latter.\nSay 1 uM. I haven't been able to find a decent...." \
  orange blue
simundump kpool /kinetics/EGF_Receptor/Sos.Grb2 1 1.6667e-06 0 0 0 0 0 1 0 \
  6e+05 0 0 "" orange blue
simundump kpool /kinetics/EGF_Receptor/Sos* 1 1.6667e-06 0 0 2.7778e-12 0 0 1 \
  0 6e+05 0 0 "" red blue
simundump kreac /kinetics/EGF_Receptor/dephosph_Sos 1 0 0 0.1 0 1 "" \
  edit_reac white blue A group
simundump kreac /kinetics/EGF_Receptor/Grb2_bind_Sos 1 464.21 458.29 \
  4.1667e-08 0.0168 1 \
  "As there are 2 SH3 domains, this reaction could be 2nd order.\nI have a Kd of 22 uM from peptide binding (Lemmon et al \nJBC 269:50 pg 31653). However, Chook et al JBC 271:48 pg30472\nsay it is 0.4uM with purified proteins, so we believe them.\nThey say it is 1:1 binding." \
  edit_reac white blue A group
simundump kpool /kinetics/EGF_Receptor/Sos 1 0.1 0.1 0.1 1.1207e-07 60000 \
  60000 60000 0 6e+05 0 0 "" red blue
simundump kpool /kinetics/MAPK* 0 0.36 0 0 7.7162e-36 0 0 2.16e+05 0 6e+05 0 \
  1 \
  "This version is phosphorylated on both the tyr and thr residues and\nis active: refs\nThe rate consts are very hard to nail down. Combine Sanghera et al\nJBC 265(1) :52-57 with Nemenoff et al JBC 93 pp 1960 to get\nk3=10/sec = k2 (from Nemenoff Vmax) and k1 = (k2 + k3)/Km = 1.3e-6\nOr: k3 = 10, k2 = 40, k1 = 3.25e-6" \
  orange yellow
simundump kenz /kinetics/MAPK*/phosph_Sos 1 0 0 0 0 6e+05 0 0 0 0 3.25e-06 40 \
  10 0 0 50 \
  "See Porfiri and McCormick JBC 271:10 pp5871 1996 for the\nexistence of this step. We'll take the rates from the ones\nused for the phosph of Raf by MAPK." \
  edit_enz red orange CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/MAPK*/MAPK* 0 0 0 0 0 6e+05 0 0 0 0 6.5e-06 80 20 0 \
  0 100 \
  "Km = 25uM @ 50 uM ATP and 1mg/ml MBP (huge XS of substrate)\nVmax = 4124 pmol/min/ml at a conc of 125 pmol/ml of enz, so:\nk3 = .5/sec (rate limiting)\nk1 = (k2  + k3)/Km = (.5 + 0)/(25*6e5) = 2e-8 (#/cell)^-1\n#s from Sanghera et al JBC 265 pp 52 , 1990. \nFrom Nemenoff et al JBC 268(3):1960-1964 - using Sanghera's 1e-4 ratio\nof MAPK to protein, we get k3 = 7/sec from 1000 pmol/min/mg fig 5" \
  edit_enz red orange CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/MAPK*/MAPK*-feedback 1 0 0 0 0 6e+05 0 0 0 0 \
  3.25e-06 40 10 0 0 50 \
  "Ueki et al JBC 269(22):15756-15761 show the presence of\nthis step, but not the rate consts, which are derived from\nSanghera et al  JBC 265(1):52-57, 1990, see the deriv in the\nMAPK* notes." \
  edit_enz red orange CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/Shc*.Sos.Grb2 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "" brown yellow
simundump kenz /kinetics/Shc*.Sos.Grb2/Ras_GEF 1 0 0 0 0 6e+05 0.0033939 \
  0.00084847 0.0042424 0.0041954 3.3e-07 0.08 0.02 0 0 0.1 "" edit_enz red \
  brown CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/Shc*.EGFR*.Sos.Grb2 1 1.6667e-06 0 0 2.777e-12 0 0 \
  1 0 6e+05 0 0 \
  "Perhaps we should also have the EGFR kinase activity on this." brown \
  yellow
simundump kenz /kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF 1 0 0 0 0 6e+05 \
  8.0628e-11 2.0157e-11 1.0078e-10 9.1304e-11 3.3e-07 0.08 0.02 0 0 0.1 \
  "Rates from Orita et al JBC 286:34 pp 25542" edit_enz red brown CoComplex \
  kpool enzproto_to_pool_link
simundump group /kinetics/PKC 0 "" edit_group blue black x group 0 0
simundump kpool /kinetics/PKC/PKC-Ca 0 0.28282 3.7208e-17 3.7208e-17 \
  1.2901e-24 2.2325e-11 2.2325e-11 1.6969e+05 0 6e+05 0 1 "" red black
simundump kreac /kinetics/PKC/PKC-act-by-Ca 0 34687 34687 1e-06 0.5 1 \
  "Need est of rate of assoc of Ca and PKC. Assume it is fast\nThe original parameter-searched kf of 439.4 has been\nscaled by 1/6e8 to account for change of units to n. Kf now 8.16e-7, kb=.6085\nRaised kf to 1e-6 to match Ca curve, kb to .5\n" \
  edit_reac white blue A group
simundump kreac /kinetics/PKC/PKC-act-by-DAG 0 83248 83248 1.3333e-08 8.6348 \
  1 \
  "Need est of rate. Assume it is fast\nObtained from param search\nkf raised 10 X : see Shinomura et al PNAS 88 5149-5153 1991.\nkf changed from 3.865e-7 to 2.0e-7 in line with closer analysis of\nShinomura data.\n26 June 1996: Corrected DAG data: reduce kf 15x from \n2e-7 to 1.333e-8" \
  edit_reac white blue A group
simundump kreac /kinetics/PKC/PKC-Ca-to-memb 0 88137 88137 1.2705 3.5026 1 "" \
  edit_reac white blue A group
simundump kreac /kinetics/PKC/PKC-DAG-to-memb 0 9641 9641 1 0.1 1 \
  "Raise kb from .087 to 0.1 to match data from Shinomura et al.\nLower kf from 1.155 to 1.0 to match data from Shinomura et al." \
  edit_reac white blue A group
simundump kreac /kinetics/PKC/PKC-act-by-Ca-AA 0 4162.4 4162.4 2e-09 0.1 1 \
  "Schaechter and Benowitz We have to increase Kf for conc scaling\nChanged kf to 2e-9 on Sept 19, 94. This gives better match.\n" \
  edit_reac white blue A group
simundump kreac /kinetics/PKC/PKC-act-by-DAG-AA 0 46827 46827 2 0.2 1 \
  "Assume slowish too. Schaechter and Benowitz" edit_reac white blue A group
simundump kpool /kinetics/PKC/PKC-DAG-AA* 0 0.12061 4.9137e-18 4.9137e-18 0 \
  2.9482e-12 2.9482e-12 72366 0 6e+05 0 1 "" cyan blue
simundump kpool /kinetics/PKC/PKC-Ca-AA* 0 0.16962 1.75e-16 1.75e-16 \
  7.7347e-25 1.05e-10 1.05e-10 1.0177e+05 0 6e+05 0 1 "" orange blue
simundump kpool /kinetics/PKC/PKC-Ca-memb* 0 0.10258 1.3896e-17 1.3896e-17 \
  4.6792e-25 8.3376e-12 8.3376e-12 61549 0 6e+05 0 1 "" pink blue
simundump kpool /kinetics/PKC/PKC-DAG-memb* 0 0.023753 9.4352e-21 9.4352e-21 \
  0 5.6611e-15 5.6611e-15 14252 0 6e+05 0 1 "" yellow blue
simundump kpool /kinetics/PKC/PKC-basal* 0 0.0432 0.02 0.02 3.1847e-25 12000 \
  12000 25920 0 6e+05 0 1 "" pink blue
simundump kreac /kinetics/PKC/PKC-basal-act 0 57812 57812 1 50 1 \
  "Initial basal levels were set by kf = 1, kb = 20. In model, though, the\nbasal levels of PKC activity are higher." \
  edit_reac white blue A group
simundump kpool /kinetics/PKC/PKC-AA* 0 1 1.8133e-17 1.8133e-17 7.6713e-24 \
  1.088e-11 1.088e-11 6e+05 0 6e+05 0 1 "" cyan blue
simundump kreac /kinetics/PKC/PKC-act-by-AA 0 346.87 346.87 2e-10 0.1 1 \
  "Raise kf from 1.667e-10 to 2e-10 to get better match to data." edit_reac \
  white blue A group
simundump kpool /kinetics/PKC/PKC-Ca-DAG 0 0.0017993 8.4632e-23 8.4632e-23 0 \
  5.0779e-17 5.0779e-17 1079.6 0 6e+05 0 1 "" white blue
simundump kreac /kinetics/PKC/PKC-n-DAG 0 5203 5203 1e-09 0.1 1 \
  "kf raised 10 X based on Shinomura et al PNAS 88 5149-5153 1991\ncloser analysis of Shinomura et al: kf now 1e-8 (was 1.66e-8).\nFurther tweak. To get sufficient AA synergy, increase kf to 1.5e-8\n26 June 1996: Corrected DAG levels: reduce kf by 15x from\n1.5e-8 to 1e-9" \
  edit_reac white blue A group
simundump kpool /kinetics/PKC/PKC-DAG 0 0.08533 1.161e-16 1.161e-16 0 \
  6.9661e-11 6.9661e-11 51198 0 6e+05 0 1 "CoInit was .0624\n" white blue
simundump kreac /kinetics/PKC/PKC-n-DAG-AA 0 46827 46827 3e-08 2 1 \
  "Reduced kf to 0.66X to match Shinomura et al data.\nInitial: kf = 3.3333e-9\nNew: 2e-9\nNewer: 2e-8\nkb was 0.2\nnow 2." \
  edit_reac white blue A group
simundump kpool /kinetics/PKC/PKC-DAG-AA 0 0.012093 2.5188e-19 2.5188e-19 0 \
  1.5113e-13 1.5113e-13 7255.5 0 6e+05 0 1 "" white blue
simundump kpool /kinetics/PKC/PKC-cytosolic 0 1.5489 1 1 1.1208e-23 6e+05 \
  6e+05 9.2935e+05 0 6e+05 0 1 \
  "Marquez et al J. Immun 149,2560(92) est 1e6/cell for chromaffin cells\nWe will use 1 uM as our initial concen\n" \
  white blue
simundump kpool /kinetics/DAG 1 1.5 0 0 0 0 0 9e+05 0 6e+05 2 0 \
  "The conc of this has been a problem. Schaecter and Benowitz use 50 uM,\nbut Shinomura et al have < 5. So I have altered the DAG-dependent \nrates in the PKC model to reflect this." \
  green black
simundump kpool /kinetics/Ca 1 0.16 0.08 0.08 4.2592e-18 48000 48000 96000 0 \
  6e+05 2 0 "" red black
simundump kpool /kinetics/AA 0 1 0 0 0 0 0 6e+05 0 6e+05 0 1 "" darkgreen \
  black
simundump kpool /kinetics/PKC-active 1 0.02 2.1222e-16 0.02 2.1077e-34 12000 \
  12000 12000 0 6e+05 2 0 "" red black
simundump kenz /kinetics/PKC-active/PKC-act-raf 1 0 0 0 0 6e+05 0 0 0 3238.9 \
  5e-07 16 4 0 0 20 \
  "Rate consts from Chen et al Biochem 32, 1032 (1993)\nk3 = k2 = 4\nk1 = 9e-5\nrecalculated gives 1.666e-5, which is not very different.\nLooks like k3 is rate-limiting in this case: there is a huge amount\nof craf locked up in the enz complex. Let us assume a 10x\nhigher Km, ie, lower affinity.  k1 drops by 10x.\nAlso changed k2 to 4x k3.\nLowerd k1 to 1e-6 to balance 10X DAG sensitivity of PKC" \
  edit_enz red yellow CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PKC-active/PKC-inact-GAP 1 0 0 0 0 0 358.95 89.737 \
  448.68 448.68 1e-05 16 4 0 0 20 \
  "Rate consts copied from PCK-act-raf\nThis reaction inactivates GAP. The idea is from the \nBoguski and McCormick review." \
  edit_enz red yellow CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PKC-active/PKC-act-GEF 1 0 0 0 0 0 1.775e-09 \
  4.4374e-10 2.2187e-09 2.2187e-09 1e-05 16 4 0 0 20 \
  "Rate consts from PKC-act-raf.\nThis reaction activates GEF. It can lead to at least 2X stim of ras, and\na 2X stim of MAPK over and above that obtained via direct phosph of\nc-raf. Note that it is a push-pull reaction, and there is also a contribution\nthrough the phosphorylation and inactivation of GAPs.\nThe original PKC-act-raf rate consts are too fast. We lower K1 by 10 X" \
  edit_enz red yellow CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PKC-active/PKC-phosph-neurogranin 1 0 0 0 0 6e+05 \
  7578.1 1878.3 9456.5 9456.4 1.7e-07 2.34 0.58 0 0 2.92 \
  "Rates from Huang et al ABB 305:2 570-580 1993" edit_enz red red CoComplex \
  kpool enzproto_to_pool_link
simundump kenz /kinetics/PKC-active/PKC-phosph-ng-CaM 1 0 0 0 0 6e+05 18492 \
  4622.9 23115 23114 1.02e-07 1.4 0.35 0 0 1.75 \
  "Rates are 60% those of PKC-phosph-neurogranin. See\nHuang et al ABB 305:2 570-580 1993" \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PKC-active/phosph-AC2 1 0 0 0 0 6e+05 285.25 71.312 \
  356.56 356.56 1e-06 16 4 0 0 20 \
  "Phorbol esters have little effect on AC1 or on the Gs-stimulation of\nAC2. So in this model we are only dealing with the increase in\nbasal activation of AC2 induced by PKC\nk1 = 1.66e-6\nk2 = 16\nk3 =4\n" \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump group /kinetics/PLA2 0 \
  "Mail source of data: Leslie and Channon BBA 1045 (1990) pp 261-270.\nFig 6 is Ca curve. Fig 4a is PIP2 curve. Fig 4b is DAG curve. Also see\nWijkander and Sundler JBC 202 (1991) pp873-880;\nDiez and Mong JBC 265(24) p14654;\nLeslie JBC 266(17) (1991) pp11366-11371" \
  edit_group darkgreen black x group 0 1
simundump kpool /kinetics/PLA2/PLA2-cytosolic 0 0.4 0.4 0.4 1.0792e-24 \
  2.4e+05 2.4e+05 2.4e+05 0 6e+05 0 1 \
  "Calculated cytosolic was 20 nm from Wijkander and Sundler\nHowever, Leslie and Channon use about 400 nM. Need to confirm,\nbut this is the value I use here. Another recalc of W&S gives 1uM" \
  yellow darkgreen
simundump kreac /kinetics/PLA2/PLA2-Ca-act 0 498.41 0 1.6667e-06 0.1 1 \
  "Leslie and Channon BBA 1045 (1990) 261-270 fig6 pp267." edit_reac white \
  darkgreen A group
simundump kpool /kinetics/PLA2/PLA2-Ca* 0 1 0 0 7.652e-24 0 0 6e+05 0 6e+05 0 \
  1 "" yellow darkgreen
simundump kenz /kinetics/PLA2/PLA2-Ca*/kenz 0 0 0 0 0 6e+05 1.6153e+05 40381 \
  2.0191e+05 2.0185e+05 2.25e-06 21.6 5.4 0 0 27 \
  "10 x raise oct22\n12 x oct 24, set k2 = 4 * k3" edit_enz red yellow \
  CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/PLA2/PIP2-PLA2-act 0 4622.4 4682.4 2e-09 0.5 1 "" \
  edit_reac white darkgreen A group
simundump kpool /kinetics/PLA2/PIP2-PLA2* 0 1 0 0 7.5972e-24 0 0 6e+05 0 \
  6e+05 0 1 "" cyan darkgreen
simundump kenz /kinetics/PLA2/PIP2-PLA2*/kenz 0 0 0 0 0 6e+05 6.1234e+05 \
  1.5309e+05 7.6543e+05 7.6546e+05 4.6e-06 44.16 11.04 0 0 55.2 \
  "10 X raise oct 22\n12 X further raise oct 24 to allow for correct conc of enzyme\n" \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/PLA2/PIP2-Ca-PLA2-act 0 1896.2 1495.2 2e-08 0.1 1 \
  "" edit_reac white darkgreen A group
simundump kpool /kinetics/PLA2/PIP2-Ca-PLA2* 0 1 0 0 7.4722e-24 0 0 6e+05 0 \
  6e+05 0 1 "" cyan darkgreen
simundump kenz /kinetics/PLA2/PIP2-Ca-PLA2*/kenz 0 0 0 0 0 6e+05 4.0959e+06 \
  1.024e+06 5.1199e+06 5.1197e+06 1.5e-05 144 36 0 0 180 \
  "10 x raise oct 22\n12 x and rescale for k2 = 4 * k3 convention oct 24\nIncrease further to get the match to expt, which was spoilt due\nto large accumulation of PLA2 in the enzyme complexed forms.\nLets raise k3, leaving the others at \nk1 = 1.5e-5 and k2 = 144 since they are large already.\n" \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/PLA2/DAG-Ca-PLA2-act 0 1504.3 1495.2 5e-09 4 1 \
  "27 June 1996\nScaled kf down by 0.015\nfrom 3.33e-7 to 5e-9\nto fit with revised DAG estimates\nand use of mole-fraction to calculate eff on PLA2." \
  edit_reac white darkgreen A group
simundump kpool /kinetics/PLA2/DAG-Ca-PLA2* 0 1 0 0 7.7112e-24 0 0 6e+05 0 \
  6e+05 0 1 "" pink darkgreen
simundump kenz /kinetics/PLA2/DAG-Ca-PLA2*/kenz 0 0 0 0 0 6e+05 1.3539e+05 \
  33848 1.6924e+05 1.6923e+05 2.5e-05 240 60 0 0 300 \
  "10 X raise oct 22\n12 X raise oct 24 + conversion to k2 =4 * k3" edit_enz \
  red pink CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/PLA2/APC 0 30 30 30 0 1.8e+07 1.8e+07 1.8e+07 0 \
  6e+05 5 1 \
  "arachodonylphosphatidylcholine is the favoured substrate\nfrom Wijkander and Sundler, JBC 202 pp 873-880, 1991.\nTheir assay used 30 uM substrate, which is what the kinetics in\nthis model are based on. For the later model we should locate\na more realistic value for APC." \
  yellow darkgreen
simundump kreac /kinetics/PLA2/Degrade-AA 1 0 1.2585e+06 0.4 0 1 \
  "I need to check if the AA degradation pathway really leads back to \nAPC. Anyway, it is a convenient buffered pool to dump it back into.\nFor the purposes of the full model we use a rate of degradation of\n0.2/sec\nRaised decay to 0.4 : see PLA35.g notes for Feb17 " \
  edit_reac white darkgreen A group
simundump kpool /kinetics/PLA2/PLA2*-Ca 0 1 0 0 7.7162e-24 0 0 6e+05 0 6e+05 \
  1 1 \
  "Phosphorylated form of PLA2. Still need to hook it up using kinases.\nPKA: Wightman et al JBC 257 pp6650 1982\nPKC: Many refs, eg Gronich et al JBC 263 pp 16645, 1988 but see Lin etal\nMAPK: Lin et al, Cell 72 pp 269, 1993.  Show 3x with MAPK but not PKC alone\nDo not know if there is a Ca requirement for active phosphorylated state." \
  orange darkgreen
simundump kenz /kinetics/PLA2/PLA2*-Ca/kenz 0 0 0 0 0 6e+05 0 0 0 0 5e-05 480 \
  120 0 0 600 \
  "This form should be 3 to 6 times as fast as the Ca-only form.\nI have scaled by 4x which seems to give a 5x rise.\n10x raise Oct 22\n12 x oct 24, changed k2 = 4 * k3" \
  edit_enz red orange CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/PLA2/PLA2* 1 1.6667e-06 0 0 1.286e-29 0 0 1 0 6e+05 \
  0 0 "" orange darkgreen
simundump kreac /kinetics/PLA2/PLA2*-Ca-act 1 0 0 1e-05 0.1 1 \
  "To start off, same kinetics as the PLA2-Ca-act direct pathway.\nOops ! Missed out the Ca input to this pathway first time round.\nLet's raise the forward rate about 3x to 5e-6. This will let us reduce the\nrather high rates we have used for the kenz on PLA2*-Ca. In fact, it\nmay be that the rates are not that different, just that this pathway for\ngetting the PLA2 to the memb is more efficien...." \
  edit_reac white darkgreen A group
simundump kreac /kinetics/PLA2/dephosphorylate-PLA2* 1 0 0 0.17 0 1 "" \
  edit_reac white darkgreen A group
simundump kpool /kinetics/temp-PIP2 1 25 2.5 2.5 0 1.5e+06 1.5e+06 1.5e+07 0 \
  6e+05 6 1 \
  "This isn't explicitly present in the M&L model, but is obviously needed.\nI assume its conc is fixed at 1uM for now, which is a bit high. PLA2 is stim\n7x by PIP2 @ 0.5 uM (Leslie and Channon BBA 1045:261(1990) \nLeslie and Channon say PIP2 is present at 0.1 - 0.2mol% range in membs,\nwhich comes to 50 nM. Ref is Majerus et al Cell 37 pp 701-703 1984\nLets use a lower level of 30 nM, same ref...." \
  green black
simundump kpool /kinetics/IP3 1 1.71 0 0 0 0 0 1.026e+06 0 6e+05 0 0 \
  "Peak IP3 is perhaps 15 uM, basal <= 0.2 uM." pink black
simundump kpool /kinetics/Glu 1 1000 0 0 4.6208e-15 0 0 6e+08 0 6e+05 0 1 \
  "Varying the amount of (steady state) glu between .01 uM and up, the\nfinal amount of G*GTP complex does not change much. This means that\nthe system should be reasonably robust wr to the amount of glu in the\nsynaptic cleft. It would be nice to know how fast it is removed." \
  green black
simundump group /kinetics/PLCbeta 1 "Group for PLC beta" edit_group maroon \
  black x group 0 0
simundump kreac /kinetics/PLCbeta/Act-PLC-Ca 1 1.4927e+05 1.4926e+05 5e-06 1 \
  1 \
  "Affinity for Ca = 1uM without AlF, 0.1 with:\n from Smrcka et al science 251 pp 804-807 1991\nso [Ca].kf = kb so kb/kf = 1 * 6e5 = 1/1.66e-6\n\n11 June 1996: Raised affinity to 5e-6 to maintain\nbalance. See notes." \
  edit_reac white maroon A group
simundump kpool /kinetics/PLCbeta/PLC 1 0.8 0.8 0.8 6.1088e-24 4.8e+05 \
  4.8e+05 4.8e+05 0 6e+05 0 1 \
  "Total PLC = 0.8 uM see Ryu et al JBC 262 (26) pp 12511 1987" cyan maroon
simundump kreac /kinetics/PLCbeta/Degrade-IP3 1 0 5.0884e+06 1 0 1 \
  "The enzyme is IP3 5-phosphomonesterase. about 45K. Actual products\nare Ins(1,4)P2, and cIns(1:2,4,5)P3.  review in Majerus et al Science 234\n1519-1526, 1986.\nMeyer and Stryer 1988 PNAS 85:5051-5055 est decay of IP3 at\n 1-3/sec" \
  edit_reac white maroon A group
simundump kpool /kinetics/PLCbeta/Inositol 1 0 0 0 0 0 0 0 0 6e+05 5 0 "" \
  green maroon
simundump kreac /kinetics/PLCbeta/Degrade-DAG 1 0 5.0113e+06 0.02 0 1 \
  "These rates are the same as for degrading IP3, but I am sure that they could\nbe improved.\nLets double kf to 0.2, since the amount of DAG in the cell should be <= 1uM.\nNeed to double it again, for the same reason.\nkf now goes up to 0.5\n27 June 1996\nkf is now 0.02 to get 50 sec time course\nIt also gives close to 10 uM resting DAG" \
  edit_reac white maroon A group
simundump kpool /kinetics/PLCbeta/PC 1 1 0 0 0 0 0 1 0 1 4 0 \
  "Phosphatidylcholine is the main (around 55%) metabolic product of DAG,\nfollwed by PE (around 25%). Ref is Welsh and Cabot, JCB35:231-245(1987)" \
  green maroon
simundump kpool /kinetics/PLCbeta/PLC-Ca 1 0.061192 0 0 0 0 0 36715 0 6e+05 0 \
  0 "" cyan maroon
simundump kenz /kinetics/PLCbeta/PLC-Ca/PLC-Ca 1 0 0 0 0 6e+05 7.5231e+05 \
  1.8808e+05 9.4039e+05 9.4039e+05 4.2e-06 40 10 0 0 50 \
  "From Sternweis et al Phil Trans R Soc Lond 1992, also matched by Homma et al.\nk1 = 1.5e-5, now 4.2e-6\nk2 = 70/sec; now 40/sec\nk3 = 17.5/sec; now 10/sec\nNote that the wording in Sternweis et al is\nambiguous re the Km." \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/PLCbeta/Act-PLC-by-Gq 1 2.0418e+05 2.0689e+05 \
  4.2e-05 1 1 \
  "Affinity for Gq is > 20 nM (Smrcka et al Science251 804-807 1991)\nso [Gq].kf = kb so 40nM * 6e5 = kb/kf = 24e3 so kf = 4.2e-5, kb =1\n" \
  edit_reac white maroon A group
simundump kreac /kinetics/PLCbeta/Inact-PLC-Gq 1 0 2715.6 0.0133 0 1 \
  "This process is assumed to be directly caused by the inactivation of\nthe G*GTP to G*GDP. Hence, \nkf = .013 /sec = 0.8/min, same as the rate for Inact-G.\nkb = 0 since this is irreversible.\nWe may be\ninterested in studying the role of PLC as a GAP. If so, the kf would be faster here\nthan in Inact-G" \
  edit_reac white maroon A group
simundump kpool /kinetics/PLCbeta/PLC-Ca-Gq 0 0.008698 0 0 0 0 0 5218.8 0 \
  6e+05 0 0 \
  "This should really be labelled PLC-G*GTP-Ca.\nThis is the activated form of the enzyme. Mahama and Linderman assume\nthat the IP3 precursors are not rate-limiting, but I will include those for\ncompleteness as they may be needed later.\n" \
  cyan maroon
simundump kenz /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq 0 0 0 0 0 6e+05 \
  1.9601e+07 4.9003e+06 2.4501e+07 2.4501e+07 8e-05 192 48 0 0 240 \
  "From Sternweis et al, Phil Trans R Soc Lond 1992, and the values from\nother refs eg Homma et al JBC 263(14) pp6592 1988 match.\nk1 = 5e-5/sec\nk2 = 240/sec; now 120/sec\nk3 = 60/sec; now 30/sec\nNote that the wording in Sternweis et al\nis ambiguous wr. to the Km for Gq vs non-Gq states of PLC. \nK1 is still a bit too low. Raise to 7e-5\n9 Jun 1996: k1 was 0.0002, changed to 5e-5" \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/PLCbeta/PLC-Gq 1 0.063588 0 0 4.8188e-25 0 0 38153 \
  0 6e+05 0 1 "" cyan maroon
simundump kreac /kinetics/PLCbeta/PLC-bind-Gq 1 680.63 689.58 4.2e-06 1 1 \
  "this binding does not produce active PLC. This step was needed to\nimplement the described (Smrcka et al) increase in affinity for Ca\nby PLC once Gq was bound.\nThe kinetics are the same as the binding step for Ca-PLC to Gq.\n\nJune 1996:\nChanged the kf to 4.2e-5 to 4.2e-6 to preserve balance around\nthe reactions. " \
  edit_reac white maroon A group
simundump kreac /kinetics/PLCbeta/PLC-Gq-bind-Ca 1 2.0418e+05 2.0419e+05 \
  5e-05 1 1 \
  "this step has a high affinity for Ca, from Smrcka et al. 0.1uM\nso kf /kb = 1/6e4 = 1.666e-5:1. See the Act-PLC-by-Gq reac.\n11 Jun 1996: Raised kf to 5e-5 based on match to conc-eff\ncurves from Smrcka et al." \
  edit_reac white maroon A group
simundump kpool /kinetics/PIP2 1 5 2.5 2.5 0 1.5e+06 1.5e+06 3e+06 0 6e+05 6 \
  1 \
  "PIP2 concs are difficult: in memb at 0.1 to 0.5%. Cell conc est 50 nM. Eff\nconc for PLC (memb bound) will be much higher.\n PLA2 is stim 7x by PIP2 @ 0.5 uM (Leslie and Channon BBA 1045:261(1990) \nLeslie and Channon say PIP2 is present at 0.1 - 0.2mol% range in membs,\nwhich comes to 50 nM. Ref is Majerus et al Cell 37 pp 701-703 1984\ncPLA2 will see a lower conc till it attaches to memb." \
  green black
simundump kpool /kinetics/BetaGamma 1 1.6 0 0 5.5688e-41 0 0 9.6e+05 0 6e+05 \
  0 0 \
  "These exist in a nebulous sense in this model, basically only to balance\nthe conservation equations. The details of their reassociation with G-GDP\nare not modeled\nResting level =0.0094, stim level =.0236 from all42.g ish." \
  yellow black
simundump kpool /kinetics/G*GTP 1 5 0 0 3.8117e-23 0 0 3e+06 0 6e+05 2 0 \
  "Activated G protein. Berstein et al indicate that about 20-40% of the total\nGq alpha should bind GTP at steady stim. This sim gives more like 65%." \
  red black
simundump kpool /kinetics/G*GDP 1 0.1667 0 0 0 0 0 1.0002e+05 0 6e+05 0 0 "" \
  yellow black
simundump group /kinetics/Gq 1 \
  "We assume GTP is present in fixed amounts, so we leave it out\nof the explicit equations in this model. Normally we would expect it\nto associate along with the G-Receptor-ligand complex.\nMost info is from Berstein et al JBC 267:12 8081-8088 1992\nStructure of rec activation of Gq from Fay et al Biochem 30 5066-5075 1991" \
  edit_group blue black x group 0 0
simundump kreac /kinetics/Gq/RecLigandBinding 1 0 0 2.8e-05 10 1 \
  "kf = kf from text = 1e7 / M / sec = 10 /uM/sec = 10 / 6e5 / # / sec  = 1.67e-5\nkb = kr from text = 60 / sec\nNote that we continue to use uM here since [phenylephrine] is also in uM.\nFrom Martin et al FEBS Lett 316:2 191-196 1993 we have Kd = 600 nM\nAssuming kb = 10/sec, we get kf = 10/(0.6 uM * 6e5) = 2.8e-5 1/sec/#" \
  edit_reac white blue A group
simundump kpool /kinetics/Gq/G-GDP 1 1.6 1 1 5.4403e-24 6e+05 6e+05 9.6e+05 0 \
  6e+05 0 0 \
  "From M&L, total Gprot = 1e5molecules/cell\nAt equil, 92340 are here, 400 are in G*GTP, and another 600 are assoc\nwith the PLC and 6475 are as G*GDP. This is OK.\n\nFrom Pang and Sternweis JBC 265:30 18707-12 1990 we get conc est 1.6 uM\nto 0.8 uM. A number of other factors are involved too.\n" \
  yellow blue
simundump kreac /kinetics/Gq/Basal-Act-G 1 0 53.698 0.0001 0 1 \
  "kf = kg1 = 0.01/sec, kb = 0. This is the basal exchange of GTP for GDP." \
  edit_reac white blue A group
simundump kreac /kinetics/Gq/Trimerize-G 1 0 53.707 1e-05 0 1 \
  "kf == kg3 = 1e-5 /cell/sec. As usual, there is no back-reaction\nkb = 0" \
  edit_reac white blue A group
simundump kreac /kinetics/Gq/Inact-G 1 0 438.9 0.0133 0 1 \
  "From Berstein et al JBC 267:12 8081-8088 1992, kcat for GTPase activity\nof Gq is only 0.8/min" \
  edit_reac white blue A group
simundump kpool /kinetics/Gq/mGluR 1 0.3 0.3 0.3 8.087e-25 1.8e+05 1.8e+05 \
  1.8e+05 0 6e+05 0 0 \
  "From M&L, Total # of receptors/cell = 1900\nVol of cell = 1e-15 (10 um cube). Navogadro = 6.023e23\nso conversion from n to conc in uM is n/vol*nA * 1e3 = 1.66e-6\nHowever, for typical synaptic channels the density is likely to be very\nhigh at the synapse. Use an estimate of 0.1 uM for now. this gives\na total of about 60K receptors/cell, which is in line with Fay et at." \
  green blue
simundump kpool /kinetics/Gq/Rec-Glu 1 0.8 0 0 6.1728e-24 0 0 4.8e+05 0 6e+05 \
  0 0 \
  "This acts like an enzyme to activate the g proteins\nAssume cell has vol 1e-15 m^3 (10 uM cube), conversion factor to\nconc in uM is 6e5\n" \
  green blue
simundump kpool /kinetics/Gq/Rec-Gq 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "Fraction of Rec-Gq is 44%  of rec, from Fay et al.\nSince this is not the same receptor, this value is a bit doubtful. Still,\nwe adjust the rate consts in Rec-bind-Gq to match." \
  green blue
simundump kreac /kinetics/Gq/Rec-Glu-bind-Gq 1 0 0 1e-08 0.0001 1 \
  "This is the k1-k2 equivalent for enzyme complex formation in the\nbinding of Rec-Glu to Gq.\nSee Fay et al Biochem 30 5066-5075 1991.\nkf = 5e-5 which is nearly the same as calculated by Fay et al. (4.67e-5)\nkb = .04\n\nJune 1996: Closer reading of Fay et al suggests that \nkb <= 0.0001, so kf = 1e-8 by detailed balance. This\nreaction appears to be neglible." \
  edit_reac white blue A group
simundump kreac /kinetics/Gq/Glu-bind-Rec-Gq 1 0 0 2.8e-05 0.1 1 \
  "From Fay et al\nkb3 = kb = 1.06e-3 which is rather slow.\nk+1 = kf = 2.8e7 /M/sec= 4.67e-5/sec use 5e-5.\nHowever, the Kd from Martin et al may be more appropriate, as this\nis Glu not the system from Fay.\nkf = 2.8e-5, kb = 10\nLet us compromise. since we have the Fay model, keep kf = k+1 = 2.8e-5.\nBut kb (k-3) is .01 * k-1 from Fay. Scaling by .01, kb = .01 * 10 = 0.1" \
  edit_reac white blue A group
simundump kpool /kinetics/Gq/Rec-Glu-Gq 1 1.6667e-06 0 0 1.286e-29 0 0 1 0 \
  6e+05 0 0 "" orange blue
simundump kreac /kinetics/Gq/Activate-Gq 1 0 0 0.01 0 1 \
  "This is the kcat==k3 stage of the Rec-Glu ezymatic activation of Gq.\nFrom Berstein et al actiation is at .35 - 0.7/min\nFrom Fay et al Biochem 30 5066-5075 1991 kf = .01/sec\nFrom Nakamura et al J physiol Lond 474:1 35-41 1994 see time courses.\nAlso (Berstein) 15-40% of gprot is in GTP-bound form on stim." \
  edit_reac white blue A group
simundump kreac /kinetics/Gq/Rec-bind-Gq 1 62887 62887 1e-06 1 1 \
  "Lets try out the same kinetics as the Rec-Glu-bind-Gq\nThis is much too forward. We know that the steady-state\namount of Rec-Gq should be 40% of the total amount of receptor.\nThis is for a different receptor, still we can try to match the value.\nkf = 1e-6 and kb = 1 give 0.333:0.8 which is pretty close.\n" \
  edit_reac white blue A group
simundump kpool /kinetics/Gq/mGluRAntag 1 100 0 0 0 0 0 6e+07 0 6e+05 4 1 \
  "I am implementing this as acting only on the Rec-Gq complex, based on\na more complete model PLC_Gq48.g\nwhich showed that the binding to the rec alone contributed only a small amount." \
  seagreen blue
simundump kreac /kinetics/Gq/Antag-bind-Rec-Gq 1 0 0 0.0001 0.01 1 \
  "The rate consts give a total binding affinity of only " edit_reac white \
  blue A group
simundump kpool /kinetics/Gq/Blocked-rec-Gq 1 1.6667e-06 0 0 1.286e-29 0 0 1 \
  0 6e+05 0 0 "" seagreen blue
simundump group /kinetics/MAPK 0 "" edit_group brown black x group 0 0
simundump kpool /kinetics/MAPK/craf-1 0 0.2 0.2 0.2 2.3355e-51 1.2e+05 \
  1.2e+05 1.2e+05 0 6e+05 0 1 \
  "Couldn't find any ref to the actual conc of craf-1 but I\nshould try Strom et al Oncogene 5 pp 345\nIn line with the other kinases in the cascade, I estimate the conc to be\n0.2 uM. To init we use 0.15, which is close to equil" \
  pink brown
simundump kpool /kinetics/MAPK/craf-1* 0 0.2 0 0 1.1906e-47 0 0 1.2e+05 0 \
  6e+05 0 1 "" pink brown
simundump kpool /kinetics/MAPK/MAPKK 0 0.18 0.18 0.18 0 1.08e+05 1.08e+05 \
  1.08e+05 0 6e+05 0 1 \
  "Conc is from Seger et al JBC 267:20 pp14373 (1992)\nmwt is 45/46 Kd\nWe assume that phosphorylation on both ser and thr is needed for\nactiviation. See Kyriakis et al Nature 358 417 1992\nInit conc of total is 0.18\n" \
  pink brown
simundump kpool /kinetics/MAPK/MAPK 0 0.36 0.36 0.36 0 2.16e+05 2.16e+05 \
  2.16e+05 0 6e+05 0 1 \
  "conc is from Sanghera et al JBC 265 pp 52 (1990)\nA second calculation gives 3.1 uM, from same paper.\nThey est MAPK is 1e-4x total protein, and protein is 15% of cell wt,\nso MAPK is 1.5e-5g/ml = 0.36uM. which is closer to our first estimate.\nLets use this." \
  pink brown
simundump kpool /kinetics/MAPK/craf-1** 1 0.2 0 0 1.1906e-47 0 0 1.2e+05 0 \
  6e+05 0 0 \
  "Negative feedback by MAPK* by hyperphosphorylating craf-1* gives\nrise to this pool.\nUeki et al JBC 269(22):15756-15761, 1994\n" \
  hotpink brown
simundump kpool /kinetics/MAPK/MAPK-tyr 1 0.36 0 0 2.1433e-47 0 0 2.16e+05 0 \
  6e+05 0 0 \
  "Haystead et al FEBS Lett. 306(1) pp 17-22 show that phosphorylation\nis strictly sequential, first tyr185 then thr183." \
  orange brown
simundump kpool /kinetics/MAPK/MAPKK* 0 0.18 0 0 1.0718e-47 0 0 1.08e+05 0 \
  6e+05 0 1 \
  "MAPKK phosphorylates MAPK on both the tyr and thr residues, first\ntyr then thr. Refs: Seger et al JBC267:20 pp 14373 1992\nThe MAPKK itself is phosphorylated on ser as well as thr residues.\nLet us assume that the ser goes first, and that the sequential phosphorylation\nis needed. See Kyriakis et al Nature 358 417-421 1992" \
  pink brown
simundump kenz /kinetics/MAPK/MAPKK*/MAPKKtyr 0 0 0 0 0 6e+05 0 0 0 0 2.7e-05 \
  0.6 0.15 0 0 0.75 \
  "The actual MAPKK is 2 forms from Seger et al JBC 267:20 14373(1992)\nVmax = 150nmol/min/mg\nFrom Haystead et al FEBS 306(1):17-22 we get Km=46.6nM for at least one\nof the phosphs.\nPutting these together:\nk3=0.15/sec, scale to get k2=0.6.\nk1=0.75/46.6nM=2.7e-5" \
  edit_enz red pink CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/MAPK/MAPKK*/MAPKKthr 1 0 0 0 0 6e+05 0 0 0 0 2.7e-05 \
  0.6 0.15 0 0 0.75 "Rate consts same as for MAPKKtyr." edit_enz red pink \
  CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/MAPK/MAPKK-ser 1 0.18 0 0 1.0718e-47 0 0 1.08e+05 0 \
  6e+05 0 0 "Intermediately phophorylated, assumed inactive, form of MAPKK" \
  pink brown
simundump kpool /kinetics/MAPK/Raf-GTP-Ras* 1 0.0104 0 0 6.1891e-49 0 0 6240 \
  0 6e+05 0 0 "" red brown
simundump kenz /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1 1 0 0 0 0 0 0 0 0 0 \
  5.5e-06 0.42 0.105 0 0 0.525 \
  "Kinetics are the same as for the craf-1* activity, ie.,\nk1=1.1e-6, k2=.42, k3 =0.105\nThese are based on Force et al PNAS USA 91 1270-1274 1994.\nThese parms cannot reach the observed 4X stim of MAPK. So lets\nincrease the affinity, ie, raise k1 10X to 1.1e-5\nLets take it back down to where it was.\nBack up to 5X: 5.5e-6" \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2 1 0 0 0 0 0 0 0 0 0 \
  5.5e-06 0.42 0.105 0 0 0.525 \
  "Same kinetics as other c-raf activated forms. See \nForce et al PNAS 91 1270-1274 1994.\nk1 = 1.1e-6, k2 = .42, k3 = 1.05\nraise k1 to 5.5e-6\n" \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/MKP-1 1 0.008 0.008 0.008 1.9642e-48 4800 4800 4800 \
  0 6e+05 0 1 \
  "MKP-1 dephosphoryates and inactivates MAPK in vivo: Sun et al Cell 75 \n487-493 1993. Suggest that in this case the levels of the MKP-1 protein itself\nare regulated, and rise in 1 hour to reduce MAPK activity. \nKinetics from Charles et al PNAS 90:5292-5296 1993. They refer\nto Charles et al Oncogene 7 187-190 who show that half-life of MKP1/3CH134\nis 40 min. 80% deph of MAPK in 20 min\n" \
  hotpink black
simundump kenz /kinetics/MKP-1/MKP1-tyr-deph 1 0 0 0 0 6e+05 0 0 0 0 0.000125 \
  4 1 0 0 5 \
  "The original kinetics have been modified to obey the k2 = 4 * k3 rule,\nwhile keeping kcat and Km fixed. As noted in the NOTES, the only constraining\ndata point is the time course of MAPK dephosphorylation, which this\nmodel satisfies. It would be nice to have more accurate estimates of\nrate consts and MKP-1 levels from the literature. \nEffective Km : 67 nM\nkcat = 1.43 umol/min/mg" \
  edit_enz red hotpink CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/MKP-1/MKP1-thr-deph 1 0 0 0 0 6e+05 0 0 0 0 0.000125 \
  4 1 0 0 5 "See MKP1-tyr-deph" edit_enz red hotpink CoComplex kpool \
  enzproto_to_pool_link
simundump kreac /kinetics/Ras-act-craf 1 0 0 4e-05 0.5 1 \
  "Assume the binding is fast and limited only by the amount of \nRas* available. So kf=kb/[craf-1]\nIf kb is 1/sec, then kf = 1/0.2 uM = 1/(0.2 * 6e5) = 8.3e-6\nLater: Raise it by 10 X to 4e-5\nFrom Hallberg et al JBC 269:6 3913-3916 1994, 3% of cellular Raf is\ncomplexed with Ras. So we raise kb 4x to 4\nThis step needed to memb-anchor and activate Raf: Leevers et al Nature\n369 411-414\n(I don't...." \
  edit_reac white black A group
simundump kpool /kinetics/PPhosphatase2A 1 0.16 0.16 0.16 0 96000 96000 96000 \
  0 6e+05 0 0 \
  "Refs: Pato et al Biochem J 293:35-41(93); Takai&Mieskes Biochem J 275:233-239\nKinetic consts from infoform file: k1=1.46e-4, k2=1000,k3=250. these use\nkcat values for calponin. Also, units of kcat may be in min! the\nsim with these values is awful, lets revert to Vmax base:\nk3=6, k2=25,k1=3.3e-6 or 6,6,1e-6\nCoInit assumed 0.1 uM.\nSee NOTES for MAPK_Ras50.g. CoInit now 0.08" \
  hotpink yellow
simundump kenz /kinetics/PPhosphatase2A/craf-deph 1 0 0 0 0 6e+05 0 0 0 0 \
  3.3e-06 25 6 0 0 31 "See parent PPhosphatase2A for parms\n" edit_enz red \
  hotpink CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PPhosphatase2A/MAPKK-deph 1 0 0 0 0 6e+05 0 0 0 0 \
  3.3e-06 25 6 0 0 31 \
  "See: Kyriakis et al Nature 358 pp 417-421 1992\nAhn et al Curr Op Cell Biol 4:992-999 1992 for this pathway.\nSee parent PPhosphatase2A for parms." \
  edit_enz red hotpink CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PPhosphatase2A/MAPKK-deph-ser 1 0 0 0 0 6e+05 0 0 0 \
  0 3.3e-06 25 6 0 0 31 "" edit_enz red hotpink CoComplex kpool \
  enzproto_to_pool_link
simundump kenz /kinetics/PPhosphatase2A/craf**-deph 1 0 0 0 0 0 0 0 0 0 \
  3.3e-06 25 6 0 0 31 \
  "Ueki et al JBC 269(22) pp 15756-15761 1994 show hyperphosphorylation of\ncraf, so this is there to dephosphorylate it. Identity of phosphatase is not\nknown to me, but it may be PP2A like the rest, so I have made it so." \
  edit_enz red hotpink CoComplex kpool enzproto_to_pool_link
simundump group /kinetics/Ras 1 \
  "Ras has now gotten to be a big enough component of the model to\ndeserve its own group. The main refs are\nBoguski and McCormick Nature 366 643-654 '93 Major review\nEccleston et al JBC 268:36 pp 27012-19\nOrita et al JBC 268:34 2554246" \
  edit_group blue black x group 0 0
simundump kreac /kinetics/Ras/bg-act-GEF 1 3.4255e-10 3.4256e-10 1e-05 1 1 \
  "SoS/GEF is present at 50 nM ie 3e4/cell. BetaGamma maxes out at 9e4.\nAssume we have 1/3 of the GEF active when the BetaGamma is 1.5e4.\nso 1e4 * kb = 2e4 * 1.5e4 * kf, so kf/kb = 3e-5. The rate of this equil should\nbe reasonably fast, say 1/sec\n" \
  edit_reac white blue A group
simundump kpool /kinetics/Ras/GEF-Gprot-bg 1 0.1 0 0 5.9532e-48 0 0 60000 0 \
  6e+05 0 1 \
  "Guanine nucleotide exchange factor. This activates raf by exchanging bound\nGDP with GTP. I have left the GDP/GTP out of this reaction, it would be\ntrivial to put them in. See Boguski & McCormick.\nPossible candidate molecules: RasGRF, smgGDS, Vav (in dispute). \nrasGRF: Kcat= 1.2/min    Km = 680 nM\nsmgGDS: Kcat: 0.37 /min, Km = 220 nM.\nvav: Turnover up over baseline by 10X, \n" \
  hotpink blue
simundump kenz /kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras 1 0 0 0 0 6e+05 \
  1.0852e-11 2.713e-12 1.3565e-11 1.3565e-11 3.3e-07 0.08 0.02 0 0 0.1 \
  "Kinetics based on the activation of Gq by the receptor complex in the\nGq model (in turn based on the Mahama and Linderman model)\nk1 = 2e-5, k2 = 1e-10, k3 = 10 (I do not know why they even bother with k2).\nLets put k1 at 2e-6 to get a reasonable equilibrium\nMore specific values from, eg.g: Orita et al JBC 268(34) 25542-25546\nfrom rasGRF and smgGDS: k1=3.3e-7; k2 = 0.08, k3 = 0.02\n" \
  edit_enz red hotpink CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/Ras/dephosph-GEF 1 0 4.4372e-10 1 0 1 "" edit_reac \
  white blue A group
simundump kpool /kinetics/Ras/inact-GEF 1 0.1 0.1 0.1 5.9532e-48 60000 60000 \
  60000 0 6e+05 0 1 \
  "Assume that SoS is present only at 50 nM.\nRevised to 100 nM to get equil to experimentally known levels." \
  hotpink blue
simundump kpool /kinetics/Ras/GEF* 1 0.1 0 0 5.9532e-48 0 0 60000 0 6e+05 0 0 \
  "phosphorylated and thereby activated form of GEF. See, e.g.\nOrita et al JBC 268:34 25542-25546 1993, Gulbins et al.\nIt is not clear whether there is major specificity for tyr or ser/thr." \
  hotpink blue
simundump kenz /kinetics/Ras/GEF*/GEF*-act-ras 1 0 0 0 0 6e+05 1.4053e-11 \
  3.5132e-12 1.7566e-11 1.7571e-11 3.3e-07 0.08 0.02 0 0 0.1 \
  "Kinetics same as GEF-bg-act-ras\n" edit_enz red hotpink CoComplex kpool \
  enzproto_to_pool_link
simundump kpool /kinetics/Ras/GTP-Ras 1 0.2 0 0 1.1906e-47 0 0 1.2e+05 0 \
  6e+05 0 0 \
  "Only a very small fraction (7% unstim, 15% stim) of ras is GTP-bound.\nGibbs et al JBC 265(33) 20437\n" \
  orange blue
simundump kpool /kinetics/Ras/GDP-Ras 1 0.2 0.2 0.2 0 1.2e+05 1.2e+05 1.2e+05 \
  0 6e+05 0 1 \
  "GDP bound form. See Rosen et al Neuron 12 1207-1221 June 1994.\nthe activation loop is based on Boguski and McCormick Nature 366 643-654 93\nAssume Ras is present at about the same level as craf-1, 0.2 uM.\nHallberg et al JBC 269:6 3913-3916 1994 estimate upto 5-10% of cellular\nRaf is assoc with Ras. Given that only 5-10% of Ras is GTP-bound, we\nneed similar amounts of Ras as Raf." \
  pink blue
simundump kreac /kinetics/Ras/Ras-intrinsic-GTPase 1 0 3.0487e-09 0.0001 0 1 \
  "This is extremely slow (1e-4), but it is significant as so little GAP actually\ngets complexed with it that the total GTP turnover rises only by\n2-3 X (see Gibbs et al, JBC 265(33) 20437-20422) and \nEccleston et al JBC 268(36) 27012-27019\nkf = 1e-4\n" \
  edit_reac white blue A group
simundump kreac /kinetics/Ras/dephosph-GAP 1 0 89.73 0.1 0 1 \
  "Assume a reasonably good rate for dephosphorylating it, 1/sec" edit_reac \
  white blue A group
simundump kpool /kinetics/Ras/GAP* 1 0.05 0 0 2.8867e-48 0 0 30000 0 6e+05 0 \
  1 "" red blue
simundump kpool /kinetics/Ras/GAP 1 0.002 0.002 0.002 9.1084e-50 1200 1200 \
  1200 0 6e+05 0 1 \
  "GTPase-activating proteins. See Boguski and McCormick.\nTurn off Ras by helping to hydrolyze bound GTP. \nThis one is probably NF1, ie.,  Neurofibromin as it is inhibited by AA and lipids,\nand expressed in neural cells. p120-GAP is also a possible candidate, but\nis less regulated. Both may exist at similar levels.\nSee Eccleston et al JBC 268(36) pp27012-19\nLevel=.002" \
  red blue
simundump kenz /kinetics/Ras/GAP/GAP-inact-ras 1 0 0 0 0 6e+05 1.413e-05 \
  1.413e-07 1.4271e-05 1.4271e-05 0.001666 1000 10 0 0 1010 \
  "From Eccleston et al JBC 268(36)pp27012-19 get Kd < 2uM, kcat - 10/sec\nFrom Martin et al Cell 63 843-849 1990 get Kd ~ 250 nM, kcat = 20/min\nI will go with the Eccleston figures as there are good error bars (10%). In general\nthe values are reasonably close.\nk1 = 1.666e-3/sec, k2 = 1000/sec, k3 = 10/sec (note k3 is rate-limiting)" \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/Ras/inact-GEF* 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "Phosphorylation-inactivated form of GEF. See\nHordijk et al JBC 269:5 3534-3538 1994\nand \nBuregering et al EMBO J 12:11 4211-4220 1993\n" \
  hotpink blue
simundump kreac /kinetics/Ras/CaM-bind-GEF 1 9.9888e-11 1.1379e-12 0.0001 1 1 \
  "We have no numbers for this. It is probably between\nthe two extremes represented by the CaMKII phosph states,\nand I have used guesses based on this.\nkf=1e-4\nkb=1\nThe reaction is based on Farnsworth et al Nature 376 524-527\n1995" \
  edit_reac white blue A group
simundump kpool /kinetics/Ras/CaM-GEF 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "See Farnsworth et al Nature 376 524-527 1995" pink blue
simundump kenz /kinetics/Ras/CaM-GEF/CaM-GEF-act-ras 1 0 0 0 0 6e+05 \
  3.1532e-12 7.8831e-13 3.9415e-12 3.9556e-12 3.3e-07 0.08 0.02 0 0 0.1 \
  "Kinetics same as GEF-bg_act-ras\n" edit_enz red pink CoComplex kpool \
  enzproto_to_pool_link
simundump kreac /kinetics/Ras/dephosph-inact-GEF* 1 0 0 1 0 1 "" edit_reac \
  white blue A group
simundump kpool /kinetics/PKA-active 1 1.6667e-06 0 0 2.1433e-35 0 0 1 0 \
  6e+05 0 0 "" yellow black
simundump kenz /kinetics/PKA-active/PKA-phosph-GEF 1 0 0 0 0 6e+05 3.9349e-10 \
  9.8372e-11 4.9186e-10 4.9186e-10 1e-05 36 9 0 0 45 \
  "This pathway inhibits Ras when cAMP is elevated. See:\nHordijk et al JBC 269:5 3534-3538 1994\nBurgering et al EMBO J 12:11 4211-4220 1993\nThe rates are the same as used in PKA-phosph-I1" \
  edit_enz red yellow CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PKA-active/PKA-phosph-I1 1 0 0 0 0 6e+05 1.5774e+05 \
  39436 1.9718e+05 1.9718e+05 1e-05 36 9 0 0 45 \
  "#s from Bramson et al CRC crit rev Biochem\n15:2 93-124. They have a huge list of peptide substrates\nand I have chosen high-ish rates.\nThese consts give too much PKA activity, so lower Vmax 1/3.\nNow, k1 = 3e-5, k2 = 36, k3 = 9 (still pretty fast).\nAlso lower Km 1/3  so k1 = 1e-5\nCohen et al FEBS Lett 76:182-86 1977 say rate =30% PKA act on \nphosphokinase beta.\n" \
  edit_enz red yellow CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PKA-active/PKA-phosph-GAP 1 0 0 0 0 6e+05 1103.3 \
  275.82 1379.1 1379.1 9e-05 108 27 0 0 135 "" edit_enz red yellow CoComplex \
  kpool enzproto_to_pool_link
simundump kenz /kinetics/PKA-active/phosph-PDE 1 0 0 0 0 6e+05 0 0 0 0 1e-05 \
  36 9 0 0 45 "Same rates as PKA-phosph-I1" edit_enz red yellow CoComplex \
  kpool enzproto_to_pool_link
simundump kpool /kinetics/CaM-Ca4 1 5 0 0 2.3148e-17 0 0 3e+06 0 6e+05 0 0 "" \
  blue yellow
simundump group /kinetics/CaMKII 1 \
  "Main reference here is the review by Hanson and Schulman, Ann Rev Biochem\n1992 vol 61 pp 559-601. Most of the mechanistic details and a few constants\nare derived from there. Many kinetics are from Hanson and Schulman JBC\n267:24 17216-17224 1992.\nThe enzs look a terrible mess. Actually it is just 3 reactions for diff sites,\nby 4 states of CaMKII, defined by the phosph state." \
  edit_group purple black x group 0 0
simundump kpool /kinetics/CaMKII/CaMKII 1 135 70 70 0 4.2e+07 4.2e+07 8.1e+07 \
  0 6e+05 0 0 \
  "Huge conc of CaMKII. In PSD it is 20-40% of protein, so we assume it is around\n2.5% of protein in spine as a whole. This level is so high it is unlikely to matter\nmuch if we are off a bit. This comes to about 70 uM." \
  palegreen purple
simundump kenz /kinetics/CaMKII/CaMKII/autoph-thr306-basal 1 0 0 0 0 6e+05 \
  5.7429e+06 114.86 5.743e+06 5.743e+06 0.6 100 0.002 0 0 100 \
  "This is for basal autophosphorylation on thr306\nHere we only have a rough initial time course of approx 10 min to go on. \nAssume [CaMKII] is nearly const, and that a fraction 1/x of [CaMKII] is present\nas enzcomplex. Then k3 = x/tau. \n[CaMKII]^2 . k1 ~ [CaMKII].k2/x so x ~ k2/(k1.[CaMKII])\nWe want x to be big. Let k1 = 1e-6, k2= 100 so x = 1e8/8.1e7 ~ 1.23 so k3 = 2e-3\nScale k1 up by 6e5...." \
  edit_enz red palegreen CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/CaMKII/CaMKII-CaM 1 0 0 0 0 0 0 0 0 6e+05 0 0 "" \
  palegreen purple
simundump kenz /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 1 0 0 0 0 6e+05 \
  0.2195 0.054876 0.27438 0.27437 1.54 2 0.5 0 0 2.5 \
  "This can only work on the CaMKII-CaM complex (Hanson & Schulman pg 575)\nRates are from Hanson and Schulman JBC 267:24 17216-17224. I am using\nthe pre-burst rates.\nk1 = 3.8e-6, k2= 0.92, k3= 0.23\nSee revised calculations in notes for Hanson et al Neuron Fig 5.\nk1 = 1.54 k2  = 2 k3 = 0.5\n" \
  edit_enz red palegreen CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 1 0 0 0 0 6e+05 \
  0.062261 0.015565 0.077827 0.077825 1.54 2 0.5 0 0 2.5 \
  "This really includes thr305, thr306 and possibly Ser314 as well.\nI am using rates derived for autocamtide phosphorylation, from\nHanson and Schulman JBC 267:24 17216-17224 1992\nk1 = 3.8e-6, k2= .92, k3 = 0.23\nScaling k1 because it is an intramol reacn:k1=2.3" \
  edit_enz red palegreen CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/CaMKII/CaMKII-thr286*-CaM 1 1.6667e-06 0 0 0 0 0 1 \
  0 6e+05 0 0 \
  "From Hanson and Schulman, the thr286 is responsible for autonomous activation\nof CaMKII." \
  palegreen purple
simundump kenz /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 1 0 0 0 0 \
  6e+05 0.0080795 0.0020199 0.010099 0.010099 1.54 2 0.5 0 0 2.5 \
  "The thr286 is only available as a phosph site when CaM is bound.\nSee CaMKII-CaM enz notes.\nk1 = 2.3, k2 = 0.92, k3 = 0.23\nSee CaMKII-CaM enz notes for autophosph in Hanson et al (fig 5)." \
  edit_enz red palegreen CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 1 0 0 0 0 \
  6e+05 0.0022917 0.00057293 0.0028647 0.0028646 1.54 2 0.5 0 0 2.5 \
  "Includes thr305, thr306 and possibly ser314 too.\nSee CAMKII-CaM enz notes." \
  edit_enz red palegreen CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/CaMKII/CaMKII*** 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 \
  0 \
  "From Hanson and Schulman, the CaMKII does a lot of autophosphorylation\njust after the CaM is released. This prevents further CaM binding and renders\nthe enzyme quite independent of Ca." \
  cyan purple
simundump kenz /kinetics/CaMKII/CaMKII***/autoph-thr-305 1 0 0 0 0 6e+05 \
  154.98 38.744 193.72 193.72 1 2 0.5 0 0 2.5 \
  "I assume here that the autonomous enz will happily phosphorylate ser305\nas well as anything else, and thereby disable CaM activation and make yet\nmore autonomous enz. However, the rate is now slower and corresponds to\nthe 'after-burst' rates of H&S JBC.\nk1 = 7.666667e-7. Scaling because it is intramol, we get k1=0.46\nk2 = .92, k3=.23\n" \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/CaMKII/CaMKII-bind-CaM 1 13677 13677 8.3333e-05 5 1 \
  "This is tricky. There is some cooperativity here arising from interactions\nbetween the subunits of the CAMKII holoenzyme. However, the\nstoichiometry is 1. \nKb/Kf = 6e4 #/cell. Rate is fast (see Hanson et al Neuron 12 943-956 1994)\nso lets say kb = 10. This gives kf = 1.6667e-4\nH&S AnnRev Biochem 92 give tau for dissoc as 0.2 sec at low Ca, 0.4 at high.\nLow Ca = 100 nM = physiol." \
  edit_reac white purple A group
simundump kreac /kinetics/CaMKII/CaMK-thr286-bind-CaM 1 10.069 10.588 \
  0.001667 0.1 1 \
  "Affinity is up 1000X. Time to release is about 20 sec, so the kb is OK at 0.1\nThis makes Kf around 1.6666e-3\n" \
  edit_reac white purple A group
simundump kpool /kinetics/CaMKII/CaMKII-thr286 1 1.6667e-06 0 0 0 0 0 1 0 \
  6e+05 0 0 \
  "I am not sure if we need to endow this one with a lot of enzs. It is likely\nto be a short-lived intermediate, since it will be phosphorylated further\nas soon as the CAM falls off." \
  red purple
simundump kenz /kinetics/CaMKII/CaMKII-thr286/autoph-thr305 1 0 0 0 0 0 \
  4.8164e+05 1.2041e+05 6.0206e+05 6.0205e+05 1 2 0.5 0 0 2.5 \
  "This is necessary because of the basal levels of phosphorylation." \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/CaMKII/CaMK-thr306 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 \
  0 0 \
  "This forms due to basal autophosphorylation, but I think it has to be\nconsidered as a pathway even if some CaM is floating around. In either\ncase it will tend to block further binding of CaM, and will not display any\nenzyme activity. See Hanson and Schulman JBC 267:24 pp17216-17224 1992" \
  palegreen purple
simundump kpool /kinetics/CaMKII/CaMKII** 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 \
  0 \
  "This pool is phosphorylated on thr305/306 but not on thr286. It is inactive." \
  cyan purple
simundump kpool /kinetics/CaMKII/total-CaMKII 1 70 70 70 0 4.2e+07 4.2e+07 \
  4.2e+07 0 6e+05 4 0 \
  "This pool is purely here to provide a single, fixed number,\nwhich is the total amount of CaMKII. This is used by the\nenzs to do their INTRAMOL msg." \
  cyan purple
simundump kreac /kinetics/CaMKII/basal-activity 1 0 60151 0.003 0 1 \
  "This reaction represents one of the big unknowns in CaMK-II\nbiochemistry: what maintains the basal level of phosphorylation\non thr 286 ? See Hanson and Schulman Ann Rev Biochem 1992\n61:559-601, specially pg 580, for review. I have not been able to\nfind any compelling mechanism in the literature, but fortunately\nthe level of basal activity is well documented. " \
  edit_reac white purple A group
simundump kpool /kinetics/PP1-active 1 1.8 1.8 1.8 6.1305e-41 1.08e+06 \
  1.08e+06 1.08e+06 0 6e+05 0 0 \
  "Cohen et al Meth Enz 159 390-408 is main source of info\nconc  = 1.8 uM" \
  cyan yellow
simundump kenz /kinetics/PP1-active/Deph-thr286 1 0 0 0 0 6e+05 2.3156 0.5789 \
  2.8945 2.8944 5.72e-07 1.4 0.35 0 0 1.75 \
  "The rates are from Stralfors et al Eur J Biochem 149 295-303 giving\nVmax = 5.7 umol/min giving k3 = 3.5/sec and k2 = 14.\nFoulkes et al Eur J Biochem 132 309-313 1983 give Km = 5.1 uM so\nk1 becomes 5.72e-6\nSimonelli 1984 (Grad Thesis, CUNY) showed that other substrates\nare about 1/10 rate of phosphorylase a, so we reduce k1,k2,k3 by 10\nto 5.72e-7, 1.4, 0.35" \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PP1-active/Deph-thr305 1 0 0 0 0 6e+05 2.4115e+05 \
  60288 3.0144e+05 3.0143e+05 5.72e-07 1.4 0.35 0 0 1.75 "" edit_enz red cyan \
  CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PP1-active/Deph-thr306 1 0 0 0 0 6e+05 473.62 118.41 \
  592.03 591.97 5.72e-07 1.4 0.35 0 0 1.75 "See Cohen et al" edit_enz red \
  cyan CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PP1-active/Deph-thr286c 1 0 0 0 0 6e+05 2.4115e+05 \
  60288 3.0144e+05 3.0143e+05 5.72e-07 1.4 0.35 0 0 1.75 "" edit_enz red cyan \
  CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PP1-active/Deph_thr286b 1 0 0 0 0 6e+05 17.844 \
  4.4611 22.305 22.305 5.72e-07 1.4 0.35 0 0 1.75 "" edit_enz red cyan \
  CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PP1-active/Deph-thr305b 1 0 0 0 0 6e+05 2.3754e+05 \
  59384 2.9692e+05 2.9693e+05 5.72e-07 1.4 0.35 0 0 1.75 \
  "Once the thr286 is dephosphorylated, we can't autophosph\nit again in the absence of CaM. Furthermore, CaM will not\nbind when thr305 is phosphorylated. So the only way out for\nthis pool is to go back to the basal dephosph state." \
  edit_enz red cyan CoComplex kpool enzproto_to_pool_link
simundump group /kinetics/CaM 1 "" edit_group blue black x group 0 0
simundump kpool /kinetics/CaM/CaM 1 25 20 20 8.7995e-23 1.2e+07 1.2e+07 \
  1.5e+07 0 6e+05 0 0 \
  "There is a LOT of this in the cell: upto 1% of total protein mass. (Alberts et al)\nSay 25 uM. Meyer et al Science 256 1199-1202 1992 refer to studies saying\nit is comparable to CaMK levels. \n" \
  pink blue
simundump kreac /kinetics/CaM/CaM-TR2-bind-Ca 1 3.759e+06 3.759e+06 2e-10 72 \
  1 \
  "Lets use the fast rate consts here. Since the rates are so different, I am not\nsure whether the order is relevant. These correspond to the TR2C fragment.\nWe use the Martin et al rates here, plus the Drabicowski binding consts.\nAll are scaled by 3X to cell temp.\nkf = 2e-10 kb = 72\nStemmer & Klee: K1=.9, K2=1.1. Assume 1.0uM for both. kb/kf=3.6e11.\nIf kb=72, kf = 2e-10 (Exactly the same !)...." \
  edit_reac white blue A group
simundump kreac /kinetics/CaM/CaM-TR2-Ca2-bind-Ca 1 15036 15036 6e-06 10 1 \
  "K3 = 21.5, K4 = 2.8. Assuming that the K4 step happens first, we get\nkb/kf = 2.8 uM = 1.68e6 so kf =6e-6 assuming kb = 10\n" \
  edit_reac white blue A group
simundump kreac /kinetics/CaM/CaM-Ca3-bind-Ca 1 55.934 55.934 7.75e-07 10 1 \
  "Use K3 = 21.5 uM here from Stemmer and Klee table 3.\nkb/kf =21.5 * 6e5 so kf = 7.75e-7, kb = 10" \
  edit_reac white blue A group
simundump kpool /kinetics/CaM/neurogranin-CaM 1 1.6667e-06 0 0 0 0 0 1 0 \
  6e+05 0 0 "" red blue
simundump kreac /kinetics/CaM/neurogranin-bind-CaM 1 3.7769e+06 3.7815e+06 \
  5e-07 1 1 \
  "Surprisingly, no direct info on rates from neurogranin at this time.\nThese rates are based on GAP-43 binding studies. As GAP-43 and \nneurogranin share near identity in the CaM/PKC binding regions, and also\nsimilarity in phosph and dephosph rates, I am borrowing GAP-43 \nkinetic info.\nSee Alexander et al JBC 262:13 6108-6113 1987" \
  edit_reac white blue A group
simundump kpool /kinetics/CaM/neurogranin* 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 \
  0 "The phosph form does not bind CaM (Huang et al ABB 305:2 570-580 1993)" \
  red blue
simundump kpool /kinetics/CaM/neurogranin 1 10 10 10 6.5237e-23 6e+06 6e+06 \
  6e+06 0 6e+05 0 0 \
  "Also known as RC3 and p17 and BICKS.\nConc in brain  >> 2 uM from Martzen and Slemmon J neurosci 64 92-100 1995\nbut others say less without any #s. Conc in dend spines is much higher than \noverall, so it could be anywhere from 2 uM to 50. We will estimate\n10 uM as a starting point.\nGerendasy et al JBC 269:35 22420-22426 1994 have a skeleton model (no\nnumbers) indicating CaM-Ca(n) binding ...." \
  red blue
simundump kreac /kinetics/CaM/dephosph-neurogranin 1 0 6448.5 0.005 0 1 \
  "This is put in to keep the basal levels of neurogranin* experimentally\nreasonable. From various papers, specially Ramakers et al JBC 270:23 1995\n13892-13898,\n it looks like the basal level of phosph is between 20 and 40%. I est\naround 25 % The kf of 0.005 gives around this level at basal PKC\nactivity levels of 0.1 uM active PKC." \
  edit_reac white blue A group
simundump kpool /kinetics/CaM-Ca3 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 "" \
  hotpink yellow
simundump kpool /kinetics/CaM-TR2-Ca2 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "This is the intermediate where the TR2 end (the high-affinity end) has\nbound the Ca but the TR1 end has not." \
  pink yellow
simundump kpool /kinetics/CaM(Ca)n-CaNAB 1 0 0 0 0 0 0 0 0 6e+05 0 1 "" \
  navyblue yellow
simundump kenz /kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin 1 0 0 0 0 6e+05 \
  0 0 0 0 5.56e-07 2.67 0.67 0 0 3.34 "From Seki et al ABB 316(2):673-679" \
  edit_enz red navyblue CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1 1 0 0 0 0 6e+05 \
  0.55792 0.13948 0.6974 0.69741 5.7e-07 1.36 0.34 0 0 1.7 "" edit_enz red \
  white CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I* 1 0 0 0 0 6e+05 \
  127.31 31.828 159.14 159.14 5.7e-07 1.36 0.34 0 0 1.7 "" edit_enz white \
  white CoComplex kpool enzproto_to_pool_link
simundump group /kinetics/PP1 1 "" edit_group yellow black x group 0 0
simundump kpool /kinetics/PP1/I1 1 1.8 1.8 1.8 5.1797e-47 1.08e+06 1.08e+06 \
  1.08e+06 0 6e+05 0 1 \
  "I1 is a 'mixed' inhibitor, but at high enz concs it looks like a non-compet\ninhibitor (Foulkes et al Eur J Biochem 132 309-313 9183).\nWe treat it as non-compet, so it just turns the enz off\nwithout interacting with the binding site.\nCohen et al ann rev bioch refer to results where conc is \n1.5 to 1.8 uM. In order to get complete inhib of PP1, which is at 1.8 uM,\nwe need >= 1.8 uM.\n\n" \
  orange yellow
simundump kpool /kinetics/PP1/I1* 1 0.1 0.001 0.001 5.75e-48 600 600 60000 0 \
  6e+05 0 0 "Dephosph is mainly by PP2B" orange yellow
simundump kreac /kinetics/PP1/Inact-PP1 1 47007 86270 0.0008333 0.1 1 \
  "K inhib = 1nM from Cohen Ann Rev Bioch 1989, \n4 nM from Foukes et al \nAssume 2 nM. kf /kb = 8.333e-4" \
  edit_reac white yellow A group
simundump kpool /kinetics/PP1/PP1-I1* 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 "" \
  brown yellow
simundump kpool /kinetics/PP1/PP1-I1 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 "" \
  brown yellow
simundump kreac /kinetics/PP1/dissoc-PP1-I1 1 0 39264 1 0 1 \
  "Let us assume that the equil in this case is very far over to the\nright. This is probably safe.\n" \
  edit_reac white yellow A group
simundump kpool /kinetics/PP2A 1 0.17 0.12 0.12 3.6387e-48 72000 72000 \
  1.02e+05 0 6e+05 0 0 "" red black
simundump kenz /kinetics/PP2A/PP2A-dephosph-I1 1 0 0 0 0 6e+05 716.37 171.93 \
  888.3 888.31 6.6e-06 25 6 0 0 31 \
  "PP2A does most of the dephosph of I1 at basal Ca levels. See\nthe review by Cohen in Ann Rev Biochem 1989.\nFor now, lets halve Km. k1 was 3.3e-6, now 6.6e-6\n" \
  edit_enz red red CoComplex kpool enzproto_to_pool_link
simundump kenz /kinetics/PP2A/PP2A-dephosph-PP1-I* 1 0 0 0 0 6e+05 1.6347e+05 \
  39232 2.027e+05 2.027e+05 6.6e-06 25 6 0 0 31 \
  "k1 changed from 3.3e-6 to 6.6e-6\n" edit_enz red red CoComplex kpool \
  enzproto_to_pool_link
simundump kpool /kinetics/CaNAB-Ca4 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 1 "" \
  tan yellow
simundump kenz /kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM 1 0 0 0 0 6e+05 \
  1.1898 0.29746 1.4873 1.4875 5.7e-08 0.136 0.034 0 0 0.17 \
  "The rates here are so slow I do not know if we should even bother\nwith this enz reacn. These numbers are from Liu and Storm.\nOther refs suggest that the Km stays the same\nbut the Vmax goes to 10% of the CaM stim levels. \nPrev: k1=2.2e-9, k2 = 0.0052, k3 = 0.0013\nNew : k1=5.7e-8, k2=.136, k3=.034" \
  edit_enz red tan CoComplex kpool enzproto_to_pool_link
simundump group /kinetics/PP2B 1 \
  "Also called Calcineurin.\nMajor sources of info:\nCohen, P Ann Rev Biochem 1989 58:453-508\nMumby and Walker Physiol Rev 73:4 673-699\nStemmer and Klee Biochem 33 1994 6859-6866\nLiu and Storm JBC 264:22 1989 12800-12804\nThis model is unusual: There is actually more expt info than I want to\nput in the model at this time.\nPhosph: Hashimoto and Soderling JBC 1989 264:28 16624-16629 (Not used)" \
  edit_group red3 black x group 0 0
simundump kpool /kinetics/PP2B/CaNAB 1 25 1 1 2.3355e-51 6e+05 6e+05 1.5e+07 \
  0 6e+05 0 1 \
  "We assume that the A and B subunits of PP2B are always bound under\nphysiol conditions.\nUp to 1% of brain protein = 25 uM. I need to work out how it is distributed\nbetween cytosolic and particulate fractions.\nTallant and Cheung '83 Biochem 22 3630-3635 have conc in many \nspecies, average for mammalian brain is around 1 uM." \
  tan red3
simundump kpool /kinetics/PP2B/CaNAB-Ca2 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "" tan red3
simundump kreac /kinetics/PP2B/Ca-bind-CaNAB-Ca2 1 12668 12668 1e-11 1 1 \
  "This process is probably much more complicated and involves CaM.\nHowever, as I can't find detailed info I am bundling this into a\nsingle step.\nBased on Steemer and Klee pg 6863, the Kact is 0.5 uM.\nkf/kb = 1/(0.5 * 6e5)^2 = 1.11e-11" \
  edit_reac white red3 A group
simundump kreac /kinetics/PP2B/Ca-bind-CaNAB 1 5.4983e+05 5.4983e+05 2.78e-08 \
  1 1 \
  "going on the experience with CaM, we put the fast (high affinity)\nsites first. We only know (Stemmer and Klee) that the affinity is < 70 nM.\nAssuming 10 nM at first, we get\nkf = 2.78e-8, kb = 1.\nTry 20 nM.\nkf = 7e-9, kb = 1\n\n" \
  edit_reac white red3 A group
simundump kreac /kinetics/PP2B/CaM-Ca2-bind-CaNAB 1 386.46 386.46 4e-07 1 1 \
  "Disabled. See notes for PP2B7.g\n" edit_reac white red3 A group
simundump kpool /kinetics/PP2B/CaMCa3-CaNAB 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 \
  0 0 "" blue red3
simundump kpool /kinetics/PP2B/CaMCa2-CANAB 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 \
  0 0 "" blue red3
simundump kpool /kinetics/PP2B/CaMCa4-CaNAB 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 \
  0 0 "" blue red3
simundump kreac /kinetics/PP2B/CaMCa3-bind-CaNAB 1 103.79 103.79 3.73e-06 1 1 \
  "" edit_reac white red3 A group
simundump kreac /kinetics/PP2B/CaMCa4-bind-CaNAB 1 103.69 103.69 0.001 1 1 "" \
  edit_reac white red3 A group
simundump group /kinetics/PKA 0 \
  "General ref: Taylor et al Ann Rev Biochem 1990 59:971-1005\n" edit_group \
  blue blue x group 0 0
simundump kpool /kinetics/PKA/R2C2 0 0.5 0.5 0.5 1.0526e-47 3e+05 3e+05 3e+05 \
  0 6e+05 0 1 \
  "This is the R2C2 complex, consisting of 2 catalytic (C)\nsubunits, and the R-dimer. See Taylor et al Ann Rev Biochem\n1990 59:971-1005 for a review.\nThe Doskeland and Ogreid review is better for numbers.\nAmount of PKA is about .5 uM." \
  white blue
simundump kpool /kinetics/PKA/R2C2-cAMP 0 1 0 0 5.7208e-47 0 0 6e+05 0 6e+05 \
  0 1 "CoInit was .0624\n" white blue
simundump kreac /kinetics/PKA/cAMP-bind-site-B1 0 7.7373e+05 7.7373e+05 9e-05 \
  33 1 \
  "Hasler et al FASEB J 6:2734-2741 1992 say Kd =1e-7M\nfor type II, 5.6e-8 M for type I. Take mean\nwhich comes to 2e-13 #/cell\nSmith et al PNAS USA 78:3 1591-1595 1981 have better data.\nFirst kf/kb=2.1e7/M = 3.5e-5 (#/cell).\nOgreid and Doskeland Febs Lett 129:2 287-292 1981 have figs\nsuggesting time course of complete assoc is < 1 min." \
  edit_reac white blue A group
simundump kreac /kinetics/PKA/cAMP-bind-site-B2 1 93546 93546 9e-05 33 1 \
  "For now let us set this to the same Km (1e-7M) as\nsite B. This gives kf/kb = .7e-7M * 1e6 / (6e5^2) : 1/(6e5^2)\n= 2e-13:2.77e-12\nSmith et al have better values. They say that this is\ncooperative, so the consts are now kf/kb =8.3e-4" \
  edit_reac white blue A group
simundump kreac /kinetics/PKA/cAMP-bind-site-A1 1 15708 15708 0.000125 110 1 \
  "" edit_reac white blue A group
simundump kreac /kinetics/PKA/cAMP-bind-site-A2 1 791.35 791.33 0.000125 32.5 \
  1 "" edit_reac white blue A group
simundump kpool /kinetics/PKA/R2C2-cAMP2 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "" white blue
simundump kpool /kinetics/PKA/R2C2-cAMP3 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "" white blue
simundump kpool /kinetics/PKA/R2C2-cAMP4 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "" white blue
simundump kpool /kinetics/PKA/R2C-cAMP4 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 \
  "" white blue
simundump kpool /kinetics/PKA/R2-cAMP4 1 0.15 0 0 1.1888e-48 0 0 90000 0 \
  6e+05 0 0 \
  "Starts at 0.15 for the test of fig 6 in Smith et al, but we aren't using\nthat paper any more." \
  white blue
simundump kreac /kinetics/PKA/Release-C1 1 1461 1460.9 60 3e-05 1 \
  "This has to be fast, as the activation of PKA by cAMP\nis also fast.\nkf was 10\n" \
  edit_reac white blue A group
simundump kreac /kinetics/PKA/Release-C2 1 82694 82694 60 3e-05 1 "" \
  edit_reac white blue A group
simundump kpool /kinetics/PKA/PKA-inhibitor 1 1 0.25 0.25 5.6255e-47 1.5e+05 \
  1.5e+05 6e+05 0 6e+05 0 1 \
  "About 25% of PKA C subunit is dissociated in resting cells without\nhaving any noticable activity.\nDoskeland and Ogreid Int J biochem 13 pp1-19 suggest that this is\nbecause there is a corresponding amount of inhibitor protein." \
  cyan blue
simundump kreac /kinetics/PKA/inhib-PKA 1 1.1691e+05 1.1691e+05 0.0001 1 1 \
  "This has to be set to zero for matching the expts in vitro. In vivo\nwe need to consider the inhibition though.\nkf = 1e-5\nkb = 1\n" \
  edit_reac white blue A group
simundump kpool /kinetics/PKA/inhibited-PKA 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 \
  0 0 "" cyan blue
simundump kpool /kinetics/cAMP 1 10 0 0 1.3226e-34 0 0 6e+06 0 6e+05 2 0 \
  "The conc of this has been a problem. Schaecter and Benowitz use 50 uM,\nbut Shinomura et al have < 5. So I have altered the cAMP-dependent \nrates in the PKA model to reflect this." \
  green black
simundump group /kinetics/AC 1 "" edit_group blue blue x group 0 0
simundump kpool /kinetics/AC/ATP 1 5000 5000 5000 0 3e+09 3e+09 3e+09 0 6e+05 \
  4 0 "ATP is present in all cells between 2 and 10 mM. See Lehninger." red \
  blue
simundump kpool /kinetics/AC/AC1-CaM 1 1.6667e-06 0 0 5.9537e-47 0 0 1 0 \
  6e+05 0 0 \
  "This version of cyclase is Calmodulin activated.\nGs stims it but betagamma inhibits." \
  orange blue
simundump kenz /kinetics/AC/AC1-CaM/kenz 1 0 0 0 0 6e+05 0 0 9.5017e+05 0 \
  7.5e-06 72 18 0 1 90 "" edit_enz red orange CoComplex kpool \
  enzproto_to_pool_link
simundump kpool /kinetics/AC/AC1 1 1 0.02 0.02 3.5405e-41 12000 12000 6e+05 0 \
  6e+05 0 1 "Starting conc at 20 nM." orange blue
simundump kreac /kinetics/AC/CaM-bind-AC1 1 0 0 8.3333e-05 1 1 \
  "Half-max at 20 nM CaM (Tang et al JBC 266:13 8595-8603 1991\nkb/kf = 20 nM = 12000 #/cell\nso kf = kb/12000 = kb * 8.333e-5\n" \
  edit_reac white blue A group
simundump kpool /kinetics/AC/AC2* 1 0.010851 0 0 3.4542e-43 0 0 6510.3 0 \
  6e+05 0 0 \
  "This version is activated by Gs and by a betagamma and phosphorylation." \
  yellow blue
simundump kenz /kinetics/AC/AC2*/kenz 1 0 0 0 0 6e+05 19840 4960 0 0.40901 \
  2.9e-06 28 7 0 1 35 \
  "Reduced Km to match expt data for basal activation of AC2 by PKC.\nNow k1 = 2.9e-6, k2 = 72, k3 = 18\n" \
  edit_enz red yellow CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/AC/AC2-Gs 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 "" \
  yellow blue
simundump kenz /kinetics/AC/AC2-Gs/kenz 1 0 0 0 0 6e+05 1.4265e+05 35663 \
  7.1263e+05 0 7.5e-06 72 18 0 1 90 "" edit_enz red yellow CoComplex kpool \
  enzproto_to_pool_link
simundump kpool /kinetics/AC/AC2 1 0.015 0.015 0.015 5.1228e-43 9000 9000 \
  9000 0 6e+05 0 1 "Starting at 0.015 uM." yellow blue
simundump kreac /kinetics/AC/dephosph-AC2 1 0 70.857 0.1 0 1 "Random rate." \
  edit_reac white blue A group
simundump kpool /kinetics/AC/AC1-Gs 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 "" \
  orange blue
simundump kenz /kinetics/AC/AC1-Gs/kenz 1 0 0 0 0 0 4.8165e+05 1.2041e+05 0 0 \
  7.5e-06 72 18 0 1 90 "" edit_enz red orange CoComplex kpool \
  enzproto_to_pool_link
simundump kreac /kinetics/AC/Gs-bind-AC2 1 1981.3 1980.9 0.00083333 1 1 \
  "Half-max at around 3nM = kb/kf from fig 5 in \nFeinstein et al PNAS USA 88 10173-10177 1991\nkf = kb/1800 = 5.56e-4 kb\nOfer's thesis data indicates it is more like 2 nM.\nkf = kb/1200 = 8.33e-4\n" \
  edit_reac white blue A group
simundump kreac /kinetics/AC/Gs-bind-AC1 1 6689.6 6689.6 0.00021 1 1 \
  "Half-max 8nM from Tang et al JBC266:13 8595-8603\nkb/kf = 8 nM = 4800#/cell so kf = kb * 2.08e-4" \
  edit_reac white blue A group
simundump kpool /kinetics/AC/AMP 1 3.2549e+05 3.2549e+05 3.2549e+05 0 \
  3.2549e+05 3.2549e+05 3.2549e+05 0 1 0 0 "" pink blue
simundump kpool /kinetics/AC/AC2*-Gs 1 1.6667e-06 0 0 0 0 0 1 0 6e+05 0 0 "" \
  green blue
simundump kenz /kinetics/AC/AC2*-Gs/kenz 1 0 0 0 0 0 1.2753e+06 3.1881e+05 \
  7.2038e+05 9.1736 7.5e-06 216 54 0 1 270 "" edit_enz red green CoComplex \
  kpool enzproto_to_pool_link
simundump kreac /kinetics/AC/Gs-bind-AC2* 1 5904 5904.4 0.0013888 1 1 \
  "kb/kf = 1.2 nM\nso kf = kb/720 = 1.3888 * kb." edit_reac white blue A \
  group
simundump kpool /kinetics/AC/cAMP-PDE 1 1 0.45 0.45 2.2297e-41 2.7e+05 \
  2.7e+05 6e+05 0 6e+05 0 0 \
  "The levels of the PDE are not known at this time. However, enough\nkinetic info and info about steady-state levels of cAMP etc are around\nto make it possible to estimate this." \
  green blue
simundump kenz /kinetics/AC/cAMP-PDE/PDE 1 0 0 0 0 6e+05 1.7408e+06 \
  4.3521e+05 2.176e+06 2.176e+06 4.2e-06 40 10 0 0 50 \
  "Best rates are from Conti et al Biochem 34 7979-7987 1995. Though these\nare for the Sertoli cell form, it looks like they carry nicely into\nalternatively spliced brain form. See Sette et al JBC 269:28 18271-18274\nKm ~2 uM, Vmax est ~ 10 umol/min/mg for pure form. Brain protein is 93 kD\nbut this was 67.\nSo k3 ~10, k2 ~40, k1 ~4.2e-6" \
  edit_enz red green CoComplex kpool enzproto_to_pool_link
simundump kpool /kinetics/AC/cAMP-PDE* 1 1.6667e-06 0 0 5.9537e-47 0 0 1 0 \
  6e+05 0 0 \
  "This form has about 2X activity as plain PDE. See Sette et al JBC 269:28\n18271-18274 1994." \
  green blue
simundump kenz /kinetics/AC/cAMP-PDE*/PDE* 1 0 0 0 0 6e+05 0 0 0 0 8.4e-06 80 \
  20 0 0 100 \
  "This form has about twice the activity of the unphosphorylated form. See\nSette et al JBC 269:28 18271-18274 1994.\nWe'll ignore cGMP effects for now." \
  edit_enz red green CoComplex kpool enzproto_to_pool_link
simundump kreac /kinetics/AC/dephosph-PDE 1 0 0 0.1 0 1 \
  "The rates for this are poorly constrained. In adipocytes (probably a\ndifferent PDE) the dephosphorylation is complete within 15 min, but\nthere are no intermediate time points so it could be much faster. Identity\nof phosphatase etc is still unknown." \
  edit_reac white blue A group
simundump kpool /kinetics/Gs-alpha 1 0.01 0 0 0 0 0 6000 0 6e+05 2 0 "" red \
  black
simundump kreac /kinetics/remove_glu 1 0 5.7409e+08 500 1000 1 \
  "Assume tau for removal of glu is 2 msec. We know that diffusion\ntime for arrival of glu from presynaptic side is < 50 usec.\nMost of the actual synaptic delay has to do with binding to the\nreceptors." \
  edit_reac white black A group
simundump stim /kinetics/stim 1 0 100 0.002 0.1 0 0 0 0 -1 0 0 "" edit_stim \
  white red output group 3
simundump kpool /kinetics/synapse 1 1.6667e-06 0 0 1.286e-29 0 0 1 0 6e+05 2 \
  0 "" green black
simundump xtab /kinetics/Ca_tab 1 -19.5 0 1 2 0 "" edit_xtab white red output \
  group 0 0 0 3
loadtab /kinetics/Ca_tab table 0 4000 0 80 \
 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 \
 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.08 0.0942319 0.183898 \
 0.294227 0.426821 0.605779 0.82755 1.12151 1.51149 2.03286 2.72939 3.62366 \
 4.67785 5.75655 6.69231 7.38896 7.85107 8.13536 8.30259 8.39896 8.45461 \
 8.48705 8.50751 8.52344 8.53642 8.54842 8.56129 8.57656 8.59204 8.6071 \
 8.62423 8.64162 8.66167 8.68268 8.7077 8.73457 8.76154 8.78966 8.82004 \
 8.85248 8.88407 8.91761 8.95322 8.98936 9.02779 9.06744 9.10956 9.15476 \
 9.20246 9.24977 9.30086 7.18675 5.55562 4.55243 3.90112 3.44853 3.11654 \
 2.86282 2.66273 2.50099 2.36763 2.25587 2.16092 2.07932 2.00849 1.94647 \
 1.89175 1.84313 1.79969 1.76063 1.72536 1.69335 1.6642 1.63753 1.61304 \
 1.5905 1.56967 1.55038 1.53244 1.51574 1.50014 1.48554 1.47183 1.45895 \
 1.44681 1.43535 1.4245 1.41422 1.40447 1.39519 1.38634 1.37789 1.36982 \
 1.3621 1.35469 1.34757 1.34073 1.33413 1.32778 1.32164 1.3157 1.30995 1.3044 \
 1.29899 1.29374 1.28864 1.28367 1.27882 1.2741 1.26949 1.26498 1.26058 \
 1.25626 1.25204 1.2479 1.24383 1.23984 1.23592 1.23207 1.22828 1.22455 \
 1.22088 1.21726 1.2137 1.21018 1.20671 1.20329 1.19991 1.19657 1.19327 \
 1.19001 1.18678 1.18358 1.18042 1.1773 1.1742 1.17113 1.16809 1.16508 \
 1.16209 1.15913 1.1562 1.15329 1.1504 1.14754 1.1447 1.14188 1.13908 1.1363 \
 1.13354 1.1308 1.12808 1.12537 1.12269 1.12002 1.11737 1.11474 1.11212 \
 1.10952 1.10694 1.10437 1.10181 1.09927 1.09675 1.09424 1.09174 1.08926 \
 1.08679 1.08433 1.08189 1.07946 1.07705 1.07464 1.07225 1.06987 
loadtab -continue \
 1.06751 1.06515 1.06281 1.06048 1.05816 1.05585 1.05356 1.05127 1.049 \
 1.04673 1.04448 1.04224 1.04001 1.03779 1.03558 1.03338 1.03119 1.02901 \
 1.02684 1.02468 1.02253 1.02039 1.01826 1.01614 1.01402 1.01192 1.00983 \
 1.00775 1.00567 1.0036 1.00155 0.999501 0.997462 0.995432 0.99341 0.991397 \
 0.989393 0.987397 0.985409 0.98343 0.981459 0.979497 0.977542 0.975596 \
 0.973658 0.971728 0.969805 0.967891 0.965984 0.964086 0.962195 0.960312 \
 0.958436 0.956568 0.954708 0.952854 0.951009 0.94917 0.947339 0.945515 \
 0.943699 0.941889 0.940087 0.938292 0.936503 0.934722 0.932948 0.93118 \
 0.92942 0.927666 0.925919 0.924179 0.922445 0.920718 0.918998 0.917284 \
 0.915577 0.913876 0.912181 0.910493 0.908812 0.907136 0.905468 0.903806 \
 0.902149 0.900499 0.898854 0.897216 0.895584 0.893958 0.892338 0.890723 \
 0.889115 0.887513 0.885916 0.884325 0.88274 0.881161 0.879587 0.878019 \
 0.876457 0.874901 0.87335 0.871804 0.870264 0.868729 0.8672 0.865677 \
 0.864159 0.862646 0.861138 0.859636 0.858139 0.856647 0.855161 0.853679 \
 0.852203 0.850732 0.849266 0.847805 0.846349 0.844898 0.843453 0.842012 \
 0.840576 0.839145 0.837719 0.836298 0.834881 0.833469 0.832062 0.83066 \
 0.829263 0.82787 0.826482 0.825098 0.823719 0.822345 0.820975 0.81961 \
 0.81825 0.816894 0.815542 0.814195 0.812852 0.811514 0.81018 0.80885 \
 0.807525 0.806204 0.804887 0.803575 0.802267 0.800963 0.799663 0.798368 \
 0.797076 0.795789 0.794506 0.793227 0.791952 0.790681 0.789415 0.788152 \
 0.786893 0.785638 0.784388 0.783141 0.781898 0.780659 0.779423 0.778192 \
 0.776965 0.775742 0.774522 0.773306 0.772094 0.770885 0.76968 0.768479 \
 0.767282 0.766088 0.764898 0.763712 0.762529 0.76135 0.760174 0.759002 \
 0.757834 0.756669 0.755508 0.75435 0.753195 0.752044 0.750897 0.749753 \
 0.748612 0.747475 0.746341 0.745211 
loadtab -continue \
 0.744084 0.74296 0.741839 0.740722 0.739609 0.738498 0.737391 0.736287 \
 0.735186 0.734088 0.732994 0.731903 0.730815 0.72973 0.728649 0.72757 \
 0.726495 0.725422 0.724353 0.723287 0.722224 0.721164 0.720107 0.719053 \
 0.718002 0.716954 0.715909 0.714867 0.713828 0.712792 0.711759 0.710728 \
 0.709701 0.708677 0.707655 0.706636 0.70562 0.704607 0.703597 0.70259 \
 0.701585 0.700583 0.699585 0.698589 0.697596 0.696605 0.695617 0.694632 \
 0.693649 0.692669 0.691692 0.690717 0.689745 0.688776 0.68781 0.686846 \
 0.685884 0.684926 0.683969 0.683016 0.682065 0.681116 0.680171 0.679227 \
 0.678286 0.677348 0.676412 0.675479 0.674548 0.67362 0.672694 0.671771 \
 0.67085 0.669931 0.669015 0.668101 0.66719 0.666281 0.665375 0.664471 \
 0.663569 0.662669 0.661772 0.660878 0.659985 0.659095 0.658207 0.657322 \
 0.656439 0.655558 0.654679 0.653803 0.652929 0.652057 0.651187 0.65032 \
 0.649455 0.648592 0.647731 0.646873 0.646016 0.645162 0.64431 0.64346 \
 0.642612 0.641767 0.640923 0.640082 0.639243 0.638406 0.637571 0.636738 \
 0.635907 0.635078 0.634251 0.633427 0.632604 0.631784 0.630965 0.630149 \
 0.629334 0.628522 0.627711 0.626903 0.626096 0.625292 0.624489 0.623689 \
 0.62289 0.622094 0.621299 0.620506 0.619715 0.618926 0.618139 0.617354 \
 0.616571 0.61579 0.61501 0.614233 0.613457 0.612683 0.611911 0.611141 \
 0.610373 0.609607 0.608842 0.608079 0.607318 0.606559 0.605802 0.605047 \
 0.604293 0.603541 0.602791 0.602042 0.601296 0.600551 0.599808 0.599066 \
 0.598327 0.597589 0.596852 0.596118 0.595385 0.594654 0.593925 0.593197 \
 0.592471 0.591747 0.591024 0.590303 0.589584 0.588866 0.588151 0.587436 \
 0.586724 0.586013 0.585303 0.584595 0.583889 0.583185 0.582482 0.58178 \
 0.581081 0.580383 0.579686 0.578991 0.578298 0.577607 0.576916 0.576228 \
 0.57554 0.574855 0.574171 0.573488 0.572807 0.572128 0.57145 0.570773 
loadtab -continue \
 0.570098 0.569425 0.568753 0.568082 0.567413 0.566746 0.56608 0.565415 \
 0.564752 0.564091 0.56343 0.562772 0.562114 0.561459 0.560804 0.560151 \
 0.5595 0.55885 0.558201 0.557554 0.556908 0.556264 0.555621 0.554979 \
 0.554339 0.5537 0.553062 0.552426 0.551792 0.551158 0.550526 0.549896 \
 0.549266 0.548638 0.548012 0.547387 0.546763 0.54614 0.545519 0.544899 \
 0.54428 0.543663 0.543047 0.542432 0.541819 0.541207 0.540596 0.539987 \
 0.539379 0.538772 0.538166 0.537562 0.536959 0.536357 0.535756 0.535157 \
 0.534559 0.533962 0.533366 0.532772 0.532179 0.531587 0.530997 0.530407 \
 0.529819 0.529232 0.528646 0.528062 0.527478 0.526896 0.526315 0.525736 \
 0.525157 0.52458 0.524003 0.523429 0.522855 0.522282 0.521711 0.52114 \
 0.520571 0.520003 0.519436 0.518871 0.518306 0.517743 0.51718 0.516619 \
 0.516059 0.5155 0.514943 0.514386 0.513831 0.513276 0.512723 0.512171 \
 0.51162 0.51107 0.510521 0.509973 0.509427 0.508881 0.508337 0.507793 \
 0.507251 0.50671 0.506169 0.50563 0.505092 0.504555 0.504019 0.503485 \
 0.502951 0.502418 0.501886 0.501356 0.500826 0.500297 0.49977 0.499243 \
 0.498718 0.498193 0.49767 0.497147 0.496626 0.496106 0.495586 0.495068 \
 0.494551 0.494034 0.493519 0.493004 0.492491 0.491979 0.491467 0.490957 \
 0.490447 0.489939 0.489431 0.488925 0.488419 0.487915 0.487411 0.486908 \
 0.486407 0.485906 0.485406 0.484908 0.48441 0.483913 0.483417 0.482922 \
 0.482428 0.481935 0.481443 0.480952 0.480461 0.479972 0.479483 0.478996 \
 0.478509 0.478023 0.477538 0.477054 0.476571 0.476089 0.475607 0.475127 \
 0.474648 0.474169 0.473691 0.473214 0.472739 0.472263 0.471789 0.471316 \
 0.470844 0.470372 0.469901 0.469431 0.468963 0.468494 0.468027 0.467561 \
 0.467095 0.466631 0.466167 0.465704 0.465242 0.464781 0.46432 0.46386 \
 0.463402 0.462944 0.462487 0.462031 0.461575 0.46112 0.460667 0.460214 
loadtab -continue \
 0.459762 0.45931 0.45886 0.45841 0.457961 0.457513 0.457066 0.456619 \
 0.456174 0.455729 0.455285 0.454842 0.454399 0.453957 0.453517 0.453076 \
 0.452637 0.452199 0.451761 0.451324 0.450888 0.450452 0.450017 0.449584 \
 0.44915 0.448718 0.448287 0.447856 0.447426 0.446996 0.446568 0.44614 \
 0.445713 0.445287 0.444861 0.444436 0.444012 0.443589 0.443166 0.442744 \
 0.442323 0.441903 0.441483 0.441064 0.440646 0.440229 0.439812 0.439396 \
 0.438981 0.438566 0.438152 0.437739 0.437327 0.436915 0.436504 0.436094 \
 0.435684 0.435275 0.434867 0.434459 0.434053 0.433647 0.433241 0.432837 \
 0.432433 0.432029 0.431627 0.431225 0.430823 0.430423 0.430023 0.429624 \
 0.429225 0.428827 0.42843 0.428034 0.427638 0.427243 0.426848 0.426454 \
 0.426061 0.425669 0.425277 0.424886 0.424495 0.424105 0.423716 0.423327 \
 0.422939 0.422552 0.422166 0.42178 0.421394 0.42101 0.420625 0.420242 \
 0.419859 0.419477 0.419096 0.418715 0.418335 0.417955 0.417576 0.417198 \
 0.41682 0.416443 0.416066 0.415691 0.415315 0.414941 0.414567 0.414193 \
 0.413821 0.413448 0.413077 0.412706 0.412336 0.411966 0.411597 0.411228 \
 0.41086 0.410493 0.410126 0.40976 0.409395 0.40903 0.408665 0.408302 \
 0.407939 0.407576 0.407214 0.406853 0.406492 0.406132 0.405772 0.405413 \
 0.405054 0.404697 0.404339 0.403983 0.403626 0.403271 0.402916 0.402561 \
 0.402207 0.401854 0.401501 0.401149 0.400797 0.400446 0.400096 0.399746 \
 0.399397 0.399048 0.398699 0.398352 0.398004 0.397658 0.397312 0.396966 \
 0.396621 0.396277 0.395933 0.39559 0.395247 0.394905 0.394563 0.394222 \
 0.393881 0.393541 0.393201 0.392862 0.392524 0.392186 0.391848 0.391511 \
 0.391175 0.390839 0.390504 0.390169 0.389835 0.389501 0.389168 0.388835 \
 0.388503 0.388171 0.38784 0.387509 0.387179 0.386849 0.38652 0.386191 \
 0.385863 0.385536 0.385209 0.384882 0.384556 0.38423 0.383905 0.383581 
loadtab -continue \
 0.383256 0.382933 0.38261 0.382287 0.381965 0.381643 0.381322 0.381002 \
 0.380681 0.380362 0.380043 0.379724 0.379406 0.379088 0.378771 0.378454 \
 0.378138 0.377822 0.377507 0.377192 0.376877 0.376564 0.37625 0.375937 \
 0.375625 0.375469 0.134926 0.276109 0.401596 0.568655 0.791873 1.07788 \
 1.47064 2.00565 2.73586 3.69929 4.85756 6.0525 7.07437 7.81672 8.29595 \
 8.58397 8.75019 8.84758 8.906 8.94289 8.97098 8.99468 9.01731 9.03991 9.0661 \
 9.09402 9.1234 9.15646 9.19184 9.22964 9.26934 9.31343 9.35969 9.40781 \
 9.45973 9.51454 9.57186 9.63156 9.6964 9.76393 9.83411 9.90914 9.98802 \
 10.0707 10.1569 10.2499 10.3472 10.449 10.5573 10.6718 8.33302 6.55922 \
 5.49122 4.81287 4.35141 4.01976 3.77124 3.57889 3.42614 3.30225 3.19992 \
 3.11411 3.04111 2.97822 2.92341 2.87513 2.83214 2.79353 2.75853 2.72653 \
 2.69707 2.66973 2.64421 2.62024 2.5976 2.57612 2.55564 2.53605 2.51722 \
 2.49908 2.48155 2.46457 2.44808 2.43204 2.41641 2.40114 2.38622 2.37163 \
 2.35732 2.34329 2.32952 2.316 2.3027 2.28962 2.27675 2.26408 2.25161 2.23931 \
 2.22718 2.21523 2.20344 2.19181 2.18034 2.16901 2.15782 2.14677 2.13586 \
 2.12509 2.11444 2.10393 2.09354 2.08326 2.0731 2.06306 2.05314 2.04332 \
 2.03362 2.02402 2.01453 2.00514 1.99585 1.98666 1.97756 1.96856 1.95966 \
 1.95085 1.94212 1.93349 1.92494 1.91649 1.90812 1.89983 1.89162 1.88349 \
 1.87543 1.86746 1.85957 1.85175 1.844 1.83633 1.82873 1.8212 1.81375 1.80636 \
 1.79903 1.79178 1.78459 1.77746 1.7704 1.7634 1.75647 1.74959 1.74278 \
 1.73602 1.72933 1.72269 1.71611 1.70958 1.70312 1.69671 1.69035 1.68404 \
 1.67778 1.67158 1.66543 1.65933 1.65327 1.64727 1.64132 1.63541 1.62955 \
 1.62374 1.61797 1.61225 
loadtab -continue \
 1.60658 1.60094 1.59536 1.58981 1.58431 1.57886 1.57344 1.56806 1.56273 \
 1.55743 1.55218 1.54696 1.54178 1.53664 1.53154 1.52647 1.52144 1.51645 \
 1.51149 1.50657 1.50169 1.49684 1.49202 1.48724 1.48249 1.47778 1.47309 \
 1.46845 1.46383 1.45924 1.45469 1.45017 1.44568 1.44122 1.43679 1.43239 \
 1.42801 1.42367 1.41936 1.41507 1.41081 1.40658 1.40238 1.3982 1.39406 \
 1.38994 1.38584 1.38177 1.37773 1.37371 1.36972 1.36575 1.36181 1.3579 1.354 \
 1.35013 1.34629 1.34247 1.33867 1.3349 1.33115 1.32742 1.32371 1.32003 \
 1.31637 1.31273 1.30911 1.30551 1.30194 1.29839 1.29485 1.29134 1.28785 \
 1.28438 1.28093 1.2775 1.27409 1.2707 1.26733 1.26397 1.26064 1.25732 \
 1.25402 1.25074 1.24748 1.24424 1.24102 1.23781 1.23462 1.23145 1.2283 \
 1.22516 1.22204 1.21894 1.21585 1.21278 1.20973 1.20669 1.20367 1.20067 \
 1.19768 1.19471 1.19175 1.18881 1.18588 1.18297 1.18008 1.1772 1.17433 \
 1.17148 1.16865 1.16582 1.16302 1.16022 1.15745 1.15468 1.15193 1.14919 \
 1.14647 1.14376 1.14106 1.13838 1.13571 1.13306 1.13041 1.12778 1.12517 \
 1.12256 1.11997 1.11739 1.11482 1.11227 1.10973 1.1072 1.10468 1.10217 \
 1.09968 1.0972 1.09473 1.09227 1.08983 1.08739 1.08497 1.08256 1.08015 \
 1.07776 1.07538 1.07302 1.07066 1.06831 1.06597 1.06365 1.06133 1.05903 \
 1.05673 1.05445 1.05218 1.04991 1.04766 1.04542 1.04318 1.04096 1.03875 \
 1.03654 1.03435 1.03217 1.02999 1.02782 1.02567 1.02352 1.02138 1.01926 \
 1.01714 1.01503 1.01293 1.01084 1.00875 1.00668 1.00461 1.00256 1.00051 \
 0.99847 0.99644 0.994418 0.992404 0.990399 0.988402 0.986413 0.984433 \
 0.982461 0.980497 0.978541 0.976593 0.974653 0.972721 0.970797 0.968881 \
 0.966972 0.965071 0.963178 
loadtab -continue \
 0.961292 0.959414 0.957543 0.95568 0.953824 0.951976 0.950135 0.948302 \
 0.946475 0.944656 0.942843 0.941038 0.93924 0.937449 0.935665 0.933888 \
 0.932117 0.930354 0.928597 0.926847 0.925105 0.923368 0.921638 0.919915 \
 0.918198 0.916488 0.914784 0.913086 0.911395 0.909711 0.908032 0.90636 \
 0.904695 0.903035 0.901381 0.899735 0.898094 0.896459 0.89483 0.893206 \
 0.891589 0.889978 0.888373 0.886773 0.885179 0.883591 0.882009 0.880433 \
 0.878862 0.877297 0.875737 0.874183 0.872635 0.871093 0.869556 0.868024 \
 0.866497 0.864976 0.863461 0.86195 0.860445 0.858945 0.857451 0.855962 \
 0.854477 0.852999 0.851525 0.850056 0.848592 0.847134 0.84568 0.844232 \
 0.842789 0.841351 0.839917 0.838488 0.837064 0.835645 0.834231 0.832821 \
 0.831416 0.830016 0.828621 0.82723 0.825844 0.824463 0.823086 0.821714 \
 0.820347 0.818984 0.817625 0.816271 0.814922 0.813577 0.812236 0.8109 \
 0.809568 0.808241 0.806917 0.805598 0.804284 0.802973 0.801667 0.800365 \
 0.799067 0.797774 0.796484 0.795199 0.793918 0.792641 0.791368 0.790099 \
 0.788834 0.787573 0.786316 0.785063 0.783814 0.78257 0.781329 0.780091 \
 0.778858 0.777628 0.776403 0.775181 0.773963 0.772748 0.771538 0.770331 \
 0.769128 0.767928 0.766733 0.765541 0.764352 0.763168 0.761986 0.760809 \
 0.759635 0.758464 0.757298 0.756134 0.754975 0.753818 0.752665 0.751516 \
 0.750371 0.74923 0.748258 0.747287 0.746315 0.745343 0.744371 0.743399 \
 0.742427 0.741455 0.740484 0.739512 0.73854 0.737568 0.736596 0.735624 \
 0.734652 0.733681 0.732709 0.731737 0.730765 0.729793 0.728821 0.727849 \
 0.726878 0.725906 0.724934 0.723962 0.72299 0.722018 0.721046 0.720075 \
 0.719103 0.718131 0.717159 0.716187 0.715215 0.714243 0.713272 0.7123 \
 0.711328 0.710356 0.709384 0.708412 0.707441 0.706469 0.705497 0.704525 \
 0.703553 0.702581 0.701609 0.700638 0.699666 0.698694 0.697722 0.69675 
loadtab -continue \
 0.695778 0.694806 0.693835 0.692863 0.691891 0.690919 0.689947 0.688975 \
 0.688003 0.687032 0.68606 0.685088 0.684116 0.683144 0.682172 0.6812 \
 0.680229 0.679257 0.678285 0.677313 0.676341 0.675369 0.674397 0.673426 \
 0.672454 0.671482 0.67051 0.669538 0.668566 0.667594 0.666623 0.665651 \
 0.664679 0.663707 0.662735 0.661763 0.660791 0.65982 0.658848 0.657876 \
 0.656904 0.655932 0.65496 0.653988 0.653017 0.652045 0.651073 0.650101 \
 0.649129 0.648157 0.647186 0.646214 0.645242 0.64427 0.643298 0.642326 \
 0.641354 0.640383 0.639411 0.638439 0.637467 0.636495 0.635523 0.634551 \
 0.63358 0.632608 0.631636 0.630664 0.629692 0.62872 0.627748 0.626777 \
 0.625805 0.624833 0.623861 0.622889 0.621917 0.620945 0.619974 0.619002 \
 0.61803 0.617058 0.616086 0.615114 0.614142 0.613171 0.612199 0.611227 \
 0.610255 0.609283 0.608311 0.607339 0.606368 0.605396 0.604424 0.603452 \
 0.60248 0.601508 0.600536 0.599565 0.598593 0.597621 0.596649 0.595677 \
 0.594705 0.593733 0.592762 0.59179 0.590818 0.589846 0.588874 0.587902 \
 0.58693 0.585959 0.584987 0.584015 0.583043 0.582071 0.581099 0.580128 \
 0.579156 0.578184 0.577212 0.57624 0.575268 0.574296 0.573325 0.572353 \
 0.571381 0.570409 0.569437 0.568465 0.567493 0.566522 0.56555 0.564578 \
 0.563606 0.562634 0.561662 0.56069 0.559719 0.558747 0.557775 0.556803 \
 0.555831 0.554859 0.553887 0.552916 0.551944 0.550972 0.55 0.5494 0.5488 \
 0.5482 0.5476 0.547 0.5464 0.5458 0.5452 0.5446 0.544 0.5434 0.5428 0.5422 \
 0.5416 0.541 0.5404 0.5398 0.5392 0.5386 0.538 0.5374 0.5368 0.5362 0.5356 \
 0.535 0.5344 0.5338 0.5332 0.5326 0.532 0.5314 0.5308 0.5302 0.5296 0.529 \
 0.5284 0.5278 0.5272 0.5266 0.526 0.5254 0.5248 0.5242 0.5236 0.523 0.5224 \
 0.5218 0.5212 0.5206 
loadtab -continue \
 0.52 0.5194 0.5188 0.5182 0.5176 0.517 0.5164 0.5158 0.5152 0.5146 0.514 \
 0.5134 0.5128 0.5122 0.5116 0.511 0.5104 0.5098 0.5092 0.5086 0.508 0.5074 \
 0.5068 0.5062 0.5056 0.505 0.5044 0.5038 0.5032 0.5026 0.502 0.5014 0.5008 \
 0.5002 0.4996 0.499 0.4984 0.4978 0.4972 0.4966 0.496 0.4954 0.4948 0.4942 \
 0.4936 0.493 0.4924 0.4918 0.4912 0.4906 0.49 0.4894 0.4888 0.4882 0.4876 \
 0.487 0.4864 0.4858 0.4852 0.4846 0.484 0.4834 0.4828 0.4822 0.4816 0.481 \
 0.4804 0.4798 0.4792 0.4786 0.478 0.4774 0.4768 0.4762 0.4756 0.475 0.4744 \
 0.4738 0.4732 0.4726 0.472 0.4714 0.4708 0.4702 0.4696 0.469 0.4684 0.4678 \
 0.4672 0.4666 0.466 0.4654 0.4648 0.4642 0.4636 0.463 0.4624 0.4618 0.4612 \
 0.4606 0.46 0.4594 0.4588 0.4582 0.4576 0.457 0.4564 0.4558 0.4552 0.4546 \
 0.454 0.4534 0.4528 0.4522 0.4516 0.451 0.4504 0.4498 0.4492 0.4486 0.448 \
 0.4474 0.4468 0.4462 0.4456 0.445 0.4444 0.4438 0.4432 0.4426 0.442 0.4414 \
 0.4408 0.4402 0.4396 0.439 0.4384 0.4378 0.4372 0.4366 0.436 0.4354 0.4348 \
 0.4342 0.4336 0.433 0.4324 0.4318 0.4312 0.4306 0.43 0.4294 0.4288 0.4282 \
 0.4276 0.427 0.4264 0.4258 0.4252 0.4246 0.424 0.4234 0.4228 0.4222 0.4216 \
 0.421 0.4204 0.4198 0.4192 0.4186 0.418 0.4174 0.4168 0.4162 0.4156 0.415 \
 0.4144 0.4138 0.4132 0.4126 0.412 0.4114 0.4108 0.4102 0.4096 0.409 0.4084 \
 0.4078 0.4072 0.4066 0.406 0.4054 0.4048 0.4042 0.4036 0.403 0.4024 0.4018 \
 0.4012 0.4006 
loadtab -continue \
 0.4 0.3998 0.3996 0.3994 0.3992 0.399 0.3988 0.3986 0.3984 0.3982 0.398 \
 0.3978 0.3976 0.3974 0.3972 0.397 0.3968 0.3966 0.3964 0.3962 0.396 0.3958 \
 0.3956 0.3954 0.3952 0.395 0.3948 0.3946 0.3944 0.3942 0.394 0.3938 0.3936 \
 0.3934 0.3932 0.393 0.3928 0.3926 0.3924 0.3922 0.392 0.3918 0.3916 0.3914 \
 0.3912 0.391 0.3908 0.3906 0.3904 0.3902 0.39 0.3898 0.3896 0.3894 0.3892 \
 0.389 0.3888 0.3886 0.3884 0.3882 0.388 0.3878 0.3876 0.3874 0.3872 0.387 \
 0.3868 0.3866 0.3864 0.3862 0.386 0.3858 0.3856 0.3854 0.3852 0.385 0.3848 \
 0.3846 0.3844 0.3842 0.384 0.3838 0.3836 0.3834 0.3832 0.383 0.3828 0.3826 \
 0.3824 0.3822 0.382 0.3818 0.3816 0.3814 0.3812 0.381 0.3808 0.3806 0.3804 \
 0.3802 0.38 0.3798 0.3796 0.3794 0.3792 0.379 0.3788 0.3786 0.3784 0.3782 \
 0.378 0.3778 0.3776 0.3774 0.3772 0.377 0.3768 0.3766 0.3764 0.3762 0.376 \
 0.3758 0.3756 0.3754 0.3752 0.375 0.3748 0.3746 0.3744 0.3742 0.374 0.3738 \
 0.3736 0.3734 0.3732 0.373 0.3728 0.3726 0.3724 0.3722 0.372 0.3718 0.3716 \
 0.3714 0.3712 0.371 0.3708 0.3706 0.3704 0.3702 0.37 0.3698 0.3696 0.3694 \
 0.3692 0.369 0.3688 0.3686 0.3684 0.3682 0.368 0.3678 0.3676 0.3674 0.3672 \
 0.367 0.3668 0.3666 0.3664 0.3662 0.366 0.3658 0.3656 0.3654 0.3652 0.365 \
 0.3648 0.3646 0.3644 0.3642 0.364 0.3638 0.3636 0.3634 0.3632 0.363 0.3628 \
 0.3626 0.3624 0.3622 0.362 0.3618 0.3616 0.3614 0.3612 0.361 0.3608 0.3606 \
 0.3604 0.3602 
loadtab -continue \
 0.36 0.3598 0.3596 0.3594 0.3592 0.359 0.3588 0.3586 0.3584 0.3582 0.358 \
 0.3578 0.3576 0.3574 0.3572 0.357 0.3568 0.3566 0.3564 0.3562 0.356 0.3558 \
 0.3556 0.3554 0.3552 0.355 0.3548 0.3546 0.3544 0.3542 0.354 0.3538 0.3536 \
 0.3534 0.3532 0.353 0.3528 0.3526 0.3524 0.3522 0.352 0.3518 0.3516 0.3514 \
 0.3512 0.351 0.3508 0.3506 0.3504 0.3502 0.35 0.3498 0.3496 0.3494 0.3492 \
 0.349 0.3488 0.3486 0.3484 0.3482 0.348 0.3478 0.3476 0.3474 0.3472 0.347 \
 0.3468 0.3466 0.3464 0.3462 0.346 0.3458 0.3456 0.3454 0.3452 0.345 0.3448 \
 0.3446 0.3444 0.3442 0.344 0.3438 0.3436 0.3434 0.3432 0.343 0.3428 0.3426 \
 0.3424 0.3422 0.342 0.3418 0.3416 0.3414 0.3412 0.341 0.3408 0.3406 0.3404 \
 0.3402 0.34 0.3398 0.3396 0.3394 0.3392 0.339 0.3388 0.3386 0.3384 0.3382 \
 0.338 0.3378 0.3376 0.3374 0.3372 0.337 0.3368 0.3366 0.3364 0.3362 0.336 \
 0.3358 0.3356 0.3354 0.3352 0.335 0.3348 0.3346 0.3344 0.3342 0.334 0.3338 \
 0.3336 0.3334 0.3332 0.333 0.3328 0.3326 0.3324 0.3322 0.332 0.3318 0.3316 \
 0.3314 0.3312 0.331 0.3308 0.3306 0.3304 0.3302 0.33 0.3298 0.3296 0.3294 \
 0.3292 0.329 0.3288 0.3286 0.3284 0.3282 0.328 0.3278 0.3276 0.3274 0.3272 \
 0.327 0.3268 0.3266 0.3264 0.3262 0.326 0.3258 0.3256 0.3254 0.3252 0.325 \
 0.3248 0.3246 0.3244 0.3242 0.324 0.3238 0.3236 0.3234 0.3232 0.323 0.3228 \
 0.3226 0.3224 0.3222 0.322 0.3218 0.3216 0.3214 0.3212 0.321 0.3208 0.3206 \
 0.3204 0.3202 
loadtab -continue \
 0.32 0.3198 0.3196 0.3194 0.3192 0.319 0.3188 0.3186 0.3184 0.3182 0.318 \
 0.3178 0.3176 0.3174 0.3172 0.317 0.3168 0.3166 0.3164 0.3162 0.316 0.3158 \
 0.3156 0.3154 0.3152 0.315 0.3148 0.3146 0.3144 0.3142 0.314 0.3138 0.3136 \
 0.3134 0.3132 0.313 0.3128 0.3126 0.3124 0.3122 0.312 0.3118 0.3116 0.3114 \
 0.3112 0.311 0.3108 0.3106 0.3104 0.3102 0.31 0.3098 0.3096 0.3094 0.3092 \
 0.309 0.3088 0.3086 0.3084 0.3082 0.308 0.3078 0.3076 0.3074 0.3072 0.307 \
 0.3068 0.3066 0.3064 0.3062 0.306 0.3058 0.3056 0.3054 0.3052 0.305 0.3048 \
 0.3046 0.3044 0.3042 0.304 0.3038 0.3036 0.3034 0.3032 0.303 0.3028 0.3026 \
 0.3024 0.3022 0.302 0.3018 0.3016 0.3014 0.3012 0.301 0.3008 0.3006 0.3004 \
 0.3002 0.3 0.2998 0.2996 0.2994 0.2992 0.299 0.2988 0.2986 0.2984 0.2982 \
 0.298 0.2978 0.2976 0.2974 0.2972 0.297 0.2968 0.2966 0.2964 0.2962 0.296 \
 0.2958 0.2956 0.2954 0.2952 0.295 0.2948 0.2946 0.2944 0.2942 0.294 0.2938 \
 0.2936 0.2934 0.2932 0.293 0.2928 0.2926 0.2924 0.2922 0.292 0.2918 0.2916 \
 0.2914 0.2912 0.291 0.2908 0.2906 0.2904 0.2902 0.29 0.2898 0.2896 0.2894 \
 0.2892 0.289 0.2888 0.2886 0.2884 0.2882 0.288 0.2878 0.2876 0.2874 0.2872 \
 0.287 0.2868 0.2866 0.2864 0.2862 0.286 0.2858 0.2856 0.2854 0.2852 0.285 \
 0.2848 0.2846 0.2844 0.2842 0.284 0.2838 0.2836 0.2834 0.2832 0.283 0.2828 \
 0.2826 0.2824 0.2822 0.282 0.2818 0.2816 0.2814 0.2812 0.281 0.2808 0.2806 \
 0.2804 0.2802 
loadtab -continue \
 0.28 0.2798 0.2796 0.2794 0.2792 0.279 0.2788 0.2786 0.2784 0.2782 0.278 \
 0.2778 0.2776 0.2774 0.2772 0.277 0.2768 0.2766 0.2764 0.2762 0.276 0.2758 \
 0.2756 0.2754 0.2752 0.275 0.2748 0.2746 0.2744 0.2742 0.274 0.2738 0.2736 \
 0.2734 0.2732 0.273 0.2728 0.2726 0.2724 0.2722 0.272 0.2718 0.2716 0.2714 \
 0.2712 0.271 0.2708 0.2706 0.2704 0.2702 0.27 0.2698 0.2696 0.2694 0.2692 \
 0.269 0.2688 0.2686 0.2684 0.2682 0.268 0.2678 0.2676 0.2674 0.2672 0.267 \
 0.2668 0.2666 0.2664 0.2662 0.266 0.2658 0.2656 0.2654 0.2652 0.265 0.2648 \
 0.2646 0.2644 0.2642 0.264 0.2638 0.2636 0.2634 0.2632 0.263 0.2628 0.2626 \
 0.2624 0.2622 0.262 0.2618 0.2616 0.2614 0.2612 0.261 0.2608 0.2606 0.2604 \
 0.2602 0.26 0.2598 0.2596 0.2594 0.2592 0.259 0.2588 0.2586 0.2584 0.2582 \
 0.258 0.2578 0.2576 0.2574 0.2572 0.257 0.2568 0.2566 0.2564 0.2562 0.256 \
 0.2558 0.2556 0.2554 0.2552 0.255 0.2548 0.2546 0.2544 0.2542 0.254 0.2538 \
 0.2536 0.2534 0.2532 0.253 0.2528 0.2526 0.2524 0.2522 0.252 0.2518 0.2516 \
 0.2514 0.2512 0.251 0.2508 0.2506 0.2504 0.2502 0.25 0.2498 0.2496 0.2494 \
 0.2492 0.249 0.2488 0.2486 0.2484 0.2482 0.248 0.2478 0.2476 0.2474 0.2472 \
 0.247 0.2468 0.2466 0.2464 0.2462 0.246 0.2458 0.2456 0.2454 0.2452 0.245 \
 0.2448 0.2446 0.2444 0.2442 0.244 0.2438 0.2436 0.2434 0.2432 0.243 0.2428 \
 0.2426 0.2424 0.2422 0.242 0.2418 0.2416 0.2414 0.2412 0.241 0.2408 0.2406 \
 0.2404 0.2402 
loadtab -continue \
 0.24 0.2398 0.2396 0.2394 0.2392 0.239 0.2388 0.2386 0.2384 0.2382 0.238 \
 0.2378 0.2376 0.2374 0.2372 0.237 0.2368 0.2366 0.2364 0.2362 0.236 0.2358 \
 0.2356 0.2354 0.2352 0.235 0.2348 0.2346 0.2344 0.2342 0.234 0.2338 0.2336 \
 0.2334 0.2332 0.233 0.2328 0.2326 0.2324 0.2322 0.232 0.2318 0.2316 0.2314 \
 0.2312 0.231 0.2308 0.2306 0.2304 0.2302 0.23 0.2298 0.2296 0.2294 0.2292 \
 0.229 0.2288 0.2286 0.2284 0.2282 0.228 0.2278 0.2276 0.2274 0.2272 0.227 \
 0.2268 0.2266 0.2264 0.2262 0.226 0.2258 0.2256 0.2254 0.2252 0.225 0.2248 \
 0.2246 0.2244 0.2242 0.224 0.2238 0.2236 0.2234 0.2232 0.223 0.2228 0.2226 \
 0.2224 0.2222 0.222 0.2218 0.2216 0.2214 0.2212 0.221 0.2208 0.2206 0.2204 \
 0.2202 0.22 0.2198 0.2196 0.2194 0.2192 0.219 0.2188 0.2186 0.2184 0.2182 \
 0.218 0.2178 0.2176 0.2174 0.2172 0.217 0.2168 0.2166 0.2164 0.2162 0.216 \
 0.2158 0.2156 0.2154 0.2152 0.215 0.2148 0.2146 0.2144 0.2142 0.214 0.2138 \
 0.2136 0.2134 0.2132 0.213 0.2128 0.2126 0.2124 0.2122 0.212 0.2118 0.2116 \
 0.2114 0.2112 0.211 0.2108 0.2106 0.2104 0.2102 0.21 0.2098 0.2096 0.2094 \
 0.2092 0.209 0.2088 0.2086 0.2084 0.2082 0.208 0.2078 0.2076 0.2074 0.2072 \
 0.207 0.2068 0.2066 0.2064 0.2062 0.206 0.2058 0.2056 0.2054 0.2052 0.205 \
 0.2048 0.2046 0.2044 0.2042 0.204 0.2038 0.2036 0.2034 0.2032 0.203 0.2028 \
 0.2026 0.2024 0.2022 0.202 0.2018 0.2016 0.2014 0.2012 0.201 0.2008 0.2006 \
 0.2004 0.2002 
loadtab -continue \
 0.2 0.19988 0.19976 0.19964 0.19952 0.1994 0.19928 0.19916 0.19904 0.19892 \
 0.1988 0.19868 0.19856 0.19844 0.19832 0.1982 0.19808 0.19796 0.19784 \
 0.19772 0.1976 0.19748 0.19736 0.19724 0.19712 0.197 0.19688 0.19676 0.19664 \
 0.19652 0.1964 0.19628 0.19616 0.19604 0.19592 0.1958 0.19568 0.19556 \
 0.19544 0.19532 0.1952 0.19508 0.19496 0.19484 0.19472 0.1946 0.19448 \
 0.19436 0.19424 0.19412 0.194 0.19388 0.19376 0.19364 0.19352 0.1934 0.19328 \
 0.19316 0.19304 0.19292 0.1928 0.19268 0.19256 0.19244 0.19232 0.1922 \
 0.19208 0.19196 0.19184 0.19172 0.1916 0.19148 0.19136 0.19124 0.19112 0.191 \
 0.19088 0.19076 0.19064 0.19052 0.1904 0.19028 0.19016 0.19004 0.18992 \
 0.1898 0.18968 0.18956 0.18944 0.18932 0.1892 0.18908 0.18896 0.18884 \
 0.18872 0.1886 0.18848 0.18836 0.18824 0.18812 0.188 0.18788 0.18776 0.18764 \
 0.18752 0.1874 0.18728 0.18716 0.18704 0.18692 0.1868 0.18668 0.18656 \
 0.18644 0.18632 0.1862 0.18608 0.18596 0.18584 0.18572 0.1856 0.18548 \
 0.18536 0.18524 0.18512 0.185 0.18488 0.18476 0.18464 0.18452 0.1844 0.18428 \
 0.18416 0.18404 0.18392 0.1838 0.18368 0.18356 0.18344 0.18332 0.1832 \
 0.18308 0.18296 0.18284 0.18272 0.1826 0.18248 0.18236 0.18224 0.18212 0.182 \
 0.18188 0.18176 0.18164 0.18152 0.1814 0.18128 0.18116 0.18104 0.18092 \
 0.1808 0.18068 0.18056 0.18044 0.18032 0.1802 0.18008 0.17996 0.17984 \
 0.17972 0.1796 0.17948 0.17936 0.17924 0.17912 0.179 0.17888 0.17876 0.17864 \
 0.17852 0.1784 0.17828 0.17816 0.17804 0.17792 0.1778 0.17768 0.17756 \
 0.17744 0.17732 0.1772 0.17708 0.17696 0.17684 0.17672 0.1766 0.17648 \
 0.17636 0.17624 0.17612 
loadtab -continue \
 0.176 0.17588 0.17576 0.17564 0.17552 0.1754 0.17528 0.17516 0.17504 0.17492 \
 0.1748 0.17468 0.17456 0.17444 0.17432 0.1742 0.17408 0.17396 0.17384 \
 0.17372 0.1736 0.17348 0.17336 0.17324 0.17312 0.173 0.17288 0.17276 0.17264 \
 0.17252 0.1724 0.17228 0.17216 0.17204 0.17192 0.1718 0.17168 0.17156 \
 0.17144 0.17132 0.1712 0.17108 0.17096 0.17084 0.17072 0.1706 0.17048 \
 0.17036 0.17024 0.17012 0.17 0.16988 0.16976 0.16964 0.16952 0.1694 0.16928 \
 0.16916 0.16904 0.16892 0.1688 0.16868 0.16856 0.16844 0.16832 0.1682 \
 0.16808 0.16796 0.16784 0.16772 0.1676 0.16748 0.16736 0.16724 0.16712 0.167 \
 0.16688 0.16676 0.16664 0.16652 0.1664 0.16628 0.16616 0.16604 0.16592 \
 0.1658 0.16568 0.16556 0.16544 0.16532 0.1652 0.16508 0.16496 0.16484 \
 0.16472 0.1646 0.16448 0.16436 0.16424 0.16412 0.164 0.16388 0.16376 0.16364 \
 0.16352 0.1634 0.16328 0.16316 0.16304 0.16292 0.1628 0.16268 0.16256 \
 0.16244 0.16232 0.1622 0.16208 0.16196 0.16184 0.16172 0.1616 0.16148 \
 0.16136 0.16124 0.16112 0.161 0.16088 0.16076 0.16064 0.16052 0.1604 0.16028 \
 0.16016 0.16004 0.15992 0.1598 0.15968 0.15956 0.15944 0.15932 0.1592 \
 0.15908 0.15896 0.15884 0.15872 0.1586 0.15848 0.15836 0.15824 0.15812 0.158 \
 0.15788 0.15776 0.15764 0.15752 0.1574 0.15728 0.15716 0.15704 0.15692 \
 0.1568 0.15668 0.15656 0.15644 0.15632 0.1562 0.15608 0.15596 0.15584 \
 0.15572 0.1556 0.15548 0.15536 0.15524 0.15512 0.155 0.15488 0.15476 0.15464 \
 0.15452 0.1544 0.15428 0.15416 0.15404 0.15392 0.1538 0.15368 0.15356 \
 0.15344 0.15332 0.1532 0.15308 0.15296 0.15284 0.15272 0.1526 0.15248 \
 0.15236 0.15224 0.15212 
loadtab -continue \
 0.152 0.15188 0.15176 0.15164 0.15152 0.1514 0.15128 0.15116 0.15104 0.15092 \
 0.1508 0.15068 0.15056 0.15044 0.15032 0.1502 0.15008 0.14996 0.14984 \
 0.14972 0.1496 0.14948 0.14936 0.14924 0.14912 0.149 0.14888 0.14876 0.14864 \
 0.14852 0.1484 0.14828 0.14816 0.14804 0.14792 0.1478 0.14768 0.14756 \
 0.14744 0.14732 0.1472 0.14708 0.14696 0.14684 0.14672 0.1466 0.14648 \
 0.14636 0.14624 0.14612 0.146 0.14588 0.14576 0.14564 0.14552 0.1454 0.14528 \
 0.14516 0.14504 0.14492 0.1448 0.14468 0.14456 0.14444 0.14432 0.1442 \
 0.14408 0.14396 0.14384 0.14372 0.1436 0.14348 0.14336 0.14324 0.14312 0.143 \
 0.14288 0.14276 0.14264 0.14252 0.1424 0.14228 0.14216 0.14204 0.14192 \
 0.1418 0.14168 0.14156 0.14144 0.14132 0.1412 0.14108 0.14096 0.14084 \
 0.14072 0.1406 0.14048 0.14036 0.14024 0.14012 0.14 0.13988 0.13976 0.13964 \
 0.13952 0.1394 0.13928 0.13916 0.13904 0.13892 0.1388 0.13868 0.13856 \
 0.13844 0.13832 0.1382 0.13808 0.13796 0.13784 0.13772 0.1376 0.13748 \
 0.13736 0.13724 0.13712 0.137 0.13688 0.13676 0.13664 0.13652 0.1364 0.13628 \
 0.13616 0.13604 0.13592 0.1358 0.13568 0.13556 0.13544 0.13532 0.1352 \
 0.13508 0.13496 0.13484 0.13472 0.1346 0.13448 0.13436 0.13424 0.13412 0.134 \
 0.13388 0.13376 0.13364 0.13352 0.1334 0.13328 0.13316 0.13304 0.13292 \
 0.1328 0.13268 0.13256 0.13244 0.13232 0.1322 0.13208 0.13196 0.13184 \
 0.13172 0.1316 0.13148 0.13136 0.13124 0.13112 0.131 0.13088 0.13076 0.13064 \
 0.13052 0.1304 0.13028 0.13016 0.13004 0.12992 0.1298 0.12968 0.12956 \
 0.12944 0.12932 0.1292 0.12908 0.12896 0.12884 0.12872 0.1286 0.12848 \
 0.12836 0.12824 0.12812 
loadtab -continue \
 0.128 0.12788 0.12776 0.12764 0.12752 0.1274 0.12728 0.12716 0.12704 0.12692 \
 0.1268 0.12668 0.12656 0.12644 0.12632 0.1262 0.12608 0.12596 0.12584 \
 0.12572 0.1256 0.12548 0.12536 0.12524 0.12512 0.125 0.12488 0.12476 0.12464 \
 0.12452 0.1244 0.12428 0.12416 0.12404 0.12392 0.1238 0.12368 0.12356 \
 0.12344 0.12332 0.1232 0.12308 0.12296 0.12284 0.12272 0.1226 0.12248 \
 0.12236 0.12224 0.12212 0.122 0.12188 0.12176 0.12164 0.12152 0.1214 0.12128 \
 0.12116 0.12104 0.12092 0.1208 0.12068 0.12056 0.12044 0.12032 0.1202 \
 0.12008 0.11996 0.11984 0.11972 0.1196 0.11948 0.11936 0.11924 0.11912 0.119 \
 0.11888 0.11876 0.11864 0.11852 0.1184 0.11828 0.11816 0.11804 0.11792 \
 0.1178 0.11768 0.11756 0.11744 0.11732 0.1172 0.11708 0.11696 0.11684 \
 0.11672 0.1166 0.11648 0.11636 0.11624 0.11612 0.116 0.11588 0.11576 0.11564 \
 0.11552 0.1154 0.11528 0.11516 0.11504 0.11492 0.1148 0.11468 0.11456 \
 0.11444 0.11432 0.1142 0.11408 0.11396 0.11384 0.11372 0.1136 0.11348 \
 0.11336 0.11324 0.11312 0.113 0.11288 0.11276 0.11264 0.11252 0.1124 0.11228 \
 0.11216 0.11204 0.11192 0.1118 0.11168 0.11156 0.11144 0.11132 0.1112 \
 0.11108 0.11096 0.11084 0.11072 0.1106 0.11048 0.11036 0.11024 0.11012 0.11 \
 0.10988 0.10976 0.10964 0.10952 0.1094 0.10928 0.10916 0.10904 0.10892 \
 0.1088 0.10868 0.10856 0.10844 0.10832 0.1082 0.10808 0.10796 0.10784 \
 0.10772 0.1076 0.10748 0.10736 0.10724 0.10712 0.107 0.10688 0.10676 0.10664 \
 0.10652 0.1064 0.10628 0.10616 0.10604 0.10592 0.1058 0.10568 0.10556 \
 0.10544 0.10532 0.1052 0.10508 0.10496 0.10484 0.10472 0.1046 0.10448 \
 0.10436 0.10424 0.10412 
loadtab -continue \
 0.104 0.10388 0.10376 0.10364 0.10352 0.1034 0.10328 0.10316 0.10304 0.10292 \
 0.1028 0.10268 0.10256 0.10244 0.10232 0.1022 0.10208 0.10196 0.10184 \
 0.10172 0.1016 0.10148 0.10136 0.10124 0.10112 0.101 0.10088 0.10076 0.10064 \
 0.10052 0.1004 0.10028 0.10016 0.10004 0.09992 0.0998 0.09968 0.09956 \
 0.09944 0.09932 0.0992 0.09908 0.09896 0.09884 0.09872 0.0986 0.09848 \
 0.09836 0.09824 0.09812 0.098 0.09788 0.09776 0.09764 0.09752 0.0974 0.09728 \
 0.09716 0.09704 0.09692 0.0968 0.09668 0.09656 0.09644 0.09632 0.0962 \
 0.09608 0.09596 0.09584 0.09572 0.0956 0.09548 0.09536 0.09524 0.09512 0.095 \
 0.09488 0.09476 0.09464 0.09452 0.0944 0.09428 0.09416 0.09404 0.09392 \
 0.0938 0.09368 0.09356 0.09344 0.09332 0.0932 0.09308 0.09296 0.09284 \
 0.09272 0.0926 0.09248 0.09236 0.09224 0.09212 0.092 0.09188 0.09176 0.09164 \
 0.09152 0.0914 0.09128 0.09116 0.09104 0.09092 0.0908 0.09068 0.09056 \
 0.09044 0.09032 0.0902 0.09008 0.08996 0.08984 0.08972 0.0896 0.08948 \
 0.08936 0.08924 0.08912 0.089 0.08888 0.08876 0.08864 0.08852 0.0884 0.08828 \
 0.08816 0.08804 0.08792 0.0878 0.08768 0.08756 0.08744 0.08732 0.0872 \
 0.08708 0.08696 0.08684 0.08672 0.0866 0.08648 0.08636 0.08624 0.08612 0.086 \
 0.08588 0.08576 0.08564 0.08552 0.0854 0.08528 0.08516 0.08504 0.08492 \
 0.0848 0.08468 0.08456 0.08444 0.08432 0.0842 0.08408 0.08396 0.08384 \
 0.08372 0.0836 0.08348 0.08336 0.08324 0.08312 0.083 0.08288 0.08276 0.08264 \
 0.08252 0.0824 0.08228 0.08216 0.08204 0.08192 0.0818 0.08168 0.08156 \
 0.08144 0.08132 0.0812 0.08108 0.08096 0.08084 0.08072 0.0806 0.08048 \
 0.08036 0.08024 0.08012 
loadtab -continue \
 0.08
simundump xgraph /graphs/conc1 0 0 100 0 0.27809 0
simundump xgraph /graphs/conc2 0 0 100 0 0.063073 0
simundump xplot /graphs/conc1/Shc*.Sos.Grb2.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" brown 0 0 1
simundump xplot /graphs/conc1/EGFR*.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /graphs/conc1/Sos.Grb2.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" orange 0 0 1
simundump xplot /graphs/conc1/CaM-Ca4.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" blue 0 0 1
simundump xplot /graphs/conc1/PKC-active.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /graphs/conc1/GTP-Ras.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" orange 0 0 1
simundump xplot /graphs/conc1/cAMP.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" green 0 0 1
simundump xplot /graphs/conc1/Raf-GTP-Ras*.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /graphs/conc2/L.EGFR.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /graphs/conc2/SHC*.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" orange 0 0 1
simundump xplot /graphs/conc2/MAPK*.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" orange 0 0 1
simundump xplot /graphs/conc2/BetaGamma.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" yellow 0 0 1
simundump xplot /graphs/conc2/PLC-Ca-Gq.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" cyan 0 0 1
simundump xplot /graphs/conc2/PLC-Ca.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" cyan 0 0 1
simundump xplot /graphs/conc2/Ca.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xgraph /moregraphs/conc3 0 0 100 0 5 0
simundump xgraph /moregraphs/conc4 0 0 100 0 22 0
simundump xplot /moregraphs/conc3/Sos*.Grb2.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" orange 0 0 1
simundump xplot /moregraphs/conc3/SHC*.EGFR*.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" purple 0 0 1
simundump xplot /moregraphs/conc3/CaMKII**.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" cyan 0 0 1
simundump xplot /moregraphs/conc3/PKA-active.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" yellow 0 0 1
simundump xplot /moregraphs/conc3/DAG.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" green 0 0 1
simundump xplot /moregraphs/conc3/G*GTP.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /moregraphs/conc3/Glu.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" green 0 0 1
simundump xplot /moregraphs/conc4/neurogranin*.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" red 0 0 1
simundump xplot /moregraphs/conc4/CaMKII***.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" cyan 0 0 1
simundump xplot /moregraphs/conc4/Rec-Glu-Gq.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" orange 0 0 1
simundump xplot /moregraphs/conc4/AA.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" darkgreen 0 0 1
simundump xplot /moregraphs/conc4/Rec-Glu.Co 3 524288 3 \
  "delete_plot.w <s> <d>; edit_plot.D <w>" green 0 0 1
simundump xcoredraw /edit/draw 0 -6.7481 13.81 15.368 35.924
simundump xtree /edit/draw/tree 0 /kinetics/##[] \
  "edit_elm.D <v>; drag_from_edit.w <d> <S> <x> <y> <z>" auto 0.6
call /edit/draw/tree ADDMSGARROW \
             select                 all       all       all    none -1000 0 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
     /kinetics/##[] /kinetics/##[TYPE=group]       all       all    none -1001 0 \
  "echo.p dragging <S> onto group <D>; thing_to_group_add.p <S> <D>" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kpool]  SUMTOTAL     kpool darkgreen -1002 0 \
  "echo.p dragging <S> to <D> for sumtotal" "pool_to_pool_add_sumtot.p <S> <D>" "pool_to_pool_drop_sumtot.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kpool]  CONSERVE     kpool    blue -1003 0 \
  "echo.p dragging <S> to <D> for conserve" "pool_to_pool_add_consv.p <S> <D>" "pool_to_pool_drop_consv.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kreac] /kinetics/##[TYPE=kpool]      REAC     kpool    none -1004 0 \
  "echo.p dragging <S> to <D> for product" "reac_to_pool_add.p <S> <D>" "reac_to_pool_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kreac] SUBSTRATE     kreac   green -1005 0 \
  "echo.p dragging <S> to <D> for substrate" "pool_to_reac_add.p <S> <D>" "pool_to_reac_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kreac]        KF     kreac  purple -1006 0 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kreac]        KB     kreac hotpink -1007 0 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kreac]   PRODUCT     kreac   green -1008 1 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kenz] /kinetics/##[TYPE=kpool]    MM_PRD     kpool     red -1009 0 \
  "echo.p dragging <S> to <D> for enz product" "enz_to_pool_add.p <S> <D>" "enz_to_pool_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kenz] SUBSTRATE      kenz     red -1010 0 \
  "echo.p dragging <S> to <D> for enz substrate" "pool_to_enz_add.p <S> <D>" "pool_to_enz_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kenz] /kinetics/##[TYPE=kpool]  SUMTOTAL     kpool darkgreen -1011 0 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kenz] /kinetics/##[TYPE=kpool]  CONSERVE     kpool    blue -1012 0 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kenz]  INTRAMOL      kenz   white -1013 0 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=stim] /kinetics/##[TYPE=kpool]     SLAVE     kpool  orange -1014 0 \
  "echo.p dragging <S> to <D> for stimulus" "stim_to_pool_add.p <S> <D>" "stim_to_pool_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=stim] /kinetics/##[TYPE=stim]     INPUT      stim  orange -1015 0 \
  "echo.p dragging <S> to <D> for stim" "stim_to_stim_add.p <S> <D>" "stim_to_stim_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=xtab] /kinetics/##[TYPE=kpool]     SLAVE     kpool  orange -1016 0 \
  "echo.p dragging <S> to <D> for xtab" "xtab_to_pool_add.p <S> <D>" "xtab_to_pool_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=xtab] /kinetics/##[TYPE=xtab]     INPUT      xtab  orange -1017 0 \
  "echo.p dragging <S> to <D> for xtab" "xtab_to_xtab_add.p <S> <D>" "xtab_to_xtab_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=xtab]     INPUT      xtab hotpink -1018 0 \
  "echo.p dragging <S> to <D> for xtab" "pool_to_xtab_add.p <S> <D>" "pool_to_xtab_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kchan] /kinetics/##[TYPE=kpool]      REAC     kpool    none -1019 0 \
  "echo.p dragging <S> to <D> for chan product" "chan_to_pool_add.p <S> <D>" "chan_to_pool_drop.p <S> <D>"
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kchan]   PRODUCT     kchan  orange -1020 1 \
  "" "" ""
call /edit/draw/tree ADDMSGARROW \
/kinetics/##[TYPE=kpool] /kinetics/##[TYPE=kchan] SUBSTRATE     kchan  orange -1021 0 \
  "echo.p dragging <S> to <D> for chan substrate" "pool_to_chan_add.p <S> <D>" "pool_to_chan_drop.p <S> <D>"
call /edit/draw/tree UNDUMP 100 \
 "/kinetics/EGF_Receptor" 2.3701 23.811 0 \
 "/kinetics/EGF_Receptor/EGFR" 0.050605 25.802 0 \
 "/kinetics/EGF_Receptor/activate_EGFR" 3.2588 26.159 0 \
 "/kinetics/EGF_Receptor/EGF" 0.37965 28.375 0 \
 "/kinetics/EGF_Receptor/L.EGFR" 2.5048 30.659 0 \
 "/kinetics/EGF_Receptor/dimerize_EGFR" 4.0472 34.947 0 \
 "/kinetics/EGF_Receptor/SHC" 4.9041 27.575 0 \
 "/kinetics/EGF_Receptor/SHC*" 7.8518 27.286 0 \
 "/kinetics/EGF_Receptor/dephosph_Shc" 7.9066 23.412 0 \
 "/kinetics/EGF_Receptor/EGFR*" 5.761 31.96 0 \
 "/kinetics/EGF_Receptor/EGFR*/phosph_Shc" 5.8501 30.794 0 \
 "/kinetics/EGF_Receptor/Shc_bind_EGFR" 8.3659 30.948 0 \
 "/kinetics/EGF_Receptor/SHC*.EGFR*" 7.8861 34.176 0 \
 "/kinetics/EGF_Receptor/Shc_bind_Sos.Grb2" 10.942 24.719 0 \
 "/kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2" 10.942 35.101 0 \
 "/kinetics/EGF_Receptor/Sos*.Grb2" 12.986 36.489 0 \
 "/kinetics/EGF_Receptor/Grb2_bind_Sos*" 13.691 33.547 0 \
 "/kinetics/EGF_Receptor/Grb2" 15.454 30.129 0 \
 "/kinetics/EGF_Receptor/Sos.Grb2" 14.7 24.925 0 \
 "/kinetics/EGF_Receptor/Sos*" 16.133 35.043 0 \
 "/kinetics/EGF_Receptor/dephosph_Sos" 16.023 32.377 0 \
 "/kinetics/EGF_Receptor/Grb2_bind_Sos" 17.134 27.961 0 \
 "/kinetics/EGF_Receptor/Sos" 18.093 31.622 0 \
 "/kinetics/MAPK*" 12.4924 0.776017 0 \
 "/kinetics/MAPK*/phosph_Sos" 19.081 35.91 0 \
 "/kinetics/MAPK*/MAPK*" -12.0046 -14.9398 0 \
 "/kinetics/MAPK*/MAPK*-feedback" 10.3875 10.6685 0 \
 "/kinetics/Shc*.Sos.Grb2" 11.636 28.232 0 \
 "/kinetics/Shc*.Sos.Grb2/Ras_GEF" 11.731 29.279 0 \
 "/kinetics/Shc*.EGFR*.Sos.Grb2" 11.386 32.018 0 \
 "/kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF" 11.342 31.011 0 \
 "/kinetics/PKC" -3.04929 8.21631 0 \
 "/kinetics/PKC/PKC-Ca" -4.07517 1.51085 0 \
 "/kinetics/PKC/PKC-act-by-Ca" -4.07517 -0.122947 0 \
 "/kinetics/PKC/PKC-act-by-DAG" -2.06118 0.693953 0 \
 "/kinetics/PKC/PKC-Ca-to-memb" -3.79738 4.25331 0 \
 "/kinetics/PKC/PKC-DAG-to-memb" -2.61677 2.73621 0 \
 "/kinetics/PKC/PKC-act-by-Ca-AA" -0.78797 3.81568 0 \
 "/kinetics/PKC/PKC-act-by-DAG-AA" 1.24916 3.23218 0 \
 "/kinetics/PKC/PKC-DAG-AA*" 0.600985 5.53701 0 \
 "/kinetics/PKC/PKC-Ca-AA*" -0.602776 6.29557 0 \
 "/kinetics/PKC/PKC-Ca-memb*" -2.77881 6.52897 0 \
 "/kinetics/PKC/PKC-DAG-memb*" -1.82969 5.50784 0 \
 "/kinetics/PKC/PKC-basal*" -4.7465 5.56619 0 \
 "/kinetics/PKC/PKC-basal-act" -4.97799 3.05713 0 \
 "/kinetics/PKC/PKC-AA*" 1.78159 6.82072 0 \
 "/kinetics/PKC/PKC-act-by-AA" -4.99245 -1.86537 0 \
 "/kinetics/PKC/PKC-Ca-DAG" 0.230597 1.8026 0 \
 "/kinetics/PKC/PKC-n-DAG" -3.0103 -1.99016 0 \
 "/kinetics/PKC/PKC-DAG" -0.996314 -1.08573 0 \
 "/kinetics/PKC/PKC-n-DAG-AA" -1.22781 -2.95294 0 \
 "/kinetics/PKC/PKC-DAG-AA" 0.624134 0.227153 0 \
 "/kinetics/PKC/PKC-cytosolic" -6.13155 0.597108 0 \
 "/kinetics/DAG" -3.20515 -4.71675 0 \
 "/kinetics/Ca" -8.3874 -2.76345 0 \
 "/kinetics/AA" -3.28976 -9.33758 0 \
 "/kinetics/PKC-active" -1.3293 7.8745 0 \
 "/kinetics/PKC-active/PKC-act-raf" 6.2532 10.5492 0 \
 "/kinetics/PKC-active/PKC-inact-GAP" 3.43912 11.8042 0 \
 "/kinetics/PKC-active/PKC-act-GEF" -0.247906 17.2639 0 \
 "/kinetics/PKC-active/PKC-phosph-neurogranin" -23.917 -4.6577 0 \
 "/kinetics/PKC-active/PKC-phosph-ng-CaM" -18.752 -4.7518 0 \
 "/kinetics/PKC-active/phosph-AC2" -17.302 -18.9895 0 \
 "/kinetics/PLA2" -7.35718 -14.2086 0 \
 "/kinetics/PLA2/PLA2-cytosolic" -11.8243 -8.94209 0 \
 "/kinetics/PLA2/PLA2-Ca-act" -11.097 -11.1044 0 \
 "/kinetics/PLA2/PLA2-Ca*" -8.72196 -11.646 0 \
 "/kinetics/PLA2/PLA2-Ca*/kenz" -6.0553 -11.6669 0 \
 "/kinetics/PLA2/PIP2-PLA2-act" -11.0553 -6.75022 0 \
 "/kinetics/PLA2/PIP2-PLA2*" -8.6803 -6.29188 0 \
 "/kinetics/PLA2/PIP2-PLA2*/kenz" -6.03446 -6.27105 0 \
 "/kinetics/PLA2/PIP2-Ca-PLA2-act" -10.097 -7.50022 0 \
 "/kinetics/PLA2/PIP2-Ca-PLA2*" -8.32613 -7.89605 0 \
 "/kinetics/PLA2/PIP2-Ca-PLA2*/kenz" -5.97196 -7.97938 0 \
 "/kinetics/PLA2/DAG-Ca-PLA2-act" -10.8261 -9.83355 0 \
 "/kinetics/PLA2/DAG-Ca-PLA2*" -8.13863 -10.4794 0 \
 "/kinetics/PLA2/DAG-Ca-PLA2*/kenz" -5.95113 -10.3544 0 \
 "/kinetics/PLA2/APC" -8.23862 -9.96337 0 \
 "/kinetics/PLA2/Degrade-AA" -6.1808 -5.2875 0 \
 "/kinetics/PLA2/PLA2*-Ca" -7.81296 -12.6868 0 \
 "/kinetics/PLA2/PLA2*-Ca/kenz" -6.08142 -12.8166 0 \
 "/kinetics/PLA2/PLA2*" -9.02503 -14.8512 0 \
 "/kinetics/PLA2/PLA2*-Ca-act" -10.0856 -12.7517 0 \
 "/kinetics/PLA2/dephosphorylate-PLA2*" -13.6928 -11.7346 0 \
 "/kinetics/temp-PIP2" -15.7959 -7.04735 0 \
 "/kinetics/IP3" -0.773746 -4.6555 0 \
 "/kinetics/Glu" -0.661989 13.305 0 \
 "/kinetics/PLCbeta" 8.58463 -17.4677 0 \
 "/kinetics/PLCbeta/Act-PLC-Ca" 3.07087 -16.9779 0 \
 "/kinetics/PLCbeta/PLC" 10.6971 -16.9571 0 \
 "/kinetics/PLCbeta/Degrade-IP3" 2.31251 -7.97049 0 \
 "/kinetics/PLCbeta/Inositol" 4.96525 -8.74164 0 \
 "/kinetics/PLCbeta/Degrade-DAG" -0.957152 -7.26102 0 \
 "/kinetics/PLCbeta/PC" 4.90356 -7.13764 0 \
 "/kinetics/PLCbeta/PLC-Ca" 7.01472 -12.7974 0 \
 "/kinetics/PLCbeta/PLC-Ca/PLC-Ca" -2.25113 -11.6971 0 \
 "/kinetics/PLCbeta/Act-PLC-by-Gq" 2.69957 -15.1627 0 \
 "/kinetics/PLCbeta/Inact-PLC-Gq" 11.1254 -10.3136 0 \
 "/kinetics/PLCbeta/PLC-Ca-Gq" 10.6289 -13.4111 0 \
 "/kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq" 2.9471 -11.0783 0
call /edit/draw/tree UNDUMP 100 \
 "/kinetics/PLCbeta/PLC-Gq" 15.0351 -13.5371 0 \
 "/kinetics/PLCbeta/PLC-bind-Gq" 14.7463 -16.263 0 \
 "/kinetics/PLCbeta/PLC-Gq-bind-Ca" 14.0037 -11.254 0 \
 "/kinetics/PIP2" -0.031142 -11.1327 0 \
 "/kinetics/BetaGamma" 15.7872 -2.61633 0 \
 "/kinetics/G*GTP" 7.31492 -7.01314 0 \
 "/kinetics/G*GDP" 13.5603 -5.65294 0 \
 "/kinetics/Gq" 12.7451 -1.94366 0 \
 "/kinetics/Gq/RecLigandBinding" 7.33876 -3.17897 0 \
 "/kinetics/Gq/G-GDP" 10.6804 -2.57292 0 \
 "/kinetics/Gq/Basal-Act-G" 9.805 -4.82245 0 \
 "/kinetics/Gq/Trimerize-G" 12.2554 -4.78314 0 \
 "/kinetics/Gq/Inact-G" 10.2179 -7.60948 0 \
 "/kinetics/Gq/mGluR" 6.46376 -1.76231 0 \
 "/kinetics/Gq/Rec-Glu" 5.81081 -3.72166 0 \
 "/kinetics/Gq/Rec-Gq" 4.07675 -0.999425 0 \
 "/kinetics/Gq/Rec-Glu-bind-Gq" 4.7148 -2.42249 0 \
 "/kinetics/Gq/Glu-bind-Rec-Gq" 2.38597 -3.03705 0 \
 "/kinetics/Gq/Rec-Glu-Gq" 4.74161 -5.11656 0 \
 "/kinetics/Gq/Activate-Gq" 7.01724 -4.65725 0 \
 "/kinetics/Gq/Rec-bind-Gq" 6.74297 -0.0889989 0 \
 "/kinetics/Gq/mGluRAntag" 0.602158 -2.30905 0 \
 "/kinetics/Gq/Antag-bind-Rec-Gq" 2.13987 -4.2806 0 \
 "/kinetics/Gq/Blocked-rec-Gq" 2.46024 -5.98151 0 \
 "/kinetics/MAPK" 14.6165 11.1912 0 \
 "/kinetics/MAPK/craf-1" 6.32605 8.11685 0 \
 "/kinetics/MAPK/craf-1*" 9.2401 7.71145 0 \
 "/kinetics/MAPK/MAPKK" 6.33153 3.98944 0 \
 "/kinetics/MAPK/MAPK" 6.06559 1.08628 0 \
 "/kinetics/MAPK/craf-1**" 12.4638 7.90223 0 \
 "/kinetics/MAPK/MAPK-tyr" 8.4147 0.82034 0 \
 "/kinetics/MAPK/MAPKK*" 12.5477 4.02564 0 \
 "/kinetics/MAPK/MAPKK*/MAPKKtyr" 8.89145 3.55309 0 \
 "/kinetics/MAPK/MAPKK*/MAPKKthr" 12.9613 3.03628 0 \
 "/kinetics/MAPK/MAPKK-ser" 9.26524 4.16569 0 \
 "/kinetics/MAPK/Raf-GTP-Ras*" 4.90545 6.78143 0 \
 "/kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1" 7.61789 6.21889 0 \
 "/kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2" 10.6978 6.06883 0 \
 "/kinetics/MKP-1" 5.0816 2.44073 0 \
 "/kinetics/MKP-1/MKP1-tyr-deph" 6.27806 3.06838 0 \
 "/kinetics/MKP-1/MKP1-thr-deph" 10.7893 2.93108 0 \
 "/kinetics/Ras-act-craf" 3.5614 10.091 0 \
 "/kinetics/PPhosphatase2A" 9.3898 9.13091 0 \
 "/kinetics/PPhosphatase2A/craf-deph" 7.80129 10.2154 0 \
 "/kinetics/PPhosphatase2A/MAPKK-deph" 13.159 6.07359 0 \
 "/kinetics/PPhosphatase2A/MAPKK-deph-ser" 4.8651 5.92081 0 \
 "/kinetics/PPhosphatase2A/craf**-deph" 12.4456 9.90537 0 \
 "/kinetics/Ras" 14.5128 16.351 0 \
 "/kinetics/Ras/bg-act-GEF" 13.4677 14.8376 0 \
 "/kinetics/Ras/GEF-Gprot-bg" 10.3734 17.2707 0 \
 "/kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras" 10.4022 16.5232 0 \
 "/kinetics/Ras/dephosph-GEF" 9.07016 17.8808 0 \
 "/kinetics/Ras/inact-GEF" 12.4531 18.3522 0 \
 "/kinetics/Ras/GEF*" 6.4483 17.246 0 \
 "/kinetics/Ras/GEF*/GEF*-act-ras" 7.0855 16.086 0 \
 "/kinetics/Ras/GTP-Ras" 12.564 13.0836 0 \
 "/kinetics/Ras/GDP-Ras" 6.13087 14.1651 0 \
 "/kinetics/Ras/Ras-intrinsic-GTPase" 9.09789 13.4996 0 \
 "/kinetics/Ras/dephosph-GAP" 4.02345 15.5238 0 \
 "/kinetics/Ras/GAP*" 1.3498 14.349 0 \
 "/kinetics/Ras/GAP" 6.6549 12.3377 0 \
 "/kinetics/Ras/GAP/GAP-inact-ras" 9.01211 12.4032 0 \
 "/kinetics/Ras/inact-GEF*" 15.029 19.16 0 \
 "/kinetics/Ras/CaM-bind-GEF" 2.4861 21.679 0 \
 "/kinetics/Ras/CaM-GEF" 5.3451 19.58 0 \
 "/kinetics/Ras/CaM-GEF/CaM-GEF-act-ras" 5.0223 18.657 0 \
 "/kinetics/Ras/dephosph-inact-GEF*" 14.431 21.995 0 \
 "/kinetics/PKA-active" -33.2521 -13.2975 0 \
 "/kinetics/PKA-active/PKA-phosph-GEF" 10.4635 21.469 0 \
 "/kinetics/PKA-active/PKA-phosph-I1" -32.0697 -12.9575 0 \
 "/kinetics/PKA-active/PKA-phosph-GAP" -25.9464 -5.72332 0 \
 "/kinetics/PKA-active/phosph-PDE" -30.6006 -13.7565 0 \
 "/kinetics/CaM-Ca4" -21.7417 -3.30652 0 \
 "/kinetics/CaMKII" -22.0675 3.53465 0 \
 "/kinetics/CaMKII/CaMKII" -23.4858 2.83138 0 \
 "/kinetics/CaMKII/CaMKII/autoph-thr306-basal" -24.8599 5.05318 0 \
 "/kinetics/CaMKII/CaMKII-CaM" -27.1098 2.59798 0 \
 "/kinetics/CaMKII/CaMKII-CaM/autoph-thr286" -25.2005 2.13518 0 \
 "/kinetics/CaMKII/CaMKII-CaM/autoph-thr305" -28.7153 2.24198 0 \
 "/kinetics/CaMKII/CaMKII-thr286*-CaM" -27.3694 1.17598 0 \
 "/kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286" -25.5035 0.41061 0 \
 "/kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305" -28.9315 0.5886 0 \
 "/kinetics/CaMKII/CaMKII***" -27.2826 -2.06342 0 \
 "/kinetics/CaMKII/CaMKII***/autoph-thr-305" -25.4274 -2.66482 0 \
 "/kinetics/CaMKII/CaMKII-bind-CaM" -22.9651 1.08708 0 \
 "/kinetics/CaMKII/CaMK-thr286-bind-CaM" -22.9434 0.48185 0 \
 "/kinetics/CaMKII/CaMKII-thr286" -27.2175 -0.53271 0 \
 "/kinetics/CaMKII/CaMKII-thr286/autoph-thr305" -29.5214 -0.44252 0 \
 "/kinetics/CaMKII/CaMK-thr306" -27.5647 4.37988 0 \
 "/kinetics/CaMKII/CaMKII**" -27.3203 -3.56542 0 \
 "/kinetics/CaMKII/total-CaMKII" -27.5063 3.69968 0 \
 "/kinetics/CaMKII/basal-activity" -25.0357 -0.6019 0 \
 "/kinetics/PP1-active" -31.1151 -0.299871 0 \
 "/kinetics/PP1-active/Deph-thr286" -30.7635 1.34168 0 \
 "/kinetics/PP1-active/Deph-thr305" -29.98 -1.54485 0 \
 "/kinetics/PP1-active/Deph-thr306" -25.2043 3.28268 0 \
 "/kinetics/PP1-active/Deph-thr286c" -30.0007 -3.25612 0 \
 "/kinetics/PP1-active/Deph_thr286b" -24.4244 -1.55812 0 \
 "/kinetics/PP1-active/Deph-thr305b" -24.1901 -3.61772 0 \
 "/kinetics/CaM" -20.2388 -3.85522 0
call /edit/draw/tree UNDUMP 86 \
 "/kinetics/CaM/CaM" -20.2558 3.86448 0 \
 "/kinetics/CaM/CaM-TR2-bind-Ca" -18.0769 3.22368 0 \
 "/kinetics/CaM/CaM-TR2-Ca2-bind-Ca" -19.081 1.37008 0 \
 "/kinetics/CaM/CaM-Ca3-bind-Ca" -20.6385 -1.59562 0 \
 "/kinetics/CaM/neurogranin-CaM" -29.8497 -4.38352 0 \
 "/kinetics/CaM/neurogranin-bind-CaM" -25.8694 -3.94642 0 \
 "/kinetics/CaM/neurogranin*" -22.7817 -7.05092 0 \
 "/kinetics/CaM/neurogranin" -27.4802 -7.06122 0 \
 "/kinetics/CaM/dephosph-neurogranin" -20.667 -5.3862 0 \
 "/kinetics/CaM-Ca3" -20.6843 0.38496 0 \
 "/kinetics/CaM-TR2-Ca2" -19.9261 2.37508 0 \
 "/kinetics/CaM(Ca)n-CaNAB" -30.1908 -7.09392 0 \
 "/kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin" -29.1772 -5.97072 0 \
 "/kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1" -32.3589 -6.46762 0 \
 "/kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I*" -31.6516 -4.59042 0 \
 "/kinetics/PP1" -43.217 -4.45482 0 \
 "/kinetics/PP1/I1" -34.8682 -8.57122 0 \
 "/kinetics/PP1/I1*" -39.0125 -8.53922 0 \
 "/kinetics/PP1/Inact-PP1" -42.258 -6.63722 0 \
 "/kinetics/PP1/PP1-I1*" -40.602 -3.18402 0 \
 "/kinetics/PP1/PP1-I1" -33.1937 -2.90782 0 \
 "/kinetics/PP1/dissoc-PP1-I1" -39.353 -6.36092 0 \
 "/kinetics/PP2A" -36.186 -5.55982 0 \
 "/kinetics/PP2A/PP2A-dephosph-I1" -36.07 -6.36092 0 \
 "/kinetics/PP2A/PP2A-dephosph-PP1-I*" -36.128 -4.50452 0 \
 "/kinetics/CaNAB-Ca4" -24.5902 -9.01132 0 \
 "/kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM" -32.2904 -5.45242 0 \
 "/kinetics/PP2B" -19.7192 -6.29422 0 \
 "/kinetics/PP2B/CaNAB" -18.3689 -8.88522 0 \
 "/kinetics/PP2B/CaNAB-Ca2" -20.9249 -8.97692 0 \
 "/kinetics/PP2B/Ca-bind-CaNAB-Ca2" -22.4923 -10.1921 0 \
 "/kinetics/PP2B/Ca-bind-CaNAB" -19.7916 -10.3295 0 \
 "/kinetics/PP2B/CaM-Ca2-bind-CaNAB" -26.6292 -9.75522 0 \
 "/kinetics/PP2B/CaMCa3-CaNAB" -29.3342 -11.1935 0 \
 "/kinetics/PP2B/CaMCa2-CANAB" -27.1927 -11.1285 0 \
 "/kinetics/PP2B/CaMCa4-CaNAB" -30.6641 -10.0557 0 \
 "/kinetics/PP2B/CaMCa3-bind-CaNAB" -27.2603 -9.04692 0 \
 "/kinetics/PP2B/CaMCa4-bind-CaNAB" -27.3054 -8.08112 0 \
 "/kinetics/PKA" -36.391 -12.4445 0 \
 "/kinetics/PKA/R2C2" -41.1034 -19.5171 0 \
 "/kinetics/PKA/R2C2-cAMP" -38.1415 -19.0493 0 \
 "/kinetics/PKA/cAMP-bind-site-B1" -38.727 -22.7922 0 \
 "/kinetics/PKA/cAMP-bind-site-B2" -36.3851 -21.5446 0 \
 "/kinetics/PKA/cAMP-bind-site-A1" -33.6987 -22.7298 0 \
 "/kinetics/PKA/cAMP-bind-site-A2" -30.4115 -21.2986 0 \
 "/kinetics/PKA/R2C2-cAMP2" -34.5942 -18.2071 0 \
 "/kinetics/PKA/R2C2-cAMP3" -31.9079 -19.2676 0 \
 "/kinetics/PKA/R2C2-cAMP4" -29.5213 -17.6565 0 \
 "/kinetics/PKA/R2C-cAMP4" -31.8045 -16.5228 0 \
 "/kinetics/PKA/R2-cAMP4" -38.1415 -16.9594 0 \
 "/kinetics/PKA/Release-C1" -29.8089 -14.6545 0 \
 "/kinetics/PKA/Release-C2" -34.6799 -15.9325 0 \
 "/kinetics/PKA/PKA-inhibitor" -39.1617 -15.0654 0 \
 "/kinetics/PKA/inhib-PKA" -36.3685 -14.4421 0 \
 "/kinetics/PKA/inhibited-PKA" -39.7887 -13.4665 0 \
 "/kinetics/cAMP" -29.745 -25.6605 0 \
 "/kinetics/AC" -18.3376 -14.5715 0 \
 "/kinetics/AC/ATP" -18.8508 -15.9695 0 \
 "/kinetics/AC/AC1-CaM" -21.2913 -14.3605 0 \
 "/kinetics/AC/AC1-CaM/kenz" -21.3291 -15.4955 0 \
 "/kinetics/AC/AC1" -25.0561 -12.4956 0 \
 "/kinetics/AC/CaM-bind-AC1" -23.5709 -12.6911 0 \
 "/kinetics/AC/AC2*" -19.4559 -19.6215 0 \
 "/kinetics/AC/AC2*/kenz" -19.5822 -18.7645 0 \
 "/kinetics/AC/AC2-Gs" -22.2942 -18.8105 0 \
 "/kinetics/AC/AC2-Gs/kenz" -22.3731 -17.8025 0 \
 "/kinetics/AC/AC2" -18.4151 -21.4045 0 \
 "/kinetics/AC/dephosph-AC2" -20.0424 -20.9005 0 \
 "/kinetics/AC/AC1-Gs" -23.7289 -13.6085 0 \
 "/kinetics/AC/AC1-Gs/kenz" -22.7533 -14.7565 0 \
 "/kinetics/AC/Gs-bind-AC2" -22.2999 -23.2425 0 \
 "/kinetics/AC/Gs-bind-AC1" -25.6881 -13.9845 0 \
 "/kinetics/AC/AMP" -24.4581 -14.5715 0 \
 "/kinetics/AC/AC2*-Gs" -20.9507 -19.2425 0 \
 "/kinetics/AC/AC2*-Gs/kenz" -20.875 -18.1885 0 \
 "/kinetics/AC/Gs-bind-AC2*" -21.4805 -20.5405 0 \
 "/kinetics/AC/cAMP-PDE" -27.5206 -12.7975 0 \
 "/kinetics/AC/cAMP-PDE/PDE" -25.2173 -16.5475 0 \
 "/kinetics/AC/cAMP-PDE*" -27.4938 -14.8815 0 \
 "/kinetics/AC/cAMP-PDE*/PDE*" -24.8959 -17.1515 0 \
 "/kinetics/AC/dephosph-PDE" -29.3954 -15.9435 0 \
 "/kinetics/Gs-alpha" -27.0722 -17.0725 0 \
 "/kinetics/remove_glu" -2.3364 15.4 0 \
 "/kinetics/stim" -6.682 18.093 0 \
 "/kinetics/synapse" -4.0824 17.502 0 \
 "/kinetics/Ca_tab" -11.994 5.9604 0
simundump xtext /file/notes 0 1
xtextload /file/notes \
"Re-merged with egfr9.g and all115.g" \
""
addmsg /kinetics/EGF_Receptor/activate_EGFR /kinetics/EGF_Receptor/EGFR REAC A B 
addmsg /kinetics/EGF_Receptor/EGF /kinetics/EGF_Receptor/activate_EGFR SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/EGFR /kinetics/EGF_Receptor/activate_EGFR SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/L.EGFR /kinetics/EGF_Receptor/activate_EGFR PRODUCT n 
addmsg /kinetics/EGF_Receptor/activate_EGFR /kinetics/EGF_Receptor/EGF REAC A B 
addmsg /kinetics/EGF_Receptor/activate_EGFR /kinetics/EGF_Receptor/L.EGFR REAC B A 
addmsg /kinetics/EGF_Receptor/dimerize_EGFR /kinetics/EGF_Receptor/L.EGFR REAC A B 
addmsg /kinetics/EGF_Receptor/dimerize_EGFR /kinetics/EGF_Receptor/L.EGFR REAC A B 
addmsg /kinetics/EGF_Receptor/L.EGFR /kinetics/EGF_Receptor/dimerize_EGFR SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/L.EGFR /kinetics/EGF_Receptor/dimerize_EGFR SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/EGFR* /kinetics/EGF_Receptor/dimerize_EGFR PRODUCT n 
addmsg /kinetics/EGF_Receptor/EGFR*/phosph_Shc /kinetics/EGF_Receptor/SHC REAC sA B 
addmsg /kinetics/EGF_Receptor/dephosph_Shc /kinetics/EGF_Receptor/SHC REAC B A 
addmsg /kinetics/EGF_Receptor/EGFR*/phosph_Shc /kinetics/EGF_Receptor/SHC* MM_PRD pA 
addmsg /kinetics/EGF_Receptor/dephosph_Shc /kinetics/EGF_Receptor/SHC* REAC A B 
addmsg /kinetics/EGF_Receptor/Shc_bind_EGFR /kinetics/EGF_Receptor/SHC* REAC A B 
addmsg /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 /kinetics/EGF_Receptor/SHC* REAC A B 
addmsg /kinetics/EGF_Receptor/SHC* /kinetics/EGF_Receptor/dephosph_Shc SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/SHC /kinetics/EGF_Receptor/dephosph_Shc PRODUCT n 
addmsg /kinetics/EGF_Receptor/dimerize_EGFR /kinetics/EGF_Receptor/EGFR* REAC B A 
addmsg /kinetics/EGF_Receptor/EGFR*/phosph_Shc /kinetics/EGF_Receptor/EGFR* REAC eA B 
addmsg /kinetics/EGF_Receptor/Shc_bind_EGFR /kinetics/EGF_Receptor/EGFR* REAC A B 
addmsg /kinetics/EGF_Receptor/EGFR* /kinetics/EGF_Receptor/EGFR*/phosph_Shc ENZYME n 
addmsg /kinetics/EGF_Receptor/SHC /kinetics/EGF_Receptor/EGFR*/phosph_Shc SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/SHC* /kinetics/EGF_Receptor/Shc_bind_EGFR SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/EGFR* /kinetics/EGF_Receptor/Shc_bind_EGFR SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/SHC*.EGFR* /kinetics/EGF_Receptor/Shc_bind_EGFR PRODUCT n 
addmsg /kinetics/EGF_Receptor/Shc_bind_EGFR /kinetics/EGF_Receptor/SHC*.EGFR* REAC B A 
addmsg /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 /kinetics/EGF_Receptor/SHC*.EGFR* REAC A B 
addmsg /kinetics/EGF_Receptor/Sos.Grb2 /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/SHC* /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 SUBSTRATE n 
addmsg /kinetics/Shc*.Sos.Grb2 /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 PRODUCT n 
addmsg /kinetics/EGF_Receptor/Sos.Grb2 /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/SHC*.EGFR* /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 SUBSTRATE n 
addmsg /kinetics/Shc*.EGFR*.Sos.Grb2 /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 PRODUCT n 
addmsg /kinetics/EGF_Receptor/Grb2_bind_Sos* /kinetics/EGF_Receptor/Sos*.Grb2 REAC B A 
addmsg /kinetics/EGF_Receptor/Sos* /kinetics/EGF_Receptor/Grb2_bind_Sos* SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Grb2 /kinetics/EGF_Receptor/Grb2_bind_Sos* SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Sos*.Grb2 /kinetics/EGF_Receptor/Grb2_bind_Sos* PRODUCT n 
addmsg /kinetics/EGF_Receptor/Grb2_bind_Sos /kinetics/EGF_Receptor/Grb2 REAC A B 
addmsg /kinetics/EGF_Receptor/Grb2_bind_Sos* /kinetics/EGF_Receptor/Grb2 REAC A B 
addmsg /kinetics/EGF_Receptor/Grb2_bind_Sos /kinetics/EGF_Receptor/Sos.Grb2 REAC B A 
addmsg /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 /kinetics/EGF_Receptor/Sos.Grb2 REAC A B 
addmsg /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 /kinetics/EGF_Receptor/Sos.Grb2 REAC A B 
addmsg /kinetics/MAPK*/phosph_Sos /kinetics/EGF_Receptor/Sos* MM_PRD pA 
addmsg /kinetics/EGF_Receptor/Grb2_bind_Sos* /kinetics/EGF_Receptor/Sos* REAC A B 
addmsg /kinetics/EGF_Receptor/dephosph_Sos /kinetics/EGF_Receptor/Sos* REAC A B 
addmsg /kinetics/EGF_Receptor/Sos* /kinetics/EGF_Receptor/dephosph_Sos SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Sos /kinetics/EGF_Receptor/dephosph_Sos PRODUCT n 
addmsg /kinetics/EGF_Receptor/Grb2 /kinetics/EGF_Receptor/Grb2_bind_Sos SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Sos.Grb2 /kinetics/EGF_Receptor/Grb2_bind_Sos PRODUCT n 
addmsg /kinetics/EGF_Receptor/Sos /kinetics/EGF_Receptor/Grb2_bind_Sos SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Grb2_bind_Sos /kinetics/EGF_Receptor/Sos REAC A B 
addmsg /kinetics/MAPK*/phosph_Sos /kinetics/EGF_Receptor/Sos REAC sA B 
addmsg /kinetics/EGF_Receptor/dephosph_Sos /kinetics/EGF_Receptor/Sos REAC B A 
addmsg /kinetics/MAPK*/phosph_Sos /kinetics/MAPK* REAC eA B 
addmsg /kinetics/MAPK*/MAPK* /kinetics/MAPK* REAC eA B 
addmsg /kinetics/MAPK*/MAPK*-feedback /kinetics/MAPK* REAC eA B 
addmsg /kinetics/MAPK/MAPKK*/MAPKKthr /kinetics/MAPK* MM_PRD pA 
addmsg /kinetics/MKP-1/MKP1-thr-deph /kinetics/MAPK* REAC sA B 
addmsg /kinetics/MAPK* /kinetics/MAPK*/phosph_Sos ENZYME n 
addmsg /kinetics/EGF_Receptor/Sos /kinetics/MAPK*/phosph_Sos SUBSTRATE n 
addmsg /kinetics/MAPK* /kinetics/MAPK*/MAPK* ENZYME n 
addmsg /kinetics/PLA2/PLA2-cytosolic /kinetics/MAPK*/MAPK* SUBSTRATE n 
addmsg /kinetics/MAPK* /kinetics/MAPK*/MAPK*-feedback ENZYME n 
addmsg /kinetics/MAPK/craf-1* /kinetics/MAPK*/MAPK*-feedback SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Shc_bind_Sos.Grb2 /kinetics/Shc*.Sos.Grb2 REAC B A 
addmsg /kinetics/Shc*.Sos.Grb2/Ras_GEF /kinetics/Shc*.Sos.Grb2 REAC eA B 
addmsg /kinetics/Shc*.Sos.Grb2 /kinetics/Shc*.Sos.Grb2/Ras_GEF ENZYME n 
addmsg /kinetics/Ras/GDP-Ras /kinetics/Shc*.Sos.Grb2/Ras_GEF SUBSTRATE n 
addmsg /kinetics/EGF_Receptor/Shc.EGFR_bind_Sos.Grb2 /kinetics/Shc*.EGFR*.Sos.Grb2 REAC B A 
addmsg /kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF /kinetics/Shc*.EGFR*.Sos.Grb2 REAC eA B 
addmsg /kinetics/Shc*.EGFR*.Sos.Grb2 /kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF ENZYME n 
addmsg /kinetics/Ras/GDP-Ras /kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF SUBSTRATE n 
addmsg /kinetics/PKC/PKC-act-by-Ca /kinetics/PKC/PKC-Ca REAC B A 
addmsg /kinetics/PKC/PKC-act-by-DAG /kinetics/PKC/PKC-Ca REAC A B 
addmsg /kinetics/PKC/PKC-Ca-to-memb /kinetics/PKC/PKC-Ca REAC A B 
addmsg /kinetics/PKC/PKC-act-by-Ca-AA /kinetics/PKC/PKC-Ca REAC A B 
addmsg /kinetics/PKC/PKC-cytosolic /kinetics/PKC/PKC-act-by-Ca SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/PKC/PKC-act-by-Ca SUBSTRATE n 
addmsg /kinetics/PKC/PKC-Ca /kinetics/PKC/PKC-act-by-Ca PRODUCT n 
addmsg /kinetics/DAG /kinetics/PKC/PKC-act-by-DAG SUBSTRATE n 
addmsg /kinetics/PKC/PKC-Ca /kinetics/PKC/PKC-act-by-DAG SUBSTRATE n 
addmsg /kinetics/PKC/PKC-Ca-DAG /kinetics/PKC/PKC-act-by-DAG PRODUCT n 
addmsg /kinetics/PKC/PKC-Ca /kinetics/PKC/PKC-Ca-to-memb SUBSTRATE n 
addmsg /kinetics/PKC/PKC-Ca-memb* /kinetics/PKC/PKC-Ca-to-memb PRODUCT n 
addmsg /kinetics/PKC/PKC-Ca-DAG /kinetics/PKC/PKC-DAG-to-memb SUBSTRATE n 
addmsg /kinetics/PKC/PKC-DAG-memb* /kinetics/PKC/PKC-DAG-to-memb PRODUCT n 
addmsg /kinetics/PKC/PKC-Ca /kinetics/PKC/PKC-act-by-Ca-AA SUBSTRATE n 
addmsg /kinetics/AA /kinetics/PKC/PKC-act-by-Ca-AA SUBSTRATE n 
addmsg /kinetics/PKC/PKC-Ca-AA* /kinetics/PKC/PKC-act-by-Ca-AA PRODUCT n 
addmsg /kinetics/PKC/PKC-DAG-AA* /kinetics/PKC/PKC-act-by-DAG-AA PRODUCT n 
addmsg /kinetics/PKC/PKC-DAG-AA /kinetics/PKC/PKC-act-by-DAG-AA SUBSTRATE n 
addmsg /kinetics/PKC/PKC-act-by-DAG-AA /kinetics/PKC/PKC-DAG-AA* REAC B A 
addmsg /kinetics/PKC/PKC-act-by-Ca-AA /kinetics/PKC/PKC-Ca-AA* REAC B A 
addmsg /kinetics/PKC/PKC-Ca-to-memb /kinetics/PKC/PKC-Ca-memb* REAC B A 
addmsg /kinetics/PKC/PKC-DAG-to-memb /kinetics/PKC/PKC-DAG-memb* REAC B A 
addmsg /kinetics/PKC/PKC-basal-act /kinetics/PKC/PKC-basal* REAC B A 
addmsg /kinetics/PKC/PKC-cytosolic /kinetics/PKC/PKC-basal-act SUBSTRATE n 
addmsg /kinetics/PKC/PKC-basal* /kinetics/PKC/PKC-basal-act PRODUCT n 
addmsg /kinetics/PKC/PKC-act-by-AA /kinetics/PKC/PKC-AA* REAC B A 
addmsg /kinetics/AA /kinetics/PKC/PKC-act-by-AA SUBSTRATE n 
addmsg /kinetics/PKC/PKC-AA* /kinetics/PKC/PKC-act-by-AA PRODUCT n 
addmsg /kinetics/PKC/PKC-cytosolic /kinetics/PKC/PKC-act-by-AA SUBSTRATE n 
addmsg /kinetics/PKC/PKC-act-by-DAG /kinetics/PKC/PKC-Ca-DAG REAC B A 
addmsg /kinetics/PKC/PKC-DAG-to-memb /kinetics/PKC/PKC-Ca-DAG REAC A B 
addmsg /kinetics/PKC/PKC-cytosolic /kinetics/PKC/PKC-n-DAG SUBSTRATE n 
addmsg /kinetics/DAG /kinetics/PKC/PKC-n-DAG SUBSTRATE n 
addmsg /kinetics/PKC/PKC-DAG /kinetics/PKC/PKC-n-DAG PRODUCT n 
addmsg /kinetics/PKC/PKC-n-DAG /kinetics/PKC/PKC-DAG REAC B A 
addmsg /kinetics/PKC/PKC-n-DAG-AA /kinetics/PKC/PKC-DAG REAC A B 
addmsg /kinetics/PKC/PKC-DAG /kinetics/PKC/PKC-n-DAG-AA SUBSTRATE n 
addmsg /kinetics/AA /kinetics/PKC/PKC-n-DAG-AA SUBSTRATE n 
addmsg /kinetics/PKC/PKC-DAG-AA /kinetics/PKC/PKC-n-DAG-AA PRODUCT n 
addmsg /kinetics/PKC/PKC-n-DAG-AA /kinetics/PKC/PKC-DAG-AA REAC B A 
addmsg /kinetics/PKC/PKC-act-by-DAG-AA /kinetics/PKC/PKC-DAG-AA REAC A B 
addmsg /kinetics/PKC/PKC-act-by-Ca /kinetics/PKC/PKC-cytosolic REAC A B 
addmsg /kinetics/PKC/PKC-basal-act /kinetics/PKC/PKC-cytosolic REAC A B 
addmsg /kinetics/PKC/PKC-act-by-AA /kinetics/PKC/PKC-cytosolic REAC A B 
addmsg /kinetics/PKC/PKC-n-DAG /kinetics/PKC/PKC-cytosolic REAC A B 
addmsg /kinetics/PKC/PKC-act-by-DAG /kinetics/DAG REAC A B 
addmsg /kinetics/PKC/PKC-n-DAG /kinetics/DAG REAC A B 
addmsg /kinetics/PLA2/DAG-Ca-PLA2-act /kinetics/DAG REAC A B 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq /kinetics/DAG MM_PRD pA 
addmsg /kinetics/PLCbeta/Degrade-DAG /kinetics/DAG REAC A B 
addmsg /kinetics/PLCbeta/PLC-Ca/PLC-Ca /kinetics/DAG MM_PRD pA 
addmsg /kinetics/PKC/PKC-act-by-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/PLA2/PLA2-Ca-act /kinetics/Ca REAC A B 
addmsg /kinetics/PLA2/PLA2*-Ca-act /kinetics/Ca REAC A B 
addmsg /kinetics/PLCbeta/Act-PLC-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/PLCbeta/PLC-Gq-bind-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/CaM/CaM-TR2-bind-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/CaM/CaM-TR2-bind-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/CaM/CaM-TR2-Ca2-bind-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/Ca /kinetics/Ca CONSERVE n nInit 
addmsg /kinetics/CaM/CaM-Ca3-bind-Ca /kinetics/Ca REAC A B 
addmsg /kinetics/PP2B/Ca-bind-CaNAB-Ca2 /kinetics/Ca REAC A B 
addmsg /kinetics/PP2B/Ca-bind-CaNAB-Ca2 /kinetics/Ca REAC A B 
addmsg /kinetics/PP2B/Ca-bind-CaNAB /kinetics/Ca REAC A B 
addmsg /kinetics/PP2B/Ca-bind-CaNAB /kinetics/Ca REAC A B 
addmsg /kinetics/Ca_tab /kinetics/Ca SLAVE output 
addmsg /kinetics/PKC/PKC-act-by-Ca-AA /kinetics/AA REAC A B 
addmsg /kinetics/PKC/PKC-act-by-AA /kinetics/AA REAC A B 
addmsg /kinetics/PKC/PKC-n-DAG-AA /kinetics/AA REAC A B 
addmsg /kinetics/PLA2/PLA2-Ca*/kenz /kinetics/AA MM_PRD pA 
addmsg /kinetics/PLA2/PIP2-PLA2*/kenz /kinetics/AA MM_PRD pA 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2*/kenz /kinetics/AA MM_PRD pA 
addmsg /kinetics/PLA2/DAG-Ca-PLA2*/kenz /kinetics/AA MM_PRD pA 
addmsg /kinetics/PLA2/PLA2*-Ca/kenz /kinetics/AA MM_PRD pA 
addmsg /kinetics/PLA2/Degrade-AA /kinetics/AA REAC A B 
addmsg /kinetics/PKC/PKC-DAG-AA* /kinetics/PKC-active SUMTOTAL n nInit 
addmsg /kinetics/PKC/PKC-Ca-memb* /kinetics/PKC-active SUMTOTAL n nInit 
addmsg /kinetics/PKC/PKC-Ca-AA* /kinetics/PKC-active SUMTOTAL n nInit 
addmsg /kinetics/PKC/PKC-DAG-memb* /kinetics/PKC-active SUMTOTAL n nInit 
addmsg /kinetics/PKC/PKC-basal* /kinetics/PKC-active SUMTOTAL n nInit 
addmsg /kinetics/PKC/PKC-AA* /kinetics/PKC-active SUMTOTAL n nInit 
addmsg /kinetics/PKC-active/PKC-act-raf /kinetics/PKC-active REAC sA B 
addmsg /kinetics/PKC-active/PKC-act-raf /kinetics/PKC-active CONSERVE nComplex nComplexInit 
addmsg /kinetics/PKC-active/PKC-inact-GAP /kinetics/PKC-active REAC eA B 
addmsg /kinetics/PKC-active/PKC-inact-GAP /kinetics/PKC-active CONSERVE nComplex nComplexInit 
addmsg /kinetics/PKC-active/PKC-act-GEF /kinetics/PKC-active REAC eA B 
addmsg /kinetics/PKC-active/PKC-act-GEF /kinetics/PKC-active CONSERVE nComplex nComplexInit 
addmsg /kinetics/PKC-active/PKC-phosph-neurogranin /kinetics/PKC-active REAC eA B 
addmsg /kinetics/PKC-active/PKC-phosph-ng-CaM /kinetics/PKC-active REAC eA B 
addmsg /kinetics/PKC-active/phosph-AC2 /kinetics/PKC-active REAC eA B 
addmsg /kinetics/PKC-active /kinetics/PKC-active/PKC-act-raf ENZYME n 
addmsg /kinetics/MAPK/craf-1 /kinetics/PKC-active/PKC-act-raf SUBSTRATE n 
addmsg /kinetics/PKC-active /kinetics/PKC-active/PKC-inact-GAP ENZYME n 
addmsg /kinetics/Ras/GAP /kinetics/PKC-active/PKC-inact-GAP SUBSTRATE n 
addmsg /kinetics/PKC-active /kinetics/PKC-active/PKC-act-GEF ENZYME n 
addmsg /kinetics/Ras/inact-GEF /kinetics/PKC-active/PKC-act-GEF SUBSTRATE n 
addmsg /kinetics/PKC-active /kinetics/PKC-active/PKC-phosph-neurogranin ENZYME n 
addmsg /kinetics/CaM/neurogranin /kinetics/PKC-active/PKC-phosph-neurogranin SUBSTRATE n 
addmsg /kinetics/PKC-active /kinetics/PKC-active/PKC-phosph-ng-CaM ENZYME n 
addmsg /kinetics/CaM/neurogranin-CaM /kinetics/PKC-active/PKC-phosph-ng-CaM SUBSTRATE n 
addmsg /kinetics/PKC-active /kinetics/PKC-active/phosph-AC2 ENZYME n 
addmsg /kinetics/AC/AC2 /kinetics/PKC-active/phosph-AC2 SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-Ca-act /kinetics/PLA2/PLA2-cytosolic REAC A B 
addmsg /kinetics/PLA2/PIP2-PLA2-act /kinetics/PLA2/PLA2-cytosolic REAC A B 
addmsg /kinetics/PLA2/PIP2-PLA2* /kinetics/PLA2/PLA2-cytosolic CONSERVE n nInit 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2* /kinetics/PLA2/PLA2-cytosolic CONSERVE n nInit 
addmsg /kinetics/PLA2/DAG-Ca-PLA2* /kinetics/PLA2/PLA2-cytosolic CONSERVE n nInit 
addmsg /kinetics/PLA2/PLA2-Ca* /kinetics/PLA2/PLA2-cytosolic CONSERVE n nInit 
addmsg /kinetics/PLA2/PLA2*-Ca /kinetics/PLA2/PLA2-cytosolic CONSERVE n nInit 
addmsg /kinetics/MAPK*/MAPK* /kinetics/PLA2/PLA2-cytosolic CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLA2/PLA2*-Ca/kenz /kinetics/PLA2/PLA2-cytosolic CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLA2/PLA2-Ca*/kenz /kinetics/PLA2/PLA2-cytosolic CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLA2/DAG-Ca-PLA2*/kenz /kinetics/PLA2/PLA2-cytosolic CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2*/kenz /kinetics/PLA2/PLA2-cytosolic CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLA2/PIP2-PLA2*/kenz /kinetics/PLA2/PLA2-cytosolic CONSERVE nComplex nComplexInit 
addmsg /kinetics/MAPK*/MAPK* /kinetics/PLA2/PLA2-cytosolic REAC sA B 
addmsg /kinetics/PLA2/PLA2* /kinetics/PLA2/PLA2-cytosolic CONSERVE n nInit 
addmsg /kinetics/PLA2/dephosphorylate-PLA2* /kinetics/PLA2/PLA2-cytosolic REAC B A 
addmsg /kinetics/PLA2/PLA2-cytosolic /kinetics/PLA2/PLA2-Ca-act SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/PLA2/PLA2-Ca-act SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-Ca* /kinetics/PLA2/PLA2-Ca-act PRODUCT n 
addmsg /kinetics/PLA2/PLA2-Ca-act /kinetics/PLA2/PLA2-Ca* REAC B A 
addmsg /kinetics/PLA2/PLA2-Ca*/kenz /kinetics/PLA2/PLA2-Ca* REAC eA B 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2-act /kinetics/PLA2/PLA2-Ca* REAC A B 
addmsg /kinetics/PLA2/DAG-Ca-PLA2-act /kinetics/PLA2/PLA2-Ca* REAC A B 
addmsg /kinetics/PLA2/PLA2-Ca* /kinetics/PLA2/PLA2-Ca*/kenz ENZYME n 
addmsg /kinetics/PLA2/APC /kinetics/PLA2/PLA2-Ca*/kenz SUBSTRATE n 
addmsg /kinetics/temp-PIP2 /kinetics/PLA2/PIP2-PLA2-act SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-cytosolic /kinetics/PLA2/PIP2-PLA2-act SUBSTRATE n 
addmsg /kinetics/PLA2/PIP2-PLA2* /kinetics/PLA2/PIP2-PLA2-act PRODUCT n 
addmsg /kinetics/PLA2/PIP2-PLA2-act /kinetics/PLA2/PIP2-PLA2* REAC B A 
addmsg /kinetics/PLA2/PIP2-PLA2*/kenz /kinetics/PLA2/PIP2-PLA2* REAC eA B 
addmsg /kinetics/PLA2/PIP2-PLA2* /kinetics/PLA2/PIP2-PLA2*/kenz ENZYME n 
addmsg /kinetics/PLA2/APC /kinetics/PLA2/PIP2-PLA2*/kenz SUBSTRATE n 
addmsg /kinetics/temp-PIP2 /kinetics/PLA2/PIP2-Ca-PLA2-act SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-Ca* /kinetics/PLA2/PIP2-Ca-PLA2-act SUBSTRATE n 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2* /kinetics/PLA2/PIP2-Ca-PLA2-act PRODUCT n 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2-act /kinetics/PLA2/PIP2-Ca-PLA2* REAC B A 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2*/kenz /kinetics/PLA2/PIP2-Ca-PLA2* REAC eA B 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2* /kinetics/PLA2/PIP2-Ca-PLA2*/kenz ENZYME n 
addmsg /kinetics/PLA2/APC /kinetics/PLA2/PIP2-Ca-PLA2*/kenz SUBSTRATE n 
addmsg /kinetics/DAG /kinetics/PLA2/DAG-Ca-PLA2-act SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-Ca* /kinetics/PLA2/DAG-Ca-PLA2-act SUBSTRATE n 
addmsg /kinetics/PLA2/DAG-Ca-PLA2* /kinetics/PLA2/DAG-Ca-PLA2-act PRODUCT n 
addmsg /kinetics/PLA2/DAG-Ca-PLA2-act /kinetics/PLA2/DAG-Ca-PLA2* REAC B A 
addmsg /kinetics/PLA2/DAG-Ca-PLA2*/kenz /kinetics/PLA2/DAG-Ca-PLA2* REAC eA B 
addmsg /kinetics/PLA2/DAG-Ca-PLA2* /kinetics/PLA2/DAG-Ca-PLA2*/kenz ENZYME n 
addmsg /kinetics/PLA2/APC /kinetics/PLA2/DAG-Ca-PLA2*/kenz SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-Ca*/kenz /kinetics/PLA2/APC REAC sA B 
addmsg /kinetics/PLA2/PIP2-PLA2*/kenz /kinetics/PLA2/APC REAC sA B 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2*/kenz /kinetics/PLA2/APC REAC sA B 
addmsg /kinetics/PLA2/DAG-Ca-PLA2*/kenz /kinetics/PLA2/APC REAC sA B 
addmsg /kinetics/PLA2/PLA2*-Ca/kenz /kinetics/PLA2/APC REAC sA B 
addmsg /kinetics/PLA2/Degrade-AA /kinetics/PLA2/APC REAC B A 
addmsg /kinetics/AA /kinetics/PLA2/Degrade-AA SUBSTRATE n 
addmsg /kinetics/PLA2/APC /kinetics/PLA2/Degrade-AA PRODUCT n 
addmsg /kinetics/PLA2/PLA2*-Ca/kenz /kinetics/PLA2/PLA2*-Ca REAC eA B 
addmsg /kinetics/PLA2/PLA2*-Ca-act /kinetics/PLA2/PLA2*-Ca REAC B A 
addmsg /kinetics/PLA2/PLA2*-Ca /kinetics/PLA2/PLA2*-Ca/kenz ENZYME n 
addmsg /kinetics/PLA2/APC /kinetics/PLA2/PLA2*-Ca/kenz SUBSTRATE n 
addmsg /kinetics/MAPK*/MAPK* /kinetics/PLA2/PLA2* MM_PRD pA 
addmsg /kinetics/PLA2/PLA2*-Ca-act /kinetics/PLA2/PLA2* REAC A B 
addmsg /kinetics/PLA2/dephosphorylate-PLA2* /kinetics/PLA2/PLA2* REAC A B 
addmsg /kinetics/PLA2/PLA2* /kinetics/PLA2/PLA2*-Ca-act SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2*-Ca /kinetics/PLA2/PLA2*-Ca-act PRODUCT n 
addmsg /kinetics/Ca /kinetics/PLA2/PLA2*-Ca-act SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2* /kinetics/PLA2/dephosphorylate-PLA2* SUBSTRATE n 
addmsg /kinetics/PLA2/PLA2-cytosolic /kinetics/PLA2/dephosphorylate-PLA2* PRODUCT n 
addmsg /kinetics/PLA2/PIP2-PLA2-act /kinetics/temp-PIP2 REAC A B 
addmsg /kinetics/PLA2/PIP2-Ca-PLA2-act /kinetics/temp-PIP2 REAC A B 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq /kinetics/IP3 MM_PRD pA 
addmsg /kinetics/PLCbeta/Degrade-IP3 /kinetics/IP3 REAC A B 
addmsg /kinetics/PLCbeta/PLC-Ca/PLC-Ca /kinetics/IP3 MM_PRD pA 
addmsg /kinetics/Gq/RecLigandBinding /kinetics/Glu REAC A B 
addmsg /kinetics/Gq/Glu-bind-Rec-Gq /kinetics/Glu REAC A B 
addmsg /kinetics/remove_glu /kinetics/Glu REAC A B 
addmsg /kinetics/Ca /kinetics/PLCbeta/Act-PLC-Ca SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC /kinetics/PLCbeta/Act-PLC-Ca SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Ca /kinetics/PLCbeta/Act-PLC-Ca PRODUCT n 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq /kinetics/PLCbeta/PLC CONSERVE n nInit 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq /kinetics/PLCbeta/PLC CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLCbeta/Act-PLC-Ca /kinetics/PLCbeta/PLC REAC A B 
addmsg /kinetics/PLCbeta/PLC-Ca /kinetics/PLCbeta/PLC CONSERVE n nInit 
addmsg /kinetics/PLCbeta/PLC-Ca/PLC-Ca /kinetics/PLCbeta/PLC CONSERVE nComplex nComplexInit 
addmsg /kinetics/PLCbeta/PLC-bind-Gq /kinetics/PLCbeta/PLC REAC A B 
addmsg /kinetics/PLCbeta/PLC-Gq /kinetics/PLCbeta/PLC CONSERVE n nInit 
addmsg /kinetics/IP3 /kinetics/PLCbeta/Degrade-IP3 SUBSTRATE n 
addmsg /kinetics/PLCbeta/Inositol /kinetics/PLCbeta/Degrade-IP3 PRODUCT n 
addmsg /kinetics/PLCbeta/Degrade-IP3 /kinetics/PLCbeta/Inositol REAC B A 
addmsg /kinetics/PLCbeta/PC /kinetics/PLCbeta/Degrade-DAG PRODUCT n 
addmsg /kinetics/DAG /kinetics/PLCbeta/Degrade-DAG SUBSTRATE n 
addmsg /kinetics/PLCbeta/Degrade-DAG /kinetics/PLCbeta/PC REAC B A 
addmsg /kinetics/PLCbeta/Act-PLC-Ca /kinetics/PLCbeta/PLC-Ca REAC B A 
addmsg /kinetics/PLCbeta/Act-PLC-by-Gq /kinetics/PLCbeta/PLC-Ca REAC A B 
addmsg /kinetics/PLCbeta/Inact-PLC-Gq /kinetics/PLCbeta/PLC-Ca REAC B A 
addmsg /kinetics/PLCbeta/PLC-Ca/PLC-Ca /kinetics/PLCbeta/PLC-Ca REAC eA B 
addmsg /kinetics/PLCbeta/PLC-Ca /kinetics/PLCbeta/PLC-Ca/PLC-Ca ENZYME n 
addmsg /kinetics/PIP2 /kinetics/PLCbeta/PLC-Ca/PLC-Ca SUBSTRATE n 
addmsg /kinetics/G*GTP /kinetics/PLCbeta/Act-PLC-by-Gq SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Ca /kinetics/PLCbeta/Act-PLC-by-Gq SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq /kinetics/PLCbeta/Act-PLC-by-Gq PRODUCT n 
addmsg /kinetics/G*GDP /kinetics/PLCbeta/Inact-PLC-Gq PRODUCT n 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq /kinetics/PLCbeta/Inact-PLC-Gq SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Ca /kinetics/PLCbeta/Inact-PLC-Gq PRODUCT n 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq /kinetics/PLCbeta/PLC-Ca-Gq REAC eA B 
addmsg /kinetics/PLCbeta/Act-PLC-by-Gq /kinetics/PLCbeta/PLC-Ca-Gq REAC B A 
addmsg /kinetics/PLCbeta/Inact-PLC-Gq /kinetics/PLCbeta/PLC-Ca-Gq REAC A B 
addmsg /kinetics/PLCbeta/PLC-Gq-bind-Ca /kinetics/PLCbeta/PLC-Ca-Gq REAC B A 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq ENZYME n 
addmsg /kinetics/PIP2 /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-bind-Gq /kinetics/PLCbeta/PLC-Gq REAC B A 
addmsg /kinetics/PLCbeta/PLC-Gq-bind-Ca /kinetics/PLCbeta/PLC-Gq REAC A B 
addmsg /kinetics/PLCbeta/PLC /kinetics/PLCbeta/PLC-bind-Gq SUBSTRATE n 
addmsg /kinetics/G*GTP /kinetics/PLCbeta/PLC-bind-Gq SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Gq /kinetics/PLCbeta/PLC-bind-Gq PRODUCT n 
addmsg /kinetics/Ca /kinetics/PLCbeta/PLC-Gq-bind-Ca SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Gq /kinetics/PLCbeta/PLC-Gq-bind-Ca SUBSTRATE n 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq /kinetics/PLCbeta/PLC-Gq-bind-Ca PRODUCT n 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq/PLCb-Ca-Gq /kinetics/PIP2 REAC sA B 
addmsg /kinetics/PLCbeta/PLC-Ca/PLC-Ca /kinetics/PIP2 REAC sA B 
addmsg /kinetics/Gq/Trimerize-G /kinetics/BetaGamma REAC A B 
addmsg /kinetics/Gq/Basal-Act-G /kinetics/BetaGamma REAC B A 
addmsg /kinetics/Gq/Activate-Gq /kinetics/BetaGamma REAC B A 
addmsg /kinetics/Ras/bg-act-GEF /kinetics/BetaGamma REAC A B 
addmsg /kinetics/PLCbeta/Act-PLC-by-Gq /kinetics/G*GTP REAC A B 
addmsg /kinetics/PLCbeta/PLC-bind-Gq /kinetics/G*GTP REAC A B 
addmsg /kinetics/Gq/Inact-G /kinetics/G*GTP REAC A B 
addmsg /kinetics/Gq/Basal-Act-G /kinetics/G*GTP REAC B A 
addmsg /kinetics/Gq/Activate-Gq /kinetics/G*GTP REAC B A 
addmsg /kinetics/PLCbeta/Inact-PLC-Gq /kinetics/G*GDP REAC B A 
addmsg /kinetics/Gq/Inact-G /kinetics/G*GDP REAC B A 
addmsg /kinetics/Gq/Trimerize-G /kinetics/G*GDP REAC A B 
addmsg /kinetics/Gq/mGluR /kinetics/Gq/RecLigandBinding SUBSTRATE n 
addmsg /kinetics/Glu /kinetics/Gq/RecLigandBinding SUBSTRATE n 
addmsg /kinetics/Gq/Rec-Glu /kinetics/Gq/RecLigandBinding PRODUCT n 
addmsg /kinetics/Gq/Trimerize-G /kinetics/Gq/G-GDP REAC B A 
addmsg /kinetics/Gq/Basal-Act-G /kinetics/Gq/G-GDP REAC A B 
addmsg /kinetics/Gq/Rec-Glu-bind-Gq /kinetics/Gq/G-GDP REAC A B 
addmsg /kinetics/Gq/Rec-bind-Gq /kinetics/Gq/G-GDP REAC A B 
addmsg /kinetics/Gq/G-GDP /kinetics/Gq/Basal-Act-G SUBSTRATE n 
addmsg /kinetics/G*GTP /kinetics/Gq/Basal-Act-G PRODUCT n 
addmsg /kinetics/BetaGamma /kinetics/Gq/Basal-Act-G PRODUCT n 
addmsg /kinetics/G*GDP /kinetics/Gq/Trimerize-G SUBSTRATE n 
addmsg /kinetics/BetaGamma /kinetics/Gq/Trimerize-G SUBSTRATE n 
addmsg /kinetics/Gq/G-GDP /kinetics/Gq/Trimerize-G PRODUCT n 
addmsg /kinetics/G*GTP /kinetics/Gq/Inact-G SUBSTRATE n 
addmsg /kinetics/G*GDP /kinetics/Gq/Inact-G PRODUCT n 
addmsg /kinetics/Gq/RecLigandBinding /kinetics/Gq/mGluR REAC A B 
addmsg /kinetics/Gq/Rec-Glu /kinetics/Gq/mGluR CONSERVE n nInit 
addmsg /kinetics/Gq/Rec-Glu-Gq /kinetics/Gq/mGluR CONSERVE n nInit 
addmsg /kinetics/Gq/Rec-Gq /kinetics/Gq/mGluR CONSERVE n nInit 
addmsg /kinetics/Gq/Rec-bind-Gq /kinetics/Gq/mGluR REAC A B 
addmsg /kinetics/Gq/Blocked-rec-Gq /kinetics/Gq/mGluR CONSERVE n nInit 
addmsg /kinetics/Gq/RecLigandBinding /kinetics/Gq/Rec-Glu REAC B A 
addmsg /kinetics/Gq/Rec-Glu-bind-Gq /kinetics/Gq/Rec-Glu REAC A B 
addmsg /kinetics/Gq/Activate-Gq /kinetics/Gq/Rec-Glu REAC B A 
addmsg /kinetics/Gq/Glu-bind-Rec-Gq /kinetics/Gq/Rec-Gq REAC A B 
addmsg /kinetics/Gq/Rec-bind-Gq /kinetics/Gq/Rec-Gq REAC B A 
addmsg /kinetics/Gq/Antag-bind-Rec-Gq /kinetics/Gq/Rec-Gq REAC A B 
addmsg /kinetics/Gq/G-GDP /kinetics/Gq/Rec-Glu-bind-Gq SUBSTRATE n 
addmsg /kinetics/Gq/Rec-Glu /kinetics/Gq/Rec-Glu-bind-Gq SUBSTRATE n 
addmsg /kinetics/Gq/Rec-Glu-Gq /kinetics/Gq/Rec-Glu-bind-Gq PRODUCT n 
addmsg /kinetics/Glu /kinetics/Gq/Glu-bind-Rec-Gq SUBSTRATE n 
addmsg /kinetics/Gq/Rec-Glu-Gq /kinetics/Gq/Glu-bind-Rec-Gq PRODUCT n 
addmsg /kinetics/Gq/Rec-Gq /kinetics/Gq/Glu-bind-Rec-Gq SUBSTRATE n 
addmsg /kinetics/Gq/Rec-Glu-bind-Gq /kinetics/Gq/Rec-Glu-Gq REAC B A 
addmsg /kinetics/Gq/Glu-bind-Rec-Gq /kinetics/Gq/Rec-Glu-Gq REAC B A 
addmsg /kinetics/Gq/Activate-Gq /kinetics/Gq/Rec-Glu-Gq REAC A B 
addmsg /kinetics/Gq/Rec-Glu-Gq /kinetics/Gq/Activate-Gq SUBSTRATE n 
addmsg /kinetics/G*GTP /kinetics/Gq/Activate-Gq PRODUCT n 
addmsg /kinetics/BetaGamma /kinetics/Gq/Activate-Gq PRODUCT n 
addmsg /kinetics/Gq/Rec-Glu /kinetics/Gq/Activate-Gq PRODUCT n 
addmsg /kinetics/Gq/G-GDP /kinetics/Gq/Rec-bind-Gq SUBSTRATE n 
addmsg /kinetics/Gq/mGluR /kinetics/Gq/Rec-bind-Gq SUBSTRATE n 
addmsg /kinetics/Gq/Rec-Gq /kinetics/Gq/Rec-bind-Gq PRODUCT n 
addmsg /kinetics/Gq/Antag-bind-Rec-Gq /kinetics/Gq/mGluRAntag REAC A B 
addmsg /kinetics/Gq/Rec-Gq /kinetics/Gq/Antag-bind-Rec-Gq SUBSTRATE n 
addmsg /kinetics/Gq/mGluRAntag /kinetics/Gq/Antag-bind-Rec-Gq SUBSTRATE n 
addmsg /kinetics/Gq/Blocked-rec-Gq /kinetics/Gq/Antag-bind-Rec-Gq PRODUCT n 
addmsg /kinetics/Gq/Antag-bind-Rec-Gq /kinetics/Gq/Blocked-rec-Gq REAC B A 
addmsg /kinetics/PKC-active/PKC-act-raf /kinetics/MAPK/craf-1 REAC sA B 
addmsg /kinetics/PPhosphatase2A/craf-deph /kinetics/MAPK/craf-1 MM_PRD pA 
addmsg /kinetics/PKC-active/PKC-act-raf /kinetics/MAPK/craf-1* MM_PRD pA 
addmsg /kinetics/MAPK*/MAPK*-feedback /kinetics/MAPK/craf-1* REAC sA B 
addmsg /kinetics/PPhosphatase2A/craf-deph /kinetics/MAPK/craf-1* REAC sA B 
addmsg /kinetics/PPhosphatase2A/craf**-deph /kinetics/MAPK/craf-1* MM_PRD pA 
addmsg /kinetics/Ras-act-craf /kinetics/MAPK/craf-1* REAC A B 
addmsg /kinetics/PPhosphatase2A/MAPKK-deph-ser /kinetics/MAPK/MAPKK MM_PRD pA 
addmsg /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1 /kinetics/MAPK/MAPKK REAC sA B 
addmsg /kinetics/MAPK/MAPKK*/MAPKKtyr /kinetics/MAPK/MAPK REAC sA B 
addmsg /kinetics/MKP-1/MKP1-tyr-deph /kinetics/MAPK/MAPK MM_PRD pA 
addmsg /kinetics/MAPK*/MAPK*-feedback /kinetics/MAPK/craf-1** MM_PRD pA 
addmsg /kinetics/PPhosphatase2A/craf**-deph /kinetics/MAPK/craf-1** REAC sA B 
addmsg /kinetics/MAPK/MAPKK*/MAPKKtyr /kinetics/MAPK/MAPK-tyr MM_PRD pA 
addmsg /kinetics/MAPK/MAPKK*/MAPKKthr /kinetics/MAPK/MAPK-tyr REAC sA B 
addmsg /kinetics/MKP-1/MKP1-tyr-deph /kinetics/MAPK/MAPK-tyr REAC sA B 
addmsg /kinetics/MKP-1/MKP1-thr-deph /kinetics/MAPK/MAPK-tyr MM_PRD pA 
addmsg /kinetics/MAPK/MAPKK*/MAPKKtyr /kinetics/MAPK/MAPKK* REAC eA B 
addmsg /kinetics/MAPK/MAPKK*/MAPKKthr /kinetics/MAPK/MAPKK* REAC eA B 
addmsg /kinetics/PPhosphatase2A/MAPKK-deph /kinetics/MAPK/MAPKK* REAC sA B 
addmsg /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2 /kinetics/MAPK/MAPKK* MM_PRD pA 
addmsg /kinetics/MAPK/MAPKK* /kinetics/MAPK/MAPKK*/MAPKKtyr ENZYME n 
addmsg /kinetics/MAPK/MAPK /kinetics/MAPK/MAPKK*/MAPKKtyr SUBSTRATE n 
addmsg /kinetics/MAPK/MAPKK* /kinetics/MAPK/MAPKK*/MAPKKthr ENZYME n 
addmsg /kinetics/MAPK/MAPK-tyr /kinetics/MAPK/MAPKK*/MAPKKthr SUBSTRATE n 
addmsg /kinetics/PPhosphatase2A/MAPKK-deph /kinetics/MAPK/MAPKK-ser MM_PRD pA 
addmsg /kinetics/PPhosphatase2A/MAPKK-deph-ser /kinetics/MAPK/MAPKK-ser REAC sA B 
addmsg /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1 /kinetics/MAPK/MAPKK-ser MM_PRD pA 
addmsg /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2 /kinetics/MAPK/MAPKK-ser REAC sA B 
addmsg /kinetics/Ras-act-craf /kinetics/MAPK/Raf-GTP-Ras* REAC B A 
addmsg /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1 /kinetics/MAPK/Raf-GTP-Ras* REAC eA B 
addmsg /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2 /kinetics/MAPK/Raf-GTP-Ras* REAC eA B 
addmsg /kinetics/MAPK/Raf-GTP-Ras* /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1 ENZYME n 
addmsg /kinetics/MAPK/MAPKK /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.1 SUBSTRATE n 
addmsg /kinetics/MAPK/Raf-GTP-Ras* /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2 ENZYME n 
addmsg /kinetics/MAPK/MAPKK-ser /kinetics/MAPK/Raf-GTP-Ras*/Raf-GTP-Ras*.2 SUBSTRATE n 
addmsg /kinetics/MKP-1/MKP1-tyr-deph /kinetics/MKP-1 REAC eA B 
addmsg /kinetics/MKP-1/MKP1-thr-deph /kinetics/MKP-1 REAC eA B 
addmsg /kinetics/MKP-1 /kinetics/MKP-1/MKP1-tyr-deph ENZYME n 
addmsg /kinetics/MAPK/MAPK-tyr /kinetics/MKP-1/MKP1-tyr-deph SUBSTRATE n 
addmsg /kinetics/MKP-1 /kinetics/MKP-1/MKP1-thr-deph ENZYME n 
addmsg /kinetics/MAPK* /kinetics/MKP-1/MKP1-thr-deph SUBSTRATE n 
addmsg /kinetics/MAPK/Raf-GTP-Ras* /kinetics/Ras-act-craf PRODUCT n 
addmsg /kinetics/MAPK/craf-1* /kinetics/Ras-act-craf SUBSTRATE n 
addmsg /kinetics/Ras/GTP-Ras /kinetics/Ras-act-craf SUBSTRATE n 
addmsg /kinetics/PPhosphatase2A/craf-deph /kinetics/PPhosphatase2A REAC eA B 
addmsg /kinetics/PPhosphatase2A/MAPKK-deph /kinetics/PPhosphatase2A REAC eA B 
addmsg /kinetics/PPhosphatase2A/MAPKK-deph-ser /kinetics/PPhosphatase2A REAC eA B 
addmsg /kinetics/PPhosphatase2A/craf**-deph /kinetics/PPhosphatase2A REAC eA B 
addmsg /kinetics/PPhosphatase2A /kinetics/PPhosphatase2A/craf-deph ENZYME n 
addmsg /kinetics/MAPK/craf-1* /kinetics/PPhosphatase2A/craf-deph SUBSTRATE n 
addmsg /kinetics/PPhosphatase2A /kinetics/PPhosphatase2A/MAPKK-deph ENZYME n 
addmsg /kinetics/MAPK/MAPKK* /kinetics/PPhosphatase2A/MAPKK-deph SUBSTRATE n 
addmsg /kinetics/PPhosphatase2A /kinetics/PPhosphatase2A/MAPKK-deph-ser ENZYME n 
addmsg /kinetics/MAPK/MAPKK-ser /kinetics/PPhosphatase2A/MAPKK-deph-ser SUBSTRATE n 
addmsg /kinetics/PPhosphatase2A /kinetics/PPhosphatase2A/craf**-deph ENZYME n 
addmsg /kinetics/MAPK/craf-1** /kinetics/PPhosphatase2A/craf**-deph SUBSTRATE n 
addmsg /kinetics/BetaGamma /kinetics/Ras/bg-act-GEF SUBSTRATE n 
addmsg /kinetics/Ras/inact-GEF /kinetics/Ras/bg-act-GEF SUBSTRATE n 
addmsg /kinetics/Ras/GEF-Gprot-bg /kinetics/Ras/bg-act-GEF PRODUCT n 
addmsg /kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras /kinetics/Ras/GEF-Gprot-bg REAC eA B 
addmsg /kinetics/Ras/bg-act-GEF /kinetics/Ras/GEF-Gprot-bg REAC B A 
addmsg /kinetics/Ras/GEF-Gprot-bg /kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras ENZYME n 
addmsg /kinetics/Ras/GDP-Ras /kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras SUBSTRATE n 
addmsg /kinetics/Ras/GEF* /kinetics/Ras/dephosph-GEF SUBSTRATE n 
addmsg /kinetics/Ras/inact-GEF /kinetics/Ras/dephosph-GEF PRODUCT n 
addmsg /kinetics/Ras/bg-act-GEF /kinetics/Ras/inact-GEF REAC A B 
addmsg /kinetics/PKC-active/PKC-act-GEF /kinetics/Ras/inact-GEF REAC sA B 
addmsg /kinetics/Ras/dephosph-GEF /kinetics/Ras/inact-GEF REAC B A 
addmsg /kinetics/PKA-active/PKA-phosph-GEF /kinetics/Ras/inact-GEF REAC sA B 
addmsg /kinetics/Ras/CaM-bind-GEF /kinetics/Ras/inact-GEF REAC A B 
addmsg /kinetics/Ras/dephosph-inact-GEF* /kinetics/Ras/inact-GEF REAC B A 
addmsg /kinetics/PKC-active/PKC-act-GEF /kinetics/Ras/GEF* MM_PRD pA 
addmsg /kinetics/Ras/dephosph-GEF /kinetics/Ras/GEF* REAC A B 
addmsg /kinetics/Ras/GEF*/GEF*-act-ras /kinetics/Ras/GEF* REAC eA B 
addmsg /kinetics/Ras/GEF* /kinetics/Ras/GEF*/GEF*-act-ras ENZYME n 
addmsg /kinetics/Ras/GDP-Ras /kinetics/Ras/GEF*/GEF*-act-ras SUBSTRATE n 
addmsg /kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras /kinetics/Ras/GTP-Ras MM_PRD pA 
addmsg /kinetics/Ras/GAP/GAP-inact-ras /kinetics/Ras/GTP-Ras REAC sA B 
addmsg /kinetics/Ras/Ras-intrinsic-GTPase /kinetics/Ras/GTP-Ras REAC A B 
addmsg /kinetics/Ras/GEF*/GEF*-act-ras /kinetics/Ras/GTP-Ras MM_PRD pA 
addmsg /kinetics/Ras/CaM-GEF/CaM-GEF-act-ras /kinetics/Ras/GTP-Ras MM_PRD pA 
addmsg /kinetics/Ras-act-craf /kinetics/Ras/GTP-Ras REAC A B 
addmsg /kinetics/Shc*.Sos.Grb2/Ras_GEF /kinetics/Ras/GTP-Ras MM_PRD pA 
addmsg /kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF /kinetics/Ras/GTP-Ras MM_PRD pA 
addmsg /kinetics/Ras/GEF-Gprot-bg/GEF-bg_act-ras /kinetics/Ras/GDP-Ras REAC sA B 
addmsg /kinetics/Ras/GAP/GAP-inact-ras /kinetics/Ras/GDP-Ras MM_PRD pA 
addmsg /kinetics/Ras/Ras-intrinsic-GTPase /kinetics/Ras/GDP-Ras REAC B A 
addmsg /kinetics/Ras/GEF*/GEF*-act-ras /kinetics/Ras/GDP-Ras REAC sA B 
addmsg /kinetics/Ras/CaM-GEF/CaM-GEF-act-ras /kinetics/Ras/GDP-Ras REAC sA B 
addmsg /kinetics/Shc*.Sos.Grb2/Ras_GEF /kinetics/Ras/GDP-Ras REAC sA B 
addmsg /kinetics/Shc*.EGFR*.Sos.Grb2/Ras_GEF /kinetics/Ras/GDP-Ras REAC sA B 
addmsg /kinetics/Ras/GTP-Ras /kinetics/Ras/Ras-intrinsic-GTPase SUBSTRATE n 
addmsg /kinetics/Ras/GDP-Ras /kinetics/Ras/Ras-intrinsic-GTPase PRODUCT n 
addmsg /kinetics/Ras/GAP* /kinetics/Ras/dephosph-GAP SUBSTRATE n 
addmsg /kinetics/Ras/GAP /kinetics/Ras/dephosph-GAP PRODUCT n 
addmsg /kinetics/PKC-active/PKC-inact-GAP /kinetics/Ras/GAP* MM_PRD pA 
addmsg /kinetics/Ras/dephosph-GAP /kinetics/Ras/GAP* REAC A B 
addmsg /kinetics/Ras/GAP/GAP-inact-ras /kinetics/Ras/GAP REAC eA B 
addmsg /kinetics/PKC-active/PKC-inact-GAP /kinetics/Ras/GAP REAC sA B 
addmsg /kinetics/Ras/dephosph-GAP /kinetics/Ras/GAP REAC B A 
addmsg /kinetics/Ras/GAP /kinetics/Ras/GAP/GAP-inact-ras ENZYME n 
addmsg /kinetics/Ras/GTP-Ras /kinetics/Ras/GAP/GAP-inact-ras SUBSTRATE n 
addmsg /kinetics/PKA-active/PKA-phosph-GEF /kinetics/Ras/inact-GEF* MM_PRD pA 
addmsg /kinetics/Ras/dephosph-inact-GEF* /kinetics/Ras/inact-GEF* REAC A B 
addmsg /kinetics/Ras/inact-GEF /kinetics/Ras/CaM-bind-GEF SUBSTRATE n 
addmsg /kinetics/Ras/CaM-GEF /kinetics/Ras/CaM-bind-GEF PRODUCT n 
addmsg /kinetics/CaM-Ca4 /kinetics/Ras/CaM-bind-GEF SUBSTRATE n 
addmsg /kinetics/Ras/CaM-bind-GEF /kinetics/Ras/CaM-GEF REAC B A 
addmsg /kinetics/Ras/CaM-GEF/CaM-GEF-act-ras /kinetics/Ras/CaM-GEF REAC eA B 
addmsg /kinetics/Ras/CaM-GEF /kinetics/Ras/CaM-GEF/CaM-GEF-act-ras ENZYME n 
addmsg /kinetics/Ras/GDP-Ras /kinetics/Ras/CaM-GEF/CaM-GEF-act-ras SUBSTRATE n 
addmsg /kinetics/Ras/inact-GEF* /kinetics/Ras/dephosph-inact-GEF* SUBSTRATE n 
addmsg /kinetics/Ras/inact-GEF /kinetics/Ras/dephosph-inact-GEF* PRODUCT n 
addmsg /kinetics/PKA-active/PKA-phosph-GEF /kinetics/PKA-active REAC eA B 
addmsg /kinetics/PKA-active/PKA-phosph-I1 /kinetics/PKA-active REAC eA B 
addmsg /kinetics/PKA/Release-C1 /kinetics/PKA-active REAC B A 
addmsg /kinetics/PKA/Release-C2 /kinetics/PKA-active REAC B A 
addmsg /kinetics/PKA/inhib-PKA /kinetics/PKA-active REAC A B 
addmsg /kinetics/PKA-active/PKA-phosph-GAP /kinetics/PKA-active REAC eA B 
addmsg /kinetics/PKA-active/phosph-PDE /kinetics/PKA-active REAC eA B 
addmsg /kinetics/PKA-active /kinetics/PKA-active/PKA-phosph-GEF ENZYME n 
addmsg /kinetics/Ras/inact-GEF /kinetics/PKA-active/PKA-phosph-GEF SUBSTRATE n 
addmsg /kinetics/PKA-active /kinetics/PKA-active/PKA-phosph-I1 ENZYME n 
addmsg /kinetics/PP1/I1 /kinetics/PKA-active/PKA-phosph-I1 SUBSTRATE n 
addmsg /kinetics/PKA-active /kinetics/PKA-active/PKA-phosph-GAP ENZYME n 
addmsg /kinetics/PKA-active /kinetics/PKA-active/phosph-PDE ENZYME n 
addmsg /kinetics/AC/cAMP-PDE /kinetics/PKA-active/phosph-PDE SUBSTRATE n 
addmsg /kinetics/Ras/CaM-bind-GEF /kinetics/CaM-Ca4 REAC A B 
addmsg /kinetics/CaMKII/CaMKII-bind-CaM /kinetics/CaM-Ca4 REAC A B 
addmsg /kinetics/CaMKII/CaMK-thr286-bind-CaM /kinetics/CaM-Ca4 REAC A B 
addmsg /kinetics/CaM/CaM-Ca3-bind-Ca /kinetics/CaM-Ca4 REAC B A 
addmsg /kinetics/PP2B/CaMCa4-bind-CaNAB /kinetics/CaM-Ca4 REAC A B 
addmsg /kinetics/AC/CaM-bind-AC1 /kinetics/CaM-Ca4 REAC A B 
addmsg /kinetics/CaMKII/CaMKII-bind-CaM /kinetics/CaMKII/CaMKII REAC A B 
addmsg /kinetics/CaMKII/CaMKII/autoph-thr306-basal /kinetics/CaMKII/CaMKII REAC eA B 
addmsg /kinetics/CaMKII/CaMKII/autoph-thr306-basal /kinetics/CaMKII/CaMKII REAC sA B 
addmsg /kinetics/PP1-active/Deph-thr306 /kinetics/CaMKII/CaMKII MM_PRD pA 
addmsg /kinetics/PP1-active/Deph_thr286b /kinetics/CaMKII/CaMKII MM_PRD pA 
addmsg /kinetics/PP1-active/Deph-thr305b /kinetics/CaMKII/CaMKII MM_PRD pA 
addmsg /kinetics/CaMKII/basal-activity /kinetics/CaMKII/CaMKII REAC A B 
addmsg /kinetics/CaMKII/CaMKII /kinetics/CaMKII/CaMKII/autoph-thr306-basal ENZYME n 
addmsg /kinetics/CaMKII/CaMKII /kinetics/CaMKII/CaMKII/autoph-thr306-basal SUBSTRATE n 
addmsg /kinetics/CaMKII/total-CaMKII /kinetics/CaMKII/CaMKII/autoph-thr306-basal INTRAMOL n 
addmsg /kinetics/CaMKII/CaMKII-bind-CaM /kinetics/CaMKII/CaMKII-CaM REAC B A 
addmsg /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 /kinetics/CaMKII/CaMKII-CaM REAC eA B 
addmsg /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 /kinetics/CaMKII/CaMKII-CaM REAC sA B 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 /kinetics/CaMKII/CaMKII-CaM REAC sA B 
addmsg /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 /kinetics/CaMKII/CaMKII-CaM REAC eA B 
addmsg /kinetics/PP1-active/Deph-thr286 /kinetics/CaMKII/CaMKII-CaM MM_PRD pA 
addmsg /kinetics/CaMKII/CaMKII-CaM /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-CaM /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 SUBSTRATE n 
addmsg /kinetics/CaMKII/total-CaMKII /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 INTRAMOL n 
addmsg /kinetics/CaMKII/CaMKII-CaM /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 SUBSTRATE n 
addmsg /kinetics/CaMKII/total-CaMKII /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 INTRAMOL n 
addmsg /kinetics/CaMKII/CaMKII-CaM/autoph-thr286 /kinetics/CaMKII/CaMKII-thr286*-CaM MM_PRD pA 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 /kinetics/CaMKII/CaMKII-thr286*-CaM REAC eA B 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 /kinetics/CaMKII/CaMKII-thr286*-CaM MM_PRD pA 
addmsg /kinetics/CaMKII/CaMK-thr286-bind-CaM /kinetics/CaMKII/CaMKII-thr286*-CaM REAC B A 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 /kinetics/CaMKII/CaMKII-thr286*-CaM REAC eA B 
addmsg /kinetics/PP1-active/Deph-thr286 /kinetics/CaMKII/CaMKII-thr286*-CaM REAC sA B 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-CaM /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 SUBSTRATE n 
addmsg /kinetics/CaMKII/total-CaMKII /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr286 INTRAMOL n 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 SUBSTRATE n 
addmsg /kinetics/CaMKII/total-CaMKII /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 INTRAMOL n 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 /kinetics/CaMKII/CaMKII*** MM_PRD pA 
addmsg /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 /kinetics/CaMKII/CaMKII*** MM_PRD pA 
addmsg /kinetics/CaMKII/CaMKII***/autoph-thr-305 /kinetics/CaMKII/CaMKII*** REAC eA B 
addmsg /kinetics/CaMKII/CaMKII***/autoph-thr-305 /kinetics/CaMKII/CaMKII*** MM_PRD pA 
addmsg /kinetics/PP1-active/Deph-thr305 /kinetics/CaMKII/CaMKII*** REAC sA B 
addmsg /kinetics/PP1-active/Deph-thr286c /kinetics/CaMKII/CaMKII*** REAC sA B 
addmsg /kinetics/CaMKII/CaMKII-thr286/autoph-thr305 /kinetics/CaMKII/CaMKII*** MM_PRD pA 
addmsg /kinetics/CaMKII/CaMKII*** /kinetics/CaMKII/CaMKII***/autoph-thr-305 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/CaMKII***/autoph-thr-305 SUBSTRATE n 
addmsg /kinetics/CaMKII/total-CaMKII /kinetics/CaMKII/CaMKII***/autoph-thr-305 INTRAMOL n 
addmsg /kinetics/CaM-Ca4 /kinetics/CaMKII/CaMKII-bind-CaM SUBSTRATE n 
addmsg /kinetics/CaMKII/CaMKII /kinetics/CaMKII/CaMKII-bind-CaM SUBSTRATE n 
addmsg /kinetics/CaMKII/CaMKII-CaM /kinetics/CaMKII/CaMKII-bind-CaM PRODUCT n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/CaMK-thr286-bind-CaM SUBSTRATE n 
addmsg /kinetics/CaM-Ca4 /kinetics/CaMKII/CaMK-thr286-bind-CaM SUBSTRATE n 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM /kinetics/CaMKII/CaMK-thr286-bind-CaM PRODUCT n 
addmsg /kinetics/CaMKII/CaMK-thr286-bind-CaM /kinetics/CaMKII/CaMKII-thr286 REAC A B 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM/autoph-thr305 /kinetics/CaMKII/CaMKII-thr286 REAC sA B 
addmsg /kinetics/CaMKII/CaMKII-CaM/autoph-thr305 /kinetics/CaMKII/CaMKII-thr286 REAC sA B 
addmsg /kinetics/CaMKII/CaMKII***/autoph-thr-305 /kinetics/CaMKII/CaMKII-thr286 REAC sA B 
addmsg /kinetics/PP1-active/Deph-thr305 /kinetics/CaMKII/CaMKII-thr286 MM_PRD pA 
addmsg /kinetics/PP1-active/Deph_thr286b /kinetics/CaMKII/CaMKII-thr286 REAC sA B 
addmsg /kinetics/CaMKII/basal-activity /kinetics/CaMKII/CaMKII-thr286 REAC B A 
addmsg /kinetics/CaMKII/CaMKII-thr286/autoph-thr305 /kinetics/CaMKII/CaMKII-thr286 REAC eA B 
addmsg /kinetics/CaMKII/CaMKII-thr286/autoph-thr305 /kinetics/CaMKII/CaMKII-thr286 REAC sA B 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/CaMKII-thr286/autoph-thr305 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/CaMKII-thr286/autoph-thr305 SUBSTRATE n 
addmsg /kinetics/CaMKII/CaMKII/autoph-thr306-basal /kinetics/CaMKII/CaMK-thr306 MM_PRD pA 
addmsg /kinetics/PP1-active/Deph-thr306 /kinetics/CaMKII/CaMK-thr306 REAC sA B 
addmsg /kinetics/PP1-active/Deph-thr286c /kinetics/CaMKII/CaMKII** MM_PRD pA 
addmsg /kinetics/PP1-active/Deph-thr305b /kinetics/CaMKII/CaMKII** REAC sA B 
addmsg /kinetics/CaMKII/CaMKII /kinetics/CaMKII/basal-activity SUBSTRATE n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/CaMKII/basal-activity PRODUCT n 
addmsg /kinetics/PP1-active/Deph-thr286 /kinetics/PP1-active REAC eA B 
addmsg /kinetics/PP1-active/Deph-thr305 /kinetics/PP1-active REAC eA B 
addmsg /kinetics/PP1-active/Deph-thr306 /kinetics/PP1-active REAC eA B 
addmsg /kinetics/PP1-active/Deph_thr286b /kinetics/PP1-active REAC eA B 
addmsg /kinetics/PP1-active/Deph-thr286c /kinetics/PP1-active REAC eA B 
addmsg /kinetics/PP1-active/Deph-thr305b /kinetics/PP1-active REAC eA B 
addmsg /kinetics/PP1/Inact-PP1 /kinetics/PP1-active REAC A B 
addmsg /kinetics/PP1/dissoc-PP1-I1 /kinetics/PP1-active REAC B A 
addmsg /kinetics/PP1-active /kinetics/PP1-active/Deph-thr286 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-thr286*-CaM /kinetics/PP1-active/Deph-thr286 SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1-active/Deph-thr305 ENZYME n 
addmsg /kinetics/CaMKII/CaMKII*** /kinetics/PP1-active/Deph-thr305 SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1-active/Deph-thr306 ENZYME n 
addmsg /kinetics/CaMKII/CaMK-thr306 /kinetics/PP1-active/Deph-thr306 SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1-active/Deph-thr286c ENZYME n 
addmsg /kinetics/CaMKII/CaMKII*** /kinetics/PP1-active/Deph-thr286c SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1-active/Deph_thr286b ENZYME n 
addmsg /kinetics/CaMKII/CaMKII-thr286 /kinetics/PP1-active/Deph_thr286b SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1-active/Deph-thr305b ENZYME n 
addmsg /kinetics/CaMKII/CaMKII** /kinetics/PP1-active/Deph-thr305b SUBSTRATE n 
addmsg /kinetics/CaM/CaM-TR2-bind-Ca /kinetics/CaM/CaM REAC A B 
addmsg /kinetics/CaM/neurogranin-bind-CaM /kinetics/CaM/CaM REAC A B 
addmsg /kinetics/PKC-active/PKC-phosph-ng-CaM /kinetics/CaM/CaM MM_PRD pA 
addmsg /kinetics/CaM/CaM /kinetics/CaM/CaM-TR2-bind-Ca SUBSTRATE n 
addmsg /kinetics/CaM-TR2-Ca2 /kinetics/CaM/CaM-TR2-bind-Ca PRODUCT n 
addmsg /kinetics/Ca /kinetics/CaM/CaM-TR2-bind-Ca SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/CaM/CaM-TR2-bind-Ca SUBSTRATE n 
addmsg /kinetics/CaM-TR2-Ca2 /kinetics/CaM/CaM-TR2-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/CaM/CaM-TR2-Ca2-bind-Ca SUBSTRATE n 
addmsg /kinetics/CaM-Ca3 /kinetics/CaM/CaM-TR2-Ca2-bind-Ca PRODUCT n 
addmsg /kinetics/CaM-Ca3 /kinetics/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/CaM/CaM-Ca3-bind-Ca SUBSTRATE n 
addmsg /kinetics/CaM-Ca4 /kinetics/CaM/CaM-Ca3-bind-Ca PRODUCT n 
addmsg /kinetics/CaM/neurogranin-bind-CaM /kinetics/CaM/neurogranin-CaM REAC B A 
addmsg /kinetics/PKC-active/PKC-phosph-ng-CaM /kinetics/CaM/neurogranin-CaM REAC sA B 
addmsg /kinetics/CaM/neurogranin /kinetics/CaM/neurogranin-bind-CaM SUBSTRATE n 
addmsg /kinetics/CaM/neurogranin-CaM /kinetics/CaM/neurogranin-bind-CaM PRODUCT n 
addmsg /kinetics/CaM/CaM /kinetics/CaM/neurogranin-bind-CaM SUBSTRATE n 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin /kinetics/CaM/neurogranin* REAC sA B 
addmsg /kinetics/PKC-active/PKC-phosph-neurogranin /kinetics/CaM/neurogranin* MM_PRD pA 
addmsg /kinetics/PKC-active/PKC-phosph-ng-CaM /kinetics/CaM/neurogranin* MM_PRD pA 
addmsg /kinetics/CaM/dephosph-neurogranin /kinetics/CaM/neurogranin* REAC A B 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin /kinetics/CaM/neurogranin MM_PRD pA 
addmsg /kinetics/CaM/neurogranin-bind-CaM /kinetics/CaM/neurogranin REAC A B 
addmsg /kinetics/PKC-active/PKC-phosph-neurogranin /kinetics/CaM/neurogranin REAC sA B 
addmsg /kinetics/CaM/dephosph-neurogranin /kinetics/CaM/neurogranin REAC B A 
addmsg /kinetics/CaM/neurogranin* /kinetics/CaM/dephosph-neurogranin SUBSTRATE n 
addmsg /kinetics/CaM/neurogranin /kinetics/CaM/dephosph-neurogranin PRODUCT n 
addmsg /kinetics/CaM/CaM-TR2-Ca2-bind-Ca /kinetics/CaM-Ca3 REAC B A 
addmsg /kinetics/CaM/CaM-Ca3-bind-Ca /kinetics/CaM-Ca3 REAC A B 
addmsg /kinetics/PP2B/CaMCa3-bind-CaNAB /kinetics/CaM-Ca3 REAC A B 
addmsg /kinetics/CaM/CaM-TR2-bind-Ca /kinetics/CaM-TR2-Ca2 REAC B A 
addmsg /kinetics/CaM/CaM-TR2-Ca2-bind-Ca /kinetics/CaM-TR2-Ca2 REAC A B 
addmsg /kinetics/PP2B/CaM-Ca2-bind-CaNAB /kinetics/CaM-TR2-Ca2 REAC A B 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin /kinetics/CaM(Ca)n-CaNAB REAC eA B 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1 /kinetics/CaM(Ca)n-CaNAB REAC eA B 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I* /kinetics/CaM(Ca)n-CaNAB REAC eA B 
addmsg /kinetics/PP2B/CaMCa4-CaNAB /kinetics/CaM(Ca)n-CaNAB SUMTOTAL n nInit 
addmsg /kinetics/PP2B/CaMCa3-CaNAB /kinetics/CaM(Ca)n-CaNAB SUMTOTAL n nInit 
addmsg /kinetics/PP2B/CaMCa2-CANAB /kinetics/CaM(Ca)n-CaNAB SUMTOTAL n nInit 
addmsg /kinetics/CaM(Ca)n-CaNAB /kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin ENZYME n 
addmsg /kinetics/CaM/neurogranin* /kinetics/CaM(Ca)n-CaNAB/dephosph_neurogranin SUBSTRATE n 
addmsg /kinetics/CaM(Ca)n-CaNAB /kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1 ENZYME n 
addmsg /kinetics/PP1/I1* /kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1 SUBSTRATE n 
addmsg /kinetics/CaM(Ca)n-CaNAB /kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I* ENZYME n 
addmsg /kinetics/PP1/PP1-I1* /kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I* SUBSTRATE n 
addmsg /kinetics/PKA-active/PKA-phosph-I1 /kinetics/PP1/I1 REAC sA B 
addmsg /kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM /kinetics/PP1/I1 MM_PRD pA 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1 /kinetics/PP1/I1 MM_PRD pA 
addmsg /kinetics/PP2A/PP2A-dephosph-I1 /kinetics/PP1/I1 MM_PRD pA 
addmsg /kinetics/PP1/dissoc-PP1-I1 /kinetics/PP1/I1 REAC B A 
addmsg /kinetics/PP1/Inact-PP1 /kinetics/PP1/I1* REAC A B 
addmsg /kinetics/PKA-active/PKA-phosph-I1 /kinetics/PP1/I1* MM_PRD pA 
addmsg /kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM /kinetics/PP1/I1* REAC sA B 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph_inhib1 /kinetics/PP1/I1* REAC sA B 
addmsg /kinetics/PP2A/PP2A-dephosph-I1 /kinetics/PP1/I1* REAC sA B 
addmsg /kinetics/PP1/PP1-I1* /kinetics/PP1/Inact-PP1 PRODUCT n 
addmsg /kinetics/PP1/I1* /kinetics/PP1/Inact-PP1 SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1/Inact-PP1 SUBSTRATE n 
addmsg /kinetics/PP1/Inact-PP1 /kinetics/PP1/PP1-I1* REAC B A 
addmsg /kinetics/PP2A/PP2A-dephosph-PP1-I* /kinetics/PP1/PP1-I1* REAC sA B 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I* /kinetics/PP1/PP1-I1* REAC sA B 
addmsg /kinetics/PP1/dissoc-PP1-I1 /kinetics/PP1/PP1-I1 REAC A B 
addmsg /kinetics/PP2A/PP2A-dephosph-PP1-I* /kinetics/PP1/PP1-I1 MM_PRD pA 
addmsg /kinetics/CaM(Ca)n-CaNAB/dephosph-PP1-I* /kinetics/PP1/PP1-I1 MM_PRD pA 
addmsg /kinetics/PP1/PP1-I1 /kinetics/PP1/dissoc-PP1-I1 SUBSTRATE n 
addmsg /kinetics/PP1-active /kinetics/PP1/dissoc-PP1-I1 PRODUCT n 
addmsg /kinetics/PP1/I1 /kinetics/PP1/dissoc-PP1-I1 PRODUCT n 
addmsg /kinetics/PP2A/PP2A-dephosph-I1 /kinetics/PP2A REAC eA B 
addmsg /kinetics/PP2A/PP2A-dephosph-PP1-I* /kinetics/PP2A REAC eA B 
addmsg /kinetics/PP2A /kinetics/PP2A/PP2A-dephosph-I1 ENZYME n 
addmsg /kinetics/PP1/I1* /kinetics/PP2A/PP2A-dephosph-I1 SUBSTRATE n 
addmsg /kinetics/PP2A /kinetics/PP2A/PP2A-dephosph-PP1-I* ENZYME n 
addmsg /kinetics/PP1/PP1-I1* /kinetics/PP2A/PP2A-dephosph-PP1-I* SUBSTRATE n 
addmsg /kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM /kinetics/CaNAB-Ca4 REAC eA B 
addmsg /kinetics/PP2B/Ca-bind-CaNAB-Ca2 /kinetics/CaNAB-Ca4 REAC B A 
addmsg /kinetics/PP2B/CaM-Ca2-bind-CaNAB /kinetics/CaNAB-Ca4 REAC A B 
addmsg /kinetics/PP2B/CaMCa4-bind-CaNAB /kinetics/CaNAB-Ca4 REAC A B 
addmsg /kinetics/PP2B/CaMCa3-bind-CaNAB /kinetics/CaNAB-Ca4 REAC A B 
addmsg /kinetics/CaNAB-Ca4 /kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM ENZYME n 
addmsg /kinetics/PP1/I1* /kinetics/CaNAB-Ca4/dephosph_inhib1_noCaM SUBSTRATE n 
addmsg /kinetics/PP2B/Ca-bind-CaNAB /kinetics/PP2B/CaNAB REAC A B 
addmsg /kinetics/PP2B/Ca-bind-CaNAB /kinetics/PP2B/CaNAB-Ca2 REAC B A 
addmsg /kinetics/PP2B/Ca-bind-CaNAB-Ca2 /kinetics/PP2B/CaNAB-Ca2 REAC A B 
addmsg /kinetics/CaNAB-Ca4 /kinetics/PP2B/Ca-bind-CaNAB-Ca2 PRODUCT n 
addmsg /kinetics/Ca /kinetics/PP2B/Ca-bind-CaNAB-Ca2 SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/PP2B/Ca-bind-CaNAB-Ca2 SUBSTRATE n 
addmsg /kinetics/PP2B/CaNAB-Ca2 /kinetics/PP2B/Ca-bind-CaNAB-Ca2 SUBSTRATE n 
addmsg /kinetics/PP2B/CaNAB /kinetics/PP2B/Ca-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/PP2B/CaNAB-Ca2 /kinetics/PP2B/Ca-bind-CaNAB PRODUCT n 
addmsg /kinetics/Ca /kinetics/PP2B/Ca-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/Ca /kinetics/PP2B/Ca-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/CaNAB-Ca4 /kinetics/PP2B/CaM-Ca2-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/CaM-TR2-Ca2 /kinetics/PP2B/CaM-Ca2-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/PP2B/CaMCa2-CANAB /kinetics/PP2B/CaM-Ca2-bind-CaNAB PRODUCT n 
addmsg /kinetics/PP2B/CaMCa3-bind-CaNAB /kinetics/PP2B/CaMCa3-CaNAB REAC B A 
addmsg /kinetics/PP2B/CaM-Ca2-bind-CaNAB /kinetics/PP2B/CaMCa2-CANAB REAC B A 
addmsg /kinetics/PP2B/CaMCa4-bind-CaNAB /kinetics/PP2B/CaMCa4-CaNAB REAC B A 
addmsg /kinetics/PP2B/CaMCa3-CaNAB /kinetics/PP2B/CaMCa3-bind-CaNAB PRODUCT n 
addmsg /kinetics/CaM-Ca3 /kinetics/PP2B/CaMCa3-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/CaNAB-Ca4 /kinetics/PP2B/CaMCa3-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/PP2B/CaMCa4-CaNAB /kinetics/PP2B/CaMCa4-bind-CaNAB PRODUCT n 
addmsg /kinetics/CaM-Ca4 /kinetics/PP2B/CaMCa4-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/CaNAB-Ca4 /kinetics/PP2B/CaMCa4-bind-CaNAB SUBSTRATE n 
addmsg /kinetics/PKA/cAMP-bind-site-B1 /kinetics/PKA/R2C2 REAC A B 
addmsg /kinetics/PKA/cAMP-bind-site-B1 /kinetics/PKA/R2C2-cAMP REAC B A 
addmsg /kinetics/PKA/cAMP-bind-site-B2 /kinetics/PKA/R2C2-cAMP REAC A B 
addmsg /kinetics/PKA/R2C2 /kinetics/PKA/cAMP-bind-site-B1 SUBSTRATE n 
addmsg /kinetics/PKA/R2C2-cAMP /kinetics/PKA/cAMP-bind-site-B1 PRODUCT n 
addmsg /kinetics/cAMP /kinetics/PKA/cAMP-bind-site-B1 SUBSTRATE n 
addmsg /kinetics/PKA/R2C2-cAMP /kinetics/PKA/cAMP-bind-site-B2 SUBSTRATE n 
addmsg /kinetics/cAMP /kinetics/PKA/cAMP-bind-site-B2 SUBSTRATE n 
addmsg /kinetics/PKA/R2C2-cAMP2 /kinetics/PKA/cAMP-bind-site-B2 PRODUCT n 
addmsg /kinetics/PKA/R2C2-cAMP2 /kinetics/PKA/cAMP-bind-site-A1 SUBSTRATE n 
addmsg /kinetics/cAMP /kinetics/PKA/cAMP-bind-site-A1 SUBSTRATE n 
addmsg /kinetics/PKA/R2C2-cAMP3 /kinetics/PKA/cAMP-bind-site-A1 PRODUCT n 
addmsg /kinetics/cAMP /kinetics/PKA/cAMP-bind-site-A2 SUBSTRATE n 
addmsg /kinetics/PKA/R2C2-cAMP3 /kinetics/PKA/cAMP-bind-site-A2 SUBSTRATE n 
addmsg /kinetics/PKA/R2C2-cAMP4 /kinetics/PKA/cAMP-bind-site-A2 PRODUCT n 
addmsg /kinetics/PKA/cAMP-bind-site-B2 /kinetics/PKA/R2C2-cAMP2 REAC B A 
addmsg /kinetics/PKA/cAMP-bind-site-A1 /kinetics/PKA/R2C2-cAMP2 REAC A B 
addmsg /kinetics/PKA/cAMP-bind-site-A1 /kinetics/PKA/R2C2-cAMP3 REAC B A 
addmsg /kinetics/PKA/cAMP-bind-site-A2 /kinetics/PKA/R2C2-cAMP3 REAC A B 
addmsg /kinetics/PKA/cAMP-bind-site-A2 /kinetics/PKA/R2C2-cAMP4 REAC B A 
addmsg /kinetics/PKA/Release-C1 /kinetics/PKA/R2C2-cAMP4 REAC A B 
addmsg /kinetics/PKA/Release-C1 /kinetics/PKA/R2C-cAMP4 REAC B A 
addmsg /kinetics/PKA/Release-C2 /kinetics/PKA/R2C-cAMP4 REAC A B 
addmsg /kinetics/PKA/Release-C2 /kinetics/PKA/R2-cAMP4 REAC B A 
addmsg /kinetics/PKA/R2C2-cAMP4 /kinetics/PKA/Release-C1 SUBSTRATE n 
addmsg /kinetics/PKA-active /kinetics/PKA/Release-C1 PRODUCT n 
addmsg /kinetics/PKA/R2C-cAMP4 /kinetics/PKA/Release-C1 PRODUCT n 
addmsg /kinetics/PKA/R2C-cAMP4 /kinetics/PKA/Release-C2 SUBSTRATE n 
addmsg /kinetics/PKA-active /kinetics/PKA/Release-C2 PRODUCT n 
addmsg /kinetics/PKA/R2-cAMP4 /kinetics/PKA/Release-C2 PRODUCT n 
addmsg /kinetics/PKA/inhib-PKA /kinetics/PKA/PKA-inhibitor REAC A B 
addmsg /kinetics/PKA-active /kinetics/PKA/inhib-PKA SUBSTRATE n 
addmsg /kinetics/PKA/PKA-inhibitor /kinetics/PKA/inhib-PKA SUBSTRATE n 
addmsg /kinetics/PKA/inhibited-PKA /kinetics/PKA/inhib-PKA PRODUCT n 
addmsg /kinetics/PKA/inhib-PKA /kinetics/PKA/inhibited-PKA REAC B A 
addmsg /kinetics/PKA/cAMP-bind-site-B1 /kinetics/cAMP REAC A B 
addmsg /kinetics/PKA/cAMP-bind-site-B2 /kinetics/cAMP REAC A B 
addmsg /kinetics/PKA/cAMP-bind-site-A1 /kinetics/cAMP REAC A B 
addmsg /kinetics/PKA/cAMP-bind-site-A2 /kinetics/cAMP REAC A B 
addmsg /kinetics/AC/AC2*/kenz /kinetics/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC2-Gs/kenz /kinetics/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC1-CaM/kenz /kinetics/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC1-Gs/kenz /kinetics/cAMP MM_PRD pA 
addmsg /kinetics/AC/AC2*-Gs/kenz /kinetics/cAMP MM_PRD pA 
addmsg /kinetics/AC/cAMP-PDE*/PDE* /kinetics/cAMP REAC sA B 
addmsg /kinetics/AC/cAMP-PDE/PDE /kinetics/cAMP REAC sA B 
addmsg /kinetics/AC/AC2*/kenz /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC2-Gs/kenz /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC1-CaM/kenz /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC1-Gs/kenz /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/AC2*-Gs/kenz /kinetics/AC/ATP REAC sA B 
addmsg /kinetics/AC/CaM-bind-AC1 /kinetics/AC/AC1-CaM REAC B A 
addmsg /kinetics/AC/AC1-CaM /kinetics/AC/AC1-CaM/kenz ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC1-CaM/kenz SUBSTRATE n 
addmsg /kinetics/AC/CaM-bind-AC1 /kinetics/AC/AC1 REAC A B 
addmsg /kinetics/AC/Gs-bind-AC1 /kinetics/AC/AC1 REAC A B 
addmsg /kinetics/CaM-Ca4 /kinetics/AC/CaM-bind-AC1 SUBSTRATE n 
addmsg /kinetics/AC/AC1-CaM /kinetics/AC/CaM-bind-AC1 PRODUCT n 
addmsg /kinetics/AC/AC1 /kinetics/AC/CaM-bind-AC1 SUBSTRATE n 
addmsg /kinetics/PKC-active/phosph-AC2 /kinetics/AC/AC2* MM_PRD pA 
addmsg /kinetics/AC/dephosph-AC2 /kinetics/AC/AC2* REAC A B 
addmsg /kinetics/AC/Gs-bind-AC2* /kinetics/AC/AC2* REAC A B 
addmsg /kinetics/AC/AC2* /kinetics/AC/AC2*/kenz ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC2*/kenz SUBSTRATE n 
addmsg /kinetics/AC/Gs-bind-AC2 /kinetics/AC/AC2-Gs REAC B A 
addmsg /kinetics/AC/AC2-Gs /kinetics/AC/AC2-Gs/kenz ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC2-Gs/kenz SUBSTRATE n 
addmsg /kinetics/AC/Gs-bind-AC2 /kinetics/AC/AC2 REAC A B 
addmsg /kinetics/PKC-active/phosph-AC2 /kinetics/AC/AC2 REAC sA B 
addmsg /kinetics/AC/dephosph-AC2 /kinetics/AC/AC2 REAC B A 
addmsg /kinetics/AC/AC2* /kinetics/AC/dephosph-AC2 SUBSTRATE n 
addmsg /kinetics/AC/AC2 /kinetics/AC/dephosph-AC2 PRODUCT n 
addmsg /kinetics/AC/Gs-bind-AC1 /kinetics/AC/AC1-Gs REAC B A 
addmsg /kinetics/AC/AC1-Gs /kinetics/AC/AC1-Gs/kenz ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC1-Gs/kenz SUBSTRATE n 
addmsg /kinetics/AC/AC2 /kinetics/AC/Gs-bind-AC2 SUBSTRATE n 
addmsg /kinetics/AC/AC2-Gs /kinetics/AC/Gs-bind-AC2 PRODUCT n 
addmsg /kinetics/Gs-alpha /kinetics/AC/Gs-bind-AC2 SUBSTRATE n 
addmsg /kinetics/Gs-alpha /kinetics/AC/Gs-bind-AC1 SUBSTRATE n 
addmsg /kinetics/AC/AC1 /kinetics/AC/Gs-bind-AC1 SUBSTRATE n 
addmsg /kinetics/AC/AC1-Gs /kinetics/AC/Gs-bind-AC1 PRODUCT n 
addmsg /kinetics/AC/cAMP-PDE*/PDE* /kinetics/AC/AMP MM_PRD pA 
addmsg /kinetics/AC/cAMP-PDE/PDE /kinetics/AC/AMP MM_PRD pA 
addmsg /kinetics/AC/Gs-bind-AC2* /kinetics/AC/AC2*-Gs REAC B A 
addmsg /kinetics/AC/AC2*-Gs /kinetics/AC/AC2*-Gs/kenz ENZYME n 
addmsg /kinetics/AC/ATP /kinetics/AC/AC2*-Gs/kenz SUBSTRATE n 
addmsg /kinetics/Gs-alpha /kinetics/AC/Gs-bind-AC2* SUBSTRATE n 
addmsg /kinetics/AC/AC2*-Gs /kinetics/AC/Gs-bind-AC2* PRODUCT n 
addmsg /kinetics/AC/AC2* /kinetics/AC/Gs-bind-AC2* SUBSTRATE n 
addmsg /kinetics/AC/cAMP-PDE/PDE /kinetics/AC/cAMP-PDE REAC eA B 
addmsg /kinetics/AC/dephosph-PDE /kinetics/AC/cAMP-PDE REAC B A 
addmsg /kinetics/PKA-active/phosph-PDE /kinetics/AC/cAMP-PDE REAC sA B 
addmsg /kinetics/AC/cAMP-PDE /kinetics/AC/cAMP-PDE/PDE ENZYME n 
addmsg /kinetics/cAMP /kinetics/AC/cAMP-PDE/PDE SUBSTRATE n 
addmsg /kinetics/AC/cAMP-PDE*/PDE* /kinetics/AC/cAMP-PDE* REAC eA B 
addmsg /kinetics/AC/dephosph-PDE /kinetics/AC/cAMP-PDE* REAC A B 
addmsg /kinetics/PKA-active/phosph-PDE /kinetics/AC/cAMP-PDE* MM_PRD pA 
addmsg /kinetics/AC/cAMP-PDE* /kinetics/AC/cAMP-PDE*/PDE* ENZYME n 
addmsg /kinetics/cAMP /kinetics/AC/cAMP-PDE*/PDE* SUBSTRATE n 
addmsg /kinetics/AC/cAMP-PDE* /kinetics/AC/dephosph-PDE SUBSTRATE n 
addmsg /kinetics/AC/cAMP-PDE /kinetics/AC/dephosph-PDE PRODUCT n 
addmsg /kinetics/AC/Gs-bind-AC2 /kinetics/Gs-alpha REAC A B 
addmsg /kinetics/AC/Gs-bind-AC1 /kinetics/Gs-alpha REAC A B 
addmsg /kinetics/AC/Gs-bind-AC2* /kinetics/Gs-alpha REAC A B 
addmsg /kinetics/Glu /kinetics/remove_glu SUBSTRATE n 
addmsg /kinetics/synapse /kinetics/remove_glu PRODUCT n 
addmsg /kinetics/remove_glu /kinetics/synapse REAC B A 
addmsg /kinetics/stim /kinetics/synapse SLAVE output 
addmsg /kinetics/Shc*.Sos.Grb2 /graphs/conc1/Shc*.Sos.Grb2.Co PLOT Co *Shc*.Sos.Grb2.Co *brown 
addmsg /kinetics/EGF_Receptor/EGFR* /graphs/conc1/EGFR*.Co PLOT Co *EGFR*.Co *red 
addmsg /kinetics/EGF_Receptor/Sos.Grb2 /graphs/conc1/Sos.Grb2.Co PLOT Co *Sos.Grb2.Co *orange 
addmsg /kinetics/CaM-Ca4 /graphs/conc1/CaM-Ca4.Co PLOT Co *CaM-Ca4.Co *blue 
addmsg /kinetics/PKC-active /graphs/conc1/PKC-active.Co PLOT Co *PKC-active.Co *red 
addmsg /kinetics/Ras/GTP-Ras /graphs/conc1/GTP-Ras.Co PLOT Co *GTP-Ras.Co *orange 
addmsg /kinetics/cAMP /graphs/conc1/cAMP.Co PLOT Co *cAMP.Co *green 
addmsg /kinetics/MAPK/Raf-GTP-Ras* /graphs/conc1/Raf-GTP-Ras*.Co PLOT Co *Raf-GTP-Ras*.Co *red 
addmsg /kinetics/EGF_Receptor/L.EGFR /graphs/conc2/L.EGFR.Co PLOT Co *L.EGFR.Co *red 
addmsg /kinetics/EGF_Receptor/SHC* /graphs/conc2/SHC*.Co PLOT Co *SHC*.Co *orange 
addmsg /kinetics/MAPK* /graphs/conc2/MAPK*.Co PLOT Co *MAPK*.Co *orange 
addmsg /kinetics/BetaGamma /graphs/conc2/BetaGamma.Co PLOT Co *BetaGamma.Co *yellow 
addmsg /kinetics/PLCbeta/PLC-Ca-Gq /graphs/conc2/PLC-Ca-Gq.Co PLOT Co *PLC-Ca-Gq.Co *cyan 
addmsg /kinetics/PLCbeta/PLC-Ca /graphs/conc2/PLC-Ca.Co PLOT Co *PLC-Ca.Co *cyan 
addmsg /kinetics/Ca /graphs/conc2/Ca.Co PLOT Co *Ca.Co *red 
addmsg /kinetics/EGF_Receptor/Sos*.Grb2 /moregraphs/conc3/Sos*.Grb2.Co PLOT Co *Sos*.Grb2.Co *orange 
addmsg /kinetics/EGF_Receptor/SHC*.EGFR* /moregraphs/conc3/SHC*.EGFR*.Co PLOT Co *SHC*.EGFR*.Co *purple 
addmsg /kinetics/CaMKII/CaMKII** /moregraphs/conc3/CaMKII**.Co PLOT Co *CaMKII**.Co *cyan 
addmsg /kinetics/PKA-active /moregraphs/conc3/PKA-active.Co PLOT Co *PKA-active.Co *yellow 
addmsg /kinetics/DAG /moregraphs/conc3/DAG.Co PLOT Co *DAG.Co *green 
addmsg /kinetics/G*GTP /moregraphs/conc3/G*GTP.Co PLOT Co *G*GTP.Co *red 
addmsg /kinetics/Glu /moregraphs/conc3/Glu.Co PLOT Co *Glu.Co *green 
addmsg /kinetics/CaM/neurogranin* /moregraphs/conc4/neurogranin*.Co PLOT Co *neurogranin*.Co *red 
addmsg /kinetics/CaMKII/CaMKII*** /moregraphs/conc4/CaMKII***.Co PLOT Co *CaMKII***.Co *cyan 
addmsg /kinetics/Gq/Rec-Glu-Gq /moregraphs/conc4/Rec-Glu-Gq.Co PLOT Co *Rec-Glu-Gq.Co *orange 
addmsg /kinetics/AA /moregraphs/conc4/AA.Co PLOT Co *AA.Co *darkgreen 
addmsg /kinetics/Gq/Rec-Glu /moregraphs/conc4/Rec-Glu.Co PLOT Co *Rec-Glu.Co *green 
enddump
// End of dump

call /edit/draw/tree RESET
reset
