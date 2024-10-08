
include <membrane.scad>
include <boxSpeaker2.scad>
rotate([0,30,0]){
color("#00A36C") boxSpeaker2();
color("#36454F") translate([0,0,100]) rotate([0,180,0])membrane();
color("#28282B")
translate([0,0,-100])
rotate([0,180,0])
import("render/speaker.stl");}