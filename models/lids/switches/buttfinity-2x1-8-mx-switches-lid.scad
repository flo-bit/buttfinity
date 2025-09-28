include <../../libs/cherrymx.scad>
include <../../libs/BOSL2/std.scad>;
include <../buttfinity-lid-base.scad>;

module EightMXSwitchesLid() {
  difference() {
    spacing = 18;

    union() {
      ButtfinityLid(1, 2);

      cuboid([34, 34 * 2 + 4, 15], anchor=TOP, rounding=1, edges="Z");
    }

    translate([-spacing / 2, -spacing / 2, 0])
      CherryMXWithCutouts(16, 16);
    translate([-spacing / 2, spacing / 2, 0])
      CherryMXWithCutouts(16, 16);

    translate([spacing / 2, -spacing / 2, 0])
      CherryMXWithCutouts(16, 16);
    translate([spacing / 2, spacing / 2, 0])
      CherryMXWithCutouts(16, 16);

    translate([spacing / 2, -spacing * 1.5, 0])
      CherryMXWithCutouts(16, 16);
    translate([spacing / 2, spacing * 1.5, 0])
      CherryMXWithCutouts(16, 16);

    translate([-spacing / 2, -spacing * 1.5, 0])
      CherryMXWithCutouts(16, 16);
    translate([-spacing / 2, spacing * 1.5, 0])
      CherryMXWithCutouts(16, 16);
  }
}

// $fn = 128;

// EightMXSwitchesLid();
