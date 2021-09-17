$fn=64;

module m3_mount(length=10,top_cut=0) {
   cylinder(d=6.2,h=3.2,center=false);
   cylinder(d=3.5,h=length,center=false);
   if(0 != top_cut) {
      intersection() {
         cylinder(d=6.2,h=10,center=false);
         union() {
            translate([0,0,3.2+0.09]) cube([3.5,10,0.2],true);
            translate([0,0,3.2+0.09+0.2]) cube([3.5,3.5,0.21],true);
         }
      }
   }
}

module belt_hold() {
   difference() {
      union() {
         translate([-0.5,0,-17]) cube([8,5,34],false);
         translate([0,-4.5,-8.5]) cube([7,5,6],false);
         translate([0,-4.5,2.5]) cube([7,5,6],false);
      }
      translate([3.5,3.2+1.9,12.5]) rotate([90,0,0]) m3_mount(top_cut=0.2);
      translate([3.5,3.2+1.9,-12.5]) rotate([90,0,0]) m3_mount(top_cut=0.2);
   }
}

belt_hold();
