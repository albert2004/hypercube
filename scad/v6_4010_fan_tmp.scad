$fn=90;

module v6_4010_fan() {
   difference() {
      union() {
         hull() {
            translate([0,0,1]) cube([41,41,2],true);
            translate([0,0,7.5+4]) cube([26,26,1],true);
         }
         translate([0,0,27.49]) cube([26,26,31],true);
         hull() {
            translate([0,0,43]) rotate([0,90,0]) cylinder(d=26,h=29,center=true);
            translate([0,20,43]) cube([29,2,26],true);
         }
      }
      for(rotate=[0,90,180,270]) {
         rotate([0,0,rotate]) translate([-16,16,-0.01]) {
            cylinder(d=3.5,h=10,center=false);
            hull() {
               translate([0,0,2]) rotate([0,0,45]) cylinder(d=6.7,h=10,center=false,$fn=6);
               translate([-3,3,2]) cylinder(d=6.7,h=10,center=false,$fn=6);
            }
         }
      }
      hull() {
         translate([0,0,-0.01]) cylinder(d=36,h=1,center=false);
         translate([0,0,12]) cube([22.5,22.5,1],true);
      }
      translate([0,0,12]) cube([22.5,22.5,62],true);
      hull() {
         translate([0,0,43]) rotate([0,90,0]) cylinder(d=22.5,h=26.5,center=true);
         translate([0,11,43]) cube([26.5,22.5,22.5],true);
      }
   //   translate([0,0,48]) cube([8,30,2.5],true);
      translate([0,0,43]) rotate([0,90,0]) cylinder(d=18,h=30,center=true);
      hull() {
         translate([-5,0,43]) rotate([0,90,0]) cylinder(d=18,h=30,center=true);
         translate([-5,20,43]) rotate([0,90,0]) cylinder(d=18,h=30,center=true);
      }
   //   translate([0,0,65]) cube([30,30,20],true);
   }
}

v6_4010_fan();