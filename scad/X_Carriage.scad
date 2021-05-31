// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

module orig() {
   import("X_Carriage_1.0.stl");
   translate([0,-15.25,0]) rotate([180,0,0]) import("Extruder_Mount_1.0.stl");
}

$fn=64;

square_nut_add = 0.5;

module belt_tensioner() {
   corner_r = 1;
   translate([0,0,-2.41]) linear_extrude(8+2.41+4) offset(r=corner_r) offset(r=-corner_r)
      polygon([[-22.5,-19],[-12.5,-19],[-12.5,-9],[-14.5,-9],
               [-14.5,corner_r],[-20.5,corner_r],[-20.5,-9],[-22.5,-9],[-22.5,-12.4]]);
}

module belt_tensioner_holes() {
   translate([-17.5,-12.5,9+4]) rotate([180,0,0]) cylinder(d=4.5,h=8,center=false);
   translate([-20.51,-5.5,3.5]) rotate([0,90,0]) m3_screw_mount_no_head(length=6.1,
      nut_offset=2, add_cut=0, side_hole=true);
   translate([-17.45,-5.5,0]) cube([2.1,7,0.4],true);
   for(i=[-19.5,-17.5,-15.5]) {
      translate([i,-2,7.4]) rotate([90,0,0]) cylinder(d=1.2,h=7,center=false);
   }
   translate([-21,-9,7.4]) cube([7,7,6],false);
   translate([-21,-9,8]) cube([7,10,4.1],false);
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

module m3_screw_mount_no_head(length=10, nut_offset=4, add_cut=0.2, side_hole_len=10, side_hole=false) {
   cylinder(d=3.5,h=length,center=false);
   translate([0,0,nut_offset]) rotate([0,0,45]) cylinder(d=(5.44+square_nut_add)*1.41,h=2.3,center=false,$fn=4);
   if(add_cut != 0) {
      translate([0,0,nut_offset+2.3]) {
         cube([3.5,5.44+square_nut_add,add_cut*2],true);
         translate([0,0,add_cut-0.01]) cube([3.5,3.5,add_cut*2],true);
      }
   }
   if(side_hole) {
      translate([0,-(5.54+square_nut_add)/2,nut_offset])cube([side_hole_len,5.54+square_nut_add,2.2],false);
   }
}

module belt_tensioner_one_side_holes() {
   translate([0,0,13.4]) belt_tensioner_holes();
   mirror([0,1,0]) translate([0,0,13.4]) belt_tensioner_holes();
}

module belt_tensioner_one_side() {
   translate([0,0,13.4]) belt_tensioner();
   mirror([0,1,0]) translate([0,0,13.4]) belt_tensioner();
}

module belt_tensioner_cut() {
   translate([0,0,-3.5]) linear_extrude(30) offset(r=-1) offset(r=1)
      polygon([[-40,-33.5],[-27.5,-33.5],[-27.5,-20],[-22.5,-20],[-22.5,-9],[-20.5,-9],
               [-20.5,9],[-22.5,9],[-22.5,23],[-27.5,23],[-27.5,33.5],[-40,33.5]]);
   translate([0,0,-13.5]) linear_extrude(30) offset(r=-1) offset(r=1)
      polygon([[-22.5,15],[-22.5,23],[-27.5,23],[-27.5,33.5],[-40,33.5]]);
   translate([0,0,3.4]) linear_extrude(10) offset(r=-1) offset(r=1)
      polygon([[-40,-33.5],[-22.5,-33.5],[-22.5,-9],[-20.5,-9],
               [-20.5,9],[-22.5,9],[-22.5,33.5],[-40,33.5]]);
}

module belt_tensioner_cut_no_opto() {
   mirror([1,0,0]) translate([0,0,-3.5]) linear_extrude(30) offset(r=-1) offset(r=1)
      polygon([[-40,-33.5],[-22.5,-33.5],[-22.5,-9],[-20.5,-9],
               [-20.5,9],[-22.5,9],[-22.5,33.5],[-40,33.5]]);
}

module m3_mount(length=10) {
   cylinder(d=6.2,h=3.2,center=false);
   cylinder(d=3.5,h=length,center=false);
   translate([0,0,3.3]) cube([8,3.5,0.21],true);
   translate([0,0,3.5]) cube([3.5,3.5,0.21],true);
}

module opto_mount2() {
   hull() {
      translate([0,-20, -1]) cube([30,43,0.1],false);
      translate([0,-14.5, 5]) cube([30,29,0.1],false);
   }
   hull() {
      translate([0,-14.5, 5]) cube([30,29,0.1],false);
      translate([0,-12, 10]) cube([30,24,0.1],false);
   }
   hull() {
      translate([15,-12, 10]) cube([15,24,0.1],false);
      translate([20.6,-8, 13.5]) cube([15,16,0.1],false);
   }
}

module opto_mount() {
   translate([22,9.5,-9.1]) m3_mount();
   translate([22,-9.5,-9.1]) m3_mount();
   translate([15,14,-9.1]) cube([15,9,6],false);
   translate([15,-7,-5]) cube([15,14,6],false);
   translate([15,-20,-3.5]) cube([15,43,2.51],false);
   hull() {
      translate([15,-20, -1]) cube([15,43,0.1],false);
      translate([15,-14.5, 5]) cube([15,29,0.1],false);
   }
   hull() {
      translate([15,-14.5, 5]) cube([15,29,0.1],false);
      translate([15,-12, 10]) cube([15,24,0.1],false);
   }
   hull() {
      translate([15,-12, 10]) cube([15,24,0.1],false);
      translate([20.6,-8, 13.5]) cube([15,16,0.1],false);
   }
}

module x_carriage() {
   difference() {
      union() {
         translate([0,0,-9]) linear_extrude(20) offset(r=1) offset(r=-1)
            polygon([[-27.5,-32.5],[27.5,-32.5],[27.5,32.5],[-27.5,32.5]]);
         for(y=[22.5,-22.5]) {
            minkowski() {
               translate([-26.5+5,y,12]) rotate([0,90,0]) cylinder(d=19.1+4-2,h=43,center=false);
               sphere(r=1);
            }
         }
         translate([-14.5,-17.2,10.99]) cube([29,34.4,6.31],false);
         belt_tensioner_one_side();
         mirror([1,0,0]) belt_tensioner_one_side();
      }
      belt_tensioner_one_side_holes();
      mirror([1,0,0]) belt_tensioner_one_side_holes();
      belt_tensioner_rail_one_side();
      mirror([1,0,0]) belt_tensioner_rail_one_side();
      for(y=[22.5,-22.5]) {
         translate([-28,y,12]) rotate([0,90,0]) cylinder(d=19.2,h=56,center=false);
      }
      translate([-28,22.5,12]) rotate([90,0,90]) linear_extrude(56) polygon([[0,0],[15,0],[15,15],[-5.3,15],[-5.3,0]]);
      translate([-28,-22.5,12]) rotate([90,0,90]) linear_extrude(56) polygon([[0,0],[-15,0],[-15,15],[5.3,15],[5.3,0]]);
      belt_tensioner_cut();
      belt_tensioner_cut_no_opto();
      translate([0,-35,-10]) cube([30,73,11.8],false);
      opto_mount2();
      mirror([1,0,0]) opto_mount();

      for(y=[27.5,13.75,0,-13.75]) {
         translate([-3,y,-9.01]) m3_screw_mount_no_head(length=12, nut_offset=3,side_hole=true);
      }
      translate([-23,27.5,-9.01]) rotate([0,0,180])
         m3_screw_mount_no_head(length=12, nut_offset=3,side_hole=true);
      for(x=[-10,-23]) {
         translate([x,-32.51,0]) rotate([-90,90,0])
            m3_screw_mount_no_head(length=12, nut_offset=3,side_hole=true,add_cut=0);
      }
      translate([-10,32.51,0]) rotate([90,90,0])
         m3_screw_mount_no_head(length=12, nut_offset=3,side_hole=true,add_cut=0);
   }
}

x_carriage();
//%orig();

// Revision history:
// 2020-04-24: Initial revision - re-creation from STL with modifications
// 2020-04-30: Small updates
// 2021-05-31: Change to 10mm bearings

