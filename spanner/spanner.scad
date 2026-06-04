$fa = 1;
$fs = 0.4;

shaft_width = 315;
shaft_depth = 40;
shaft_height = 5;

head_height = 15;
head_radius = 38;

hole_diameter = 12;

jaw_depth = 35;

difference() {
    union() {
        // Main shaft
        cube([shaft_width, shaft_depth, shaft_height], center=true);
        // Rounded end
        translate([-shaft_width/2, 0])
            cylinder(h=shaft_height, d=shaft_depth, center=true);
        // Head
        translate([shaft_width/2, 0])
            cylinder(h=head_height, r=head_radius, center=true);
    }
    // Hole
    translate([-shaft_width/2, 0])
        cylinder(h=shaft_height+1, d=hole_diameter, center=true);
    // Jaw
    translate([(shaft_width+head_radius)/2, 0])
        cube([head_radius, jaw_depth, head_height+1], center=true);
}
