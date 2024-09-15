tol=0.1;    // [mm]
Ds  = 69;   // speaker
DsH =2.5;   // holes
SQs = 78;   // square
SQh = 60;     // sq for holes
Dm  =100;   // membrane
perf = 4;   // perforations
width=10;   // thickness
xlen = 1.25*Dm;
ylen = 1.25*Dm;
zlen = 1.25*Dm;
screwQuant = 12;

cylinder(h=ylen+2*width+tol, d=Dm, center=true);
maxi=screwQuant-1;
for(i=[0:1:screwQuant-1])
{
    rotate([0,0,i*360/screwQuant])
    {
        translate([0,DsH*2+Dm/2,0])
        {
            cylinder(h=ylen, d=DsH, center=true);
        }
    }
}