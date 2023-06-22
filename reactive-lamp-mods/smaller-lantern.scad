difference() {
import ("Z:/savers/3d-printing/downloads/Floor Lamp - Sound Reactive WLED/Lantern (Partial).3mf");
  translate([0,0,75])
  difference() {
   sphere (d=220,$fn=128);
   sphere (d=160,$fn=128);
   }
   }
difference() {
  translate([0,0,75])
  difference() {
    sphere (d=160,$fn=128);
    sphere (d=158,$fn=128);
    }
   translate([-100,-100,-20])
    cube([200,200,40]);
   translate([-100,-100,120])
    cube([200,200,40]);
    }
