$fa = 1;
$fs = 0.4;

block_width = 31.8;
block_depth = 15.8;
block_height = 9.6;

wall_width = 1.4;
wall_depth = 1.2;
wall_height = 1;

stud_height = 1.8;
stud_diameter = 4.8;

tube_diameter = 6.5;

// Block
difference() {
    cube([block_width, block_depth, block_height], center=true);
    translate([0, 0, -wall_height])
        cube([block_width-(wall_width*2), block_depth-(wall_depth*2), block_height], center=true);
}

// Studs
for (dy = [-4:8:4]) {
    for (dx = [-12:8:12]) {
        translate([dx,  dy, block_height/2])
            cylinder(h=stud_height, d=stud_diameter);
    }
}

// Tubes
for (dx = [-8:8:8]) {
    translate([dx, 0, 0])
        difference() {
            cylinder(h=block_height, d=tube_diameter, center=true);
            translate([0, 0, -wall_height])
                cylinder(h=block_height, d=tube_diameter-(wall_depth*2), center=true);
        }
}
