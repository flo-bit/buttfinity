include <../../libs/cherrymx.scad>
include <../../libs/BOSL2/std.scad>;
include <../buttfinity-lid-base.scad>;

module FourMXSwitchesLid() {
  spacing = 18;

  cutout_w = 16;
  cutout_h = 16;

  difference() {
    union() {
      ButtfinityLid();

      cuboid([34, 34, 15], anchor=TOP, rounding=1, edges="Z");
    }
    translate([0, 0, 0])
      union() {
        translate([-spacing / 2, -spacing / 2, 0])
          CherryMXWithCutouts(cutout_w, cutout_h);

        translate([-spacing / 2, spacing / 2, 0])
          CherryMXWithCutouts(cutout_w, cutout_h);

        translate([spacing / 2, -spacing / 2, 0])
          CherryMXWithCutouts(cutout_w, cutout_h);
        translate([spacing / 2, spacing / 2, 0])
          CherryMXWithCutouts(cutout_w, cutout_h);
      }
  }
}

// $fn = 128;

// FourMXSwitchesLid();
