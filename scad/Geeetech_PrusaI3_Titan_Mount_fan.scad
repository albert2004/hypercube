
// Mocowanie extrudera tytan

$fn = 90;

fan_mount = 1;
front = 2;

motor_x = 129;
motor_y = -24;
motor_z = 173;

module titan_mount() {
   difference() {
      translate([motor_x,motor_y,motor_z]) rotate([0,0,180]) titan_mount_3d_touch();
      translate([129-5,0,194.5-10]) rotate([0,90,0]) {
         translate([0,0,-20]) screw();
         translate([-27.5,0,0]) screw();
         translate([-27.5,0,-20]) screw();
      }
   }
}

titan_mount();

module titan_mount_3d_touch() {
   difference() {
      translate([0,0,49]) rotate([-90,0,0]) union() {
         translate([0,0,-14]) cube([29,50.75,3],false);
         translate([10,0,-11]) cube([3,49,57],center=false);
         if(1 == fan_mount) {
            translate([10,29,46]) cube([3,20,12],center=false);
         }
         translate([0,3,0]) rotate([90,0,0])
            linear_extrude(3)
               polygon(points=[[13,3],[23,3],
                               [23,-11],[29,-11],[29,3],[13,46]]);
         translate([0,49,0]) rotate([90,0,0])
            linear_extrude(3)
               polygon(points=[[13,3],[36,3],[13,46]]);
      }
      translate([14,-11,30]) rotate([-90,0,90]) linear_extrude(5) polygon([[0,0],[14,10],[14,31],[0,31]]);
      translate([9,43/2+3,43/2+3]) {
         rotate([0,90,0]) cylinder(r=11.1,h=5,center=false);
         translate([0,-31/2,-31/2])rotate([0,90,0]) cylinder(r=1.5,h=5,center=false);
         translate([0,31/2,-31/2])rotate([0,90,0]) cylinder(r=1.5,h=5,center=false);
         translate([0,-31/2,31/2])rotate([0,90,0]) cylinder(r=1.5,h=5,center=false);
         translate([0,31/2,31/2])rotate([0,90,0]) cylinder(r=1.5,h=5,center=false);
         if(1 == fan_mount) {
            translate([0,30,-9.5])rotate([0,90,0]) cylinder(r=1.5,h=5,center=false);
            translate([0,30,-19.5])rotate([0,90,0]) cylinder(r=1.5,h=5,center=false);
         }
      }
   }
   rotate([0,0,270]) translate([-3,1,0]) 3d_mount();
}

module screw() {
   translate([0,10,0]) rotate([90,0,0]) cylinder(h=27.8,r=2,center=false);
   translate([0,0,0]) rotate([90,90,0]) cylinder(h=2.35+2,d=6.7,$fn=6,center=false);
   translate([0,-22,0]) rotate([-90,0,0]) cylinder(h=4,r=3.25,center=false);
}

module 3d_mount() {
   difference() {
      translate([0,2,-1.75]) union() {
         cube([14,26,4.75],false);
         translate([0,14,0]) multmatrix(m=[[1,0,0,0],
                       [-1,1,0,0],
                       [0,0,1,0]])
            cube([14,26,4.75],false);
      }
      translate([3,10+7,-2]) cube([15,10,5.75],false);
      translate([-1,10+7+18,-2]) cube([15,10,5.75],false);
      translate([13-8,5.75+7,-2]) cylinder(5.5,1.75,1.75,false);
      translate([13-8,5.75+18.5+7,-2]) cylinder(5.5,1.75,1.75,false);
   }
}
