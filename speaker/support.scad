module support(){
//const
pi = 3.141592653;
//diameters
sDM = 93;  //speaker
mDM = 100;  //membrane
mDMo = 120; //memb-borders
sdm = 2;    //Screw
Rad = 4; //border rad
//elipse eq.
lent = 100;  //points & angles number
lentc = 10;  //for rounds
dm = 100;    //z diam.
DM = 200;    //x,y diam.
DMh=60;
Hh=20;
excXY=5;
excXZ=0.5;
esc=2;
//general conf.
base = 0.2; //percent of base
bthic = 0.3;
bthich = 0.6;
tol= 0.1;   //tolerance
thic = 5;   //thickness
scrwqnt = 20; //screws number
DotArrUPh=[ for (i = [0 : 1 : lent]) [DMh/2+excXY^2*(i-lent/2)^2/lent^2,Hh*(i-lent/2)/lent] ];
DotArrDWh=[ for (i = [0 : 1 : lent]) [0, Hh*(lent/2-i)/lent] ];    
DotArrUP=[ for (i = [0 : 1 : lent]) [0.5*DM*sin(180*i/lent), 0.5*dm*cos(180*i/lent)] ];
DotArrDW=[ for (i = [0 : 1 : lent]) [0.5*(DM-2*thic)*sin(180*i/lent), 0.5*(dm-2*thic)*cos(180*i/lent)] ];
difference(){
    translate([DM/2-1.2*Hh/2,0,0]) rotate([0,90,0]) scale([esc,esc,esc]) scale([excXZ,1,1]) rotate_extrude($fn=lent) polygon(concat(DotArrUPh,DotArrDWh));
    rotate_extrude($fn=lent) polygon(DotArrUP);
    rotate([0,90,0]) cylinder(h=DM*(1+bthic/2),r=sdm,center=true,$fn=lentc);
    }
}