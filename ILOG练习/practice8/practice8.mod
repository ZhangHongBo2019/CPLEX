/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-20 at обнГ4:47:03
 *********************************************/
int nbItems=...;
int nbResources=...;
range Items=1..nbItems;
range Resources=1..nbResources;
int capacity[Resources]=...;
int Value[Items]=...;
int use[Resources][Items]=...;
/*int maxValue=max(r in Resources)capacity[r];*/
dvar int+ take[Items]; /*in 0..maxValue;*/
maximize sum(i in Items)(Value[i]*take[i]);
constraint ct;
subject to{
ct=forall(r in Resources)
sum(i in Items)(use[r][i]*take[i])<=capacity[r];
}
