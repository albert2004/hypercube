// Mellow BMG Wind mount
// TODO:
// - add radial fan
// - add 4010 fan
// - add NEMA stepper
// - add cable rails

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

module top_polygon() {
   polygon([[0,24],[15,-10],[18,-10],[18,24],[18,37],[0,37]]);
}

module top_polygon_short() {
   polygon([[-10,24],[18,24],[18,37],[-10,37]]);
}

module bmg_wind_mount(modules=0,add_brim=0) {
   if(add_brim) {
      translate([-10.2,-9-5,50+4]) cube([0.2,20,10],false);
   }
   if(modules) {
      translate([-15,9,-13]) x_carriage();
      color([0,0,1]) translate([34,-39.5,-83]) fan_mount_bmg();
      translate([-15+5,-49.8-5.5+5.75,-45.1-5.75]) bmg_wind();
//      translate([9,56.5,-45+25]) rotate([90,0,180]) radial_fan();
   }
   translate([-17,-44,-26]) {
      difference() {
         translate([0+4-0.6,-5.5,4.5-29.3-4.5]) cube([3.6,44+5.5,47+29.3+4.5],false);
         translate([-1+4,31/2+5.25-5.5,31/2+10.25-29.3]) {
            rotate([0,90,0]) cylinder(d=23.2,h=6,center=false);
            translate([0,-31/2,-31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
            translate([0,31/2,-31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
            translate([0,-31/2,31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
            translate([0,31/2,31/2])rotate([0,90,0]) cylinder(d=3.6,h=6,center=false);
         }
      }

      difference() {
         union() {
            translate([-10+1,39.5,-19-10.3]) cube([13,4.5,19+10.3+50],false);
            translate([-25.5,39.5,-19]) cube([20,4.5,9],false);
         }
         translate([-1,39,-14.5]) rotate([-90,0,0]) m3_mount();
         translate([-1,39,-14.5+13.75]) rotate([-90,0,0]) m3_mount();
         translate([-1,39,-14.5+13.75*2]) rotate([-90,0,0]) m3_mount();
         translate([-1,39,-14.5+13.75*3]) rotate([-90,0,0]) m3_mount();
         translate([-21,39,-14.5]) rotate([-90,0,0]) m3_mount();
      }
      translate([4,0,-29.3]) {
         linear_extrude(3) polygon([[-10,44],[-10,39.5],[0,0],[3,0],[3,44]]);
         cube([3,44,5],false);
      }
     
      difference() {
         union() {
            translate([-15+4,44,45.5]) cube([18,13,3],false);
            translate([4,0,47.5-29.3]) linear_extrude(3) polygon([[-10,44],[-10,39.5],[0,0],[3,0],[3,44]]);
            translate([-15+4,20,47.5]) linear_extrude(4) top_polygon();
            translate([-15,20,45.5]) linear_extrude(6) top_polygon_short();
         }
         translate([-8,53,52]) rotate([0,180,0]) m3_mount();
         translate([-21,53,52]) rotate([0,180,0]) m3_mount();
      }
      translate([4,0,0]) difference() {
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
         translate([-19,46.9,62.5]) cube([13.7,3,21],false);
         }
         translate([-10-4,42,70]) rotate([-90,0,0]) m3_mount();
         translate([-20,30,62.5]) cube([15,16.9,21],false);
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

module nema_motor() {
   rotate([0,90,0]) scale([1,1,0.66]) import("Motor_NEMA17.stl");
}

module x_carriage() {
   rotate([-90,0,0]) import("X_Carriage_v2.stl");
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

module bmg_wind() {
   difference() {
      union() {
         cube([37, 42, 54], false);
         translate([13,0,-15.5]) cube([19.5,26.5,15.5], false);
         translate([13+19.5/2,26.5-9,-15.5-4.75]) cylinder(d2=9, d1=2, h=4.75, center=false);
      }
      translate([20,0,27.5]) rotate([-90,0,0]) cylinder(d=3.1,h=100,center=false);
      translate([20+14,0,27.5]) rotate([-90,0,0]) cylinder(d=3.1,h=100,center=false);
   }
}

module fan_mount_bmg() {
   translate([-2, 1.7, 12.5]) rotate([0,0,180]) {
      difference() {
         union() {
            // fan back wall
            hull() {
               translate([-13.25, -32.8, 21]) cube([55.25, 2.5, 65-33], false);
               translate([-13.25, -32.8, 21+64]) cube([10, 2.5, 1], false);
            }
            // bottom mount to X rail
            translate([41,-58,21]) cube([24,20,4],false);
            hull() {
               translate([20,-58,21]) cube([22,26,4],false);
               translate([9,-49.3,21]) cube([22,18,4],false);
            }
         }           
         // fan back wall cut
         translate([45, -32.8, 100]) rotate([90,0,0]) cylinder(d=100,h=10,center=true);

         // fan mounting holes
         translate([35.5,-32,40.5]) rotate([90,0,0]) {
            translate([0,0,-0.8]) cube([5.43,5.43,1.8+0.1],true);
            cylinder(d=3.5,h=5,center=true);
         }
         translate([-6.5,-32,78.75]) rotate([90,0,0]) {
            translate([0,0,-0.8]) cube([5.43,5.43,1.8+0.1],true);
            cylinder(d=3.5,h=5,center=true);
         }
         // module mounting holes
         for(x=[8,22]) translate([x,-31-0.9,47.21]) rotate([90,0,0]) {
            cube([5.43,5.43,1.8+0.1],true);
            cylinder(d=3.5,h=5,center=true);
         }
         translate([57,-46.8,20]) rotate([0,0,0]) m3_mount();
      }
   }
   difference() {
      union () {
         hull() {
            translate([-8,25,17]) rotate([60,0,-45]) cube([22.5,1,5],true);
            translate([0, 41.5, 25]) cube([22.5,19,1], true);
         }
         translate([0, 41.5, 36.5]) cube([22.5, 19, 24], true);
         translate([10.5, 42, 48+8]) cube([1.5, 18, 20], true);
      }
      hull() {
         translate([-8,25,17]) rotate([60,0,-45]) cube([22.5-2,1,5-2],true);
         translate([0, 42, 25]) cube([22.5-2,18-2,1], true);
      }
      translate([0, 42, 21+25/2+13.25]) cube([19.5, 15, 20+25], true);
      translate([10, 42, 27+25]) cube([19.5, 3.5, 14], true);
   }
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

bmg_wind_mount(modules=1);
//fan_mount_bmg();