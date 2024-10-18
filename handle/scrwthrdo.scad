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
hlH=20;
tpH=4;

//sides
flngY = 38;
flngX = 35*2;

color([.5,.7,.7])
difference(){
union(){
translate([-flngX/2,-flngY/2,0]) cube([flngX,flngY,tpH]);
translate([-flngX/2,0,0]) cylinder(h=tpH,r=flngY/2,$fn=lent);
translate([flngX/2,0,0]) cylinder(h=tpH,r=flngY/2,$fn=lent);

}

translate([0,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=hlDin/2,$fn=lent);
translate([-flngX/2,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=scwD/2,$fn=lenth);
translate([flngX/2,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=scwD/2,$fn=lenth);
}
}
