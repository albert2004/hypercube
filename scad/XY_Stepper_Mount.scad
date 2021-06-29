// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

$fn=90;

// left_side = 7, right side = 2
z_offset = 7;

module stepper_mount_base() {
   translate([0,0,-1+z_offset]) linear_extrude(6) offset(r=1) offset(r=-1)
      polygon([[-0.5,-34.75],[7,-34.75],[28,-13.75],[28,29.75+2],[23,34.75+2],
               [-12,36.75],[-12,-2.25],
               [-28,-2.25],[-28,-7.25],[-0.5,-7.25]]);
   translate([0,0,5]) linear_extrude(46) offset(r=1) offset(r=-1)
      polygon([[-0.5,-34.75],[4.5,-34.75],[4.5,-2.25],[-28,-2.25],[-28,-7.25],[-0.5,-7.25]]);
   difference() {
      translate([0,17.75,0]) rotate([90,0,0]) linear_extrude(20) offset(r=4) offset(r=-4)
         polygon([[-28,-10],[-4.5,-10],[-4.5,18.85],[-11.35,25.7],[-19.65,25.7],[-28,17.35]]);
      translate([-30,-5,-31]) cube([30,30,30],false);
   }
}

module stepper_xy_mount() {
   difference() {
      stepper_mount_base();
      translate([0,0,z_offset]) {
         translate([22.5,0.25,-2]) cylinder(d=3.5,h=10,center=false);
         translate([22.5,31.25,-2]) cylinder(d=3.5,h=10,center=false);
         translate([-8.5,31.25,-2]) cylinder(d=3.5,h=10,center=false);
         translate([-8.5,31.25,5.01]) rotate([0,180,0]) cylinder(d=6.5,h=3.4,center=false);
         hull() {
            translate([7,15.75,-2]) cylinder(d=23,h=10,center=false);
            translate([-4.5,-2.25,-2]) cube([8,10,10],false);
         }
      }
      translate([-15.5,-10,16]) rotate([-90,0,0]) cylinder(d=10.5,h=30,center=false);
      hull() {
         translate([-17.25,-2,12]) rotate([-90,0,0]) cylinder(d=10.5,h=30,center=false);
         translate([-17.25,-2,-5]) rotate([-90,0,0]) cylinder(d=10.5,h=30,center=false);
      }
      translate([0,-11.25,0]) rotate([90,0,180]) linear_extrude(10) offset(r=5.25) offset(r=-5.25)
         polygon([[10.25,-10],[40,-10],[40,45],[10.25,18.35]]);
      translate([-29,-2.25,-2])cube([18.75,1,30],false);
      translate([-19.5,-2.25,-2])cube([1,21,20],false);

      translate([-28.01,7.75,8.5]) rotate([0,90,0]) cylinder(d=3.5,h=30,center=false);
      translate([-28.01,7.75,8.5]) rotate([0,90,0]) cylinder(d=6.5,h=3.4,center=false);
      translate([-4.49,7.75,8.5]) rotate([0,-90,0]) cylinder(d=3.8,h=5.4,center=false);
      translate([-4.49,7.75,8.5]) rotate([0,-90,0]) cylinder(d=4.5,h=1,center=false);

      translate([4.51,-22.25,13+z_offset]) rotate([0,-90,0]) cylinder(d=6.5,h=20,center=false);

      hull() {
         translate([4.51,-22.25,34]) rotate([0,-90,0]) cylinder(d=6.5,h=20,center=false);
         translate([4.51,-22.25,41]) rotate([0,-90,0]) cylinder(d=6.5,h=20,center=false);
      }

      hull() {
         translate([-15.5,-10,34]) rotate([-90,0,0]) cylinder(d=6.5,h=20,center=false);
         translate([-15.5,-10,41]) rotate([-90,0,0]) cylinder(d=6.5,h=20,center=false);
      }
      translate([0,0,-51+z_offset]) cube([100,100,100],true);
   }
}

//mirror([1,0,0]) stepper_xy_mount(); // right side
stepper_xy_mount(); // left side
