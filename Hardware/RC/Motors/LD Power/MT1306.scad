// ****************************************************************************
// LDPower MT1306 motor

include </Users/brandon/Google Drive/Documents/3D/OpenSCAD/bh_lib.scad>;
include </Users/brandon/Google Drive/Documents/3D/OpenSCAD/_colours.scad>;

include </Users/brandon/Google Drive/Documents/3D/OpenSCAD/Components/Motors/_common.scad>;

MOTOR_LDPOWER_MT1306_BELL_HEIGHT = 7;
MOTOR_LDPOWER_MT1306_HEIGHT = 12.5;
MOTOR_LDPOWER_MT1306_HEIGHT_GROSS = 25.5;
MOTOR_LDPOWER_MT1306_RAD = 17.7 / 2;
MOTOR_LDPOWER_MT1306_MOUNT_ARM_WIDTH = 0;
MOTOR_LDPOWER_MT1306_MOUNT_AXLE_DEPTH = 1;
MOTOR_LDPOWER_MT1306_MOUNT_HEIGHT = 3;
MOTOR_LDPOWER_MT1306_MOUNT_HOLE_RAD = 1; // M2
MOTOR_LDPOWER_MT1306_MOUNT_HOLES = 4;
MOTOR_LDPOWER_MT1306_MOUNT_RAD = 6;
MOTOR_LDPOWER_MT1306_MOUNT_THICKNESS = 0;
MOTOR_LDPOWER_MT1306_SHAFT_HEIGHT = 14;
MOTOR_LDPOWER_MT1306_SHAFT_RAD = 2;

module MOTOR_LDPOWER_MT1306() {
	
	top_height = MOTOR_LDPOWER_MT1306_HEIGHT - MOTOR_LDPOWER_MT1306_BELL_HEIGHT - MOTOR_LDPOWER_MT1306_MOUNT_HEIGHT;
	
	color(COLOUR_GREY_DARK)
	difference() {
		*motor_mount_legs(
			3,
			MOTOR_LDPOWER_MT1306_MOUNT_ARM_WIDTH,
			MOTOR_LDPOWER_MT1306_MOUNT_THICKNESS,
			MOTOR_LDPOWER_MT1306_RAD,
			MOTOR_LDPOWER_MT1306_MOUNT_HOLE_RAD
		);
		
		motor_base(
			(MOTOR_LDPOWER_MT1306_MOUNT_HEIGHT) * 0.95,
			MOTOR_LDPOWER_MT1306_RAD,
			6,
			arm_width = MOTOR_LDPOWER_MT1306_RAD * 0.5,
			bevel = 0.9,
			inner_rad = MOTOR_LDPOWER_MT1306_RAD * 0.9
		);
		
		rotate([0, 0, 360 / MOTOR_LDPOWER_MT1306_MOUNT_HOLES / 2])
		for (n = [0 : MOTOR_LDPOWER_MT1306_MOUNT_HOLES - 1])
			rotate([0, 0, 360 / MOTOR_LDPOWER_MT1306_MOUNT_HOLES * n])
			translate([MOTOR_LDPOWER_MT1306_MOUNT_RAD, 0, -0.1])
			cylinder(h = MOTOR_LDPOWER_MT1306_MOUNT_HEIGHT + 0.2, r = MOTOR_LDPOWER_MT1306_MOUNT_HOLE_RAD);
	}
	
	translate([0, 0, MOTOR_LDPOWER_MT1306_MOUNT_HEIGHT]) {
		motor_bell(
			MOTOR_LDPOWER_MT1306_BELL_HEIGHT,
			MOTOR_LDPOWER_MT1306_RAD,
			poles = 12,
			col = COLOUR_GREY_DARK
		);
		
		motor_stator(
			MOTOR_LDPOWER_MT1306_BELL_HEIGHT,
			MOTOR_LDPOWER_MT1306_RAD - 1.6,
			poles = 9
		);
		
		color(COLOUR_GREY_DARK)
		translate([0, 0, MOTOR_LDPOWER_MT1306_BELL_HEIGHT]) {
			translate([0, 0, top_height])
			scale([1, 1, -1])
			motor_base(
				top_height,
				MOTOR_LDPOWER_MT1306_RAD,
				6,
				bevel = 0.6
			);
		}
	}
	
	// collar
	color(COLOUR_GREY_DARK)
	translate([0, 0, MOTOR_LDPOWER_MT1306_HEIGHT])
	cylinder(
		h = MOTOR_LDPOWER_MT1306_HEIGHT_GROSS - MOTOR_LDPOWER_MT1306_SHAFT_HEIGHT - MOTOR_LDPOWER_MT1306_HEIGHT,
		r = MOTOR_LDPOWER_MT1306_RAD * 0.5
	);
	
	color(COLOUR_GREY_DARK)
	cylinder(
		h = MOTOR_LDPOWER_MT1306_HEIGHT + MOTOR_LDPOWER_MT1306_SHAFT_HEIGHT,
		r = MOTOR_LDPOWER_MT1306_SHAFT_RAD
	);
}

//$fs = 0.1; MOTOR_LDPOWER_MT1306();