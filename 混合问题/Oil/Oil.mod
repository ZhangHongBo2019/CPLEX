/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-12 at ÏÂÎç2:23:48
 *********************************************/
{string} Gasolines=...;
{string} Oils=...;
tuple gasoType{
float demand;
float price;
float octane;
float lead;
}
tuple oilType{
float capacity;
float price;
float octane;
float lead;
}
gasoType Gas[Gasolines]=...;
oilType Oil[Oils]=...;
float Maxprod=...;
float ProdCost=...;
dvar float+ Blend[Oils][Gasolines];
dvar float+ Prom[Gasolines];
//constraint naming
constraint ct1;
constraint ct2;
constraint ct3;
constraint ct4;
constraint ct5;
maximize
  sum(g in Gasolines,o in Oils)Blend[o][g]*(Gas[g].price-Oil[o].price-ProdCost)
    -sum(g in Gasolines)Prom[g];
subject to{
ct1=forall(g in Gasolines)
sum(o in Oils)Blend[o][g]==Gas[g].demand+10*Prom[g];
ct2=forall(o in Oils)
sum(g in Gasolines)Blend[o][g]<=Oil[o].capacity;
ct3=sum(o in Oils,g in Gasolines)
Blend[o][g]<=Maxprod;
ct4=forall(g in Gasolines)
sum(o in Oils)Blend[o][g]*(Oil[o].octane-Gas[g].octane)>=0;
ct5=forall(g in Gasolines)
sum(o in Oils)Blend[o][g]*(Oil[o].lead-Gas[g].lead)<=0;
}