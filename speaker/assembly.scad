
include <membrane.scad>
include <boxSpeaker2.scad>
include <support.scad>
rotate([0,45,15]){
color("#00A36C") boxSpeaker2();
color("#36454F") translate([0,0,100]) rotate([0,180,0])membrane();
color("#28282B")translate([0,0,-100])rotate([0,180,0])import("render/speaker.stl");
color("#00A36C") translate([50,0,0]) support();
}
