// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

module orig() {
   import("X_Carriage_1.0.stl");
   translate([0,-15.25,0]) rotate([180,0,0]) import("Extruder_Mount_1.0.stl");
}

$fn=64;

square_nut_add = 0.3;

module belt_tensioner() {
   corner_r = 1;
   difference() {
      translate([0,0,-2.41]) linear_extrude(8+2.41) offset(r=corner_r) offset(r=-corner_r)
         polygon([[-22.5,-17.2],[-12.5,-17.2],[-12.5,-9],[-14.5,-9],
                  [-14.5,corner_r],[-20.5,corner_r],[-20.5,-9],[-21.5,-9],[-22.5,-12.4]]);
      translate([-17.5,-12.5,8.01]) rotate([0,180,0]) m3_screw_mount_no_head(length=7,nut_offset=3);
      translate([-20.51,-5.5,3.5]) rotate([0,90,0]) m3_screw_mount_no_head(length=6.1,nut_offset=2);
      for(i=[-19.5,-17.5,-15.5]) {
         translate([i,-2,7.4]) rotate([90,0,0]) cylinder(d=1.2,h=7,center=false);
      }
      translate([-21,-9,7.4]) cube([7,7,3],false);
   }
}

module belt_tensioner_rail() {
   intersection() {
      translate([0,-2,0]) rotate([90,0,0]) linear_extrude(7) offset(r=5) offset(r=-5)
         polygon([[2,30],[2,11],[50,11],[50,30]]);
      union() {
         translate([2,-9,11]) cube([20,7,2.4],false);
         translate([2,-9,11]) cube([12.51,7,11],false);
      }
   }
}

module belt_tensioner_rail_one_side() {
   belt_tensioner_rail();
   mirror([0,1,0]) belt_tensioner_rail();
}

module m3_screw_mount_no_head(length=10, nut_offset=4) {
   cylinder(d=3.5,h=length,center=false);
   translate([0,0,nut_offset]) rotate([0,0,45]) cylinder(d=(5.44+square_nut_add)*1.41,h=2.1,center=false,$fn=4);
}

module belt_tensioner_one_side() {
   translate([0,0,13.4]) belt_tensioner();
   mirror([0,1,0]) translate([0,0,13.4]) belt_tensioner();
}

module belt_tensioner_cut() {
   translate([0,0,-3.5]) linear_extrude(30) offset(r=-1) offset(r=1)
      polygon([[-40,-32.5],[-27.5,-32.5],[-27.5,-12.5],[-22.5,-12.5],[-21.5,-9],[-20.5,-9],
               [-20.5,9],[-21.5,9],[-22.5,12.5],[-27.5,12.5],[-27.5,32.5],[-40,32.5]]);
}

module m3_mount(length=10) {
   cylinder(d=6.2,h=3.2,center=false);
   cylinder(d=3.5,h=length,center=false);
   translate([0,0,3.3]) cube([8,3.5,0.21],true);
   translate([0,0,3.5]) cube([3.5,3.5,0.21],true);
}


module opto_mount() {
   translate([22,9.5,-9.1]) m3_mount();
   translate([22,-9.5,-9.1]) m3_mount();
   translate([15,14,-9.1]) cube([15,9,6],false);
   translate([15,-7,-5]) cube([15,14,6],false);
   translate([15,-20,-3.5]) cube([15,43,3.51],false);
   multmatrix(m = [[1, 0, 0, 0],
                   [0, 1, -0.21, 0],
                   [0, 0, 1, 0],
                   [0, 0, 0, 1]])
      linear_extrude(height=5, scale=[1,0.7]) polygon([[15,-20],[30,-20],[30,23],[15,23]]);
//   multmatrix(m = [[1, 0, 1.5, -7.2],
//                   [0, 1, 0, 0],
//                   [0, 0, 1, 0],
//                   [0, 0, 0, 1]])
      translate([0,0,4.8]) linear_extrude(height=5.5, scale=[1,0.8])
         polygon([[15,-15.25],[30,-15.25],[30,15.25],[15,15.25]]);
      translate([0,0,9.75]) linear_extrude(height=0.6, scale=[1,1])
         polygon([[15,-12.5],[30,-12.5],[30,12.5],[15,12.5]]);
      translate([0,0,10.34]) linear_extrude(height=4, scale=[1.48,0.5])
         polygon([[15,-12.5],[30,-12.5],[30,12.5],[15,12.5]]);
}  

module x_carriage() {
   difference() {
      union() {
         translate([0,0,-9]) linear_extrude(20) offset(r=1) offset(r=-1)
            polygon([[-27.5,-32.5],[27.5,-32.5],[27.5,32.5],[-27.5,32.5]]);
      for(y=[22.5,-22.5]) {
         minkowski() {
            translate([-26.5,y,12]) rotate([0,90,0]) cylinder(d=15.1+5-2,h=53,center=false);
            sphere(r=1);
         }
      }
         translate([-14.5,-17.2,10.99]) cube([29,34.4,6.31],false);
         belt_tensioner_one_side();
         mirror([1,0,0]) belt_tensioner_one_side();
      }
      translate([-17.5,-12.5,13.4+8.01]) rotate([0,180,0]) m3_screw_mount_no_head(length=7,nut_offset=3);
      mirror([0,1,0]) translate([-17.5,-12.5,13.4+8.01]) rotate([0,180,0]) m3_screw_mount_no_head(length=7,nut_offset=3);
      mirror([1,0,0]) translate([-17.5,-12.5,13.4+8.01]) rotate([0,180,0]) m3_screw_mount_no_head(length=7,nut_offset=3);
      mirror([1,0,0]) mirror([0,1,0]) translate([-17.5,-12.5,13.4+8.01]) rotate([0,180,0]) m3_screw_mount_no_head(length=7,nut_offset=3);
      belt_tensioner_rail_one_side();
      mirror([1,0,0]) belt_tensioner_rail_one_side();
      for(y=[22.5,-22.5]) {
         translate([-28,y,12]) rotate([0,90,0]) cylinder(d=15.1,h=56,center=false);
         translate([-28,y,12]) rotate([90,0,90]) linear_extrude(56) polygon([[0,0],[6,11],[-6,11]]);
      }
      belt_tensioner_cut();
      mirror([1,0,0]) belt_tensioner_cut();
      opto_mount();
      mirror([1,0,0]) opto_mount();

      // extruder mount
      translate([0,0,-9.01]) m3_screw_mount_no_head(length=12, nut_offset=3);
      for(x=[-20,0,20]) {
         for(y=[-27.5,27.5]) {
            translate([x,y,-9.01]) m3_screw_mount_no_head(length=12, nut_offset=3);
         }
      }
      translate([10,-32.51,0]) rotate([-90,0,0]) m3_screw_mount_no_head(length=12, nut_offset=3);
      translate([-10,-32.51,0]) rotate([-90,0,0]) m3_screw_mount_no_head(length=12, nut_offset=3);
      translate([10,32.51,0]) rotate([90,0,0]) m3_screw_mount_no_head(length=12, nut_offset=3);
      translate([-10,32.51,0]) rotate([90,0,0]) m3_screw_mount_no_head(length=12, nut_offset=3);
   }
}

x_carriage();
//%orig();

// Revision history:
// 2020-04-24: Initial revision - re-creation from STL with modifications
