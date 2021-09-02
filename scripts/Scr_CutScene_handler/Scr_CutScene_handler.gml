/// @function Scr_CutScene_create(_cutscene_info)
/// @function Scr_CutScene_wait(_second)
/// @function Scr_CutScene_end_action()
/// @function Scr_CutScene_show_message(str)
/// @function Scr_CutScene_object_change_state(_instance, _state)
/// @function Scr_CutScene_object_move(_object, _x_dest, _y_dest, _speed, _end)
/// @function Scr_CutScene_objects_move([args])


function Scr_CutScene_create(_cutscene_info){
	var inst = instance_create_layer(0,0,"cutscene", Obj_cutscene);
	global.cutScene = inst;
	with(inst){
		cutscene_info = _cutscene_info;	
		event_perform(ev_other, ev_user0);
	}
}

function Scr_CutScene_wait(_second){
	global.cutScene.timer += global.timeScale;	
	
	if(global.cutScene.timer >= _second * room_speed){
		Scr_CutScene_end_action();
		global.cutScene.timer = 0;
	}
}

function Scr_CutScene_end_action(){
	with(global.cutScene){
		scene++;
		if(scene > array_length(cutscene_info) - 1){
			instance_destroy();	
		} else {
			event_perform(ev_other, ev_user0);
		}
	}
}

function Scr_CutScene_show_message(str){
	show_message(str);
	Scr_CutScene_end_action();
}

function Scr_CutScene_object_change_state(_instance, _state){
	with(_instance){
		Scr_SM_switch(_state);
	}
	Scr_CutScene_end_action();
}

function Scr_CutScene_object_move(_object, _x_dest, _y_dest, _speed, _end){
	var changeState = argument_count == 6;
	if(point_distance(_object.x, _object.y, _x_dest, _y_dest) > 1){
		with(_object){
			if(x <= _x_dest) image_xscale = 1.0;
			else image_xscale = -1.0;
			mp_potential_step(_x_dest,_y_dest,_speed,false);
		}
		return false;
	} else {
		if(_end == true) Scr_CutScene_end_action();
		if(changeState == true) with(_object) Scr_SM_switch(argument[5]);
		return true;
	}
}

function Scr_CutScene_objects_move(){
	var objCount = argument_count;
	var boolean;
	for(var i = 0; i < objCount; i++){
		var changeState = array_length(argument[i]) == 5;
		if(changeState == true){
			boolean[i] = Scr_CutScene_object_move(argument[i][0], argument[i][1], argument[i][2], argument[i][3], false, argument[i][4]);
		} else {
			boolean[i] = Scr_CutScene_object_move(argument[i][0], argument[i][1], argument[i][2], argument[i][3], false);
		}
	}
	for(var i = 0; i < objCount; i++){
		if(boolean[i] == false) return false;	
	}
	Scr_CutScene_end_action();
	return true;
}

function Scr_CutScene_object_set_variable(_object, _varName, _varValue){
	variable_instance_set(_object, _varName, _varValue);
	Scr_CutScene_end_action();
}