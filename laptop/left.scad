use <main.scad>

rotate([-90, 0, 0])
rotate([0, 0, -30])
union() {
    rotate([0, 0, 30])
    arm();
    
    body();
}