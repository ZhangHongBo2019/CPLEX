/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-11 at ÉÏÎç10:36:55
 *********************************************/
int WarehouseCost=...;
{string} Warehouse=...;
int nbStores=...;
range Stores=1..nbStores;
int capacity[Warehouse]=...;
int SupplyCost[Stores][Warehouse]=...;
dvar boolean Open[Warehouse];
dvar boolean Supply[Stores][Warehouse];
//constraint naming
constraint ct1;
constraint ct2;
constraint ct3;
minimize
  (sum(w in Warehouse)Open[w]*WarehouseCost)+(sum(w in Warehouse,s in Stores)Supply[s][w]*Supply[s][w]);
subject to{
ct1=forall(s in Stores)
  sum(w in Warehouse)Supply[s][w]==1;
ct2=forall(w in Warehouse)
sum(s in Stores)Supply[s][w]<=capacity[w];
ct3=forall(s in Stores,w in Warehouse)
Supply[s][w]<=Open[w];
}
