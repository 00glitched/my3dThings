module wcylinder(){
//global
lent=50;
//wood-cylinder
cyD=24;
cyH=100-cyD;
color(c=[.3,.2,.1])
union(){
translate([0,0,-cyH/2]) cylinder(h=cyH, r=cyD/2,center=true,$fn=lent);
sphere(r=cyD/2,center=true,$fn=lent);}}