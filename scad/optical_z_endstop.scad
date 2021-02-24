// optical Z endstop

$fn=64;

modules = 0;

module rails() {
   translate([-30,0,0]) cube([30,100,30],false);
   translate([5,60,-14]) cube([30,20,20],false);
}

module endstop() {
   difference() {
      union() {
         color([1,0,0]) cube([10,1.5,33],false);
         color([1,1,1]) translate([0,-7,27]) cube([10,7,6],false);
         color([0,0,0]) translate([2,1.5,0.8]) {
            cube([6,3,24.5],false);
            translate([0,3,6]) cube([6,7.2,4.25],false);
            translate([0,3,13.7]) cube([6,7.2,4.25],false);
         }
      }   
      translate([5,-1,3.5]) rotate([-90,0,0]) cylinder(d=3,h=20,center=false);
      translate([5,-1,22.4]) rotate([-90,0,0]) cylinder(d=3,h=20,center=false);
   }
}

if(1 == modules) {
   rails();
   translate([7,33+31,20]) rotate([90,90,0]) endstop();
}

module 2020_pin() {
   difference() {
      union() {
         translate([0,12,0]) cube([16,4,25],false);
         translate([0,0,20]) cube([5,2,20],false);
         translate([0,0,20]) cube([5,13,3],false);
      }
      hull() {
         translate([8,10,5]) cube([4,20,4],center=true);
         translate([8,10,20]) cube([4,20,4],center=true);
      }
   }
}

module 3030_case() {
   difference() {
      union() {
         cube([7,50,20],false);
         translate([-2,0,6]) cube([2,50,8],false);
      }
      translate([5,24.5,5]) cube([2.1,23,10],false);
      translate([3,-1,-1]) cube([5,24,22],false);
      hull() {
         translate([-4,-2,10]) rotate([0,90,0]) cylinder(d=4,h=10,center=false);
         translate([-4,20,10]) rotate([0,90,0]) cylinder(d=4,h=10,center=false);
      }
      translate([-4,26.6,10]) {
         rotate([0,90,0]) cylinder(d=4,h=20,center=false);
         translate([3,0,0]) cube([2.1,5.43,5.43],true);
      }
      translate([-4,45.5,10]) {
         rotate([0,90,0]) cylinder(d=4,h=20,center=false);
         translate([3,0,0]) cube([2.1,5.43,5.43],true);
      }
   }
}

module 3030_m3_nut() {
   difference() {
      union() {
         hull() {
            cylinder(d=7,h=3,center=false);
            translate([7,0,0]) cylinder(d=7,h=3,center=false);
         }
      }
      translate([3.5,0,-1]) cylinder(d=4,h=10,center=false);
      translate([3.5,0,1]) cube([5.43,5.43,2.1],true);
   }
}

// 3030_m3_nut();

/*translate([13,50,-17])*/  2020_pin();
/*translate([0,15,5])*/ // 3030_case();
