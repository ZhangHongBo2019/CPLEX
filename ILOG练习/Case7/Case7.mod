/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-9 at обнГ7:09:16
 *********************************************/
int nbItems=...;
float limitweight=...;
range Items=1..nbItems;
int value[Items]=...;
float weight[Items]=...;
dvar int take[Items] in 0..1;
constraint ct;
maximize
  sum(i in Items)(value[i]*take[i]);
subject to{
ct=sum(i in Items)weight[i]*take[i]<=limitweight;
}
