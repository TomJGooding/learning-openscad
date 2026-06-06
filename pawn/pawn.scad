$fa = 1;
$fs = 0.4;

module rounded_cylinder(height, radius) {
    x = radius - (height/2);
    rotate_extrude() {
        square([x, height]);
        translate([x, height/2, 0])
            circle(d=height);
        }
}

// Top sphere
translate([0, 0, 30.5]) // z = 38 - 7.5
    sphere(r=7.5);

// Sphere base
translate([0, 0, 22.5]) // z = 38 - 12.5 - 3
    rounded_cylinder(3, 8);

// TODO: Curvy body?
translate([0, 0, 3])
    // h = 22.5 - 3;
    cylinder(h=19.5, r1=7.5, r2=4);

// Base
rounded_cylinder(3, 10.5);
