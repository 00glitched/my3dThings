//const
pi = 3.141592653;
//diameters
dm = 20;    //in-wave
DM = 100;   //out-wave
DMo = 120;  //out
DsH = 2;    //Screw
//wave eq.
Amp = 6;    //amplitude
nCurv = 3;  //waves(sine)
lent = 100;  //points & angles number
//general conf.
tol= 0.1;   //tolerance
thic = 2;   //thickness
scrwqnt = 20; //screws number
//sine-polygon
DotArrUP=[ for (i = [0 : 1 : lent]) [0.5*(DM-dm)*i/lent, thic/2+0.5*Amp*sin(nCurv*360*i/lent)] ];
DotArrDW=[ for (i = [0 : 1 : lent]) [0.5*(DM-dm)*(lent-i)/lent, -thic/2+0.5*Amp*sin(nCurv*360*(lent-i)/lent)] ];
difference() {
rotate_extrude($fn=lent) {
    translate([0,-thic/2,0]) { square([dm/2,thic]); }
    translate([dm/2,0,0]) { polygon(concat(DotArrUP,DotArrDW)); }
    translate([DM/2,-thic/2,0]) { square([(DMo-DM)/2,thic]); }
    }
rotate_extrude($fn=lent) { translate([0,-(thic+tol)/2]) { square([DsH/2,thic+tol]); } } 
for(i=[0:1:scrwqnt-1])
        {
            rotate([0,0,i*360/scrwqnt])
            {
                translate([0,(DMo+DM)/4,0])
                {
                    cylinder(h=thic+Amp+tol, d=DsH, center=true, $fn=lent);
                }
            }
        }
    }