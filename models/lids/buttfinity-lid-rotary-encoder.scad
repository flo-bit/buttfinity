include <../libs/BOSL2/std.scad>;
include <buttfinity-lid-base.scad>;

module RotaryEncoderCutout() {
  cylinder(d=7.4, h=3);

  translate([0, 0, 0])
    cuboid([13, 13, 10], anchor=TOP);
}

module RotaryEncoderLid() {
  difference() {
    union() {
      ButtfinityLid();

      cuboid([32, 32, 2], anchor=TOP);
    }
    union() {
      translate([0, 0, -2])
        RotaryEncoderCutout();
    }
  }
}

module FourRotaryEncodersLid() {
  spacing = 20;
  difference() {
    union() {
      Lid();

      cuboid([32, 32, 2], anchor=TOP);
    }
    translate([0, 0, -2])
      union() {
        translate([spacing / 2, spacing / 2, 0]) RotaryEncoderCutout();
        translate([spacing / 2, -spacing / 2, 0]) RotaryEncoderCutout();
        translate([-spacing / 2, -spacing / 2, 0]) RotaryEncoderCutout();
        translate([-spacing / 2, spacing / 2, 0]) RotaryEncoderCutout();
      }
  }
}

// $fn = 128;

// RotaryEncoderLid();
