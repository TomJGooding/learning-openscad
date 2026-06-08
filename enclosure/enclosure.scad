$fn = 50;

eps = 1;

box_w = 39;
box_d = 93;
box_h = 27;

cnr_r = 5;

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
