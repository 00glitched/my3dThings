// Y trafo screw dist  = 46mm
// Z trafo max thic    = 38mm
// Y pot-pot dist      = 18mm
// Z pot front depth   =  5mm

tol=0.1;    // [mm]
Ds  = 69;   // speaker
DsH =2.5;   // holes
SQs = 78;   // square
SQh = 60;     // sq for holes
Dm  = 70;   // membrane
perf = 4;   // perforations
width=10;   // thickness
prop = 2;
xlen = prop*Dm;
ylen = prop*Dm;
zlen = prop*Dm;
screwQuant = 8;
difference()
{
    cube([xlen+2*width, ylen+2*width, zlen],center = true);
    
    cube([xlen, ylen, zlen+tol], center = true);
    
    rotate([90,0,0])
    {
        cylinder(h=ylen+2*width+tol, d=Dm, center=true);
        for(i=[0:1:screwQuant-1])
        {
            rotate([0,0,i*360/screwQuant])
            {
                translate([0,DsH*2+Dm/2,0])
                {
                    cylinder(h=ylen+perf, d=DsH, center=true);
                }
            }
        }
    }
    /*rotate([0,0,0])
    {
        cylinder(h=xlen+2*width+tol, d=Dm, center=true);
        for(i=[0:1:screwQuant-1])
        {
            rotate([0,0,i*360/screwQuant])
            {
                translate([0,DsH*2+Dm/2,0])
                {
                    cylinder(h=ylen+perf, d=DsH, center=true);
                }
            }
        }
    }*/
}

translate([0,0,-zlen/2])
{
    difference()
    {
        cube([xlen+2*width,ylen+2*width,width],center=true);
        
        translate([0.1*xlen,0,0])
        {
            cylinder(h=width+tol, d=Ds, center=true);
            translate([0,0,(-width)/2])
            {
                cube([SQs,SQs,perf+tol],center=true);
                cylinder(h=2*perf+tol, d=SQs, center=true);
                
                for(i=[0:90:270])
                {
                    rotate([0,0,i])
                    {
                        translate([SQh/2,SQh/2,0])
                        {
                            cylinder(h=4*perf+tol, d=DsH, center=true);
                        }
                    }
                }
            }
        }
    }
}