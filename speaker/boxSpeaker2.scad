module boxSpeaker2(){
//const
pi = 3.141592653;
//diameters
sDM = 93;  //speaker
mDM = 76;  //membrane
mDMo = 76+20; //memb-borders
sdm = 2;    //Screw
//elipse eq.
lent = 100;  //points & angles number
lents = 10;  //for screw
dm = 100;    //z diam.
DM = 200;    //x,y diam.
//general conf.
tol= 0.1;   //tolerance
thic = 5;   //thickness
scrwqnt = 20; //screws number
DotArrUP=[ for (i = [0 : 1 : lent]) [0.5*DM*sin(180*i/lent), 0.5*dm*cos(180*i/lent)] ];
DotArrDW=[ for (i = [0 : 1 : lent]) [0.5*(DM-2*thic)*sin(180*i/lent), 0.5*(dm-2*thic)*cos(180*i/lent)] ];
difference(){
    rotate_extrude($fn=lent){
        difference(){
            polygon(concat(DotArrUP,DotArrDW));
            translate([0,sDM/2,0])
            square([mDMo,dm+tol],center=true);
            translate([0,-sDM/2,0])
            square([sDM,dm+tol],center=true);}
        translate([(mDM+mDMo)/4, 0.5*(dm*sqrt(1-(mDMo/DM)^2)-thic), 0])
            square([(mDMo-mDM)/2,thic],center=true);}
    for(i=[0:1:scrwqnt-1])
        {
            rotate([0,0,i*360/scrwqnt])
            {
                translate([0,(mDM+mDMo)/4,0.5*(dm*sqrt(1-(mDMo/DM)^2))])
                {
                    cylinder(h=thic+tol, d=sdm, center=true, $fn=lents);
                }
            }
        }
    }
}