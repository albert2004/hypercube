// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

// M3 nut: head: 5.4mm, rod: 2.93mm
// M3 square: 5.44x1.7
// M3 hexagon: 5.44, 6.2x2.46

square_nut_add = 0.16;

//%import("Y_Carriage_xDia8_LM10UU_1.0.stl");

$fn=90;

module y_carriage_base() {
   difference() {
      union() {
         // body
         difference() {
            linear_extrude(45) offset(r=5) offset(r=-5)
               polygon([[-17.5,-17.5],[17.5,-17.5],[31.5,-3.5],[31.5,3.5],
                  [17.5,17.5],[-17.5,17.5],[-31.5,3.5],[-31.5,-3.5]]);
            translate([0,0,18]) linear_extrude(45-18-6.5-5) offset(r=5.5) offset(r=-5)
               polygon([[-17.5,-17.5],[17.5,-17.5],[31.5,-3.5],[31.5,3.5],
                  [17.5,17.5],[-17.5,17.5],[-31.5,3.5],[-31.5,-3.5]]);
            translate([0,0,18]) linear_extrude(45-18-6.5) offset(r=5.5) offset(r=-5)
               polygon([[-40,-17.5],[40,-17.5],[40,0],[-40,0]]);
            translate([0,0,-0.1]) linear_extrude(46)
               polygon([[11.5,17.51],[17.25,17.51],[17.25,9.85],
                  [23,4.1],[21.9,4.1],[16.5,9.5],[11.5,9.5]]);
            mirror([1,0,0]) translate([0,0,-0.1]) linear_extrude(46)
               polygon([[11.5,17.51],[17.25,17.51],[17.25,9.85],
                  [23,4.1],[21.9,4.1],[16.5,9.5],[11.5,9.5]]);
         }
         translate([0,0,0]) linear_extrude(45) offset(r=2) offset(r=-2)
            polygon([[-12.5,-17.5],[12.5,-17.5],[16.5,-13.5],[16.5,17.5],[-16.5,17.5],[-16.5,-13.5]]);
      }
      // y belt
      translate([-5.5,0,15.25]) cube([9,40,5.5],true);
      // y rail
      rotate([90,0,0]) cylinder(d=19,h=40,center=true);
      // x rails
      for(x_pos = [-22.5,22.5]) {
         translate([x_pos,0,0]) cylinder(d=8.4,h=100,center=true);
      }
      // xy belt1
      intersection() {
         translate([-11,0,0]) rotate([-90,180,-90]) linear_extrude(12)
            offset(r=9.75) offset(r=-9.75)
               polygon([[-30,25.25],[3.6,25.25],[3.6,100],[-30,100]]);
         union() {
            translate([-11,-30,25.25]) cube([11,34,30],false);
            translate([-0.1,-10.45,31]) cube([0.9,34,30],false);
            translate([-0.1,-3.65,25.25]) cube([0.9,10,30],false);
         }
      }
      // xy belt2
      intersection() {
         translate([0,0,0]) rotate([-90,180,-90]) linear_extrude(11)
            offset(r=9.75) offset(r=-9.75)
               polygon([[-3.65,12.5],[40,12.5],[40,100],[-3.65,100]]);
         union() {
            translate([0,-3.65,12.5]) cube([11,7.25,40],false);
            translate([0,-3.65,12.5]) cube([11,30,20],false);
         }
      }
   }
}

module xy_belt_mount() {
   cylinder(d=6.2,h=3.1,center=false);
   cylinder(d=3,h=100,center=false);
   translate([0,0,28.1]) cylinder(d=4.5,h=10,center=false);
}

module x_belt_mount() {
   cylinder(d=6.2,h=3.1,center=false);
   cylinder(d=3,h=14,center=false);
   translate([0,0,9]) rotate([0,0,45]) cylinder(d=(5.44+square_nut_add)*1.41,h=2,center=false,$fn=4);
}

module y_rail_mount() {
   cylinder(d=3.1,h=10,center=false);
   translate([0,0,4]) rotate([0,0,45]) cylinder(d=(5.44+square_nut_add)*1.41,h=2,center=false,$fn=4);
}

module y_carriage_scad() {
   difference() {
      union() {
         y_carriage_base();
         // xy belt1 positioner
         translate([-11.1,-6.365,35.23]) rotate([0,90,0])
            cylinder(d1=5.6,d2=4.6,h=0.9,center=false);
         // xy belt2 positioners
         translate([-0.1,6.365,22.5]) rotate([0,90,0])
            cylinder(d1=5.6,d2=4.6,h=0.9,center=false);
         translate([11.1,6.365,22.5]) rotate([0,-90,0])
            cylinder(d1=5.6,d2=4.6,h=0.9,center=false);
      }
      // xy belt1 mount
      translate([-16.6,-6.365,35.23]) rotate([0,90,0]) xy_belt_mount();
      // xy belt2 mount
      translate([16.6,6.365,22.5]) rotate([0,-90,0]) xy_belt_mount();
      // x belt2 mount
      rotate([0,-90,45]) translate([13,-7,-24.85]) x_belt_mount();
      rotate([0,-90,45]) translate([40,-7,-24.85]) x_belt_mount();
      // x belt1 mount
      mirror([1,0,0]) rotate([0,-90,45]) translate([13,-7,-24.85]) x_belt_mount();
      mirror([1,0,0]) rotate([0,-90,45]) translate([40,-7,-24.85]) x_belt_mount();
      // y rail mount
      translate([12.5,12.5,-0.1]) y_rail_mount();
      translate([-12.5,12.5,-0.1]) y_rail_mount();
      translate([-12.5,-12.5,-0.1]) y_rail_mount();
      translate([12.5,-12.5,-0.1]) y_rail_mount();
   }
}   

y_carriage_scad();

// Revision history:
// 2020-04-08: Initial revision - re-creation from STL
// 2020-04-08: Modify part to include square nuts inside (need print pause)
// 2020-04-09: Add additional rail mount. Move down screw up to help with 3030 profile collision.
