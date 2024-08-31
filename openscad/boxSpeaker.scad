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

difference()
{
    cube([xlen+2*width, ylen+2*width, zlen],center = true);
    
    cube([xlen, ylen, zlen+tol], center = true);
    
    rotate([90,0,0])
    {
        cylinder(h=ylen+2*width+tol, d=Dm, center=true);
        difference()
        {
           
               
        }
    }
    rotate([0,90,0])
    {
        cylinder(h=xlen+2*width+tol, d=Dm, center=true);
    }
    
    rotate([0,90,0])
    {
        cylinder(h=xlen+2*width+tol, d=Dm, center=true);
    }
}

translate([0,0,-zlen/2])
{
    difference()
    {
        cube([xlen+2*width,ylen+2*width,width],center=true);
        
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