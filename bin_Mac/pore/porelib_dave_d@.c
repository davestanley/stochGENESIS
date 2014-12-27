#include "pore_ext.h"

#define __BZ BZERO(&info,sizeof(Info))
#define __IFI(F) info.field_indirection = F
#define __IFT info.function_type = 1
#define __IND(N) info.dimensions = N
#define __IDS(S,N) info.dimension_size[S] = N
void INFO_K_pore_type2(){
struct K_pore_type2 var;Info info;char fields[2500];fields[0]='\0';info.name="K_pore_type2";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="K_pore_type2.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.n0";info.offset=(caddr_t)(&(var.n0))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"n0");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field n0\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.n1";info.offset=(caddr_t)(&(var.n1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"n1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field n1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.n2";info.offset=(caddr_t)(&(var.n2))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"n2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field n2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.n3";info.offset=(caddr_t)(&(var.n3))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"n3");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field n3\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.n4";info.offset=(caddr_t)(&(var.n4))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"n4");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field n4\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.alpha_A";info.offset=(caddr_t)(&(var.alpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field alpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.alpha_B";info.offset=(caddr_t)(&(var.alpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field alpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.alpha_C";info.offset=(caddr_t)(&(var.alpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field alpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.alpha_D";info.offset=(caddr_t)(&(var.alpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field alpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.alpha_F";info.offset=(caddr_t)(&(var.alpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field alpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.beta_A";info.offset=(caddr_t)(&(var.beta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field beta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.beta_B";info.offset=(caddr_t)(&(var.beta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field beta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.beta_C";info.offset=(caddr_t)(&(var.beta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field beta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.beta_D";info.offset=(caddr_t)(&(var.beta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field beta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="K_pore_type2.beta_F";info.offset=(caddr_t)(&(var.beta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object K_pore_type2, field beta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("K_pore_type2",fields);
}
void INFO_Na_pore_type2(){
struct Na_pore_type2 var;Info info;char fields[2500];fields[0]='\0';info.name="Na_pore_type2";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="Na_pore_type2.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m0h0";info.offset=(caddr_t)(&(var.m0h0))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m0h0");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m0h0\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m1h0";info.offset=(caddr_t)(&(var.m1h0))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m1h0");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m1h0\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m2h0";info.offset=(caddr_t)(&(var.m2h0))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m2h0");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m2h0\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m3h0";info.offset=(caddr_t)(&(var.m3h0))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m3h0");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m3h0\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m0h1";info.offset=(caddr_t)(&(var.m0h1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m0h1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m0h1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m1h1";info.offset=(caddr_t)(&(var.m1h1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m1h1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m1h1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m2h1";info.offset=(caddr_t)(&(var.m2h1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m2h1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m2h1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.m3h1";info.offset=(caddr_t)(&(var.m3h1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"m3h1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field m3h1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.malpha_A";info.offset=(caddr_t)(&(var.malpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field malpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.malpha_B";info.offset=(caddr_t)(&(var.malpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field malpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.malpha_C";info.offset=(caddr_t)(&(var.malpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field malpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.malpha_D";info.offset=(caddr_t)(&(var.malpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field malpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.malpha_F";info.offset=(caddr_t)(&(var.malpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field malpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.mbeta_A";info.offset=(caddr_t)(&(var.mbeta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field mbeta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.mbeta_B";info.offset=(caddr_t)(&(var.mbeta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field mbeta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.mbeta_C";info.offset=(caddr_t)(&(var.mbeta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field mbeta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.mbeta_D";info.offset=(caddr_t)(&(var.mbeta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field mbeta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.mbeta_F";info.offset=(caddr_t)(&(var.mbeta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field mbeta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.halpha_A";info.offset=(caddr_t)(&(var.halpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field halpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.halpha_B";info.offset=(caddr_t)(&(var.halpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field halpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.halpha_C";info.offset=(caddr_t)(&(var.halpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field halpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.halpha_D";info.offset=(caddr_t)(&(var.halpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field halpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.halpha_F";info.offset=(caddr_t)(&(var.halpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field halpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.hbeta_A";info.offset=(caddr_t)(&(var.hbeta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field hbeta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.hbeta_B";info.offset=(caddr_t)(&(var.hbeta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field hbeta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.hbeta_C";info.offset=(caddr_t)(&(var.hbeta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field hbeta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.hbeta_D";info.offset=(caddr_t)(&(var.hbeta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field hbeta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="Na_pore_type2.hbeta_F";info.offset=(caddr_t)(&(var.hbeta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object Na_pore_type2, field hbeta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("Na_pore_type2",fields);
}
void INFO_GENsyn_pore_type(){
struct GENsyn_pore_type var;Info info;char fields[2500];fields[0]='\0';info.name="GENsyn_pore_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GENsyn_pore_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Gmax_2";info.offset=(caddr_t)(&(var.Gmax_2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax_2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Gmax_2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.No_os1";info.offset=(caddr_t)(&(var.No_os1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No_os1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field No_os1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.No_os2";info.offset=(caddr_t)(&(var.No_os2))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No_os2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field No_os2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S14";info.offset=(caddr_t)(&(var.S14))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S15";info.offset=(caddr_t)(&(var.S15))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S21";info.offset=(caddr_t)(&(var.S21))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S22";info.offset=(caddr_t)(&(var.S22))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S23";info.offset=(caddr_t)(&(var.S23))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S24";info.offset=(caddr_t)(&(var.S24))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S25";info.offset=(caddr_t)(&(var.S25))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S11_S21";info.offset=(caddr_t)(&(var.S11_S21))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S11_S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S11_S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S11_S12";info.offset=(caddr_t)(&(var.S11_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S11_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S11_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S21_S11";info.offset=(caddr_t)(&(var.S21_S11))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S21_S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S21_S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S21_S22";info.offset=(caddr_t)(&(var.S21_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S21_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S21_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S12_S11";info.offset=(caddr_t)(&(var.S12_S11))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S12_S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S12_S22";info.offset=(caddr_t)(&(var.S12_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S12_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S12_S13";info.offset=(caddr_t)(&(var.S12_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S12_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S22_S21";info.offset=(caddr_t)(&(var.S22_S21))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S22_S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S22_S12";info.offset=(caddr_t)(&(var.S22_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S22_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S22_S23";info.offset=(caddr_t)(&(var.S22_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S22_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S13_S12";info.offset=(caddr_t)(&(var.S13_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S13_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S13_S23";info.offset=(caddr_t)(&(var.S13_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S13_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S13_S14";info.offset=(caddr_t)(&(var.S13_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S13_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S23_S22";info.offset=(caddr_t)(&(var.S23_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S23_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S23_S13";info.offset=(caddr_t)(&(var.S23_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S23_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S23_S24";info.offset=(caddr_t)(&(var.S23_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S23_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S14_S13";info.offset=(caddr_t)(&(var.S14_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S14_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S14_S24";info.offset=(caddr_t)(&(var.S14_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S14_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S14_S15";info.offset=(caddr_t)(&(var.S14_S15))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S14_S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S24_S23";info.offset=(caddr_t)(&(var.S24_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S24_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S24_S14";info.offset=(caddr_t)(&(var.S24_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S24_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S24_S25";info.offset=(caddr_t)(&(var.S24_S25))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S24_S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S15_S14";info.offset=(caddr_t)(&(var.S15_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S15_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S15_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S15_S25";info.offset=(caddr_t)(&(var.S15_S25))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S15_S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S15_S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S25_S24";info.offset=(caddr_t)(&(var.S25_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S25_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S25_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.S25_S15";info.offset=(caddr_t)(&(var.S25_S15))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S25_S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field S25_S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.Trans";info.offset=(caddr_t)(&(var.Trans))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Trans");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field Trans\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef1";info.offset=(caddr_t)(&(var.TCoef1))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef2";info.offset=(caddr_t)(&(var.TCoef2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef3";info.offset=(caddr_t)(&(var.TCoef3))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef3");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef3\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef4";info.offset=(caddr_t)(&(var.TCoef4))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef4");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef4\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef5";info.offset=(caddr_t)(&(var.TCoef5))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef5");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef5\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef6";info.offset=(caddr_t)(&(var.TCoef6))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef6");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef6\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef7";info.offset=(caddr_t)(&(var.TCoef7))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef7");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef7\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.TCoef8";info.offset=(caddr_t)(&(var.TCoef8))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef8");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field TCoef8\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.openstate1";info.offset=(caddr_t)(&(var.openstate1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"openstate1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field openstate1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.openstate2";info.offset=(caddr_t)(&(var.openstate2))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"openstate2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field openstate2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GENsyn_pore_type",fields);
}
void INFO_GENsyn_pore3D_type(){
struct GENsyn_pore3D_type var;Info info;char fields[2500];fields[0]='\0';info.name="GENsyn_pore3D_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GENsyn_pore3D_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Gmax_2";info.offset=(caddr_t)(&(var.Gmax_2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax_2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Gmax_2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.No_os1";info.offset=(caddr_t)(&(var.No_os1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No_os1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field No_os1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.No_os2";info.offset=(caddr_t)(&(var.No_os2))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No_os2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field No_os2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S14";info.offset=(caddr_t)(&(var.S14))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S15";info.offset=(caddr_t)(&(var.S15))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S21";info.offset=(caddr_t)(&(var.S21))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S22";info.offset=(caddr_t)(&(var.S22))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S23";info.offset=(caddr_t)(&(var.S23))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S24";info.offset=(caddr_t)(&(var.S24))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S25";info.offset=(caddr_t)(&(var.S25))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S11_S21";info.offset=(caddr_t)(&(var.S11_S21))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S11_S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S11_S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S11_S12";info.offset=(caddr_t)(&(var.S11_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S11_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S11_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S21_S11";info.offset=(caddr_t)(&(var.S21_S11))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S21_S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S21_S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S21_S22";info.offset=(caddr_t)(&(var.S21_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S21_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S21_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S12_S11";info.offset=(caddr_t)(&(var.S12_S11))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S12_S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S12_S22";info.offset=(caddr_t)(&(var.S12_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S12_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S12_S13";info.offset=(caddr_t)(&(var.S12_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S12_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S22_S21";info.offset=(caddr_t)(&(var.S22_S21))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S22_S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S22_S12";info.offset=(caddr_t)(&(var.S22_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S22_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S22_S23";info.offset=(caddr_t)(&(var.S22_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S22_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S13_S12";info.offset=(caddr_t)(&(var.S13_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S13_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S13_S23";info.offset=(caddr_t)(&(var.S13_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S13_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S13_S14";info.offset=(caddr_t)(&(var.S13_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S13_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S23_S22";info.offset=(caddr_t)(&(var.S23_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S23_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S23_S13";info.offset=(caddr_t)(&(var.S23_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S23_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S23_S24";info.offset=(caddr_t)(&(var.S23_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S23_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S14_S13";info.offset=(caddr_t)(&(var.S14_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S14_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S14_S24";info.offset=(caddr_t)(&(var.S14_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S14_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S14_S15";info.offset=(caddr_t)(&(var.S14_S15))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S14_S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S24_S23";info.offset=(caddr_t)(&(var.S24_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S24_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S24_S14";info.offset=(caddr_t)(&(var.S24_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S24_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S24_S25";info.offset=(caddr_t)(&(var.S24_S25))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S24_S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S15_S14";info.offset=(caddr_t)(&(var.S15_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S15_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S15_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S15_S25";info.offset=(caddr_t)(&(var.S15_S25))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S15_S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S15_S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S25_S24";info.offset=(caddr_t)(&(var.S25_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S25_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S25_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.S25_S15";info.offset=(caddr_t)(&(var.S25_S15))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S25_S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field S25_S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.Trans";info.offset=(caddr_t)(&(var.Trans))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Trans");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field Trans\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef1";info.offset=(caddr_t)(&(var.TCoef1))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef2";info.offset=(caddr_t)(&(var.TCoef2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef3";info.offset=(caddr_t)(&(var.TCoef3))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef3");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef3\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef4";info.offset=(caddr_t)(&(var.TCoef4))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef4");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef4\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef5";info.offset=(caddr_t)(&(var.TCoef5))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef5");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef5\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef6";info.offset=(caddr_t)(&(var.TCoef6))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef6");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef6\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef7";info.offset=(caddr_t)(&(var.TCoef7))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef7");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef7\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.TCoef8";info.offset=(caddr_t)(&(var.TCoef8))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef8");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field TCoef8\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.openstate1";info.offset=(caddr_t)(&(var.openstate1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"openstate1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field openstate1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.openstate2";info.offset=(caddr_t)(&(var.openstate2))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"openstate2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field openstate2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENsyn_pore3D_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENsyn_pore3D_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GENsyn_pore3D_type",fields);
}
void INFO_GENvg_pore_type(){
struct GENvg_pore_type var;Info info;char fields[2500];fields[0]='\0';info.name="GENvg_pore_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GENvg_pore_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S14";info.offset=(caddr_t)(&(var.S14))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S15";info.offset=(caddr_t)(&(var.S15))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S21";info.offset=(caddr_t)(&(var.S21))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S22";info.offset=(caddr_t)(&(var.S22))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S23";info.offset=(caddr_t)(&(var.S23))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S24";info.offset=(caddr_t)(&(var.S24))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.S25";info.offset=(caddr_t)(&(var.S25))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.malpha_A";info.offset=(caddr_t)(&(var.malpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field malpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.malpha_B";info.offset=(caddr_t)(&(var.malpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field malpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.malpha_C";info.offset=(caddr_t)(&(var.malpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field malpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.malpha_D";info.offset=(caddr_t)(&(var.malpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field malpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.malpha_F";info.offset=(caddr_t)(&(var.malpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field malpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.mbeta_A";info.offset=(caddr_t)(&(var.mbeta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field mbeta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.mbeta_B";info.offset=(caddr_t)(&(var.mbeta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field mbeta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.mbeta_C";info.offset=(caddr_t)(&(var.mbeta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field mbeta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.mbeta_D";info.offset=(caddr_t)(&(var.mbeta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field mbeta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.mbeta_F";info.offset=(caddr_t)(&(var.mbeta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field mbeta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.halpha_A";info.offset=(caddr_t)(&(var.halpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field halpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.halpha_B";info.offset=(caddr_t)(&(var.halpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field halpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.halpha_C";info.offset=(caddr_t)(&(var.halpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field halpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.halpha_D";info.offset=(caddr_t)(&(var.halpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field halpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.halpha_F";info.offset=(caddr_t)(&(var.halpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field halpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.hbeta_A";info.offset=(caddr_t)(&(var.hbeta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field hbeta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.hbeta_B";info.offset=(caddr_t)(&(var.hbeta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field hbeta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.hbeta_C";info.offset=(caddr_t)(&(var.hbeta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field hbeta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.hbeta_D";info.offset=(caddr_t)(&(var.hbeta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field hbeta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.hbeta_F";info.offset=(caddr_t)(&(var.hbeta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field hbeta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.malpha";info.offset=(caddr_t)(&(var.malpha))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field malpha\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.mbeta";info.offset=(caddr_t)(&(var.mbeta))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field mbeta\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.halpha";info.offset=(caddr_t)(&(var.halpha))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field halpha\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.hbeta";info.offset=(caddr_t)(&(var.hbeta))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field hbeta\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.num_Xgate";info.offset=(caddr_t)(&(var.num_Xgate))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"num_Xgate");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field num_Xgate\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.num_Ygate";info.offset=(caddr_t)(&(var.num_Ygate))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"num_Ygate");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field num_Ygate\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENvg_pore_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENvg_pore_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GENvg_pore_type",fields);
}
void INFO_GEN_GPROTEIN_type(){
struct GEN_GPROTEIN_type var;Info info;char fields[2500];fields[0]='\0';info.name="GEN_GPROTEIN_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GEN_GPROTEIN_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Gconcs";info.offset=(caddr_t)(&(var.Gconcs))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gconcs");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Gconcs\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.UnitG";info.offset=(caddr_t)(&(var.UnitG))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"UnitG");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field UnitG\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Gbar";info.offset=(caddr_t)(&(var.Gbar))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gbar");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Gbar\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S14";info.offset=(caddr_t)(&(var.S14))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S15";info.offset=(caddr_t)(&(var.S15))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S21";info.offset=(caddr_t)(&(var.S21))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S22";info.offset=(caddr_t)(&(var.S22))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S23";info.offset=(caddr_t)(&(var.S23))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S24";info.offset=(caddr_t)(&(var.S24))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S25";info.offset=(caddr_t)(&(var.S25))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S11_S21";info.offset=(caddr_t)(&(var.S11_S21))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S11_S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S11_S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S11_S12";info.offset=(caddr_t)(&(var.S11_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S11_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S11_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S21_S11";info.offset=(caddr_t)(&(var.S21_S11))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S21_S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S21_S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S21_S22";info.offset=(caddr_t)(&(var.S21_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S21_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S21_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S12_S11";info.offset=(caddr_t)(&(var.S12_S11))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S12_S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S12_S22";info.offset=(caddr_t)(&(var.S12_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S12_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S12_S13";info.offset=(caddr_t)(&(var.S12_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S12_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S12_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S22_S21";info.offset=(caddr_t)(&(var.S22_S21))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S22_S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S22_S12";info.offset=(caddr_t)(&(var.S22_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S22_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S22_S23";info.offset=(caddr_t)(&(var.S22_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S22_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S22_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S13_S12";info.offset=(caddr_t)(&(var.S13_S12))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S13_S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S13_S23";info.offset=(caddr_t)(&(var.S13_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S13_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S13_S14";info.offset=(caddr_t)(&(var.S13_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S13_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S13_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S23_S22";info.offset=(caddr_t)(&(var.S23_S22))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S23_S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S23_S13";info.offset=(caddr_t)(&(var.S23_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S23_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S23_S24";info.offset=(caddr_t)(&(var.S23_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S23_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S23_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S14_S13";info.offset=(caddr_t)(&(var.S14_S13))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S14_S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S14_S24";info.offset=(caddr_t)(&(var.S14_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S14_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S14_S15";info.offset=(caddr_t)(&(var.S14_S15))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S14_S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S14_S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S24_S23";info.offset=(caddr_t)(&(var.S24_S23))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S24_S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S24_S14";info.offset=(caddr_t)(&(var.S24_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S24_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S24_S25";info.offset=(caddr_t)(&(var.S24_S25))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S24_S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S24_S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S15_S14";info.offset=(caddr_t)(&(var.S15_S14))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S15_S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S15_S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S15_S25";info.offset=(caddr_t)(&(var.S15_S25))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S15_S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S15_S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S25_S24";info.offset=(caddr_t)(&(var.S25_S24))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S25_S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S25_S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.S25_S15";info.offset=(caddr_t)(&(var.S25_S15))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"S25_S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field S25_S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Trans";info.offset=(caddr_t)(&(var.Trans))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Trans");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Trans\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef1";info.offset=(caddr_t)(&(var.TCoef1))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef2";info.offset=(caddr_t)(&(var.TCoef2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef3";info.offset=(caddr_t)(&(var.TCoef3))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef3");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef3\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef4";info.offset=(caddr_t)(&(var.TCoef4))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef4");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef4\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef5";info.offset=(caddr_t)(&(var.TCoef5))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef5");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef5\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef6";info.offset=(caddr_t)(&(var.TCoef6))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef6");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef6\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef7";info.offset=(caddr_t)(&(var.TCoef7))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef7");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef7\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.TCoef8";info.offset=(caddr_t)(&(var.TCoef8))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"TCoef8");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field TCoef8\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.openstate1";info.offset=(caddr_t)(&(var.openstate1))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"openstate1");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field openstate1\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.openstate2";info.offset=(caddr_t)(&(var.openstate2))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"openstate2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field openstate2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.Kd";info.offset=(caddr_t)(&(var.Kd))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Kd");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field Kd\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.nbinding_sites";info.offset=(caddr_t)(&(var.nbinding_sites))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"nbinding_sites");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field nbinding_sites\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_GPROTEIN_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_GPROTEIN_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GEN_GPROTEIN_type",fields);
}
void INFO_GEN_gap_type(){
struct GEN_gap_type var;Info info;char fields[2500];fields[0]='\0';info.name="GEN_gap_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GEN_gap_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Vk2";info.offset=(caddr_t)(&(var.Vk2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Vk2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Ik2";info.offset=(caddr_t)(&(var.Ik2))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik2");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Ik2\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.alpha_A";info.offset=(caddr_t)(&(var.alpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field alpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.alpha_B";info.offset=(caddr_t)(&(var.alpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field alpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.alpha_C";info.offset=(caddr_t)(&(var.alpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field alpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.alpha_D";info.offset=(caddr_t)(&(var.alpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field alpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.alpha_F";info.offset=(caddr_t)(&(var.alpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"alpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field alpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.beta_A";info.offset=(caddr_t)(&(var.beta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field beta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.beta_B";info.offset=(caddr_t)(&(var.beta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field beta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.beta_C";info.offset=(caddr_t)(&(var.beta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field beta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.beta_D";info.offset=(caddr_t)(&(var.beta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field beta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.beta_F";info.offset=(caddr_t)(&(var.beta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"beta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field beta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_gap_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_gap_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GEN_gap_type",fields);
}
void INFO_GEN_tabchan_type(){
struct GEN_tabchan_type var;Info info;char fields[2500];fields[0]='\0';info.name="GEN_tabchan_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GEN_tabchan_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S14";info.offset=(caddr_t)(&(var.S14))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S15";info.offset=(caddr_t)(&(var.S15))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S21";info.offset=(caddr_t)(&(var.S21))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S22";info.offset=(caddr_t)(&(var.S22))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S23";info.offset=(caddr_t)(&(var.S23))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S24";info.offset=(caddr_t)(&(var.S24))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.S25";info.offset=(caddr_t)(&(var.S25))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.malpha";info.offset=(caddr_t)(&(var.malpha))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field malpha\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.mbeta";info.offset=(caddr_t)(&(var.mbeta))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field mbeta\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.halpha";info.offset=(caddr_t)(&(var.halpha))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field halpha\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.hbeta";info.offset=(caddr_t)(&(var.hbeta))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field hbeta\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.Ca_binding_scaling";info.offset=(caddr_t)(&(var.Ca_binding_scaling))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Ca_binding_scaling");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field Ca_binding_scaling\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.use_Ca_binding_scaling";info.offset=(caddr_t)(&(var.use_Ca_binding_scaling))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"use_Ca_binding_scaling");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field use_Ca_binding_scaling\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.assume_tabchannel_type_ODE";info.offset=(caddr_t)(&(var.assume_tabchannel_type_ODE))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"assume_tabchannel_type_ODE");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field assume_tabchannel_type_ODE\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.num_Xgate";info.offset=(caddr_t)(&(var.num_Xgate))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"num_Xgate");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field num_Xgate\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.num_Ygate";info.offset=(caddr_t)(&(var.num_Ygate))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"num_Ygate");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field num_Ygate\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GEN_tabchan_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GEN_tabchan_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GEN_tabchan_type",fields);
}
void INFO_logistic_type(){
struct logistic_type var;Info info;char fields[2500];fields[0]='\0';info.name="logistic_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="logistic_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.tmin";info.offset=(caddr_t)(&(var.tmin))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"tmin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field tmin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.size";info.offset=(caddr_t)(&(var.size))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"size");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field size\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.current";info.offset=(caddr_t)(&(var.current))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"current");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field current\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.start";info.offset=(caddr_t)(&(var.start))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"start");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field start\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.end";info.offset=(caddr_t)(&(var.end))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"end");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field end\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.event_size";info.offset=(caddr_t)(&(var.event_size))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"event_size");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field event_size\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.event";info.offset=(caddr_t)(&(var.event))-(caddr_t)(&var);		info.type="event_type";info.type_size=sizeof(struct event_type);__IFI(1);InfoHashPut(&info);strcat(fields,"event");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field event\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.input";info.offset=(caddr_t)(&(var.input))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"input");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field input\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.state";info.offset=(caddr_t)(&(var.state))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"state");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field state\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.gain";info.offset=(caddr_t)(&(var.gain))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"gain");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field gain\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.amplitude";info.offset=(caddr_t)(&(var.amplitude))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"amplitude");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field amplitude\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="logistic_type.thresh";info.offset=(caddr_t)(&(var.thresh))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"thresh");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object logistic_type, field thresh\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("logistic_type",fields);
}
void INFO_GENVhalf_type(){
struct GENVhalf_type var;Info info;char fields[2500];fields[0]='\0';info.name="GENVhalf_type";info.type_size=sizeof(var);InfoHashPut(&info);
__BZ;info.name="GENVhalf_type.name";info.offset=(caddr_t)(&(var.name))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(1);InfoHashPut(&info);strcat(fields,"name");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field name\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.index";info.offset=(caddr_t)(&(var.index))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"index");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field index\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.object";info.offset=(caddr_t)(&(var.object))-(caddr_t)(&var);		info.type="object_type";info.type_size=sizeof(struct object_type);__IFI(1);InfoHashPut(&info);strcat(fields,"object");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field object\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.flags";info.offset=(caddr_t)(&(var.flags))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"flags");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field flags\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.nextfields";info.offset=(caddr_t)(&(var.nextfields))-(caddr_t)(&var);		info.type="short";info.type_size=sizeof(short);InfoHashPut(&info);strcat(fields,"nextfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field nextfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.extfields";info.offset=(caddr_t)(&(var.extfields))-(caddr_t)(&var);		info.type="char";info.type_size=sizeof(char);__IFI(2);InfoHashPut(&info);strcat(fields,"extfields");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field extfields\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.x";info.offset=(caddr_t)(&(var.x))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"x");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field x\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.y";info.offset=(caddr_t)(&(var.y))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"y");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field y\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.z";info.offset=(caddr_t)(&(var.z))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"z");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field z\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.nmsgin";info.offset=(caddr_t)(&(var.nmsgin))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field nmsgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.msgin";info.offset=(caddr_t)(&(var.msgin))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgin");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field msgin\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.msgintail";info.offset=(caddr_t)(&(var.msgintail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgintail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field msgintail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.nmsgout";info.offset=(caddr_t)(&(var.nmsgout))-(caddr_t)(&var);		info.type="unsigned int";info.type_size=sizeof(unsigned int);InfoHashPut(&info);strcat(fields,"nmsgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field nmsgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.msgout";info.offset=(caddr_t)(&(var.msgout))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgout");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field msgout\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.msgouttail";info.offset=(caddr_t)(&(var.msgouttail))-(caddr_t)(&var);		info.type="Msg";info.type_size=sizeof(Msg);__IFI(1);InfoHashPut(&info);strcat(fields,"msgouttail");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field msgouttail\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.compositeobject";info.offset=(caddr_t)(&(var.compositeobject))-(caddr_t)(&var);		info.type="GenesisObject";info.type_size=sizeof(GenesisObject);__IFI(1);InfoHashPut(&info);strcat(fields,"compositeobject");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field compositeobject\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.componentof";info.offset=(caddr_t)(&(var.componentof))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"componentof");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field componentof\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.parent";info.offset=(caddr_t)(&(var.parent))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"parent");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field parent\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.child";info.offset=(caddr_t)(&(var.child))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"child");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field child\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.next";info.offset=(caddr_t)(&(var.next))-(caddr_t)(&var);		info.type="Element";info.type_size=sizeof(Element);__IFI(1);InfoHashPut(&info);strcat(fields,"next");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field next\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.activation";info.offset=(caddr_t)(&(var.activation))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"activation");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field activation\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Vk";info.offset=(caddr_t)(&(var.Vk))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Vk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Vk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Ek";info.offset=(caddr_t)(&(var.Ek))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ek");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Ek\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Ik";info.offset=(caddr_t)(&(var.Ik))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Ik");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Ik\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Gk";info.offset=(caddr_t)(&(var.Gk))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Gk");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Gk\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Gmax";info.offset=(caddr_t)(&(var.Gmax))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"Gmax");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Gmax\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Nt";info.offset=(caddr_t)(&(var.Nt))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"Nt");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Nt\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.No";info.offset=(caddr_t)(&(var.No))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"No");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field No\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S11";info.offset=(caddr_t)(&(var.S11))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S11");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S11\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S12";info.offset=(caddr_t)(&(var.S12))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S12");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S12\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S13";info.offset=(caddr_t)(&(var.S13))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S13");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S13\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S14";info.offset=(caddr_t)(&(var.S14))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S14");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S14\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S15";info.offset=(caddr_t)(&(var.S15))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S15");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S15\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S21";info.offset=(caddr_t)(&(var.S21))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S21");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S21\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S22";info.offset=(caddr_t)(&(var.S22))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S22");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S22\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S23";info.offset=(caddr_t)(&(var.S23))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S23");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S23\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S24";info.offset=(caddr_t)(&(var.S24))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S24");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S24\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.S25";info.offset=(caddr_t)(&(var.S25))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"S25");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field S25\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.malpha_A";info.offset=(caddr_t)(&(var.malpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field malpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.malpha_B";info.offset=(caddr_t)(&(var.malpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field malpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.malpha_C";info.offset=(caddr_t)(&(var.malpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field malpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.malpha_D";info.offset=(caddr_t)(&(var.malpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field malpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.malpha_F";info.offset=(caddr_t)(&(var.malpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field malpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.mbeta_A";info.offset=(caddr_t)(&(var.mbeta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field mbeta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.mbeta_B";info.offset=(caddr_t)(&(var.mbeta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field mbeta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.mbeta_C";info.offset=(caddr_t)(&(var.mbeta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field mbeta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.mbeta_D";info.offset=(caddr_t)(&(var.mbeta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field mbeta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.mbeta_F";info.offset=(caddr_t)(&(var.mbeta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field mbeta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.halpha_A";info.offset=(caddr_t)(&(var.halpha_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field halpha_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.halpha_B";info.offset=(caddr_t)(&(var.halpha_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field halpha_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.halpha_C";info.offset=(caddr_t)(&(var.halpha_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field halpha_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.halpha_D";info.offset=(caddr_t)(&(var.halpha_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field halpha_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.halpha_F";info.offset=(caddr_t)(&(var.halpha_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field halpha_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.hbeta_A";info.offset=(caddr_t)(&(var.hbeta_A))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_A");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field hbeta_A\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.hbeta_B";info.offset=(caddr_t)(&(var.hbeta_B))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_B");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field hbeta_B\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.hbeta_C";info.offset=(caddr_t)(&(var.hbeta_C))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_C");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field hbeta_C\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.hbeta_D";info.offset=(caddr_t)(&(var.hbeta_D))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_D");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field hbeta_D\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.hbeta_F";info.offset=(caddr_t)(&(var.hbeta_F))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta_F");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field hbeta_F\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.malpha";info.offset=(caddr_t)(&(var.malpha))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"malpha");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field malpha\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.mbeta";info.offset=(caddr_t)(&(var.mbeta))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"mbeta");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field mbeta\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.halpha";info.offset=(caddr_t)(&(var.halpha))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"halpha");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field halpha\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.hbeta";info.offset=(caddr_t)(&(var.hbeta))-(caddr_t)(&var);		info.type="float";info.type_size=sizeof(float);InfoHashPut(&info);strcat(fields,"hbeta");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field hbeta\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.num_Xgate";info.offset=(caddr_t)(&(var.num_Xgate))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"num_Xgate");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field num_Xgate\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.num_Ygate";info.offset=(caddr_t)(&(var.num_Ygate))-(caddr_t)(&var);		info.type="int";info.type_size=sizeof(int);InfoHashPut(&info);strcat(fields,"num_Ygate");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field num_Ygate\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.telapsed";info.offset=(caddr_t)(&(var.telapsed))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"telapsed");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field telapsed\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.randn";info.offset=(caddr_t)(&(var.randn))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"randn");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field randn\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Vhalf";info.offset=(caddr_t)(&(var.Vhalf))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Vhalf");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Vhalf\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.Vslope";info.offset=(caddr_t)(&(var.Vslope))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"Vslope");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field Vslope\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
__BZ;info.name="GENVhalf_type.tau";info.offset=(caddr_t)(&(var.tau))-(caddr_t)(&var);		info.type="double";info.type_size=sizeof(double);InfoHashPut(&info);strcat(fields,"tau");strcat(fields,"\n");
if (strlen(fields) > 2500) { Error(); printf("Field size too long for object GENVhalf_type, field tau\n**See sys/code_sym.c and increase the value of MAX_FIELDS_SIZE\n\n"); }
FieldHashPut("GENVhalf_type",fields);
}
#undef __BZ
#undef __IFI
#undef __IFT
#undef __IND
#undef __IDS
void DATA_porelib_dave(){
INFO_K_pore_type2();
INFO_Na_pore_type2();
INFO_GENsyn_pore_type();
INFO_GENsyn_pore3D_type();
INFO_GENvg_pore_type();
INFO_GEN_GPROTEIN_type();
INFO_GEN_gap_type();
INFO_GEN_tabchan_type();
INFO_logistic_type();
INFO_GENVhalf_type();
}
