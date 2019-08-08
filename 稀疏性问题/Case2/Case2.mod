/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-12 at 下午7:55:37
 *********************************************/
//稀疏的运输模型
{string} Products=...;
{string} Cities=...;
float capacity=...;
tuple Route{
string p;
string o;
string d;
}
{Route}Routes=...;
tuple Supply{
string p;
string o;
}
{Supply}Supplies={<p,o>|<p,o,d> in Routes};
float supply[Supplies]=...;
tuple Customer{
string p;
string d;
}
{Customer}Customers={<p,d>|<p,o,d> in Routes};
float demand[Customers];
float Cost[Routes]=...;
{string} Orig[p in Products]={o|<p,o,d> in Routes};
{string} Dest[p in Products]={d|<p,o,d> in Routes};
assert forall(p in Products)
sum(o in Orig[p])supply[<p,o>]==sum(d in Dest[p])demand[<p,d>];
dvar float+ trans[Routes];
//constraint naming
constraint ct1;
constraint ct2;
constraint ct3;
minimize
  sum(l in Routes)(trans[l]*Cost[l]);
subject to{
ct1=forall(p in Products,o in Orig[p])
sum(d in Dest[p])trans[<p,o,d>]==supply[<p,o>];
ct2=forall(p in Products,d in Dest[p])
sum(o in Orig[p])trans[<p,o,d>]==demand[<p,d>];
ct3=forall(o,d in Cities)
sum(<p,o,d> in Routes)trans[<p,o,d>]<=capacity;
}