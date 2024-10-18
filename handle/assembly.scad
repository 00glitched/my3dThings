include <wcylinder.scad>
include <scrwthrd.scad>
include <scrwthrdo.scad>


color(c=[.5,.4,.3]) translate([0,0,110]) wcylinder();
scrwthrd();
translate([0,0,-20]) scrwthrdo();
