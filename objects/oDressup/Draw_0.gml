

var _color = colors[selectedColor];

var _yy = 170;
var _xx = 350;

var _sep = 150;

draw_sprite_ext(spr_arrow, 0, _xx + 250, _yy + selectedCategory*_sep, 0.4, 0.4, 0, c_white, 1);
draw_sprite_ext(spr_arrow, 0, _xx - 250, _yy + selectedCategory*_sep,-0.4, 0.4, 0, c_white, 1);


var _i = 0;
for (var i=-1; i <= 1; i++) {
	var _scale = i==0 ? 0.5 : 0.25;
	draw_sprite_ext(spr_body, maxBody + selectedBody + i, _xx + i*150, _yy + _sep*_i, _scale, _scale, 0, _color, 1);
}

_i++
for (var i=-1; i <= 1; i++) {
	var _scale = i==0 ? 0.5 : 0.25;
	draw_sprite_ext(spr_face, maxFace + selectedFace + i, _xx + i*150, _yy + _sep*_i, _scale, _scale, 0, c_white, 1);
}

_i++
for (var i=-1; i <= 1; i++) {
	var _scale = i==0 ? 0.5 : 0.25;
	var _index = (selectedColor + i + maxColor) mod maxColor
	draw_sprite_ext(spr_body, selectedBody, _xx + i*150, _yy + _sep*_i, _scale, _scale, 0, colors[_index], 1);
}


_i++
for (var i=-1; i <= 1; i++) {
	var _scale = i==0 ? 0.5 : 0.25;
	var _index = (selectedHat + i + maxHat) mod maxHat;
	var _hat = hatSprites[_index];
	if (_hat >= 0) {
		draw_sprite_ext(_hat, 0, _xx + i*150, _yy + _sep*_i, _scale, _scale, 0, c_white, 1);
	}
}






var _xx = 1000;
var _yy = 300;

draw_sprite_ext(spr_body, selectedBody, _xx, _yy, 1, 1, 0, _color, 1);
draw_sprite_ext(spr_face, selectedFace, _xx, _yy, 1, 1, 0, c_white, 1);
if (hatSprites[selectedHat] >= 0) { 
	draw_sprite_ext(hatSprites[selectedHat], 0, _xx + 40, _yy - 60, 1, 1, -30, c_white, 1);
}

var _txt = "";
var _cat = helps[selectedCategory];
switch (selectedCategory) {
	case 0:
		_txt = _cat[selectedBody];	
		break;
	case 1:
		_txt = _cat[selectedFace];
		break;
	case 2:
		_txt = _cat[selectedColor];
		break;
	case 3:
		_txt = _cat[selectedHat];
		break;
}

draw_set_font(fnt_comic);
draw_set_color(c_black);
draw_text_ext(800, 500, _txt, -1, 500);

draw_text(10, 10, "WASD to make selections. Enter to confirm");