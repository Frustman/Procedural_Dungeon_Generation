/// @function Scr_shake(angle, zoom)
/// @param {real} angle
/// @param {real} zoom

function Scr_shake(angle, zoom, shift, angle_decrease, zoom_decrease, shift_decrease) {
	if(!instance_exists(Obj_shake)) exit;

	Obj_shake.angle = angle;
	Obj_shake.zoom = zoom;
	Obj_shake.shift = shift;

	Obj_shake.angle_decrease = angle_decrease;
	Obj_shake.zoom_decrease = zoom_decrease;
	Obj_shake.shift_decrease = shift_decrease;

}
