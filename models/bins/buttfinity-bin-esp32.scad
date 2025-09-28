include <../libs/BOSL2/std.scad>
include <buttfinity-bin-base.scad>
include <buttfinity-click-microcontroller.scad>

module ButtfinityBinESP32() {
  difference() {
    union() {
      ButtfinityBin();

      translate([-19, -19, 7])
        cube([33, 38, 4.5]);
    }

    // esp32 box
    translate([-19.5, -31.8 / 2, 5.1])
      cube([39, 31.8, 10]);

    // usb c hole
    translate([-20, 0.2, 7.8])
      cuboid([10, 10, 3.6], rounding=1);
  }

  // click into bin
  rotate([0, 180, 0])
    translate([-16.5, -16.95, -2.5])
      ClickStraightMicrocontroller(4, 0, 90);
  rotate([0, 180, 0])
    translate([-16.5, 16.95, -2.5])
      ClickStraightMicrocontroller(4, 0, -90);
}

// $fn = 128;

// ButtfinityBinESP32();
