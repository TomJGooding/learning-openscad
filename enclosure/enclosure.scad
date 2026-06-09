$fn = 50;

eps = 1;

box_w = 39;
box_d = 93;
box_h = 27;

lid_h = 6;

cnr_r = 3;

wall_d = 2;


module rounded_cube(size, radius) {
    d = radius*2;
    minkowski() {
        cube([size[0]-d, size[1]-d, size[2]-d], center=true);
        sphere(radius);
    }
}

module rounded_square(size, radius) {
    d = radius*2;
    minkowski() {
        square([size[0]-d, size[1]-d], center=true);
        circle(radius);
    }
}


// Box
translate([box_w+10, 0, 0]) {
    difference() {
        rounded_cube([box_w, box_d, box_h*2], cnr_r);

        // Chop off the top
        translate([0, 0, box_h/2]) {
            cube([box_w+eps, box_d+eps, box_h], center=true);
        }

        // Hollow inside
        rounded_cube([box_w-(wall_d*2), box_d-(wall_d*2), (box_h*2)-(wall_d*2)], cnr_r);

        // Ledge
        translate([0, 0, -wall_d]) {
            linear_extrude(wall_d+eps)
                rounded_square([box_w-wall_d, box_d-wall_d], cnr_r);
        }
    }
}

// Lid
difference() {
    rounded_cube([box_w, box_d, lid_h*2], cnr_r);

    // Chop off the top
    translate([0, 0, lid_h/2]) {
        cube([box_w+eps, box_d+eps, lid_h], center=true);
    }

    // Hollow inside
    rounded_cube([box_w-(wall_d*2), box_d-(wall_d*2), (lid_h*2)-(wall_d*2)], cnr_r);

    // FIXME: Ledge
    #translate([0, 0, -wall_d]) {
        linear_extrude(wall_d+eps)
            rounded_square([box_w+eps, box_d+eps], cnr_r);
    }
}
