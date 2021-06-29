// e3d titan extruder
// original version

use<Geeetech_PrusaI3_Titan_Mount_fan.scad>
use<v6_4010_fan.scad>

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
//   translate([0,0,3.3]) cube([8,3.5,0.21],true);
//   translate([0,0,3.5]) cube([3.5,3.5,0.21],true);
}
$fn=64;

modules = 0;
3d_front = 0;
module top_polygon() {
   polygon([[0,24],[15,-10],[18,-10],[18,24],[18,37],[0,37]]);
}

module top_polygon_bowden() {
   polygon([[0,24],[4,14.9],[18,14.9],[18,37],[0,37]]);
}

module top_polygon_short() {
   polygon([[-10,24],[18,24],[18,37],[-10,37]]);
}

module 3d_touch_plate() {
   difference() {
      if(1 == 3d_front) {
         translate([-25,0,-0.2]) linear_extrude(3.5)
            polygon([[0,15],[15,15],[25,15],[25,0],[28,0],
                     [28,44],[15,44],[15,39.5],[0,39.5]]);
      } else {
         translate([-25,0,-0.2]) linear_extrude(3.5)
            polygon([[-0.75,18],[30.75,18],[30.75,36],[26,39.5],[-0.75,39.5]]);
      }
      translate([-21.5,28,-1]) {
         translate([0,0,0]) cylinder(5.5,1.75,1.75,false);
         translate([18.25,0,0]) cylinder(5.5,1.75,1.75,false);
         translate([0,0,2]) rotate([0,0,30]) cylinder(h=2.35+2,d=6.7,$fn=6,center=false);
         translate([18.25,0,2]) rotate([0,0,30])
            cylinder(h=2.35+2,d=6.7,$fn=6,center=false);
         translate([4.5,-8,0]) cube([9.25,15.5,6],false);
      }
   }
}

module bowden_mount() {
   if(modules) {
      translate([-14,16,0]) translate([14,-28.1,-29.6]) rotate([0,0,180]) v6_hotend();
      translate([-15,9,-13]) x_carriage();
      if(1 == 3d_front) {
         translate([-29,-12,-26.2]) rotate([0,0,90]) 3d_touch();
      } else {
         translate([-29,50,-26.2]) rotate([0,0,90]) 3d_touch();
      }
      translate([0,7,-66]) fan_mount();
   }
   translate([-17,-44,-26]) {
      difference() {
         union() {
            translate([-10,39.5,-19]) cube([13,4.5,70],false);
            translate([-10,39.5-8,5]) cube([43,12.5,14],false);
            translate([-25.5,39.5,-19]) cube([20,4.5,9],false);
            translate([1,39.5-20,5]) cube([32,10,14],false);
         }
         translate([-1,39,26.75]) rotate([-90,0,0]) m3_mount();
         translate([-1,39,-14.5]) rotate([-90,0,0]) m3_mount();
         translate([-21,39,-14.5]) rotate([-90,0,0]) m3_mount();
         translate([17,32,4.99]) cylinder(d=16.5,h=3.22,center=false);
         translate([17,32,5+3.2]) cylinder(d=12.5,h=5.81,center=false);
         translate([17,32,14]) cylinder(d=16.5,h=10,center=false);
         translate([17+12,19,12]) rotate([-90,0,0]) m3_mount(30);
         translate([17-12,19,12]) rotate([-90,0,0]) m3_mount(30);
      }
      difference() {
         union() {
            translate([-15,20,47.5]) linear_extrude(4) top_polygon_bowden();
            translate([-15,20,45.5]) linear_extrude(6) top_polygon_short();
         }
         translate([-8,53,52]) rotate([0,180,0]) m3_mount();
         translate([-21,53,52]) rotate([0,180,0]) m3_mount();
      }
      difference() {
         union() {
            intersection() {
               translate([-15,20,45.5]) linear_extrude(60) top_polygon_bowden();
               translate([-1,42.4,64+9]) cable_chain();
            }
            intersection() {
               translate([-15,20,45.5]) linear_extrude(16) top_polygon();
               hull() {
                  translate([-1,42.4,64]) cable_chain();
                  translate([-1,42.4,64+9]) cable_chain();
               }
            }
         translate([-15,46.9,62.5]) cube([9.7,3,21],false);
         }
         translate([-10,42,70]) rotate([-90,0,0]) m3_mount();
         translate([-20,30,62.5]) cube([15,16.9,21],false);
      }
   }
}

