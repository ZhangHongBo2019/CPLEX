/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-12 at ÏÂÎç7:03:22
 *********************************************/
{string} Cities=...;
{string} Products=...;
float capacity=...;
float supply[Products][Cities]=...;
float demand[Products][Cities]=...;
float Cost[Products][Cities][Cities]=...;
dvar float+ trans[Products][Cities][Cities];
assert forall(p in Products)
sum(d in Cities)demand[p][d]==sum(o in Cities)supply[p][o];
constraint ct1;
constraint ct2;
constraint ct3;
minimize
  sum(p in Products,o,d in Cities)Cost[p][o][d]*trans[p][o][d];
subject to{
ct1=forall(p in Products,o in Cities)
sum(d in Cities)trans[p][o][d]==supply[p][o];
ct2=forall(p in Products,d in Cities)
sum(o in Cities)trans[p][o][d]==demand[p][d];
ct3=forall(o in Cities,d in Cities)
sum(p in Products)trans[p][o][d]<=capacity;
}