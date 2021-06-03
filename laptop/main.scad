use <../lib/sector.scad>
use <../lib/triangle.scad>

$fn = 64;
delta = 0.2;

t = 5;  // the screen thickness is 5mm

b = 25.4;   // 1 inch

union() {
    rotate([0, 0, 22])
    arm();
    
    body();
}

module body() {
    difference() {
        body1();
        
        union() {
            translate([30, -4, 40])
            cube([11, 2, b]);
        
            translate([30, -3, 40])
            cube([2, 4, b]);
        }
    }
}

module body1() {
    h = 80;
    w = 40;

    t = 2;

    translate([0, -3, 0])
    union() {
        difference() {
            union() {
                translate([9, 0, 0])
                arc(h, 9, 7, 180, 250);
                
                translate([9, 0, 78])
                sector(2, 9, 180, 250);
            }
            
            translate([5, -9, -1])
            cube([4, 1, h+2], center=false);
        }
            
        translate([0, 0, 40])
        cube([w, 3, 40], center=false);
        
        translate([0, 0, 40])
        rotate([270, 0, 0])
        triangle(40, 20, 3);
        
        cube([10, 3, 40], center=false);
        
        translate([6, -8, 78])
        cube([34, 10, 2], center=false);
        
        translate([36, -8, 77])
        cube([4, 1.4, 3], center=false);
    }
}

module arm() {
    t = 5 - delta;
    or = 30;
    ir = 20 + delta;

    translate([-(or+2), -t, 80-or])
    union() {
        difference() {
            translate([-10, 0, 0])
            cube([or+10, t, or], center=false);
            
            translate([(or-ir)/2, -1, (or-ir)/2-2])
            cube([ir, t+2, 100], center=false);
        }
    
        translate([or, -9+t, -(80-or)])
        cube([2, 9, 80], center=false);
        
        translate([-10, 0, 0])
        translate([40, 0, 0])
        mirror([1, 0, 0])
        rotate([270, 0, 0])
        triangle(40, 20, t);
    }
}
