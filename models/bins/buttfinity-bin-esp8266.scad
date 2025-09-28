include <../libs/BOSL2/std.scad>
include <buttfinity-bin-base.scad>
include <buttfinity-click-microcontroller.scad>

module ButtfinityBinESP8266() {
  difference() {
    union() {
      ButtfinityBin();

      translate([-19, -19, 5])
        cube([38, 38, 5]);
    }

    // cutout for esp8266
    translate([-19, -13.5, 3.1])
      cube([34.8, 26, 10]);

    // cutout for click mechanism
    translate([11, -36 / 2, 5.1])
      cube([4.8, 36, 10]);

    // cutout for usb c
    translate([-20, -1, 8.75])
      cuboid([10, 11, 4.5], rounding=1);
  }

  rotate([0, 180, 0])
    translate([-13.5, -14.55, -0])
      ClickStraightMicrocontroller(4, 0, 90);

  rotate([0, 180, 0])
    translate([-13.5, 13.55, -0])
      ClickStraightMicrocontroller(4, 0, -90);
}

// $fn = 128;

// ButtfinityBinESP8266();
