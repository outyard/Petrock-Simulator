

if (keyboard_check_pressed(ord("W"))) {
	selectedCategory--;
}

if (keyboard_check_pressed(ord("S"))) {
	selectedCategory++;
}

if (selectedCategory < 0) {
	selectedCategory = 3;
}
if (selectedCategory > 3) {
	selectedCategory = 0;	
}



var _shift = 0;

if (keyboard_check_pressed(ord("A"))) {
	_shift = -1;		
}
if (keyboard_check_pressed(ord("D"))) {
	_shift = 1;	
}

switch selectedCategory {
	case 0:
		selectedBody = (maxBody + selectedBody + _shift) mod maxBody;
		break;
	case 1:
		selectedFace = (maxFace + selectedFace + _shift) mod maxFace;
		break;
	case 2:
		selectedColor = (maxColor + selectedColor + _shift) mod maxColor;
		break;
	case 3:
		selectedHat = (maxHat + selectedHat + _shift) mod maxHat;
		break;
}



if (keyboard_check_pressed(vk_enter)) {
	global.rockColor = colors[selectedColor];
	global.rockColorType = selectedColor;
	global.rockHat = hatSprites[selectedHat];
	global.rockBody = selectedBody;
	global.rockFace = selectedFace;
	
	room_goto(rm_level);
}