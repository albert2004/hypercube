// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

$fn=90;
module y_rail_mount() {
   cylinder(d=6.2,h=3.2,center=false);
   cylinder(d=3.5,h=100,center=false);
   translate([0,0,3.3]) cube([8,3.5,0.21],true);
   translate([0,0,3.5]) cube([3.5,3.5,0.21],true);
}

difference() {
   linear_extrude(12.5) offset(r=5) offset(r=-5)
      polygon([[-17.5,-17.5],[17.5,-17.5],[31.5,-3.5],[31.5,3.5],
         [17.5,17.5],[-17.5,17.5],[-31.5,3.5],[-31.5,-3.5]]);
   translate([0,0,13]) rotate([90,0,0]) cylinder(d=19,h=40,center=true);
   // x rails
   for(x_pos = [-22.5,22.5]) {
      translate([x_pos,0,0]) cylinder(d=11,h=100,center=true);
   }
   // y rail mount
   translate([12.5,12.5,-0.1]) y_rail_mount();
   translate([-12.5,12.5,-0.1]) y_rail_mount();
   translate([-12.5,-12.5,-0.1]) y_rail_mount();
   translate([12.5,-12.5,-0.1]) y_rail_mount();
}

// Revision history:
// 2020-04-20: Initial revision - re-creation from STL
// 2020-04-21: Modify part to not use support under screws
