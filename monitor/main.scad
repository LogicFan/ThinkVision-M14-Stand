outer = 30;
inner = 20;

connector(outer, inner);

module connector (o, i) {
    union() {
        translate([0, 0, 2.5])
        cube([i, i, 5], center=true);

        translate([0, 0, -1])
        cube([o, o, 2], center=true);
    }
}
