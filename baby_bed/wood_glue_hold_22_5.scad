// wood glue hold - 22.5 degree

difference() {
   union() {
      translate([-10,10,-10]) cube([36+9.9,90,44],false);
      translate([-10,100,-10]) rotate([0,0,-22.5]) cube([36+9,90,44],false);
   }
   cube([36,100,45],false);
   translate([-10.1,80,0]) cube([36+9.9,20,44],false);
   translate([0,100,0]) rotate([0,0,-22.5]) cube([36,100,45],false);
   translate([-10.1,100,0]) rotate([0,0,-22.5]) cube([36+9,20,44],false);
}

// cube([10,70,40],false);