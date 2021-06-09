use <main.scad>

mirror([1, 0, 0])
rotate([-90, 0, 0])
rotate([0, 0, -30])
union() {
    rotate([0, 0, 30])
    arm();
    
    body();
}