/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-13 at ÏÂÎç4:32:12
 *********************************************/
{string} Products=...;
{string} Resources=...;
{string} Machines=...;
int RentCost[Machines]=...;
int Maxproduction=...;
float capacity[Resources]=...;
tuple ProductType{
float demand;
float insideCost;
float outsideCost;
float consump[Resources];
{string} use;
}
ProductType product[Products]=...;
dvar boolean Rent[Machines];
dvar float+ inside[Products];
dvar float+ outside[Products];
//cosntraint naming
constraint ct1;
constraint ct2;
constraint ct3;
minimize
  sum(p in Products)(inside[p]*product[p].insideCost+outside[p]*product[p].outsideCost)
  +sum(m in Machines)Rent[m]*RentCost[m];
subject to{
ct1=forall(p in Products)
inside[p]+outside[p]>=product[p].demand;
ct2=forall(r in Resources)
sum(p in Products)inside[p]*product[p].consump[r]<=capacity[r];
ct3=forall(p in Products,m in product[p].use)
inside[p]<=Maxproduction*Rent[m];
}