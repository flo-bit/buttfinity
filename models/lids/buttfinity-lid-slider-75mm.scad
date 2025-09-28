include <../libs/BOSL2/std.scad>;
include <buttfinity-lid-base.scad>;

module ButtfinityLidSlider75mm() {
  /* [Hidden] */
  Clearance_mm = 0.25;

  // Height of the thickest part at the top of the bin
  Click_Rail_mm = 0.6;

  function measured_extra_height() = 0.2;
  function anchor() = -7 - measured_extra_height() + 0.7 + 1.8 + 1.9 + sqrt(2) * Clearance_mm * 2;

  module ClickShape() {
    polygon(
      points=[
        // [0, anchor() - 1.9 - 1.8],
        // [3.75 - 1.9, anchor() - 1.9 - 1.8],
        [3.75 - 1.9 - 0.8, anchor() - 1.9 - 1.8 - 0.8],
        [3.75 - 1.9 - 0.8, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1],
        [3.75 - 1.9 - 0.8 + 0.5, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.3],
        [3.75 - 1.9 - 0.8 + 0.5, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.8 - 0.3],
        [0, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.8 - 1.25],
        [-0.8, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.8 - 1.25],
        [-0.8, anchor() - 1.9 - 1.8],
        [3.75 - 1.9 - 0.8, anchor() - 1.9 - 1.8],
      ]
    );
  }

  module ClickStraight(size, offset, angle) {
    rotate([0, 0, angle])
      translate([offset, size / 2, 0])
        rotate([90, 0, 0])
          linear_extrude(height=size)
            ClickShape();
  }

  difference() {
    ButtfinityLid(2, 1);

    translate([-35, -1, -2])
      cube([70, 2, 3]);

    translate([-75 / 2, -5, -10])
      cube([75, 10, 9.2]);
  }

  length = 60;

  difference() {
    union() {
      translate([0, -5.9, 0])
        ClickStraight(length, 0, 90);

      translate([-length / 2, -6.7, -6.2])
        cube([length, 1.85, 6.2]);
    }
  }

  difference() {
    union() {
      translate([0, 5.9, 0])
        ClickStraight(length, 0, -90);

      translate([-length / 2, 6.7 - 1.85, -6.2])
        cube([length, 1.85, 6.2]);
    }
  }
}

// $fn = 128;

// ButtfinityLidSlider75mm();
