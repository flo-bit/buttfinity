/* [Hidden] */
Corner_Radius_mm = 4;
Clearance_mm = 0.25;
Label_Clearance_mm = 3;

/* [Dimensions] */
// 1.0 equals standard 42mm Gridfinity size
Grid_Factor = 1.0;
Grid_Size_mm = 42 * Grid_Factor;
// as defined above
Width_Units = 1.0;
Width_mm = Width_Units * Grid_Size_mm;
// as defined above
Length_Units = 1.0;
Length_mm = Length_Units * Grid_Size_mm;

Mirror_X = false;
Mirror_Y = false;

/* [General Properties] */
// Thickness of the solid plane
Thickness_mm = 0.8;

/* [Click Properties] */
// Should the lid snap into place?
Include_Click_Mechanism = true;
// Along the side specified as "Width"
Click_In_X_Direction = true;
// Along the side specified as "Length"
Click_In_Y_Direction = true;
// Height of the thickest part at the top of the bin
Click_Rail_mm = 0.6;
// Reduce click rail to accommodate for labels

/* [Label Properties] */
// Enable if the box has a label plate
Leave_Space_For_Label = false;
// Position of the label plate
Label_Position = 0; // [0: Front, 180: Back, 270: Left, 90: Right]
// Width of the label plate
Label_Width_mm = 12.0;

/* [Stacking Properties] */
// Add grid on top of the lid
Include_Stacking_Grid = false;
// Compatibility with Mix&Match baseplates
Shallow_Junctions = false;
// Add holes for magnets
Use_Magnets = false;
// Only if "Use Magnets" is selected
Magnet_Diameter_mm = 6.5;
// Only if "Use Magnets" is selected
Magnet_Thickness_mm = 2.4;
// Add holes for screws
Use_Screws = false;
// Only if "Use Screws" is selected
Screw_Diameter_mm = 3.0;
// Length of the threaded part
Screw_Length_mm = 2;

$fn = 128;

module TopShape() {
  polygon(
    points=[
      [0, 0],
      [0, 0.7 + 1.8 + 1.9],
      [-0.25, 0.7 + 1.8 + 1.9],
      [-2.15, 0.7 + 1.8],
      [-2.15, 0.7],
      [-2.15 - 0.7, 0],
    ]
  );
}

function measured_extra_height() = 0.2;
function anchor() = -7 - measured_extra_height() + 0.7 + 1.8 + 1.9 + sqrt(2) * Clearance_mm * 2;

module BottomShape() {
  polygon(
    points=[
      [0, 0],
      [0, anchor()],
      [-1.9, anchor() - 1.9],
      [-1.9, anchor() - 1.9 - 1.8],
      [-(Corner_Radius_mm - Clearance_mm), anchor() - 1.9 - 1.8],
      [-(Corner_Radius_mm - Clearance_mm), 0],
    ]
  );
}

module BottomChamferShape() {
  polygon(
    points=[
      [-(Corner_Radius_mm - Clearance_mm), 0],
      [-(Corner_Radius_mm - Clearance_mm), -5],
      [-(Corner_Radius_mm - Clearance_mm) - 5, 0],
    ]
  );
}

module ClickShape() {
  polygon(
    points=[
      [0, anchor() - 1.9 - 1.8],
      [3.75 - 1.9, anchor() - 1.9 - 1.8],
      [3.75 - 1.9 - 0.8, anchor() - 1.9 - 1.8 - 0.8],
      [3.75 - 1.9 - 0.8, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1],
      [3.75 - 1.9 - 0.8 + 0.2, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2],
      [3.75 - 1.9 - 0.8 + 0.2, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.8],
      [0, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.8 - 1.25],
      [-0.8, anchor() - 1.9 - 1.8 - 0.8 - Click_Rail_mm - 0.1 - 0.2 - 0.8 - 1.25],
      [-0.8, anchor() - 1.9 - 1.8],
      [0, anchor() - 1.9 - 1.8 + 0.8],
    ]
  );
}

