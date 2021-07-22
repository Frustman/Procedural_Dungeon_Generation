//
function Scr_weapon_fsm(){

}

function Scr_weapon_idle(){
	if(state_new){
		var _stack = ds_stack_pop(state_stack);
		if(ds_stack_top(state_stack) == "RELOAD"){
			bullet_count = bullet_maxCount;
		}
		ds_stack_push(_stack);
	}
}

function Scr_weapon_reload(){
	if(state_new){
		sprite_index = weapon_reload_anim;
		image_index = 0;
	}
	
	if(sprite_index == weapon_reload_anim && image_index > image_number - 1){
		Scr_SM_switch("IDLE");
	}
}