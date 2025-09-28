include <../../libs/cherrymx.scad>
include <../../libs/BOSL2/std.scad>;
include <../buttfinity-lid-base.scad>;

module RoundMXSwitchLid() {
  difference() {
    union() {
      ButtfinityLid();

      cuboid([26, 26, 15], anchor=TOP, rounding=1, edges="Z");
    }

    CherryMXWithCutouts(16, 16, rounding=0);

    translate([0, 0, -6])
      cylinder(r=12, h=7);
  }
}

// $fn = 128;

// RoundMXSwitchLid();
