/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(Obj_cutscene)){
	if(place_meeting(x,y,Obj_chr)){
		Scr_CutScene_create(t_cutscene_info);
		instance_destroy();
	}
}