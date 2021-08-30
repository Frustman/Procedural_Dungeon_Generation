// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Scr_CutScene_handler(){

}

function Scr_CutScene_create(_cutscene_info){
	var inst = instance_create_layer(0,0,"CutScene", Obj_cutscene);
	
	with(inst){
		cutscene_info = _cutscene_info;	
	}
}

function Scr_CutScene_wait(_second){
	if(timer < _second * room_speed){
		timer += global.timeScale;	
	} else {
		scene++;
		timer = 0;
	}
}

function Scr_CutScene_end_action(){
	scene++;
	if(scene >= array_length(cutscene_info) - 1){
		instance_destroy();	
	}
	
	event_perform(ev_other, ev_user0);
}