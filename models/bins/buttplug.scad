include <../libs/BOSL2/std.scad>

module ClickStraightButtplug(size, offset, angle) {
  anchor = -7 - 0.2 + 0.7 + 1.8 + 1.9 + sqrt(2) * 0.25 * 2;

  rotate([0, 0, angle])
    translate([offset, size / 2, 0])
      rotate([90, 0, 0])
        linear_extrude(height=size)
          polygon(
            points=[
              [3.75 - 1.9 - 0.8, anchor - 1.9 - 1.8 - 0.8 + 0.5],
              [3.75 - 1.9 - 0.8, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1],
              [3.75 - 1.9 - 0.8 + 0.2, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.2],
              [3.75 - 1.9 - 0.8 + 0.2, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.2 - 0.8],
              [0, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.2 - 0.8 - 1.25],
              [-0.8, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.2 - 0.8 - 1.25],
              [-0.8, anchor - 1.9 - 1.8 - 0.8 + 0.5],
            ]
          );
}

module Buttplug(plug_size = 7.5, plug_thickness = 0.6, click_length = 5.7) {
  cuboid([plug_thickness, plug_size, plug_size], rounding=1, edges="X");

  rotate([0, 90, 0])
    translate([0, 2, 6.2])
      ClickStraightButtplug(click_length, 0, 90);

  rotate([0, 270, 180])
    translate([0, 2, 6.2])
      ClickStraightButtplug(click_length, 0, 90);
}

module plug_grid() {
  translate([21, 0, 15]) Buttplug();
  translate([21, 0, 25]) Buttplug();
}

module plug_square() {
  // four sides, 90° apart
  for (a = [0:90:270]) {
    rotate([0, 0, a]) plug_grid();
  }
}

$fn = 128;

Buttplug();
