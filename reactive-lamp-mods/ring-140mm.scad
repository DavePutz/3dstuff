RING_DIA1 = 170;
RIND_DIA2 = 140;
difference() {
   cylinder(d1=RING_DIA1,d2=RIND_DIA2,h=20,$fn=128);
   translate([0,0,-1])
   cylinder(d1=RING_DIA1 - 4,d2=RIND_DIA2 - 4,h=22,$fn=128);
   }