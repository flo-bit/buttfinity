include <../libs/BOSL2/std.scad>

module RowHoles(gridx = 1, gridy = 1, bin_size = 42, hole_size = 6, rounding = 1) {
  max_y = (gridy - 1) * bin_size / 2;
  min_y = -max_y;

  for (y = [min_y:bin_size:max_y]) {
    translate([0, y + 5, 0])
      cuboid([bin_size * gridx, hole_size, hole_size], rounding=1);

    translate([0, y - 5, 0])
      cuboid([bin_size * gridx, hole_size, hole_size], rounding=1);
  }

  max_x = (gridx - 1) * bin_size / 2;
  min_x = -max_x;

  for (x = [min_x:bin_size:max_x]) {
    translate([x + 5, 0, 0])
      cuboid([hole_size, bin_size * gridy, hole_size], rounding=1);
    translate([x - 5, 0, 0])
      cuboid([hole_size, bin_size * gridy, hole_size], rounding=1);
  }
}

module Buttholes(gridx = 1, gridy = 1, hole_height = 15, hole_height2 = 25, bin_size = 42, hole_size = 6, rounding = 1) {
  translate([0, 0, hole_height])
    RowHoles(gridx=gridx, gridy=gridy, bin_size=bin_size, hole_size=hole_size, rounding=rounding);

  translate([0, 0, hole_height2])
    RowHoles(gridx=gridx, gridy=gridy, bin_size=bin_size, hole_size=hole_size, rounding=rounding);
}
