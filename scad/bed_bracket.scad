// bed_bracket

//40 = 55, 25
// 6mm dziury
$fn=64;

module bed_bracket_55() {
   difference() {
      union() {
         hull() {
            translate([-10,-12,0]) cylinder(d=6,h=25,center=false);
            translate([10,-12,0]) cylinder(d=6,h=25,center=false);
            translate([-10,0,0]) cylinder(d=6,h=25,center=false);
            translate([10,0,0]) cylinder(d=6,h=25,center=false);
            translate([0,55+7-12/2-15,0]) cylinder(d=15.71,h=8,center=false);
         }
         hull() {
            translate([-10,0,0]) cylinder(d=6,h=8,center=false);
            translate([10,0,0]) cylinder(d=6,h=8,center=false);
            translate([0,55+7-12/2,0]) cylinder(d=12,h=8,center=false);
         }
      }
      translate([0,55,-1]) cylinder(d=4,h=30,center=false);
      hull() {
         translate([0,-7,-1]) cylinder(d=6,h=30,center=false);
         translate([0,-17,-1]) cylinder(d=6,h=30,center=false);
      }

      translate([0,-1,15]) rotate([-90,0,0]) cylinder(d=6,h=30,center=false);
      hull() {
         translate([-8,6.5,8]) cylinder(d=3,h=25,center=false);
         translate([8,6.5,8]) cylinder(d=3,h=25,center=false);
         translate([0,45,8]) cylinder(d=10,h=8,center=false);
      }
      translate([0,-15,20]) cube([30,30,30],true);
   }
}

module bed_bracket_25() {
   difference() {
      union() {
         hull() {
            translate([-10,-12,0]) cylinder(d=6,h=25,center=false);
            translate([10,-12,0]) cylinder(d=6,h=25,center=false);
            translate([-10,0,0]) cylinder(d=6,h=25,center=false);
            translate([10,0,0]) cylinder(d=6,h=25,center=false);
            translate([0,25+7-12/2-15,0]) cylinder(d=19.7,h=8,center=false);
         }
         hull() {
            translate([-10,0,0]) cylinder(d=6,h=8,center=false);
            translate([10,0,0]) cylinder(d=6,h=8,center=false);
            translate([0,25+7-12/2,0]) cylinder(d=12,h=8,center=false);
         }
      }
      translate([0,25,-1]) cylinder(d=4,h=30,center=false);
      hull() {
         translate([0,-7,-1]) cylinder(d=6,h=30,center=false);
         translate([0,-17,-1]) cylinder(d=6,h=30,center=false);
      }

      translate([0,-1,15]) rotate([-90,0,0]) cylinder(d=6,h=30,center=false);
      hull() {
         translate([-8,6.5,8]) cylinder(d=3,h=25,center=false);
         translate([8,6.5,8]) cylinder(d=3,h=25,center=false);
         translate([0,25,8]) cylinder(d=10,h=8,center=false);
      }
      translate([0,-15,20]) cube([30,30,30],true);
   }
}

bed_bracket_25();
//bed_bracket_55();
