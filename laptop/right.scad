use <main.scad>

mirror([1, 0, 0])
union() {
    rotate([0, 0, 22])
    arm();
    
    body();
}