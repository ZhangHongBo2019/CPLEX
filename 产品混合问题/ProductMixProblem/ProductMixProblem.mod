/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-10 at ÏÂÎç8:19:45
 *********************************************/
{string}Products=...;
{string}Resources=...;
tuple ProductData{
int demand;
float insideCost;
float outsideCost;
float consump[Resources];
}
ProductData Product[Products]=...;
int capacity[Resources]=...;
dvar float inside[Products];
dvar float outside[Products];
//constraint naming
constraint ct1;
constraint ct2;
minimize
  sum(p in Products)(Product[p].insideCost*inside[p]+Product[p].outsideCost*outside[p]);
subject to{
ct1=forall(p in Products)
inside[p]+outside[p]>=Product[p].demand;
ct2=forall(r in Resources)
sum(p in Products)inside[p]*Product[p].consump[r]<=capacity[r];
}