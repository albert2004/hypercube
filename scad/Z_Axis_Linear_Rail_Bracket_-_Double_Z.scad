// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

module orig(add_modules = 0) {
  // translate([0,0,2]) rotate([0,0,180]) import("Z_Axis_Linear_Rail_Bracket_-_Double_Z_-_Right_1.1.stl");
   if(add_modules != 0) {
      translate([-24,-20,49]) rotate([-90,-90,0]) import("Z_Axis_Bearing_Holder.3mf");
      translate([-6.5,3.5,52]) rotate([0,90,0]) cylinder(d=10,h=5,center=false);
   }
}

$fn=64;

module z_axis_linear_rail_bracket(cover=0) {
   difference() {
      union() {
         if(0 != cover) {
            difference() {
               translate([0,0,10]) linear_extrude(54) offset(r=2) offset(r=-2)
                  polygon([[-41,-27],[3.5,-27],[3.5,19],[-41,19]]);
               translate([-34-3,-20-3,12]) cube([35.5,32+6,60],false);
            }
         }
         linear_extrude(56.5) offset(r=2) offset(r=-2)
            polygon([[-1.5,-3.25],[2,-9.25],[28.5,-9.25],[28.5,9.25+6.5],[-1.5,9.25+6.5]]);
         linear_extrude(12) offset(r=2) offset(r=-2)
            polygon([[1,-9.25],[28.5,-9.25],[28.5,9.25],[-17.25,9.5],
                     [-28.5,-1.75],[-28.5,-9.75],[-22.5,-15.75],[-5.75,-15.75]]);
      }
      translate([-18.5,-5.75,0]) cylinder(d=12.2,h=50,center=true);
      translate([-17.5,-10,-0.1]) cube([14,1,10.1],false);
      translate([-4.25,-23,-0.1]) cube([1,14,10.1],false);
      translate([18.5,3,49]) cube([30,30,30],true);
      translate([18.5,0.75,39]) cylinder(d=6,h=20,center=true);
      translate([18.5,0.75,0]) cylinder(d=11,h=58.01,center=true);
      intersection() {
         translate([18.5,0.75,29.2]) cylinder(d=11,h=0.4,center=true);
         union() {
            translate([18.5,0.75,29.1]) cube([100,6,0.22],true);
            translate([18.5,0.75,29.3]) cube([6,100,0.22],true);
         }
      }
      hull() for(z=[49,70]) translate([5,3.25,z]) rotate([0,90,0]) cylinder(d=6,h=20,center=true);
      translate([-8.5,-16,4]) rotate([-90,0,0]) m3_screw(25.5);
      translate([-19,-24.5,9.9]) cube([30,30,0.2],true);
   }
}

module m3_screw(length=10) {
   cylinder(d=3.5,h=length,center=false);
   translate([0,0,length-1.15]) rotate([0,0,45]) cylinder(d=5.44*1.41,h=2.3,center=true,$fn=4);
   cylinder(d=6.2,h=3.2,center=false);
}

//orig(1);
mirror([0,1,0])
z_axis_linear_rail_bracket();

// Revision history:
// 2021-09-25: Initial revision - re-creation from STL with modifications
