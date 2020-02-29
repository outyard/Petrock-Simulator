
var _alpha = image_alpha;
if (immuneFrames > 0) {
	_alpha *= 0.5;	
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, _alpha);
draw_sprite_ext(spr_face, faceIndex, x, y, image_xscale, image_yscale, image_angle, c_black, image_alpha);
/*if (global.rockHat != noone) {
	draw_sprite_ext(global.rockHat, 0, 
		x + lengthdir_x(72.1*image_xscale, image_angle + 56.34), 
		y + lengthdir_y(72.1*image_yscale, image_angle + 56.34), 
		image_xscale, image_yscale, image_angle-40, c_white, image_alpha);
}*/