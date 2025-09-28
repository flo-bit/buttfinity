module ClickStraightMicrocontroller(size, offset, angle) {
  anchor = -7 - 0.2 + 0.7 + 1.8 + 1.9 + sqrt(2) * 0.25 * 2;
  rotate([0, 0, angle])
    translate([offset, size / 2, 0])
      rotate([90, 0, 0])
        linear_extrude(height=size)
          polygon(
            points=[
              [3.75 - 1.9 - 0.8, anchor - 1.9 - 1.8 - 0.8 + 3],
              [3.75 - 1.9 - 0.8, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1],
              [3.75 - 1.9 - 0.8 + 0.5, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.5],
              [3.75 - 1.9 - 0.8 + 0.5, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.5 - 0.8],
              [0, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.2 - 0.8 - 1.25],
              [-0.8, anchor - 1.9 - 1.8 - 0.8 - 0.8 - 0.1 - 0.2 - 0.8 - 1.25],
              [-0.8, anchor - 1.9 - 1.8 + 3],
            ]
          );
}
