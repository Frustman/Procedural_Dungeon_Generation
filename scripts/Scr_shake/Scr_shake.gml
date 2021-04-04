/// @function Scr_shake(angle, zoom)
/// @param {real} angle
/// @param {real} zoom

function Scr_shake(angle, zoom, shift, duration) {
	if(!instance_exists(Obj_shake)) exit;
	
	Obj_shake.seed = random(1000);

	Obj_shake.max_roll = angle;
	Obj_shake.zoom = zoom;
	Obj_shake.max_offset = shift;
	
	Obj_shake.shake_cnt = 0;
	Obj_shake.shake_duration = duration;
}