module BaseShape() {
  offset(r=Corner_Radius_mm - Clearance_mm) {
    square([Width_Units * Grid_Size_mm - 2 * Corner_Radius_mm, Length_Units * Grid_Size_mm - 2 * Corner_Radius_mm], center=true);
  }
}

module BaseSurface() {
  translate([0, 0, -Thickness_mm])
    linear_extrude(height=Thickness_mm)
      BaseShape();
}

module TopCorner() {
  translate([-Corner_Radius_mm, -Corner_Radius_mm, 0]) {
    rotate_extrude(angle=90) translate([Corner_Radius_mm, 0, 0]) TopShape();
    linear_extrude(height=0.7 + 1.8 + 1.9)
      difference() {
        square([Corner_Radius_mm, Corner_Radius_mm]);
        circle(r=Corner_Radius_mm);
      }
    ;
  }
}

module BottomCorner() {
  Radius_With_Clearance = Corner_Radius_mm - Clearance_mm;
  translate([-Radius_With_Clearance, -Radius_With_Clearance, 0]) {
    rotate_extrude(angle=90) translate([Radius_With_Clearance, 0, 0]) BottomShape();
  }
}

function MagnetSupportHeight() =
  Use_Magnets ? Magnet_Thickness_mm + (
      Use_Screws ? Screw_Length_mm
      : Thickness_mm
    )
  : 0;

module MagnetHole() {
  // Magnet Hole
  if (Use_Magnets) {
    translate([0, 0, -Magnet_Thickness_mm])
      linear_extrude(height=Magnet_Thickness_mm())
        circle(r=Magnet_Diameter_mm / 2);
    // Screw Hole
    if (Use_Screws) {
      translate([0, 0, -Magnet_Thickness_mm - Screw_Length_mm])
        linear_extrude(height=Screw_Length_mm())
          circle(r=Screw_Diameter_mm / 2);
    }
  }
}

module MagnetSupport() {
  if (Use_Magnets) {
    translate([0, 0, -MagnetSupportHeight()])
      linear_extrude(height=MagnetSupportHeight())
        circle(r=Magnet_Diameter_mm / 2 + 1);
  }
}

module TopJunction() {
  rotate([0, 0, 0]) TopCorner();
  rotate([0, 0, 90]) TopCorner();
  rotate([0, 0, 180]) TopCorner();
  rotate([0, 0, 270]) TopCorner();
}

module NegativeTopJunction() {
  translate([0, 0, 0.7 + 1.8 + 1.9 - 1.25])
    linear_extrude(height=1.25)
      square([10, 10], center=true);
}

module BottomCorners() {
  x = Width_Units / 2 * Grid_Size_mm - Clearance_mm;
  y = Length_Units / 2 * Grid_Size_mm - Clearance_mm;
  translate([x, y, 0]) rotate([0, 0, 0]) BottomCorner();
  translate([-x, y, 0]) rotate([0, 0, 90]) BottomCorner();
  translate([-x, -y, 0]) rotate([0, 0, 180]) BottomCorner();
  translate([x, -y, 0]) rotate([0, 0, 270]) BottomCorner();
}

module TopStraight(size, offset, angle) {
  rotate([0, 0, angle])
    translate([offset, size / 2, 0])
      rotate([90, 0, 0])
        linear_extrude(height=size)
          TopShape();
}

module BottomStraight(size, offset, angle) {
  rotate([0, 0, angle])
    translate([offset, size / 2, 0])
      rotate([90, 0, 0])
        linear_extrude(height=size) {
          BottomShape();
          BottomChamferShape();
        }
}

module ClickStraight(size, offset, angle) {
  rotate([0, 0, angle])
    translate([offset, size / 2, 0])
      rotate([90, 0, 0])
        linear_extrude(height=size)
          ClickShape();
}

