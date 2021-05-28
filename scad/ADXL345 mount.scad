$fn=64;
difference() {
   union() {
      translate([-16,0,0]) cube([32,5,20],false);
      translate([-16,0,0]) rotate([180,-90,0]) linear_extrude(2) polygon([[5,11],[5,0],[20,0]]);
      translate([14,0,0]) rotate([180,-90,0]) linear_extrude(2) polygon([[5,11],[5,0],[20,0]]);
      translate([-16,-11,0]) cube([32,11,5],false);
      for(x=[-7.5,7.5]) { translate([x,-6,0]) cylinder(d=6,h=6,center=false); }
   }
   for(x=[-7.5,7.5]) { translate([x,-6,-1]) cylinder(d=3.5,h=10,center=false); }
   for(x=[-10,10]) { translate([x,-1,17]) rotate([-90,0,0]) cylinder(d=3.5,h=10,center=false); }
}

