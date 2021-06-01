use <../connector.scad>

$fn = 64;

l = 324;        // the width of the monitor, copy from websites
d = 7.6;        // the thickness of the stand part of the monitor, by measurement
ro = 2;         // the radius of the M4 screw
ho = 100;       // the horizontal separation between two holes, VESA 100 standard
vo = 5;         // the vertical separation of the hole from the top edge of the bottom body, measured value

mw = ho + 20;   // the width of the main body

bt = 2;         // the thickness of the bottom body
bh = 20;        // the height of the bottom body

bottom (mw, bt, bh, ro, ho, vo);

// the bottom part that connects to monitor through
// w: the width of the bottom body
// t: the thickness of the bottom body
// h: the height of the bottom body
// ro: the radius of the hole that connect to monitor throw M4 screw
// ho: the horizontal separation between two holes
// vo: the vertical separation from the top edge of the bottom body
module bottom (w, t, h, ro, ho, vo) {
    translate([0, 0, -h/2])
    difference() {
        cube([w, t, h], center=true);
        
        union() {
            rotate([90, 0, 0]) 
            translate([ho/2, (h/2)-vo, 0])
            cylinder(h=t+2, r=ro, center=true);

            rotate([90, 0, 0]) 
            translate([-ho/2, (h/2)-vo, 0])
            cylinder(h=t+2, r=ro, center=true);
        }
    }
}

// the top part that connect to arm
// l: the width of the body
// t: the thickness of the body bottom
// d: the thickness difference between screen and stand when fold
// module top(l, t, d) {
//     h = 40;         // height

//     polyhedron(
//         points=[
//             [-l/2, -t/2, 0],    // 0
//             [-l/2, -t/2, h],
//             [l/2, -t/2, h],
//             [l/2, -t/2, 0],
//             [-l/2, t/2, 0],     // 4
//             [l/2, t/2, 0],
//             [-l/2, t/2+d, d],   // 6
//             [-l/2, t/2+d, h],
//             [l/2, t/2+d, h],
//             [l/2, t/2+d, d],
//         ],
//         faces=[
//             [0, 1, 2, 3],
//             [0, 3, 5, 4],
//             [4, 5, 9, 6],
//             [6, 9, 8, 7],
//             [1, 7, 8, 2],
//             [0, 4, 6, 7, 1],
//             [3, 2, 8, 9, 5]
//         ]
//     );
// }

// // the arm part that connects to the laptop using catcher
// // l: monitor width
// // t: the thickness of the body
// // ir: the inner radius for the catcher
// // a: the angle for the catcher
// module arm(l, t, ir, a) {
//     h1 = 17;
//     h2 = 6;

//     translate([-l/2, 0, 0])
//     union() {
//         translate([(l+t)/4, 0, h1/2])
//         cube([(l-t)/2, t, h1], center=true);

//         catcher(t/2, ir, a, h1, h2);
//     }
// }

// l = 324;        // copy from websites
// t = 2;          // temporary value
// d = 7.6;        // measured value
// or = 2;         // M4 screw, 2mm radius
// oh = 100;       // VESA mount, 100mm separation
// ov = 5;         // measured value

// union() {
//     bottom(oh+20, t, or, oh, ov);
    
//     top(oh+20, t, d);

//     translate([0, d/2, 23])
//     arm(l, d+t, 1, -20);
// }