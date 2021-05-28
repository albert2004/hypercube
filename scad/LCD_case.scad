// 2.7 50 144
// // 55(63)150

// // 40 98 13 top left - 13mm od pcb

// sd 20 top 27 wys 3
// roraty 25 top 7, 9 right
// stop 5 bottom, right 9,5 6(3.5) 5,3(4.1) od pcb

// pod pcb 19mm
$fn=64;

top_module = 0;

wall = 2;
pcb_spacing = 1;
pcb_x = 150;
pcb_y = 63;

cover_x = pcb_x + 2*pcb_spacing + 2*wall;
cover_y = pcb_y + 2*pcb_spacing + 2*wall;

module case_outer() {
   translate([0,0,-25]) cube([cover_x, cover_y, 100], true);
}

module case() {
   difference() {
      union() {
         difference() {
            union() {
               case_outer();
               if(top_module) {
                  rotate([-45,0,0]) difference() {
                     union() {
                        translate([70,20.715,27.075]) cube([4,28,30],true);
                        translate([50,20.715,27.075]) cube([4,28,30],true);
                        translate([60,20.715,27.075+27/2]) cube([20,28,3],true);
                        translate([-70,20.715,27.075]) cube([4,28,30],true);
                        translate([-50,20.715,27.075]) cube([4,28,30],true);
                        translate([-60,20.715,27.075+27/2]) cube([20,28,3],true);
                     }
                     rotate([45,0,0]) translate([0,0,8-49.5]) cube([200,200,100],true);
                  }
               }
            }
            if(top_module) {
               top_cut();
            }
            // Internal hole:
            translate([0,0,-wall-25]) cube([cover_x-2*wall, cover_y-2*wall, 100], true);
         }
         // Reset button:
         hull() {
            translate([cover_x/2-wall-pcb_spacing-9-7.5/2-3,cover_y/2-wall-pcb_spacing-55+8,22]) cylinder(d=5,h=6,center=true);
            translate([cover_x/2-wall-pcb_spacing-9-7.5/2+3,cover_y/2-wall-pcb_spacing-55+8,22]) cylinder(d=5,h=6,center=true);
         }
      }
      // LCD:
      translate([-cover_x/2 + 99/2 + 13 + wall + pcb_spacing, cover_y/2 - 41/2 - 13 - wall - pcb_spacing, 16]) cube([99,41,20],true);
      // Rotary knob:
      translate([cover_x/2-wall-pcb_spacing-9-7.5/2,cover_y/2-wall-pcb_spacing-26-7.5/2,16]) cylinder(d=7.5,h=20,center=true);
      // Reset button:
      hull() {
         translate([cover_x/2-wall-pcb_spacing-9-7.5/2-3,cover_y/2-wall-pcb_spacing-55+8,16]) cylinder(d=3,h=20,center=true);
         translate([cover_x/2-wall-pcb_spacing-9-7.5/2+3,cover_y/2-wall-pcb_spacing-55+8,16]) cylinder(d=3,h=20,center=true);
      }
      // SD Card:
      translate([-cover_x/2,0,25-5/2-wall-14]) cube([10,29,5],true);
      for(x=[-144/2,144/2]) for(y=[50/2+4,-50/2+4]) {
         translate([x,y,25-(wall+13)/2]) difference() {
            cylinder(d=5,h=wall+14,center=true);
         }
      }
   }
   for(x=[-144/2,144/2]) for(y=[50/2+4,-50/2+4]) {
      translate([x,y,25-80/2-wall-14.5]) difference() {
         cylinder(d=8,h=80,center=true);
         cylinder(d=2.8,h=81,center=true);
      }
   }
   for(x=[-144/2,144/2]) for(y=[50/2+4,-50/2+4]) {
      translate([x,y,25-(wall+13)/2]) difference() {
         cylinder(d=8,h=wall+13,center=true);
         translate([0,0,2]) cylinder(d=5,h=wall+14,center=true);
         cylinder(d=3.5,h=wall+14,center=true);
      }
   }
}

module case_total() {
   difference() {
      rotate([45,0,0]) case();
      translate([0,0,-20-50]) cube([200,200,100],true);
      rotate([45,0,0]) translate([0,0,-20-50]) cube([200,200,100],true);
   }

   intersection() {
      difference() {
         rotate([45,0,0]) case_outer();
         translate([0,0,-20-50]) cube([200,200,100],true);
         rotate([45,0,0]) translate([0,0,-20-50]) cube([200,200,100],true);
      }
      union() {
         translate([0,0,-20-48]) cube([200,200,100],true);
         rotate([45,0,0]) translate([0,0,-20-48]) cube([200,200,100],true);
      }
   }
}

module top_cut() {
   translate([60,20.715,27.075-27/2]) cube([16,28,14.4],true);
   translate([60,20.715+20,27.075-27/2]) cube([6,28,14.4],true);
   translate([-60,20.715,27.075-27/2]) cube([16,28,14.4],true);
   translate([-60,20.715+20,27.075-27/2]) cube([6,28,14.4],true);
}

module button() {
   hull() {
      translate([cover_x/2-wall-pcb_spacing-9-7.5/2-3,cover_y/2-wall-pcb_spacing-55+8,16]) cylinder(d=2.5,h=10,center=true);
      translate([cover_x/2-wall-pcb_spacing-9-7.5/2+3,cover_y/2-wall-pcb_spacing-55+8,16]) cylinder(d=2.5,h=10,center=true);
   }
   hull() {
      translate([cover_x/2-wall-pcb_spacing-9-7.5/2-3,cover_y/2-wall-pcb_spacing-55+8,16+3.5]) cylinder(d=6,h=3,center=true);
      translate([cover_x/2-wall-pcb_spacing-9-7.5/2+3,cover_y/2-wall-pcb_spacing-55+8,16+3.5]) cylinder(d=6,h=3,center=true);
   }
}

difference() {
   case_total();
   if(top_module) {
      rotate([45,0,0]) translate([0,0,-50+8.51]) cube([200,200,100],true);
   } else {
      rotate([45,0,0]) translate([0,0,50+8.51]) cube([200,200,100],true);
      rotate([45,0,0]) translate([0,30,8]) cube([30,10,1.1],true);
   }
}

// button();