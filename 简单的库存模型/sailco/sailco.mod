/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-13 at 下午5:38:45
 *********************************************/
int nbPeriods=...;
range Periods=1..nbPeriods;
int Demand[Periods]=...;
int RegularCost=...;
int ExtraCost=...;
int capacity=...;
int Inventory=...;
int InventoryCost=...;
dvar float+ RegularBoat[Periods];
dvar float+ ExtraBoat[Periods];
dvar float+ Inv[0..nbPeriods];
//constraint naming
constraint ct1;
constraint ct2;
minimize
  sum(p in Periods)(RegularBoat[p]*RegularCost+ExtraBoat[p]*ExtraCost+Inv[p]*InventoryCost);
subject to{
Inv[0]==Inventory;
ct1=forall(p in Periods)
 RegularBoat[p]<=capacity;
ct2=forall(p in Periods)
RegularBoat[p]+ExtraBoat[p]+Inv[p-1]>=Demand[p]+Inv[p];//此处需要注意
}

