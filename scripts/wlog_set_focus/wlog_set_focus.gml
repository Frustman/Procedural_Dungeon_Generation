///@function wlog_set_focus(bool)
///@arg bool
function wlog_set_focus(argument0) {
	global.wlogRecent.cameraFocus = argument0;
	if(argument0 == true)
		Obj_camera.focus_id = global.wlogRecent;
	else
		Obj_camera.focus_id = -1;
}
