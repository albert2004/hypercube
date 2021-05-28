//21v2v12
//9x9x7x3.5x5
$fn=64;

module mount_piles(height = 6, d_add = 0) {
   for(x=[-21/2,21/2]) {
      for(y=[2,14.5]) translate([x,y+0.5,0]) cylinder(d=1.9+d_add,h=height,center=false);
   }
}

module screw_mount() {
   translate([15,5,-50]) cylinder(d=3.5,h=100,center=false);
   translate([-15,20,-50]) cylinder(d=3.5,h=100,center=false);
}

module bottom() {
   difference() {
      union() {
         hull() {
            translate([-26/2,0,-2]) cube([26,26,2],false);
            translate([15,5,-2]) cylinder(d=6,h=2,center=false);
            translate([-15,20,-2]) cylinder(d=6,h=2,center=false);
         }
         mount_piles(6,0);
         for(x=[-21/2,21/2]) {
            translate([x,8.5,1.75]) cube([1,12,3.5],true);
         }
      }
      screw_mount();
   }
}

module top() {
   difference() {
      union() {
         hull() {
            translate([-26/2,0,0]) cube([26,26,2],false);
            translate([15,5,0]) cylinder(d=6,h=2,center=false);
            translate([-15,20,0]) cylinder(d=6,h=2,center=false);
         }
         translate([-10,-10,-4]) cube([10,8,6],false);
         translate([-10,-10,0]) cube([10,10,2],false);
      }
      translate([0,14.5,-1]) cylinder(d=7.5,h=4,center=false);
      translate([0,0,-1]) mount_piles(6,0.6);
      screw_mount();
      translate([-10.1,-7,-1]) rotate([0,90,0]) cylinder(d=3.5,h=10.2,center=false);
   }
}

module arm() {
   difference() {
      hull() {
         translate([0,-8,-4]) cube([10,6,6],false);
         translate([2,-14,-10]) cube([6,12,6],false);
      }
      translate([-0.1,-5,-1]) rotate([0,90,0]) cylinder(d=3.5,h=10.2,center=false);
      translate([5,-5,-1]) rotate([0,90,0]) cylinder(d=4.4,h=10.2,center=false);
      translate([5,-14.1,-7]) rotate([-90,0,0]) cylinder(d=3.5,h=12.2,center=false);
      translate([5,-7,-7]) rotate([-90,0,0]) cylinder(d=4.4,h=12.2,center=false);
   }
}

module 3030_mount() {
   difference() {
      union() {
         translate([-10,-40,-7]) cube([30,20,4],false);
         hull() {
            translate([-10,-24,-7]) cube([30,4,4],false);
            translate([2,-24,0]) cube([6,10,6],false);
         }
      }
      translate([5,-24.1,3]) rotate([-90,0,0]) cylinder(d=3.5,h=12.2,center=false);
      translate([15,-32,-8]) cylinder(d=6,h=10,center=false);
      translate([-5,-32,-8]) cylinder(d=6,h=10,center=false);
   }
}

//bottom();
translate([0,0,10]) top();
//translate([0,-2,10]) arm();
//translate([0,-2,0]) 3030_mount();