module scrwthrd(){
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
tpH=3;

//sides
flngY = 38;
flngX = 35*2;

//limits
// [108,38,20] [mm]

color([.5,.7,.7])
difference(){
union(){
    cylinder(h=hlH,r=hlDout/2,$fn=lent);
    translate([-flngX/2,-flngY/2,0]) cube([flngX,flngY,tpH]);
    translate([-flngX/2,0,0]) cylinder(h=tpH,r=flngY/2,$fn=lent);
    translate([flngX/2,0,0]) cylinder(h=tpH,r=flngY/2,$fn=lent);
    translate([0,0,tpH]) cylinder(h=tpH,r1=flngY/2,r2=hlDout/2,$fn=lent);
    for(j=[0:1]){
        rotate([0,0,180*j])
        for(i=[0:1]){
            translate([0,0,tpH])
            translate([0,(hlDout+hlDin)/12*cos(180*i),0])
            rotate([90,0,360*(1.05*(i-0.5))])
            translate([0,0,-(hlDout-hlDin)/4])
            linear_extrude((hlDout-hlDin)/2)
            polygon([[0,0],[(flngX+flngY/2)/2,0],[0,(hlH-tpH)/cos(40)]]);
            }}}
    // less:
    translate([0,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=tol+hlDin/2,$fn=lent);
    translate([-flngX/2,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=scwD/2,$fn=lenth);
    translate([flngX/2,0,-tol/2]) cylinder(h=tpH+hlH+tol,r=scwD/2,$fn=lenth);
    translate([0,0,hlH]) cylinder(h=tpH+hlH,r=hlDout/2,$fn=lent);
    for(i=[0:1:3]){
        rotate([0,90,90*i]) translate([-(hlH+2*tpH)/2,0,0]) cylinder(h=hlDout,r=scw2D/2,$fn=lenth);
        }
    }
}