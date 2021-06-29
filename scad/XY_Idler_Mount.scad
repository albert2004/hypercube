// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>
$fn = 64;

module original() {
   translate([7.5,0,0]) import("XY_Idler_Mount_1.1.stl");
}

module XY_Idler_Mount() {
   difference() {
      union() {
         difference() {
            linear_extrude(5) offset(r=2) offset(r=-2) square([25,62.5],true);
            translate([0,0,-1]) 
            linear_extrude(7) polygon([[-12.75,-2],[0,-2],
            [0,-12],[-3,-12],[-3,-15.75],[-12.75,-15.75]]);
         }
         intersection () {
            union() {
               linear_extrude(12) offset(r=2) offset(r=-2)
                  polygon([[-12.5,-14.75],[-4.75,-14.75],[-4.75,-4],[5.2,-4],[5.2,-20.25],
                           [6,-20.25],
                           [30,-20.25],[30,-14.75],
                           [12.5,-14.75],[12.5,7.25],
                           [30,7.25],[30,12.75],
                           [8,12.75],[-12.5,1]]);
               translate([12,-4.4,0]) cube([20,1.3,12],false);
            }
            hull() {
               translate([22.5,-20.25,7]) rotate([-90,0,0]) cylinder(d=10,h=33,center=false);
               translate([-12.5,-20.25,0]) cube([35,33,12],false);
            }
         }
         translate([22.5,-15,7]) rotate([-90,0,0]) cylinder(d1=8.5,d2=5.8,h=1.25,center=false);
         translate([22.5,-12.5+8.7,7]) rotate([90,0,0]) cylinder(d1=8.5,d2=5.8,h=1.25,center=false);
         translate([22.5,7.5,7]) rotate([90,0,0]) cylinder(d1=8.5,d2=5.8,h=1.25,center=false);
         translate([22.5,5-8.7,7]) rotate([-90,0,0]) cylinder(d1=8.5,d2=5.8,h=1.25,center=false);
      }
      translate([0,-3.75,-1]) cylinder(d=10.4,h=14,center=false);
      translate([22.5,-21,7]) {
         rotate([-90,0,0]) cylinder(d=3.5,h=35,center=false);
         rotate([-90,0,0]) cylinder(d=6.2,h=3.85,center=false);
         translate([0,28.5,0]) rotate([-90,0,0]) cylinder(d=4,h=5.4,center=false);
         translate([0,32.8,0]) rotate([-90,0,0]) cylinder(d=4.5,h=1,center=false);
      }
      translate([-12.55,-10.75,6]) {
         rotate([0,90,0]) cylinder(d=3.5,h=26,center=false);
         rotate([0,90,0]) cylinder(d=6.2-1,h=3.85,center=false);
         translate([17.75,0,0]) rotate([0,90,0]) cylinder(d=4,h=6.4,center=false);
         translate([23.1,0,0]) rotate([0,90,0]) cylinder(d=4.5,h=2,center=false);
      }
      hull() {
         translate([-0.25,-25.25,-1]) cylinder(d=6,h=7,center=false);
         translate([0.25,-25.25,-1]) cylinder(d=6,h=7,center=false);
      }
      hull() {
         translate([-0.25,21,-1]) cylinder(d=6,h=7,center=false);
         translate([0.25,21,-1]) cylinder(d=6,h=7,center=false);
         translate([-0.25,14.5,-1]) cylinder(d=6,h=7,center=false);
         translate([0.25,14.5,-1]) cylinder(d=6,h=7,center=false);
      }
   }
}
// 8.6
module screw_pad() {
   difference() {
      hull() {
         translate([-5,0,0]) cylinder(d=12,h=3,center=false);
         translate([5,0,0]) cylinder(d=12,h=3,center=false);
      }
      translate([0,0,-1]) cylinder(d=6,h=5,center=false);
   }
}

//%original();
mirror([1,0,0]) XY_Idler_Mount();
//screw_pad();
