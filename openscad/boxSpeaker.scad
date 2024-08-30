xscale=1.5;
resize([xscale,1,1])
{
    rotate([45,45,45])
    {
        difference()
        {
            cube([2,2,2],center = true);
            cube([1,3,1], center = true);
        }
    }
}