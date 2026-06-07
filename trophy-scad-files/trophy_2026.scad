include <downloads/prism-chamfer.scad>;

Start_edge=3;
End_edge=5;
Top=true;
Side_length=5;
Enable_side2=false;
Side2_length=15;
//base1_size=200;
//base2_size=180;
adjust=3;
led_long_side=151;
led_sh_side=116;
frame_y = 27;
Corner_slope="medium"; // [shallow, medium, deep]
 $fn=64;
 print_bases=false;
 print_panel=false;
 print_plaques=true;
 print_frame = false;
 landscape_mode = true;
 with_names = false;
 
module rounded_plaque (length,width,height)
{
  rotate([90,0,0])
 linear_extrude(height=height)
   offset(r=4)
    square([length,width]);
}

module plaque(x,y,z,width,height)
{
    translate([x,y,z])
    union() {
     rounded_plaque(width,height,2);
     translate([0,-2,0])
     union() {
     screw_head(.5,1,height/2);
     screw_head(width-.5,1,height/2);
     }
    }
}

module base(base1_size,base2_size,led1_size,led2_size) {
 difference() {
  union() {
  //  bottom layer
  translate([-1.5,-1.5,0])
   cube([base1_size+3,base1_size/adjust+3,4]);
  // second layer
  difference() {
  polygon_points = [[0,0],[base1_size,0],[base1_size,base1_size/adjust],[0,base1_size/adjust]];
  h=30;
  linear_extrude(height=h)
    polygon(polygon_points, convexity=2);
  polygon_points2 = [[-.2,-.2],[base1_size+.4,-.2],[base1_size+.4,base1_size/adjust+.4],[-.2,base1_size/adjust+.4]];
  prism_chamfer_mask(polygon_points2, Start_edge, End_edge, Top?h:0,
                     Side_length, Enable_side2 ? Side2_length : Side_length, Corner_slope);
  }
  // third layer
 translate([10,5,20])
  difference() {
  polygon_points = [[0,0],[base2_size,0],[base2_size,base2_size/adjust],[0,base2_size/adjust]];
  h=40;
  linear_extrude(height=h)
    polygon(polygon_points, convexity=2);
  polygon_points2 = [[-.2,-.2],[base2_size+.4,-.2],[base2_size+.4,base2_size/adjust+.4],[-.2,base2_size/adjust+.4]];
  prism_chamfer_mask(polygon_points2, Start_edge, End_edge, Top?h:0,
                     Side_length, Enable_side2 ? Side2_length : Side_length, Corner_slope);
 
  }
  }
  // cutout frame slot
  translate([18,14,57])
//   scale ([1.01,1.01,1])
    image_frame(led1_size,led2_size,base2_size,2.1);
  }

}

module guide_rail(len) {
    polygon_points = [[0,0],[4,0],[0,4],[0,0]];
    linear_extrude(height=len)
      polygon(polygon_points, convexity=2);
}

module image_frame(led1_size,led2_size,base2_sz,thick) {
   difference() {
    union() {
    cube([thick,base2_sz/adjust - 9,led2_size+8]);
    cube([led1_size+8,thick,led2_size+8]);
    translate([led1_size+8,0,0])
     cube([thick,base2_sz/adjust - 9,led2_size+8]);
    
    translate([0,0,led2_size+8])
     cube([led1_size+10,base2_sz/adjust - 8,thick]);
    }
    translate([7,-1,7])
     cube([led1_size-4,thick+2,led2_size-4]);
    // slots on top
       for (x=[10:20:led1_size]) {
        translate([x,8,led2_size])
         cube([5,16,20]);
    }
   }
   // rails to hold in LED & lithopane
   if (landscape_mode) {
    translate([1,frame_y,4])
     rotate([0,0,270])
      guide_rail(led_sh_side + 4);
   translate([led_long_side+8,frame_y,4])
    // cutouts for usb/screws
    difference() {
      rotate([0,0,180])
       guide_rail(led_sh_side + 4);
      translate([-5,-4,(led_sh_side / 2)-3])
         cube([5,5,15]);
      translate([-5,-4,led_sh_side])
         cube([5,5,4]);
      translate([-5,-4,-1])
         cube([5,5,4]);
     }
   }
   else {
    translate([1,frame_y,4])
     rotate([0,0,270])
      guide_rail(150);
   translate([led_sh_side+8,frame_y,4])
    rotate([0,0,180])
     guide_rail(150);
   }
}

module screw_head(x,y,z) {
 color("white")

 translate([x,y,z])
 rotate([90,0,0])
 difference() {
    sphere (d=5);
    translate([-3,-3,-3])
      cube([6,6,4]);
    translate([-.5,-3,1.5])
     cube([1,6,5]);
     }
 }
 
height=50;
side_length=30;

//base
base1_size=landscape_mode? led_long_side+45 :led_sh_side+47;
base2_size=landscape_mode? led_long_side+25:led_sh_side+27;
led1_size=landscape_mode? led_long_side : led_sh_side;
led2_size=landscape_mode? led_sh_side : led_long_side;
if (print_bases) {
  translate([-48,-20,0])
    base(base1_size,base2_size,led1_size,led2_size);
}
//frame for hueforge image

  if (print_frame) {
    translate([-30,-5.7,37])
      image_frame(led1_size,led2_size,base2_size,2);
}
//words on separate plaques
//color("black")
if (print_plaques) {
 union() {
     
plaque(-10,-15,34,96,17);
plaque(-33,-20,9,127,12);


 }
 color("black")
 union() {
 translate([-26,-22,12])
 rotate([90,0,0])
  linear_extrude(height=2)
  text ("Photogenesis",size=6);
 translate([-4,-17,39])
 rotate([90,0,0])
 linear_extrude(height=2)
  text ("2025-2026",size=6);
}
color("black")
translate([40,-17,43])
 union() {
  rotate([90,0,0]) 
   linear_extrude(height=2)
     text ("1st Place",size=6);
   if (with_names) {
    translate([0,0,-7])
     rotate([90,0,0]) 
      linear_extrude(height=2)
       text ("Large Prints",size=6);
   }
 } 
 color("black")
  if (with_names) {
  translate([30,-22,12])
    rotate([90,0,0])
     linear_extrude(height=2)
      text ("Test Name",size=7);
  }
}
// led panel
if (print_panel) {
 color("blue")
 translate([-26.5,13,43])
 rotate([90,0,0])
 cube([led_long_side,led_sh_side,20]);
}
