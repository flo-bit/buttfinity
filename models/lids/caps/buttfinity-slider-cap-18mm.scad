include <../../libs/BOSL2/std.scad>;

module SliderCap() {
  difference() {
    cyl(d1=18, d2=16, h=15, anchor=BOTTOM, rounding2=1);

    length = 4;
    width = 1.2;
    height = 13.7;
    translate([-length / 2, -width / 2, 0])
      cube([length, width, height]);

    translate([-5 / 2, -5 / 2, 0])
      cube([5, 5, 5]);
  }
}

$fn = 128;

SliderCap();
