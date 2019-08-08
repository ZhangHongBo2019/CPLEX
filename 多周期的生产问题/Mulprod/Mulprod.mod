/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-11 at ÏÂÎç4:06:58
 *********************************************/
{string}Products=...;
{string}Resources=...;
int nbPeriod=...;
range Periods=1..nbPeriod;
int capacity[Resources]=...;
float demand[Products][Periods]=...;
float insideCost[Products]=...;
float outsideCost[Products]=...;
float consump[Resources][Products]=...;
float Inventory[Products]=...;
float InvCost[Products]=...;
dvar float+ inside[Products][Periods];
dvar float+ outside[Products][Periods];
dvar float+ Inv[Products][0..nbPeriod];
//constraint naming
constraint ct1;
constraint ct2;
constraint ct3;
minimize
  sum(p in Products,t in Periods)
    (inside[p][t]*insideCost[p]+outside[p][t]*outsideCost[p]+Inv[p][t]*InvCost[p]);
subject to{
ct1=forall(t in Periods,p in Products)
  inside[p][t]+outside[p][t]+Inv[p][t-1]==demand[p][t]+Inv[p][t];
ct2=forall(r in Resources,t in Periods)
sum(p in Products)inside[p][t]*consump[r][p]<=capacity[r];
ct3=forall(p in Products)
Inv[p][0]==Inventory[p];    
}
tuple plan{
float inside;
float outside;
float Inv;
}
plan Plan[p in Products][t in Periods]=<inside[p][t],outside[p][t],Inv[p][t]>;
execute DISPLAY{
writeln("plan=",Plan); 
}
