/// @description Insert description here
// You can write your code in this editor
global.paused = !global.paused;
if(global.paused == false){
	instance_activate_object(Obj_camera);
	instance_activate_object(Obj_chr);
	with(Obj_camera){
		event_perform(ev_other,ev_user0);	
	}
	sprite_delete(paused_surf);
	instance_destroy(Obj_status);
    paused_surf = -1;
}