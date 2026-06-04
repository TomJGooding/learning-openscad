$fa = 1;
$fs = 0.4;

pitch = 38;

hull_h = 6;

lg_cyl_h = 14;
lg_cyl_r = 16;

sm_cyl_h = 24;
sm_cyl_r = 9;

lg_hole_d = 20;
sm_hole_d = 6;

difference() {
    union() {
        // Convex hull of two cylinders
        hull() {
            cylinder(h=hull_h, r=lg_cyl_r);
            translate([pitch, 0])
                cylinder(h=hull_h, r=sm_cyl_r);
        }
        // Extend cylinders
        cylinder(h=lg_cyl_h, r=lg_cyl_r);
        translate([pitch, 0, -sm_cyl_h])
            cylinder(h=sm_cyl_h, r=sm_cyl_r);
    }

    // Large hole
    translate([0, 0, -1])
        cylinder(h=lg_cyl_h+2, d=lg_hole_d);
    // Small hole
    translate([pitch, 0, -sm_cyl_h-1])
        cylinder(h=hull_h+sm_cyl_h+2, d=sm_hole_d);
}
