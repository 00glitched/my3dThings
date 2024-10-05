//const
pi = 3.141592653;
//diameters
sDM = 70;  //speaker
mDM = 100;  //membrane
mDMo = 120; //memb-borders
sdm = 2;    //Screw
//elipse eq.
lent = 100;  //points & angles number
dm = 100;    //z diam.
DM = 200;    //x,y diam.
//general conf.
tol= 0.1;   //tolerance
thic = 5;   //thickness
scrwqnt = 20; //screws number
DotArrUP=[ for (i = [0 : 1 : lent]) [0.5*DM*sin(180*i/lent), 0.5*dm*cos(180*i/lent)] ];
DotArrDW=[ for (i = [0 : 1 : lent]) [0.5*(DM-2*thic)*sin(180*i/lent), 0.5*(dm-2*thic)*cos(180*i/lent)] ];
rotate_extrude($fn=lent){
    difference(){
        polygon(concat(DotArrUP,DotArrDW));
        translate([0,sDM/2,0])
        square([mDMo,dm+tol],center=true);
        translate([0,-sDM/2,0])
        square([sDM,dm+tol],center=true);}
    translate([(mDM+mDMo)/4, 0.5*(dm*sqrt(1-mDMo^2/DM^2)-thic), 0])
        square([(mDMo-mDM)/2,thic],center=true);}
        