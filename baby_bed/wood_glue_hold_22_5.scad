// wood glue hold - 22.5 degree

difference() {
   union() {
      translate([-4,30,-6]) cube([36+8,70,40],false);
      translate([-4,100,-6]) rotate([0,0,-22.5]) cube([36+8,70,40],false);
   }
   cube([36,100,45],false);
   translate([0,100,0]) rotate([0,0,-22.5]) cube([36,100,45],false);
}
