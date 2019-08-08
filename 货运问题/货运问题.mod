/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-4-21 at ÏÂÎç3:17:13
 *********************************************/
{string}Cities=...;
{string}Products=...;
float capacity=...;
float supply[Products][Cities]=...;
float demand[Products][Cities]=...;
assert forall(p in Products)
sum(o in Cities)supply[p][o]==sum(d in Cities)demand[p][d];
float cost[Products][Cities][Cities]=...;
dvar float+ trans[Products][Cities][Cities];
minimize sum(p in Products,o,d in Cities)cost[p][o][d]*trans[p][o][d];
constraint ct1;
constraint ct2;
constraint ct3;
subject to{
ct1=forall(p in Products,o in Cities)
sum(d in Cities)trans[p][o][d]==sum(d in Cities)supply[p][o];
ct2=forall(p in Products,d in Cities)
sum(o in Cities)trans[p][o][d]==sum(o in Cities)demand[p][d];
ct3=forall(o,d in Cities)
sum(p in Products)supply[p][o]==sum(p in Products)demand[p][d];
}
