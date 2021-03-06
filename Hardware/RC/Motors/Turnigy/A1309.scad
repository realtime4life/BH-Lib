// ****************************************************************************
// Turnigy A1309 motor

include </Users/brandon/Google Drive/Documents/3D/OpenSCAD/bh_lib.scad>;
include </Users/brandon/Google Drive/Documents/3D/OpenSCAD/_colours.scad>;

include </Users/brandon/Google Drive/Documents/3D/OpenSCAD/Components/Motors/_common.scad>;

MOTOR_TURNIGY_A1309_BELL_HEIGHT = 4;
MOTOR_TURNIGY_A1309_HEIGHT = 9.45;
MOTOR_TURNIGY_A1309_RAD = 6.51;
MOTOR_TURNIGY_A1309_MOUNT_ARM_WIDTH = 2.9;
MOTOR_TURNIGY_A1309_MOUNT_HEIGHT = 2.5;
MOTOR_TURNIGY_A1309_MOUNT_HOLE_RAD = 0.825; // 1.65mm
MOTOR_TURNIGY_A1309_MOUNT_HOLES = 3;
MOTOR_TURNIGY_A1309_MOUNT_RAD = 8.5;
MOTOR_TURNIGY_A1309_MOUNT_THICKNESS = 0.8;
MOTOR_TURNIGY_A1309_SHAFT_HEIGHT = 3.9;
MOTOR_TURNIGY_A1309_SHAFT_RAD = 0.75;

module motor_turnigy_a1309() {
	
	top_height = MOTOR_TURNIGY_A1309_HEIGHT - MOTOR_TURNIGY_A1309_BELL_HEIGHT - MOTOR_TURNIGY_A1309_MOUNT_HEIGHT - 1;
	
	color(COLOUR_GREY_DARK) {
		motor_mount_legs(
			3,
			MOTOR_TURNIGY_A1309_MOUNT_ARM_WIDTH,
			MOTOR_TURNIGY_A1309_MOUNT_THICKNESS,
			MOTOR_TURNIGY_A1309_MOUNT_RAD,
			MOTOR_TURNIGY_A1309_MOUNT_HOLE_RAD
		);
		
		motor_base(
			(MOTOR_TURNIGY_A1309_MOUNT_HEIGHT) * 0.95,
			MOTOR_TURNIGY_A1309_RAD,
			3,
			arm_width = MOTOR_TURNIGY_A1309_MOUNT_ARM_WIDTH
		);
	}
	
	translate([0, 0, MOTOR_TURNIGY_A1309_MOUNT_HEIGHT]) {
		motor_bell(
			MOTOR_TURNIGY_A1309_BELL_HEIGHT,
			MOTOR_TURNIGY_A1309_RAD,
			poles = 12
		);
		
		motor_stator(
			MOTOR_TURNIGY_A1309_BELL_HEIGHT,
			MOTOR_TURNIGY_A1309_RAD - 1.6,
			poles = 9
		);
		
		color(COLOUR_GREY_DARK)
		translate([0, 0, MOTOR_TURNIGY_A1309_BELL_HEIGHT]) {
			translate([0, 0, top_height])
			scale([1, 1, -1])
			motor_base(
				top_height,
				MOTOR_TURNIGY_A1309_RAD,
				3,
				arm_width = MOTOR_TURNIGY_A1309_MOUNT_ARM_WIDTH
			);
		}
	}
	
	color(COLOUR_GREY_DARK)
	cylinder(
		h = MOTOR_TURNIGY_A1309_HEIGHT,
		r = MOTOR_TURNIGY_A1309_SHAFT_RAD * 2
	);
	
	color(COLOUR_STEEL)
	cylinder(
		h = MOTOR_TURNIGY_A1309_HEIGHT + MOTOR_TURNIGY_A1309_SHAFT_HEIGHT,
		r = MOTOR_TURNIGY_A1309_SHAFT_RAD
	);
}

//$fs = 0.1; motor_turnigy_a1309();
