module orig() {
   translate([0,34,0]) rotate([180,180,0]) import("Z_Motor_Mount_1.0.stl");
}

$fn=64;

//%orig();

linear_extrude(5) difference() {
   offset(r=2) offset(r=-2) {
      difference() {
         polygon([[-26.5,0],[26.5,0],[26.5,73],[-26.5,73]]);
         hull() {
            translate([-20,10]) circle(d=6);
            translate([-40,10]) circle(d=6);
         }
         hull() {
            translate([20,10]) circle(d=6);
            translate([40,10]) circle(d=6);
         }
      }
   }
   translate([0,47]) circle(d=23);
   for(x=[-1,1]) for(y=[-1,1])
      translate([x*15.5,47+y*15.5]) circle(d=3.5);
}

difference() {
   linear_extrude(35) offset(r=2) offset(r=-2) {
      difference() {
         polygon([[-37.5,25],[37.5,25],[37.5,30],[26.5,30],[26.5,73],[-26.5,73],[-26.5,30],[-37.5,30]]);
         polygon([[-21.5,25],[21.5,25],[21.5,68],[-21.5,68]]);
      }
   }
   for(x=[-1,1]) translate([x*32,22.5,20]) rotate([-90,0,0]) cylinder(d=6,h=10,center=false);
}