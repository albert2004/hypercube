// OpenSCAD file for hypercube parts.
// Copyright by Piotr Stachura <pstachura2012@gmail.com>

module orig() {
   import("Z_Axis_Bearing_Holder_1.0.stl");
}

$fn=64;

module z_axis_bearing_holder() {
   difference() {
      linear_extrude(43) offset(r=1) offset(r=-1) union() for(x=[0,1]) mirror([x,0,0])
         polygon([[-36,-10],[-15,-10],[-15,-25],[-10.2,-25],[-10.2,-21.75],
                  [0,-21.75],[0,25],[-15,25],[-15,20],[-36,20]]);
      translate([0,0,-7]) cube([20.4,51,20],true);
      for(y=[19.25,-11.75]) translate([0,y,25]) cylinder(d=6,h=51,center=true);
      hull() for(y=[19.25,30]) translate([0,y,33.5]) cylinder(d=10,h=51,center=true);
      translate([0,0,15.5]) rotate([90,0,0]) cylinder(d=6,h=51,center=true);
      hull() {
         translate([0,0,35.5]) rotate([90,0,0]) cylinder(d=6,h=51,center=true);
         translate([0,0,55.5]) rotate([90,0,0]) cylinder(d=6,h=51,center=true);
      }
      for(x=[30,-30]) translate([x,5.25,15]) rotate([0,90,0]) cylinder(d=21,h=50,center=true);
      translate([0,-2.25,33]) cube([10.2,29.5,50],true);
      
      for(x=[-1,1]) {
         translate([x*30,0,57]) cube([30,50,50],true);
         translate([x*30,20,56]) cube([30,20,50],true);
         translate([x*30,3.25,45]) cube([50,14,50],true);
         translate([x*(30-14.5),5.25,40]) cube([1,50,50],true);
      }
      for(x=[20,31,-20,-31]) translate([x,15.1,28]) rotate([90,0,0]) m3_screw(25.2);
      translate([0,52,0]) rotate([30,0,0]) cube([100,40,200],true);
      intersection() {
         translate([0,34,0]) rotate([30,0,0]) cube([31,40,200],true);
         translate([0,0,37.5]) cube([31,40,30],true);
      }
   }
}

module m3_screw(length=10) {
   cylinder(d=3.5,h=length,center=false);
   translate([0,0,length-1.15]) rotate([0,0,45]) cylinder(d=5.44*1.41,h=2.3,center=true,$fn=4);
   cylinder(d=6.2,h=3.2,center=false);
}

//orig();
z_axis_bearing_holder();

// Revision history:
// 2021-09-25: Initial revision - re-creation from STL with modifications
