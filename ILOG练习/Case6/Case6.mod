/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-9 at обнГ12:14:09
 *********************************************/
int nbResources=...;
int nbItems=...;
range Items=1..nbItems;
range Resources=1..nbResources;
int capacity[Resources]=...;
int value[Items]=...;
int use[Resources][Items]=...;
int maxValue=max(r in Resources)capacity[r];
dvar int take[Items] in 0..maxValue;
constraint ct;
maximize
  sum(i in Items)(value[i]*take[i]);
subject to{
ct=forall(r in Resources)
sum(i in Items)use[r][i]*take[i]<=capacity[r];
}