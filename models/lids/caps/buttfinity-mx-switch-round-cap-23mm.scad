include <../../libs/cherrymx.scad>;
include <../../libs/BOSL2/std.scad>;

module RoundMXSwitchCap23mm() {
  top_rounding = 1;

  w = 7.2;
  h = 5.56;

  thickness = 1.4;
  difference() {
    translate([0, 0, 1])
      cyl(r=11.4, h=6, rounding2=top_rounding);

    translate([0, 0, 5])
      CherryMX();

    difference() {
      translate([0, 0, -2])
        cylinder(r=10.6, h=4);

      translate([-(w - thickness) / 2, -(h - thickness) / 2, -2])
        cube([w - thickness, h - thickness, 4]);
    }
  }
}

RoundMXSwitchCap23mm();
