/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-7 at ÏÂÎç6:27:11
 *********************************************/
{string} Products=...;
{string} Resources=...;
tuple ProductData{
float demand;
float consumption[Resources];
float insideCost;
float outsideCost;
}
ProductData product[Products]=...;
float capacity[Resources]=...;
dvar float+ inside[Products];
dvar float+ outside[Products];
minimize
  sum(p in Products)(product[p].insideCost*inside[p]+product[p].outsideCost*outside[p]);
subject to{
forall(p in Products)
  inside[p]+outside[p]>=product[p].demand;
forall(r in Resources)
  sum(p in Products)product[p].consumption[r]*inside[p]<=capacity[r];
}