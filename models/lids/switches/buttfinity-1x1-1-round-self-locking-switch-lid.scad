include <../../libs/cherrymx.scad>
include <../../libs/BOSL2/std.scad>;
include <../buttfinity-lid-base.scad>;

module RoundMXSwitchLid() {
  difference() {
    union() {
      ButtfinityLid();

      cyl(d=26, h=13, rounding=1, anchor=TOP);
    }

    translate([0, 0, -4])
      cylinder(d=24, h=5);

    translate([0, 0, -8])
      cuboid([8.1, 8.1, 8]);

    translate([0, 2.5, -12])
      cuboid([8, 3, 8]);

    translate([0, -2.5, -12])
      cuboid([8, 3, 8]);
  }
}

// $fn = 128;

// RoundMXSwitchLid();
