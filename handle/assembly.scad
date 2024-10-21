include <wcylinder.scad>
include <scrwthrd.scad>
include <scrwthrdo.scad>

rotate([0,90,0]){
color(c=[.5,.4,.3]) translate([0,0,95]) wcylinder();
scrwthrd();
translate([0,0,-1.5]) rotate([0,0,0]) scrwthrdo();
    }
