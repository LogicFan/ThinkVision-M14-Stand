use <../connector.scad>

// 122 

$fn = 64;

l = 324;        // the width of the monitor, copy from websites
t = 7.6;        // the thickness of the stand part of the monitor, by measurement
ro = 2;         // the radius of the M4 screw
ho = 100;       // the horizontal separation between two holes, VESA 100 standard
vo = 5;         // the vertical separation of the hole from the top edge of the bottom body, measured value

mw = ho + 20;   // the width of the main body

bt = 2;         // the thickness of the bottom body
bh = 20;        // the height of the bottom body

tt = 6;         // the thickness of the top body
th = 40;        // the height of the top body

aw = 20;
ah = 122 - th;

ca = 20;
cir = 1;
ch1 = 17;
ch2 = 6;

delta = 5;
// union () {
//     bottom(mw, bt, bh, ro, ho, vo);
//     top(l, mw, t, bt, tt, th);
// }

arm(l, aw, t, ah, ca, cir, ch1, ch2, delta);

// the arm (including connector)
// w: the width of the monitor
// t: the thickness of the arm
// h: the height of the vertical arm
// ca: the angle of the connector
// cir: the inner radius of the connector
// ch1: the h1 of the connector
// ch2: the h2 of the connector
module arm (w, aw, t, h, ca, cir, ch1, ch2, delta) {
    union () {
        translate([(delta+t)/2, 0, ch1/2])
        cube([delta, t, ch1], center=true);
        
        connector(t/2, cir, ca, ch1, ch2);
    }
    
}

// the bottom part that connects to monitor through
// w: the width of the bottom body
// t: the thickness of the bottom body
// h: the height of the bottom body
// ro: the radius of the hole that connect to monitor throw M4 screw
// ho: the horizontal separation between two holes
// vo: the vertical separation from the top edge of the bottom body
module bottom (w, t, h, ro, ho, vo) {
    translate([0, t/2, -h/2])
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

// the top part of the main body
// w: the width of the top body
// t: the thickness of the stand part of the monitor
// bt: the thickness of the bottom body
// tt: the thickness of the top body
// h: the height of the top body
module top(w, mw, t, bt, tt, h) {
    x = t + bt - tt;
    p = mw/2;
    q = -w/2;

    points = [
        [p, 0, 0],          // 0
        [p, bt, 0],
        [p, bt+t, t],
        [p, 0, tt],
        [p, x, tt+x],
        [p, x, h],
        [p, x+tt, h],
        [q, 0, 0],          // 7
        [q, bt, 0],
        [q, bt+t, t],
        [q, 0, tt],
        [q, x, tt+x],
        [q, x, h],
        [q, x+tt, h]
    ];

    faces = [
        [0, 1, 8, 7],
        [1, 2, 9, 8],
        [0, 7, 10, 3],
        [3, 10, 11, 4],
        [4, 11, 12, 5],
        [2, 6, 13, 9],
        [5, 12, 13, 6],
        [0, 3, 4, 2, 1],
        [2, 4, 5, 6],
        [7, 8, 9, 11, 10],
        [9, 13, 12, 11]
    ];

    difference () {
        polyhedron(points=points, faces=faces);
    
        translate([-w/2-2, -2, 0])
        cube([(w-mw)/2+2, x+2, h*2], center=false);
    }
}

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