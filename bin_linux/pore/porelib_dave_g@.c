#include <stdio.h>
#include "pore_ext.h"
#include "porelib_dave_g@.h"

void STARTUP_porelib_dave() {
  GenesisObject* object;
  GenesisObject  tobject;
  char*          slotnames[50];
  char*          argv[50];

  /* Definition of object Napores2 */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "Napores2";
  tobject.type = "Na_pore_type2";
  tobject.size = sizeof(struct Na_pore_type2);
  { extern int NaPorePop2(); tobject.function = NaPorePop2; HashFunc("NaPorePop2", NaPorePop2, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("Napores2");
  object->defaults->object = object;
  object->defaults->name = CopyString("Napores2");
  { extern int NaPorePop2(); AddActionToObject(object, "INIT", NaPorePop2, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'Napores2'\n")); HashFunc("NaPorePop2", NaPorePop2, "int"); }
  { extern int NaPorePop2(); AddActionToObject(object, "PROCESS", NaPorePop2, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'Napores2'\n")); HashFunc("NaPorePop2", NaPorePop2, "int"); }
  { extern int NaPorePop2(); AddActionToObject(object, "RESET", NaPorePop2, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'Napores2'\n")); HashFunc("NaPorePop2", NaPorePop2, "int"); }
  { extern int NaPorePop2(); AddActionToObject(object, "CHECK", NaPorePop2, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'Napores2'\n")); HashFunc("NaPorePop2", NaPorePop2, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", Napores2_VOLTAGE, slotnames, 1);
  object->author = "Adam Strassberg";
  object->description = "Sodium pore population represented through eight state Markov kinetic scheme (see Strassberg and DeFelice, 1992).\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object Kpores2 */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "Kpores2";
  tobject.type = "K_pore_type2";
  tobject.size = sizeof(struct K_pore_type2);
  { extern int KPorePop2(); tobject.function = KPorePop2; HashFunc("KPorePop2", KPorePop2, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("Kpores2");
  object->defaults->object = object;
  object->defaults->name = CopyString("Kpores2");
  { extern int KPorePop2(); AddActionToObject(object, "INIT", KPorePop2, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'Kpores2'\n")); HashFunc("KPorePop2", KPorePop2, "int"); }
  { extern int KPorePop2(); AddActionToObject(object, "PROCESS", KPorePop2, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'Kpores2'\n")); HashFunc("KPorePop2", KPorePop2, "int"); }
  { extern int KPorePop2(); AddActionToObject(object, "RESET", KPorePop2, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'Kpores2'\n")); HashFunc("KPorePop2", KPorePop2, "int"); }
  { extern int KPorePop2(); AddActionToObject(object, "CHECK", KPorePop2, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'Kpores2'\n")); HashFunc("KPorePop2", KPorePop2, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", Kpores2_VOLTAGE, slotnames, 1);
  object->author = "Adam Strassberg";
  object->description = "Potassium pore population represented through five state Markov kinetic scheme (see Strassberg and DeFelice, 1992).\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENsynpores */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENsynpores";
  tobject.type = "GENsyn_pore_type";
  tobject.size = sizeof(struct GENsyn_pore_type);
  { extern int GENsynPorePop(); tobject.function = GENsynPorePop; HashFunc("GENsynPorePop", GENsynPorePop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENsynpores");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENsynpores");
  { extern int GENsynPorePop(); AddActionToObject(object, "INIT", GENsynPorePop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENsynpores'\n")); HashFunc("GENsynPorePop", GENsynPorePop, "int"); }
  { extern int GENsynPorePop(); AddActionToObject(object, "PROCESS", GENsynPorePop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENsynpores'\n")); HashFunc("GENsynPorePop", GENsynPorePop, "int"); }
  { extern int GENsynPorePop(); AddActionToObject(object, "RESET", GENsynPorePop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENsynpores'\n")); HashFunc("GENsynPorePop", GENsynPorePop, "int"); }
  { extern int GENsynPorePop(); AddActionToObject(object, "CHECK", GENsynPorePop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENsynpores'\n")); HashFunc("GENsynPorePop", GENsynPorePop, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", GENsynpores_VOLTAGE, slotnames, 1);
  slotnames[0] = "T";
  MsgListAdd(object, "TRANSMITTER", GENsynpores_TRANSMITTER, slotnames, 1);
  object->author = "David Stanley";
  object->description = "GENERAL synaptic pore population represented through a 5x2 state Markov kinetic scheme (see Koch, Methods in Neuronal Modeling, 2nd Edition). T=transmitter in units of mols\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENvgpores */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENvgpores";
  tobject.type = "GENvg_pore_type";
  tobject.size = sizeof(struct GENvg_pore_type);
  { extern int GENvgPorePop(); tobject.function = GENvgPorePop; HashFunc("GENvgPorePop", GENvgPorePop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENvgpores");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENvgpores");
  { extern int GENvgPorePop(); AddActionToObject(object, "INIT", GENvgPorePop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENvgpores'\n")); HashFunc("GENvgPorePop", GENvgPorePop, "int"); }
  { extern int GENvgPorePop(); AddActionToObject(object, "PROCESS", GENvgPorePop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENvgpores'\n")); HashFunc("GENvgPorePop", GENvgPorePop, "int"); }
  { extern int GENvgPorePop(); AddActionToObject(object, "RESET", GENvgPorePop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENvgpores'\n")); HashFunc("GENvgPorePop", GENvgPorePop, "int"); }
  { extern int GENvgPorePop(); AddActionToObject(object, "CHECK", GENvgPorePop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENvgpores'\n")); HashFunc("GENvgPorePop", GENvgPorePop, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", GENvgpores_VOLTAGE, slotnames, 1);
  object->author = "David Stanley";
  object->description = "GENERAL voltage gated pore population represented through a 5x2 state Markov kinetic scheme.\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENtabchan */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENtabchan";
  tobject.type = "GEN_tabchan_type";
  tobject.size = sizeof(struct GEN_tabchan_type);
  { extern int GENtabchanPop(); tobject.function = GENtabchanPop; HashFunc("GENtabchanPop", GENtabchanPop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENtabchan");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENtabchan");
  { extern int GENtabchanPop(); AddActionToObject(object, "INIT", GENtabchanPop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENtabchan'\n")); HashFunc("GENtabchanPop", GENtabchanPop, "int"); }
  { extern int GENtabchanPop(); AddActionToObject(object, "PROCESS", GENtabchanPop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENtabchan'\n")); HashFunc("GENtabchanPop", GENtabchanPop, "int"); }
  { extern int GENtabchanPop(); AddActionToObject(object, "RESET", GENtabchanPop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENtabchan'\n")); HashFunc("GENtabchanPop", GENtabchanPop, "int"); }
  { extern int GENtabchanPop(); AddActionToObject(object, "CHECK", GENtabchanPop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENtabchan'\n")); HashFunc("GENtabchanPop", GENtabchanPop, "int"); }
  slotnames[0] = "malpha";
  MsgListAdd(object, "MALPHA", GENtabchan_MALPHA, slotnames, 1);
  slotnames[0] = "mbeta";
  MsgListAdd(object, "MBETA", GENtabchan_MBETA, slotnames, 1);
  slotnames[0] = "halpha";
  MsgListAdd(object, "HALPHA", GENtabchan_HALPHA, slotnames, 1);
  slotnames[0] = "hbeta";
  MsgListAdd(object, "HBETA", GENtabchan_HBETA, slotnames, 1);
  slotnames[0] = "Ca_binding_scaling";
  MsgListAdd(object, "CA_BINDING_SCALING", GENtabchan_CA_BINDING_SCALING, slotnames, 1);
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", GENtabchan_VOLTAGE, slotnames, 1);
  object->author = "David Stanley";
  object->description = "GENERAL voltage gated pore population represented through a 5x2 state Markov kinetic \
		scheme. Alpha/beta rates are sent as messages from tables.\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENGprotein */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENGprotein";
  tobject.type = "GEN_GPROTEIN_type";
  tobject.size = sizeof(struct GEN_GPROTEIN_type);
  { extern int GENGproteinPop(); tobject.function = GENGproteinPop; HashFunc("GENGproteinPop", GENGproteinPop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENGprotein");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENGprotein");
  { extern int GENGproteinPop(); AddActionToObject(object, "INIT", GENGproteinPop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENGprotein'\n")); HashFunc("GENGproteinPop", GENGproteinPop, "int"); }
  { extern int GENGproteinPop(); AddActionToObject(object, "PROCESS", GENGproteinPop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENGprotein'\n")); HashFunc("GENGproteinPop", GENGproteinPop, "int"); }
  { extern int GENGproteinPop(); AddActionToObject(object, "RESET", GENGproteinPop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENGprotein'\n")); HashFunc("GENGproteinPop", GENGproteinPop, "int"); }
  { extern int GENGproteinPop(); AddActionToObject(object, "CHECK", GENGproteinPop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENGprotein'\n")); HashFunc("GENGproteinPop", GENGproteinPop, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", GENGprotein_VOLTAGE, slotnames, 1);
  slotnames[0] = "T";
  MsgListAdd(object, "TRANSMITTER", GENGprotein_TRANSMITTER, slotnames, 1);
  object->author = "David Stanley";
  object->description = "Markov pore to simulate GABA_B G-protein (see Koch, Methods in Neuronal Modeling, 2nd Edition). T=[Receptor] Normalized 0..1\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENgap */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENgap";
  tobject.type = "GEN_gap_type";
  tobject.size = sizeof(struct GEN_gap_type);
  { extern int GENgapPop(); tobject.function = GENgapPop; HashFunc("GENgapPop", GENgapPop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENgap");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENgap");
  { extern int GENgapPop(); AddActionToObject(object, "INIT", GENgapPop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENgap'\n")); HashFunc("GENgapPop", GENgapPop, "int"); }
  { extern int GENgapPop(); AddActionToObject(object, "PROCESS", GENgapPop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENgap'\n")); HashFunc("GENgapPop", GENgapPop, "int"); }
  { extern int GENgapPop(); AddActionToObject(object, "RESET", GENgapPop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENgap'\n")); HashFunc("GENgapPop", GENgapPop, "int"); }
  { extern int GENgapPop(); AddActionToObject(object, "CHECK", GENgapPop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENgap'\n")); HashFunc("GENgapPop", GENgapPop, "int"); }
  slotnames[0] = "Vm1";
  MsgListAdd(object, "VOLTAGE1", GENgap_VOLTAGE1, slotnames, 1);
  slotnames[0] = "Vm2";
  MsgListAdd(object, "VOLTAGE2", GENgap_VOLTAGE2, slotnames, 1);
  object->author = "David Stanley";
  object->description = "Voltage gated gap junction population\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object logistic */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "logistic";
  tobject.type = "logistic_type";
  tobject.size = sizeof(struct logistic_type);
  { extern int LogisticEvent(); tobject.function = LogisticEvent; HashFunc("LogisticEvent", LogisticEvent, "int"); }
  ObjectAddClass(&tobject,ClassID("buffer"),CLASS_PERMANENT);
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("logistic");
  object->defaults->object = object;
  object->defaults->name = CopyString("logistic");
  { extern int LogisticEvent(); AddActionToObject(object, "PROCESS", LogisticEvent, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'logistic'\n")); HashFunc("LogisticEvent", LogisticEvent, "int"); }
  { extern int LogisticEvent(); AddActionToObject(object, "RESET", LogisticEvent, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'logistic'\n")); HashFunc("LogisticEvent", LogisticEvent, "int"); }
  { extern int BufferCopy(); AddActionToObject(object, "COPY", BufferCopy, 0) ? 0 : (Error(), printf("adding action 'COPY' to object 'logistic'\n")); HashFunc("BufferCopy", BufferCopy, "int"); }
  { extern int BufferCreate(); AddActionToObject(object, "CREATE", BufferCreate, 0) ? 0 : (Error(), printf("adding action 'CREATE' to object 'logistic'\n")); HashFunc("BufferCreate", BufferCreate, "int"); }
  slotnames[0] = "input";
  MsgListAdd(object, "INPUT", logistic_INPUT, slotnames, 1);
  slotnames[0] = "thresh";
  MsgListAdd(object, "THRESH", logistic_THRESH, slotnames, 1);
  slotnames[0] = "gain";
  MsgListAdd(object, "GAIN", logistic_GAIN, slotnames, 1);
  slotnames[0] = "amplitude";
  MsgListAdd(object, "AMPLITUDE", logistic_AMPLITUDE, slotnames, 1);
  object->author = "David Stanley";
  object->description = "Logistic function - basically the same as sigmoidal function, except is of the form (amplitude * 1/(1+exp(gain*(input-thresh)/2))).\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENVhalf */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENVhalf";
  tobject.type = "GENVhalf_type";
  tobject.size = sizeof(struct GENVhalf_type);
  { extern int GENVhalfPop(); tobject.function = GENVhalfPop; HashFunc("GENVhalfPop", GENVhalfPop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENVhalf");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENVhalf");
  { extern int GENVhalfPop(); AddActionToObject(object, "INIT", GENVhalfPop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENVhalf'\n")); HashFunc("GENVhalfPop", GENVhalfPop, "int"); }
  { extern int GENVhalfPop(); AddActionToObject(object, "PROCESS", GENVhalfPop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENVhalf'\n")); HashFunc("GENVhalfPop", GENVhalfPop, "int"); }
  { extern int GENVhalfPop(); AddActionToObject(object, "RESET", GENVhalfPop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENVhalf'\n")); HashFunc("GENVhalfPop", GENVhalfPop, "int"); }
  { extern int GENVhalfPop(); AddActionToObject(object, "CHECK", GENVhalfPop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENVhalf'\n")); HashFunc("GENVhalfPop", GENVhalfPop, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", GENVhalf_VOLTAGE, slotnames, 1);
  object->author = "David Stanley";
  object->description = "GENERAL voltage gated pore population represented through a 5x2 state Markov kinetic scheme.\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object GENsynpores3D */
  BZERO(&tobject,sizeof(GenesisObject));
  tobject.name = "GENsynpores3D";
  tobject.type = "GENsyn_pore3D_type";
  tobject.size = sizeof(struct GENsyn_pore3D_type);
  { extern int GENsynPore3DPop(); tobject.function = GENsynPore3DPop; HashFunc("GENsynPore3DPop", GENsynPore3DPop, "int"); }
  ObjectAddClass(&tobject,ClassID("segment"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("GENsynpores3D");
  object->defaults->object = object;
  object->defaults->name = CopyString("GENsynpores3D");
  { extern int GENsynPore3DPop(); AddActionToObject(object, "INIT", GENsynPore3DPop, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'GENsynpores3D'\n")); HashFunc("GENsynPore3DPop", GENsynPore3DPop, "int"); }
  { extern int GENsynPore3DPop(); AddActionToObject(object, "PROCESS", GENsynPore3DPop, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'GENsynpores3D'\n")); HashFunc("GENsynPore3DPop", GENsynPore3DPop, "int"); }
  { extern int GENsynPore3DPop(); AddActionToObject(object, "RESET", GENsynPore3DPop, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'GENsynpores3D'\n")); HashFunc("GENsynPore3DPop", GENsynPore3DPop, "int"); }
  { extern int GENsynPore3DPop(); AddActionToObject(object, "CHECK", GENsynPore3DPop, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'GENsynpores3D'\n")); HashFunc("GENsynPore3DPop", GENsynPore3DPop, "int"); }
  slotnames[0] = "Vm";
  MsgListAdd(object, "VOLTAGE", GENsynpores3D_VOLTAGE, slotnames, 1);
  slotnames[0] = "T";
  MsgListAdd(object, "TRANSMITTER", GENsynpores3D_TRANSMITTER, slotnames, 1);
  object->author = "David Stanley";
  object->description = "GENERAL synaptic pore population represented through a 5x2 state Markov kinetic scheme (see Koch, Methods in Neuronal Modeling, 2nd Edition). T=transmitter in units of mols\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

/* Script variables */

} /* STARTUP_porelib_dave */
