// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Scr_CutScene_handler(){

}

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
