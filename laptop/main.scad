use <../lib/sector.scad>
use <../lib/triangle.scad>

$fn = 64;
delta = 0.2;

t = 5;  // the screen thickness is 5mm

b = 25.4;   // 1 inch

module body() {
    h = 80;
    w = 40;

    translate([0, -2, 0])
    union() {
        translate([9, 0, 0])
        arc(h, 9, 7, 180, 250);
        
        translate([0, 0, 40])
        cube([w, 2, 40], center=false);
        
        translate([0, 0, 40])
        rotate([270, 0, 0])
        triangle(40, 20, 2);
        
        cube([10, 2, 40], center=false);
    }
}

module arm() {
    t = 5 - delta;
    or = 40;
    ir = 20 + delta;

    translate([-2, 0, 40])
    union() {
        translate([-or/2, -t/2, or/2])
        difference() {
            cube([or, t, or], center=true);

            union() {
                cube([ir, t+1, ir], center=true);

                translate([0, 0, ir*2-1])
                cube([ir, t+1, ir*3], center=true);
            }        
        }
    
        translate([0, -9, -40])
        cube([2, 9, 80], center=false);
        
        mirror([1, 0, 0])
        mirror([0, 0, 1])
        rotate([90, 0, 0])
        triangle(40, 20, t);
    }
}

union() {
    rotate([0, 0, 27])
    arm();
    
    body();
}
