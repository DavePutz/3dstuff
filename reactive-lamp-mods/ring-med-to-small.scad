RING_DIA1 = 125;
RIND_DIA2 = 80;
SPH_DIA = 154;
HGT = 20;
module shapeit() {
difference() {
 circle(d=154,$fn=128);
 circle(d=150,$fn=128);
 translate([-80,-80,0])
   square([160,105]);
 translate([-64,41])
   square([160,105]);
 translate([50,20])
   square([160,105]);
 }
 rotate([0,0,305])
 translate([-71.6,-28.8])
   square([2.3,25]);
}
*difference() {
   cylinder(d1=RING_DIA1,d2=RIND_DIA2,h=HGT,$fn=128);
   translate([0,0,-1])
   cylinder(d1=RING_DIA1 - 4,d2=RIND_DIA2 - 4,h=HGT+2,$fn=128);
   }
rotate_extrude(angle=360,convexity=20,$fn=128) 
  shapeit();
  