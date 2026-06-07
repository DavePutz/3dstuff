$fn=64;
difference() {
 union() {
  translate([-171,-178,0])
    scale([1.05,1,1])
     import ("z:/savers/3d-printing/trophy-2026_Lithopane diffuser.stl");
     
// make it thicker
  translate([0,0,.4])
    cube([156,120,1]);
  translate([1,0,2])
    cube([156,5,15]);
  translate([1,115,2])
    cube([156,5,15]);
 }
 
// screw holes
translate([3,3,2])
 cylinder(d=2,h=20);
translate([71,3,2])
 cylinder(d=2,h=20);
translate([84,3,2])
 cylinder(d=2,h=20);
translate([153,3,2])
 cylinder(d=2,h=20);
translate([3,118,2])
 cylinder(d=2,h=20);
translate([71,118,2])
 cylinder(d=2,h=20);
translate([84,118,2])
 cylinder(d=2,h=20);
translate([153,118,2])
 cylinder(d=2,h=20);
 }

