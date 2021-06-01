// the connector that connects between the laptop part & monitor part
// or: outer radius of the connector
// ir: inner radius of the connector
// a: the angle of the connector
// h1: the up-side of the connector
// h2: the lower-side (connecting side) of the connector
module connecter(or, ir, a, h1, h2) {
    difference() {
        union() {
            translate([or/2, 0, h1/2])
            cube([or, or*2, h1], center=true);

            difference() {
                translate([0, 0, h1/2-h2/2])
                cylinder(h=h1+h2, r=or, center=true);

                rotate([0, 0, a])
                translate([or/2, 0, -h2/2-1])
                cube([or, or*2, h2+2], center=true);
            }
        }
        
        cylinder(h=(h1+h2)*2, r=ir, center=true);
    }
}

$fn = 64;
or = 3;
ir = 1;
a = 20;
h1 = 17;
h2 = 3;

connecter(or, ir, a, h1, h2);