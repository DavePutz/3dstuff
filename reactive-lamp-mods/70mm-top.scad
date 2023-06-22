difference() {
scale ([7/16,7/16,1])
  import ("Z:/savers/3d-printing/downloads/Floor Lamp - Sound Reactive WLED/Lamp Top (Basic).stl");
  cylinder (d=20,h=150,$fn=128);
  }
  difference() {
    import ("Z:/savers/3d-printing/downloads/Floor Lamp - Sound Reactive WLED/Lamp Top (Basic).stl");
   difference() {
    cylinder (d=200,h=150,$fn=128);
    cylinder (d=20,h=150,$fn=128);
    }
    }
    