module BottomStraights() {
  BottomStraight(Length_Units * Grid_Size_mm - 2 * Corner_Radius_mm, Width_Units * Grid_Size_mm / 2 - Clearance_mm, 0);
  BottomStraight(Length_Units * Grid_Size_mm - 2 * Corner_Radius_mm, Width_Units * Grid_Size_mm / 2 - Clearance_mm, 180);
  BottomStraight(Width_Units * Grid_Size_mm - 2 * Corner_Radius_mm, Length_Units * Grid_Size_mm / 2 - Clearance_mm, 90);
  BottomStraight(Width_Units * Grid_Size_mm - 2 * Corner_Radius_mm, Length_Units * Grid_Size_mm / 2 - Clearance_mm, 270);
}

module ClickStraights() {
  if (Click_In_Y_Direction) {
    ClickStraight(Length_Units * Grid_Size_mm - 4 * Corner_Radius_mm, Width_Units * Grid_Size_mm / 2 - Corner_Radius_mm, 0);
    ClickStraight(Length_Units * Grid_Size_mm - 4 * Corner_Radius_mm, Width_Units * Grid_Size_mm / 2 - Corner_Radius_mm, 180);
  }
  if (Click_In_X_Direction) {
    ClickStraight(Width_Units * Grid_Size_mm - 4 * Corner_Radius_mm, Length_Units * Grid_Size_mm / 2 - Corner_Radius_mm, 90);
    ClickStraight(Width_Units * Grid_Size_mm - 4 * Corner_Radius_mm, Length_Units * Grid_Size_mm / 2 - Corner_Radius_mm, 270);
  }
}

module TopStraights() {
  translate([-Width_Units / 2 * Grid_Size_mm, 0, 0]) {
    for (x = [0:1:Width_Units]) {
      TopStraight(Length_Units * Grid_Size_mm, x * Grid_Size_mm, 0);
      TopStraight(Length_Units * Grid_Size_mm, -x * Grid_Size_mm, 180);
    }
    TopStraight(Length_Units * Grid_Size_mm, Width_Units * Grid_Size_mm, 0);
  }

  translate([0, -Length_Units / 2 * Grid_Size_mm, 0]) {
    for (y = [0:1:Length_Units]) {
      TopStraight(Width_Units * Grid_Size_mm, y * Grid_Size_mm, 90);
      TopStraight(Width_Units * Grid_Size_mm, -y * Grid_Size_mm, 270);
    }
    TopStraight(Width_Units * Grid_Size_mm, Length_Units * Grid_Size_mm, 90);
  }
}

module TopJunctions() {
  translate(
    [
      -Width_Units * Grid_Size_mm / 2,
      -Length_Units * Grid_Size_mm / 2,
      0,
    ]
  ) {
    for (x = [0:1:Width_Units], y = [0:1:Length_Units]) {
      translate([x * Grid_Size_mm, y * Grid_Size_mm, 0])
        TopJunction();
    }
    for (x = [0:1:Width_Units]) {
      translate([x * Grid_Size_mm, Length_Units * Grid_Size_mm, 0])
        TopJunction();
    }
    for (y = [0:1:Length_Units]) {
      translate([Width_Units * Grid_Size_mm, y * Grid_Size_mm, 0])
        TopJunction();
    }
    translate([Width_Units * Grid_Size_mm, Length_Units * Grid_Size_mm, 0])
      TopJunction();
  }
}

module NegativeTopJunctions() {
  translate(
    [
      -Width_Units * Grid_Size_mm / 2,
      -Length_Units * Grid_Size_mm / 2,
      0,
    ]
  ) {
    for (x = [0:1:Width_Units], y = [0:1:Length_Units]) {
      translate([x * Grid_Size_mm, y * Grid_Size_mm, 0])
        NegativeTopJunction();
    }
    for (x = [0:1:Width_Units]) {
      translate([x * Grid_Size_mm, Length_Units * Grid_Size_mm, 0])
        NegativeTopJunction();
    }
    for (y = [0:1:Length_Units]) {
      translate([Width_Units * Grid_Size_mm, y * Grid_Size_mm, 0])
        NegativeTopJunction();
    }
    translate([Width_Units * Grid_Size_mm, Length_Units * Grid_Size_mm, 0])
      NegativeTopJunction();
  }
}

