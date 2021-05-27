/// @function Scr_shake(angle, zoom)
/// @param {real} angle
/// @param {real} zoom

function Scr_shake(_angle, _zoom, _shift, _duration) {
	with(instance_create_layer(0,0,"gui",Obj_shake)){
	
	seed = random(1000);

	max_roll = _angle;
	zoom = _zoom;
	max_offset = _shift;
	
	shake_cnt = 0;
	shake_duration = _duration;
	
	}
}
