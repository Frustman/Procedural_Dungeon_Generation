/// @function Scr_shake(angle, zoom)
/// @param {real} angle
/// @param {real} zoom

function Scr_shake(angle, zoom) {
	if(!instance_exists(Obj_shake)) exit;

	Obj_shake.angle = angle;
	Obj_shake.zoom = zoom;

}
