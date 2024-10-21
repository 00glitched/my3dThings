module scrwthrdo(){
//global
lent=100;   //geometry
lenth=20;  //holes
tol=0.1;
//diameters
hlDin=24;
hlDout=30;
scwD=6;
scw2D=3;
tpD=34;

//heigts
hlH=20*1.25;
tpH=3;
ribH=10;

//sides
flngY = 38;
flngX = 35*2;
defs=5;

color([.5,.7,.7])
rotate([180,0,0])
difference(){
union(){
translate([-flngX/2,-flngY/2,0]) cube([flngX,flngY,tpH]);
translate([-flngX/2,0,0]) cylinder(h=tpH,r=flngY/2,$fn=lent);
translate([flngX/2,0,0]) cylinder(h=tpH,r=flngY/2,$fn=lent);
translate([hlDin/2+defs,0,0]){
for(j=[0:1]){
        rotate([0,0,180*j])
        for(i=[0:1]){
            translate([0,0,tpH])
            translate([0,(hlDout+hlDin)/6*cos(180*i),0])
            rotate([90,0,360*(1.1*(i-0.5))])
            translate([-0.489,0,-(hlDout-hlDin)/4])
            linear_extrude((hlDout-hlDin)/2)
            polygon([[0,0],[(flngX+flngY)/4-defs,0],[0,0.5*(hlH-tpH)]]);
            }}}}
translate([0,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=tol+hlDin/2,$fn=lent);
translate([-flngX/2,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=scwD/2,$fn=lenth);
translate([flngX/2,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=scwD/2,$fn=lenth);
translate([-(flngX+flngY)/2,-flngY/2,tpH+0.5*hlH*0.75]) cube([flngX+flngY,flngY,50]);
}}
//scrwthrdo();