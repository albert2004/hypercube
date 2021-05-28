$fn=64;

module voron_afterburner_mount(modules=0)
{
   if(modules) {
   //   translate([-15,9,-13]) x_carriage();
     /* translate([0,-17.25,59])*/ voron_extruder_mount();
//      voron_v6_mount();
   }
}

// 31.5
module voron_extruder_mount() {
/*   rotate([90,90,0]) translate([0,0,-8.25]) {
      translate([0,0,0]) rotate([0,0,0]) translate([-65.7-(59.325/2),-97.5-(55/2),-(15/2)])
         import("VoronAfterburner/blower_housing_rear.stl");
      translate([0,0,15.75]) rotate([0,180,0]) translate([-114-(59.3/2),-86.5-(55/2),-(16.5/2)])
         import("VoronAfterburner/[a]_blower_housing_front.stl");
   }*/
//   translate([-85.6-(59.325/2),-61.9-(55/2),-(23.7/2)])
//      import("VoronAfterburner/Direct_Feed/extruder_body.stl");
   translate([-85.6-(59.9/2),-121.9-(44.2/2),-(7.7/2)]) import("VoronAfterburner/Direct_Feed/extruder_motor_plate.stl");
}

module voron_v6_mount() {
   rotate([0,0,-90]) {
      rotate([0,-90,0]) {
         translate([0,0,-1.7]) rotate([0,0,0]) translate([-84.725-(58.55/2),-83.7-(60.6/2),-(38.53/2)])
            import("VoronAfterburner/Printheads/E3D_V6/printhead_front_e3dv6.stl");
         translate([8,0,13.715]) rotate([0,180,0]) translate([-95.72-(50.82/2),-137.8-(40/2),-(14.5/2)])
            import("VoronAfterburner/Printheads/E3D_V6/printhead_rear_e3dv6.stl");
      }
      translate([-6.5,0,10.7]) rotate([90,0,180]) import("E3D_V6_1.75mm_Universal_HotEnd_Mockup.stl");
   }
   translate([0,-27,4.325]) rotate([-90,-90,0]) translate([-59.8-(66.1/2),-64.7-(60.6/2),-(12/2)])
      import("VoronAfterburner/hotend_fan_mount.stl");
}

module x_carriage() {
   rotate([-90,0,0]) import("X_Carriage_v2.stl");
}

voron_afterburner_mount(modules=1);