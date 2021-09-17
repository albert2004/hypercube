$fn=60;
difference() {
   union() {
      linear_extrude(0.6) offset(r=1) offset(r=-1) polygon([[0,0],[23.5,0],[23.5,6],[17,6],[14,8.5],[0,8.5]]);
      linear_extrude(1.6) offset(r=1) offset(r=-1) polygon([[14,0],[23.5,0],[23.5,6],[17,6],[14,8.5]]);
      translate([4.25,4.25,0.6]) cylinder(d=5,h=0.4,center=false);
   }
   translate([4.25,4.25,-0.1]) cylinder(d=3.4,h=3,center=false);
}