module titan_mount_v2() {
   if(modules) {
      translate([-14,16,0]) {
//         translate([-38,0,64]) titan_extruder();
//         translate([-14.1,-39.25,-0.25]) nema_motor();
         translate([14,-28.1,-29.6]) rotate([0,0,180]) v6_hotend();
      }
      translate([-15,9,-13]) x_carriage();
      if(1 == 3d_front) {
         translate([-29,-12,-26.2]) rotate([0,0,90]) 3d_touch();
      } else {
         translate([-29,50,-26.2]) rotate([0,0,90]) 3d_touch();
      }
      translate([0,7,-66]) fan_mount();
//      translate([9,56.5,-45+25]) rotate([90,0,180]) radial_fan();
   }
   translate([-17,-44,-26]) {
      difference() {
         translate([0,0,4.5]) cube([3,44,47],false);
         translate([-1,31/2+5.25,31/2+10.25]) {
            rotate([0,90,0]) cylinder(d=23.2,h=6,center=false);
            translate([0,-31/2,-31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
            translate([0,31/2,-31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
            translate([0,-31/2,31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
            translate([0,31/2,31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
         }
      }

      difference() {
         union() {
            translate([-10,39.5,-19]) cube([13,4.5,19],false);
            translate([-25.5,39.5,-19]) cube([20,4.5,9],false);
         }
         translate([-1,39,-14.5]) rotate([-90,0,0]) m3_mount();
         translate([-21,39,-14.5]) rotate([-90,0,0]) m3_mount();
      }
      if(1 == 3d_front) {
         3d_touch_plate();
      } else {
         linear_extrude(3) polygon([[-10,44],[-10,39.5],[0,0],[3,0],[3,44]]);
         cube([3,44,5],false);
      }
      difference() {
         union() {
            translate([-15,20,47.5]) linear_extrude(4) top_polygon();
            translate([-15,20,45.5]) linear_extrude(6) top_polygon_short();
         }
         translate([-8,53,52]) rotate([0,180,0]) m3_mount();
         translate([-21,53,52]) rotate([0,180,0]) m3_mount();
         translate([-2.5,51.5,49.5]) cube([3,3,2.1],false);
      }
      difference() {
         union() {
            intersection() {
               translate([-15,20,45.5]) linear_extrude(60) top_polygon();
               translate([-1,42.4,64+9]) cable_chain();
            }
            intersection() {
               translate([-15,20,45.5]) linear_extrude(16) top_polygon();
               hull() {
                  translate([-1,42.4,64]) cable_chain();
                  translate([-1,42.4,64+9]) cable_chain();
               }
            }
         translate([-15,46.9,62.5]) cube([9.7,3,21],false);
         }
         translate([-10,42,70]) rotate([-90,0,0]) m3_mount();
         translate([-20,30,62.5]) cube([15,16.9,21],false);
      }
      difference() {
         translate([0,0,51.5]) cube([3,40,34],false);
         translate([-1,30,51.5+11]) cube([5,11,24],false);
         for(y=[4,12,20]) for(z=[0,6,13,19]) {
            translate([-1,y,62.5+z]) cube([5,5,2],false);
         }
      }
   }
}

module cable_chain_xy_end() {
   difference() {
      cable_chain();
      translate([1,0,0]) cube([14,20,30],true);
      translate([-20,0,-8.2]) cube([14,20,16.4],false);
   }
   translate([-15.7,-10.5,8.2]) cube([9.7,18,4.25],false);
   translate([-15.7,-10.5,8.25-20.7]) cube([9.7,18,4.25],false);
   difference() {
      translate([7.3,-8.5,-2.5]) cube([46,4,30],true);
      translate([0,0,-8]) rotate([90,0,0]) cylinder(d=6,h=20,center=false);
      translate([20,0,-8]) rotate([90,0,0]) cylinder(d=6,h=20,center=false);
      translate([0,-11,7]) cube([5,5,2],false);
      translate([0,-11,1]) cube([5,5,2],false);
      translate([0,-11,1]) cube([5,2,8],false);
      translate([8,-11,7]) cube([5,5,2],false);
      translate([8,-11,1]) cube([5,5,2],false);
      translate([8,-11,1]) cube([5,2,8],false);
      translate([8,-11,-11]) cube([5,5,2],false);
      translate([8,-11,-5]) cube([5,5,2],false);
      translate([8,-11,-11]) cube([5,2,8],false);
      translate([16,-11,7]) cube([5,5,2],false);
      translate([16,-11,1]) cube([5,5,2],false);
      translate([16,-11,1]) cube([5,2,8],false);
   }
   translate([-19.85,-8,9.2]) cube([8.3,5,2],true);
   translate([-19.85,-8,-9.2]) cube([8.3,5,2],true);
}

module titan_extruder() {
   rotate([90,90,0]) {
      import("e3d_Titan_extruder_-_big_gear-1.STL");
      import("e3d_Titan_extruder_-_175_filament_feed-1.STL");
     // import("e3d_Titan_extruder_-_cilindar_fitting-1.STL");
      import("e3d_Titan_extruder_-_e3d_extruder-1.STL");
      import("e3d_Titan_extruder_-_gornji_dio_e3d_extruder-1.STL");
      import("e3d_Titan_extruder_-_polugica-1.STL");
      import("e3d_Titan_extruder_-_small_gear-1.STL");
     // import("e3d_Titan_extruder_-_teflon_tube-1.STL");
      import("e3d_Titan_extruder_-_teflon_tube-2.STL");
   }
}

module nema_motor() {
   rotate([0,90,0]) scale([1,1,0.66]) import("Motor_NEMA17.stl");
}

module x_carriage() {
   rotate([-90,0,0]) import("X_Carriage_v2.stl");
}

module v6_hotend() {
   rotate([90,0,-90]) import("E3D_V6_1.75mm_Universal_HotEnd_Mockup.stl");
   translate([0,43,-8.3]) rotate([90,90,0]) v6_4010_fan();
}

module 3d_touch() {
   scale([1,1,1.08]) import("3D_Touch_Sensor.stl");
   // 0.8mm below nozzle
}

module radial_fan() {
   import("5015_Blower_Fan.stl");
}

module m3_screw() {
   rotate([90,0,0]) import("M3_HEX_SCREW.stl");
}

module belt_clamp() {
   rotate([-90,90,0]) scale([1.05,1,1]) import("Belt_Clamp_v3.stl");
}

module cable_chain() {
   rotate([-90,180,0]) import("cable_chain_v2.stl");
}

module fan_mount() {
   translate([-2, 1.7, 12.5]) rotate([0,0,180]) {
      difference() {
         hull() {
            translate([-13.25, -32.8, 5]) cube([54, 1.5, 1], false);
            translate([-13.25, -32.8, 86]) cube([54, 1.5, 1], false);
         }
         translate([-11+48, -32, 12+3.25+25]) rotate([90, 0, 0]) cylinder(d=4, h=3, center=true);
         translate([-9.5+3.25, -32, 10.5+43+25]) rotate([90, 0, 0]) cylinder(d=4, h=3, center=true);
      }
   }
   difference() {
      union () {
         hull() {
            translate([0,0,0]) rotate([60,0,0]) cube([22.5,1,5],true);
            translate([0, 42, 11]) cube([22.5,18,1], true);
         }
         translate([0, 42, 16.5+25/2]) cube([22.5, 18, 10.5+25], true);
         translate([10.5, 42, 48+8]) cube([1.5, 18, 71+16], true);
//         hull() {
//            translate([-21,-3,17.5]) cube([1,10,3],false);
//            translate([-1,-3,-0.3]) cube([1,10,2],false);
//         }
         hull() {
            translate([-30,7,17.5]) cube([10,1,3],false);
            translate([-42.75,33,17.5]) cube([54,1,3],false);
         }
         translate([-30,-3,17.5]) cube([10,10,3],false);
         translate([-32,-1.1,97.5]) cube([10,3,20],false);
         hull() {
            translate([-32,-1.1,97.5]) cube([10,3,2],false);
            translate([-42.75,33,97.5]) cube([54,1.5,2],false);
         }
      }
      hull() {
         translate([0,-5.01,-1])rotate([60,0,0]) cube([19.5,1,2],true);
         translate([0, 42, 11]) cube([19.5,15,0.01], true);
      }
      translate([0, 42, 21+25/2]) cube([19.5, 15, 20+25], true);
      translate([10, 42, 27+25]) cube([19.5, 3.5, 14], true);
      translate([-25,2,15.5]) rotate([0,0,0]) m3_mount();
      translate([-27,-8,110]) rotate([-90,0,0]) m3_mount();
   }
   if(0 == 3d_front) {
      translate([-17,15,40]) 3d_touch_plate();
   }
}

module belt_hold() {
   translate([-32.5-3.5,30.4,-13]) {
      difference() {
         union() {
            translate([-0.5,0,-17]) cube([8,5,34],false);
            translate([0,-0.6,-8.5]) cube([7,5,6],false);
            translate([0,-0.6,2.5]) cube([7,5,6],false);
         }
         translate([3.5,3.2+1.9,12.5]) rotate([90,0,0]) m3_mount(top_cut=0.2);
         translate([3.5,3.2+1.9,-12.5]) rotate([90,0,0]) m3_mount(top_cut=0.2);
      }
   }
}

titan_mount_v2();
//bowden_mount();
//belt_hold();
//cable_chain_xy_end();
//fan_mount();

// 29, 62.1

//M851 X-32.00 Y17.00 Z-0.82
//M851 X-29 Y62.1 Z-0.9