///@function wlog_destroy()
function wlog_destroy() {
	global.wcount-=1;
	if(sequenceid != -1){
		sequenceid.recur = true;
	}
	if(cameraFocus == true){
		Obj_camera.focus_id = -1;
	}
	instance_destroy();


}
