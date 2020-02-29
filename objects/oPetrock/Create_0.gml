image_speed = 0;
image_xscale = 0.5;
image_yscale = image_xscale;

fixture = physics_fixture_create();
if (global.rockBody == 0) {
	physics_fixture_set_circle_shape(fixture, 120 * image_xscale);
	horAngleMod = 0.01;
} else {
	physics_fixture_set_polygon_shape(fixture);
	physics_fixture_add_point(fixture, -60, -50);
	physics_fixture_add_point(fixture, -50, -60);
	
	physics_fixture_add_point(fixture,  50, -60);
	physics_fixture_add_point(fixture,  60, -50);
	
	physics_fixture_add_point(fixture,  60,  50);
	physics_fixture_add_point(fixture,  50,  60);
	
	physics_fixture_add_point(fixture, -50,  60);
	physics_fixture_add_point(fixture, -60,  50);

	horAngleMod = 0.05;
}


physics_fixture_set_angular_damping(fixture, 0.5);
physics_fixture_set_friction(fixture, 0.1);
physics_fixture_set_density(fixture, 0.3);
physics_fixture_bind(fixture, id);

physics_fixture_delete(fixture);

var _hatX = 40;
var _hatY = -60;
var _hatAngle = 40;

jumpsLeft = 1;
jumpsMax = 1;

hat = noone;

var _fix = noone;
var _inst = noone;

switch global.rockHat {
	case spr_tophat:
		_fix = physics_fixture_create();
		physics_fixture_set_polygon_shape(_fix);
		physics_fixture_add_point(_fix,  05, -65);
		physics_fixture_add_point(_fix,  53, -45);
		physics_fixture_add_point(_fix,  15,  10);
		physics_fixture_add_point(_fix, -35,  10);
		break;
	case spr_plumhat:
		_fix = physics_fixture_create();
		physics_fixture_set_circle_shape(_fix, 30);
		break;
}

if _fix != noone {
	var _instX = 20;
	var _instY = -30;
	
	if (global.rockBody == 1) {
		_instX = 30;
		_instY = -45;
	}
	
	_inst = instance_create_depth(x+_instX, y+_instY, depth-1, oHat);	
	physics_fixture_set_density(_fix, 0.01);
	
	physics_fixture_bind(_fix, _inst);
	_inst.phy_rotation = 40;
	physics_joint_weld_create(id, _inst, x+_instX, y+_instY, 0, 0, 0, false);
	phy_rotation = 0;
	_inst.phy_rotation = 40;
	
	_inst.image_xscale = 0.5;
	_inst.image_yscale = 0.5;
	_inst.sprite_index = global.rockHat;
	hat = _inst;
}


image_index = global.rockBody;
faceIndex = global.rockFace;
image_blend = global.rockColor;

timeSinceGrounded = 0;

spdMod = 1;
jumpMod = 1;

hp = 5;
defense = 1;
style = 0;

kills = 0;
framesInGame = 0;

immuneFrames = 0;

last_last_phy_speed_y = 0;
last_phy_speed_y = 0;

switch global.rockBody {
	case Shapes.Box:
		style += 2;
		break;
}

switch global.rockFace {
	case Faces.Angry:
		spdMod *= 1.3;
		style -= 1;
		break;
	
	case Faces.Sad:
		spdMod *= 0.8;
		defense *= 1.1;
		break;
		
	case Faces.Happy:
		spdMod *= 1.1;
		jumpMod *= 1.1;
		defense *= .9;
		break;
		
	case Faces.Smile:
		spdMod *= 1;
		jumpMod *= 1.1;
		break;
}

switch global.rockHat {
	case spr_tophat:
		jumpsMax += 1;
		style+=2;
		break;
	case spr_plumhat:
		spdMod *= 1.2;
		style += 1;
		break;
}

switch global.rockColorType {
	case Colors.Blue:
		spdMod *= 0.9;
		style += 2;
		break;
	case Colors.Red:
		spdMod *= 1.1;
		break;
	case Colors.CoolGray:
		style += 1;
		break;
	case Colors.Gray:
		defense *= 1.1;
}