module MagnetHoles() {
  translate(
    [
      -Width_Units * Grid_Size_mm / 2,
      -Length_Units * Grid_Size_mm / 2,
      0,
    ]
  ) {
    for (x = [0:1:Width_Units], y = [0:1:Length_Units]) {
      translate([x * Grid_Size_mm, y * Grid_Size_mm, 0]) {
        translate([8.8, 8.8, 0]) MagnetHole();
        translate([-8.8, 8.8, 0]) MagnetHole();
        translate([-8.8, -8.8, 0]) MagnetHole();
        translate([8.8, -8.8, 0]) MagnetHole();
      }
    }
  }
}

module MagnetSupports() {
  intersection() {
    translate([0, 0, -7]) linear_extrude(height=7) BaseShape();
    translate(
      [
        -Width_Units * Grid_Size_mm / 2,
        -Length_Units * Grid_Size_mm / 2,
        0,
      ]
    ) {
      for (x = [0:1:Width_Units], y = [0:1:Length_Units]) {
        translate([x * Grid_Size_mm, y * Grid_Size_mm, 0]) {
          translate([8.8, 8.8, 0]) MagnetSupport();
          translate([-8.8, 8.8, 0]) MagnetSupport();
          translate([-8.8, -8.8, 0]) MagnetSupport();
          translate([8.8, -8.8, 0]) MagnetSupport();
        }
      }
    }
  }
}

module FullTop() {
  difference() {
    union() {
      TopStraights();
      TopJunctions();
    }
    if (Shallow_Junctions) {
      NegativeTopJunctions();
    }
  }
}

module TopWithClearance() {
  intersection() {
    FullTop();
    linear_extrude(height=0.7 + 1.8 + 1.9)
      BaseShape();
  }
}

module BottomWithClearance() {
  BottomStraights();
  BottomCorners();
}

module ClickWithClearance() {
  ClickStraights();
}

module LabelBlocker() {
  height = 0.8 + Click_Rail_mm + 0.1 + 0.2 + 0.8 + 1.25;
  length = Label_Position % 180 == 0 ? Length_mm : Width_mm;
  width = Label_Width_mm;
  lid_width = Label_Position % 180 == 0 ? Width_mm : Length_mm;
  rotate([0, 0, Label_Position])
    translate([-width + lid_width / 2 - 1.9 - Label_Clearance_mm, -length / 2, anchor() - 1.9 - 1.8 - height])
      linear_extrude(height=height)
        square([width + Label_Clearance_mm, length]);
}

module EntirePart() {
  difference() {
    union() {
      if (Include_Stacking_Grid) TopWithClearance();
      BaseSurface();
      BottomWithClearance();
      if (Include_Click_Mechanism) ClickWithClearance();
      if (Use_Magnets) MagnetSupports();
    }
    ; if (Use_Magnets) MagnetHoles();
    if (Leave_Space_For_Label) LabelBlocker();
  }
}

module MirrorXPart() {
  if (Mirror_X) {
    mirror([1, 0, 0]) EntirePart();
  } else {
    EntirePart();
  }
}

module MirrorXYPart() {
  if (Mirror_Y) {
    mirror([0, 1, 0]) MirrorXPart();
  } else {
    MirrorXPart();
  }
}

bigger_hole_width = 11.5;

difference() {
  union() {
    MirrorXYPart();

    translate([-7.5, -9.5, -5])
      cube([15, 19, 4.5]);

    translate([-6.5, -8.5, -5])
      cube([13, 5, 1]);
  }
  union() {
    translate([-bigger_hole_width / 2, -7.75, -5])
      cube([bigger_hole_width, 15.5, 4]);
  }
}

r = 1;
translate([0, 0, -(1 + r / 2 + 2)])
  union() {
    translate([bigger_hole_width / 2, 5, 0])
      sphere(r=r);

    translate([bigger_hole_width / 2, -5, 0])
      sphere(r=r);

    translate([-bigger_hole_width / 2, 5, 0])
      sphere(r=r);

    translate([-bigger_hole_width / 2, -5, 0])
      sphere(r=r);
  }
