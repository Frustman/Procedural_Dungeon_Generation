///@function wlog_set_sequence(bool)
///@arg bool
function wlog_set_sequence(argument0) {
	if(argument0 == true){
		if(global.wlogRecent.sequenceid == -1){
			var inst = instance_create_layer(x,y,"sequence",Obj_logSequence);
			global.wlogRecent.sequenceid = inst;
		}
	} else {
		if(global.wlogRecent.sequenceid == -1){
			instance_destroy(global.wlogRecent.sequenceid);
		}
	}
}
