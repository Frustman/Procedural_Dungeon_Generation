///@function wlog_destroy()
function wlog_destroy() {
	global.wcount-=1;
	if(sequenceid != -1){
		sequenceid.recur = true;
	}
	if(cameraFocus == true){
		Obj_camera.focus_id = -1;
	}
	ds_list_delete(global.wlogList, ds_list_find_index(global.wlogList, id));
	instance_destroy();
	if(Obj_camera.focus_id == -1){
		global.wlogRecent = global.wlogList[|0];
	}
}
