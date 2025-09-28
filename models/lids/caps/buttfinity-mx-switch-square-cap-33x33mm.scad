include <../../libs/cherrymx.scad>;
include <../../libs/BOSL2/std.scad>;

module SquareMXSwitchCap33x33mm() {
  w2 = 7.2;
  h2 = 5.56;

  w = 32.8;
  h = 32.8;

  thickness = 1.4;
  difference() {
    cuboid([w, h, 6], rounding=1.3, edges=[TOP, "Z"]);

    translate([0, 0, -6])
      union() {
        translate([0, 0, 11])
          CherryMX();
      }

    translate([0, 0, -0.6])
      difference() {
        cuboid([w - 1, h - 1, 5.4], rounding=0.7, edges=[TOP, "Z"]);

        translate([0, 0, 2])
          cuboid([w2 - thickness, h2 - thickness, 6]);
      }
  }
}

SquareMXSwitchCap33x33mm();
