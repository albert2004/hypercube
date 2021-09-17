$fn=60;

difference() {
   union() {
      linear_extrude(10) offset(r=1) offset(r=-1) polygon([[-7.5,-6],[7.5,-6],[7.5,5],[5,6],[-5,6],[-7.5,5]]);
      linear_extrude(1.6) offset(r=1) offset(r=-1)  polygon([[-7.5,-6],[7.5,-6],[7.5,5],[5,6],[5,14],[-5,14],[-5,6],[-6,5]]);
   }
   translate([0,0,-0.1]) cylinder(d=10.3,h=11,center=false);
   translate([4,0,5]) rotate([0,90,0]) cylinder(d=2.2,h=4,center=false);
}