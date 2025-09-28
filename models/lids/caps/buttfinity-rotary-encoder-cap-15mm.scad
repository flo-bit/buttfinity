include <../../libs/BOSL2/std.scad>;

module RotaryEncoderCap15mm() {
  difference() {
    cyl(d1=15, d2=13, h=18, anchor=BOTTOM, rounding2=1);

    difference() {
      translate([0, 0, 0])
        cylinder(d1=6, d2=5.8, h=17);
    }
    translate([0, 0, -1])
      cylinder(d=13, h=7);
  }
}

$fn = 128;

RotaryEncoderCap15mm();