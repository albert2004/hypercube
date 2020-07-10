// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

$fn=90;

module stepper_mount_base() {
   translate([0,0,-1]) linear_extrude(6) offset(r=1) offset(r=-1)
      polygon([[-0.5,-34.75],[7,-34.75],[28,-13.75],[28,29.75+2],[23,34.75+2],
               [-13.5,34.75+2],[-18.5,29.75+2],[-18.5,-2.25],
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
      translate([-15.5,-10,16]) rotate([-90,0,0]) cylinder(d=10.5,h=30,center=false);
      translate([-29,-2.25,-2])cube([10,1,30],false);
      translate([-19.5,-2.25,-2])cube([1,21,20],false);
      translate([22.5,0.25,-2]) cylinder(d=3.5,h=10,center=false);
      translate([22.5,31.25,-2]) cylinder(d=3.5,h=10,center=false);
      translate([-8.5,31.25,-2]) cylinder(d=3.5,h=10,center=false);
      translate([-8.5,31.25,5.01]) rotate([0,180,0]) cylinder(d=6.5,h=3.4,center=false);
      translate([7,15.75,-2]) cylinder(d=22.5,h=10,center=false);

      translate([-28.01,7.75,8.5]) rotate([0,90,0]) cylinder(d=3.5,h=30,center=false);
      translate([-4.49,7.75,8.5]) rotate([0,-90,0]) cylinder(d=6.5,h=3.4,center=false);
      translate([-28.01,7.75,8.5]) rotate([0,90,0]) cylinder(d=3.8,h=5.4,center=false);
      translate([-28.01,7.75,8.5]) rotate([0,90,0]) cylinder(d=4.5,h=1,center=false);

      translate([4.51,-22.25,16]) rotate([0,-90,0]) cylinder(d=6.5,h=20,center=false);

      hull() {
         translate([4.51,-22.25,34]) rotate([0,-90,0]) cylinder(d=6.5,h=20,center=false);
         translate([4.51,-22.25,41]) rotate([0,-90,0]) cylinder(d=6.5,h=20,center=false);
      }

      hull() {
         translate([-15.5,-10,34]) rotate([-90,0,0]) cylinder(d=6.5,h=20,center=false);
         translate([-15.5,-10,41]) rotate([-90,0,0]) cylinder(d=6.5,h=20,center=false);
      }
   }
}

// mirror([1,0,0]) stepper_xy_mount(); // right side
stepper_xy_mount(); // left side
