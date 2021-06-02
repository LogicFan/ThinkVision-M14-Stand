translate([0,0,0]) sector(30, 20, 10, 90);
translate([22,0,0]) sector(30, 20, 300, 30);
translate([0,22,0]) sector(30, 20, 30, 300);
translate([22,22,0]) sector(30, 20, 10, 190);

module sector(h, r, a1, a2) {
    d = 2 * r;
    if (a2 - a1 > 180) {
        difference() {
            cylinder(h=h, d=d);
            translate([0,0,-0.5]) sector(h+1, d+1, a2-360, a1); 
        }
    } else {
        difference() {
            cylinder(h=h, d=d);
            rotate([0,0,a1]) translate([-d/2, -d/2, -0.5])
                cube([d, d/2, h+1]);
            rotate([0,0,a2]) translate([-d/2, 0, -0.5])
                cube([d, d/2, h+1]);
        }
    }
}

module arc(h, r1, r2, a1, a2) {
    difference() {
        sector(h, r1, a1, a2);
        sector(h, r2, a1, a2);
    }
}
