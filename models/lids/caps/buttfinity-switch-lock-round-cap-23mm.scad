include <../../libs/BOSL2/std.scad>;

module RoundSwitchLockCap23mm() {
  top_rounding = 1;

  difference() {
    cyl(r=11.4, h=3.6, rounding2=top_rounding, anchor=BOTTOM);

    cuboid([2.1, 3.1, 2.8]);
  }
}

$fn = 128;

RoundSwitchLockCap23mm();
