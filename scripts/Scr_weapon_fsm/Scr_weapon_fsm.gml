//
function Scr_weapon_fsm(){

}

function Scr_weapon_use(){
	if(state_new){
		var _stack = ds_stack_pop(state_stack);
		if(ds_stack_top(state_stack) == "BACK"){
			CONTAINER.player_curWeapon = id;
			instance_destroy(Obj_bullet_ui_controller);
			instance_create_layer(x,y,"sort_start",Obj_bullet_ui_controller);
		}
		ds_stack_push(_stack);
	}
}

function Scr_weapon_reload(){
	if(state_new){
		sprite_index = weapon_reload_anim;
		image_index = 0;
		Alarm[0] = weapon_reloadDelay;
	}
	
	if(sprite_index == weapon_reload_anim && image_index > image_number - 1){
		Scr_SM_switch("USE");
	}
}