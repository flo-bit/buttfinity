include <../libs/BOSL2/std.scad>
include <buttfinity-bin-base.scad>
include <buttfinity-click-microcontroller.scad>

module ButtfinityBinRP2040() {
  difference() {
    union() {
      ButtfinityBin();

      translate([-19, -19, 5])
        cube([38, 38, 5]);
    }

    // cutout for rp2040
    translate([-19, -18.3 / 2, 3.1])
      cube([23.5, 18.3, 10]);

    // cutout for click mechanism
    translate([0, -36 / 2, 5.1])
      cube([4.8, 36, 10]);

    // usb c hole
    translate([-20, 0, 8])
      cuboid([10, 10, 4], rounding=1);
  }

  // click into bin
  rotate([0, 180, 0])
    translate([-2.5, -10.2, -0])
      ClickStraightMicrocontroller(4, 0, 90);

  rotate([0, 180, 0])
    translate([-2.5, 10.2, -0])
      ClickStraightMicrocontroller(4, 0, -90);
}

// $fn = 128;

// ButtfinityBinRP2040();
