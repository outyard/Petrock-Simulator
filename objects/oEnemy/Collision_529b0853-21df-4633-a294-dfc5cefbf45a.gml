if (abs(angle_difference(point_direction(x, y, other.x, other.y), 90)) < 30) {
	other.kills += 1;
	instance_destroy();	
} else {
	with other {
		if (immuneFrames > 0) {
			break;	
		}
		hp -= 1 * (2 - defense)
		immuneFrames = 60;
		var _dir = point_direction(other.x, other.y, x, y);
		physics_apply_impulse(phy_position_x, phy_position_y, lengthdir_x(1, _dir), lengthdir_y(1, _dir));
	}
}