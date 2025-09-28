include <../../libs/cherrymx.scad>
include <../../libs/BOSL2/std.scad>;
include <../buttfinity-lid-base.scad>;

module SquareMXSwitchLid() {
  difference() {
    union() {
      ButtfinityLid();

      cuboid([34, 34, 15], anchor=TOP, rounding=1, edges="Z");
    }

    CherryMXWithCutouts(34, 34, rounding=1);
  }
}

// $fn = 128;

// SquareMXSwitchLid();
