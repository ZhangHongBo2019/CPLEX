/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-10 at обнГ6:58:50
 *********************************************/
int nbItems=...;
int nbResources=...;
range Items=1..nbItems;
range Resources=1..nbResources;
int capacity[Resources]=...;
int use[Resources][Items]=...;
int value[Items]=...;
int maxItems=max(r in Resources)capacity[r];
dvar int take[Items] in 0..maxItems;
constraint ct;
maximize
  sum(i in Items)take[i]*value[i];
subject to{
ct=forall(r in Resources)
sum(i in Items)use[r][i]*take[i]<=capacity[r];
}