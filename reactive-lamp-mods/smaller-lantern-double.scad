size=170;
translate([0,0,-20])
union() {
   difference() {
   import ("Z:/savers/3d-printing/downloads/Floor Lamp - Sound Reactive WLED/Lantern (Partial).3mf");
   // remove shells
  translate([0,0,75])
  difference() {
   sphere (d=220,$fn=128);
   sphere (d=size,$fn=128);
   }
  // remove bottom
  translate([-(size/2),-(size/2),-20])
     cube([size,size,40]);
  // remove top
  translate([-(size/2),-(size/2),90])
     cube([size,size,40]);
   }

   
difference() {
union() {
//outer shell
difference() {
  translate([0,0,75])
  difference() {
    sphere (d=size,$fn=128);
    sphere (d=size-.6,$fn=128);
    }
   translate([-100,-100,-20])
    cube([200,200,40]);
   translate([-100,-100,130])
    cube([200,200,40]);
    }
    //inner shell
difference() {
  translate([0,0,75])
  difference() {
    sphere (d=size-1.8,$fn=128);
    sphere (d=size-2.4,$fn=128);
    }
   translate([-100,-100,-20])
    cube([200,200,40]);
   translate([-100,-100,130])
    cube([200,200,40]);
    }
// cut out for center wall spot
    }
    translate([0,-size/2,size-25])
   rotate([90,0,90])
   linear_extrude(height=.1) {
     circle(d=size,$fn=128);
     }
 }
 }
//ring on top
translate([0,0,109.5])
 difference () {
   cylinder(d=size/1.31,h=.6,$fn=128);
   cylinder (d=(size/1.31)-2.4,h=1,$fn=128);
   }


