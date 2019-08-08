/*********************************************
 * OPL 12.6.1.0 Model
 * Author: Administrator
 * Creation Date: 2018-9-14 at ÏÂÎç12:47:07
 *********************************************/
using CP;
range r=0..3;
execute{
}
string Colors[r]=["blue","white","yellow","green"];
dvar int Belgium in r;
dvar int Denmark in r;
dvar int France in r;
dvar int Germany in r;
dvar int Luxembourg in r;
dvar int Netherlands in r;
subject to{
Belgium!=France;
Belgium!=Germany;
Belgium!=Netherlands;
Belgium!=Luxembourg;
Denmark!=Germany;
France!=Germany;
France!=Luxembourg;
Germany!=Luxembourg;
Germany!=Netherlands;
}
execute {
writeln("Belgium= ",Colors[Belgium]);
writeln("Denmark= ",Colors[Denmark]);
writeln("France= ",Colors[France]);
writeln("Germany= ",Colors[Germany]);
writeln("Luxembourg= ",Colors[Luxembourg]);
writeln("Netherlands= ",Colors[Netherlands]);
}