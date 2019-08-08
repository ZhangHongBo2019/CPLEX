/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-13 at 上午9:43:59
 *********************************************/
//集覆盖问题Set covering Problems
int nbWorkers=...;
range Workers=1..nbWorkers;
{string} Tasks=...;
{int} Qualified[Tasks]=...;
//assert forall(t in Tasks,i in Qualified[t]) i in asSet(Workers);
//assert forall(t in Tasks)
//card(Qualified[t] inter asSet(Workers))==card(Qualified[t]);
float Cost[Workers]=...;
dvar boolean Hire[Workers];
//constraint naming
constraint ct;
minimize
  sum(c in Workers)Cost[c]*Hire[c];
subject to{
ct=forall(t in Tasks)
sum(c in Qualified[t])
  Hire[c]>=1;
}
{int}Crew={c|c in Workers:Hire[c]==1};
execute DISPLAY{
writeln("Crew= ",Crew);
}