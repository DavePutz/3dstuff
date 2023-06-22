difference() {
 union() {
  cylinder (d=152,h=4,$fn=128);
  }
 translate ([0,0,-1])
  cylinder (d=9,h=9,$fn=128);
 *translate([0,0,-1])
  cylinder (d=20,h=6,$fn=64);
 translate([-3,-80,-1])
   cube([6,80,6]);

  }
