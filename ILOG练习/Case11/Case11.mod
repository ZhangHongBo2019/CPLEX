/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-12 at ÉÏÎç10:00:03
 *********************************************/
{string} Gasolines=...;
{string} Oils=...;
tuple gasType{
float demand;
float Price;
float Octane;
float Lead;
}
tuple oilType{
float capacity;
float Price;
float Octane;
float Lead;
}
gasType Gas[Gasolines]=...;
oilType Oil[Oils]=...;
float Maxproduction=...;
float ProdCost=...;
dvar float+ Blend[Oils][Gasolines];
dvar float+ PromCost[Gasolines];
//constraint naming
constraint ct1;
constraint ct2;
constraint ct3;
constraint ct4;
constraint ct5;
maximize
  sum(g in Gasolines,o in Oils)
    Blend[o][g]*(Gas[g].Price-Oil[o].Price-ProdCost)
    -sum(g in Gasolines)PromCost[g];
subject to{
ct1=forall(g in Gasolines)
sum(o in Oils)Blend[o][g]==Gas[g].demand+10*PromCost[g];
ct2=forall(o in Oils)
sum(g in Gasolines)Blend[o][g]<=Oil[o].capacity;
ct3=forall(g in Gasolines)
sum(o in Oils)Blend[o][g]*(Oil[o].Octane-Gas[g].Octane)>=0;
ct4=forall(g in Gasolines)
sum(o in Oils)Blend[o][g]*(Oil[o].Lead-Gas[g].Lead)<=0;
ct5=sum(g in Gasolines,o in Oils)Blend[o][g]<=Maxproduction;
}