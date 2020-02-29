
timeSinceGrounded++;

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _angleMod = 1;
if (timeSinceGrounded > 5) {
	show_debug_message("in air");
	_angleMod = 0.5;
} else {
	show_debug_message("on ground");	
}

physics_apply_angular_impulse(_hor*horAngleMod*_angleMod*spdMod);
physics_apply_force(phy_position_x, phy_position_y, _hor*0.5, timeSinceGrounded > 5 ? 0 : -abs(_hor)*0.5);

if (keyboard_check_pressed(ord("W")) && jumpsLeft > 0) {
	jumpsLeft--;
	physics_apply_impulse(phy_position_x, phy_position_y, 0, -4);
}

last_last_phy_speed_y = last_phy_speed_y;
last_phy_speed_y = phy_speed_y;
immuneFrames--;

framesInGame++;

if (timeSinceGrounded > 5) {
	jumpsLeft = min(jumpsLeft, jumpsMax-1);	
}




if (hp <= 0) {
	show_message("You died!");
	game_restart();
}	