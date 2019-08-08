/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-13 at ÉÏÎç11:59:12
 *********************************************/
{string} Warehouses=...;
int nbStores=...;
int Wacost=...;
int capacity[Warehouses]=...;
range Stores=1..nbStores;
int Cost[Stores][Warehouses]=...;
dvar boolean Select[Stores][Warehouses];
dvar boolean open[Warehouses];
//constraint naming 
constraint ct1;
constraint ct2;
constraint ct3;
minimize
  sum(w in Warehouses)
  open[w]*Wacost+sum(s in Stores,w in Warehouses)Select[s][w]*Cost[s][w];
subject to{
ct1=forall(s in Stores)
sum(w in Warehouses)
  Select[s][w]==1;
ct2=forall(w in Warehouses)
sum(s in Stores)Select[s][w]<=capacity[w];
ct3=forall(s in Stores,w in Warehouses)
Select[s][w]<=open[w];
}
execute DISPLAY{
writeln("Select= ,open= ",Select,open);
}