include <../../libs/cherrymx.scad>
include <../../libs/BOSL2/std.scad>;
include <../buttfinity-lid-base.scad>;

module TwoMXSwitchesLid() {
  spacing = 18;

  difference() {
    union() {
      ButtfinityLid();

      cuboid([34, 34, 15], anchor=TOP, rounding=1, edges="Z");
    }

    union() {
      translate([0, -spacing / 2, 0])
        CherryMXWithCutouts(34, 16, rounding=1);
      translate([0, spacing / 2, 0])
        CherryMXWithCutouts(34, 16, rounding=1);
    }
  }
}

// $fn = 128;

// TwoMXSwitchesLid();
