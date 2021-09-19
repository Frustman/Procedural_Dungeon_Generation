/// @description Insert description here
// You can write your code in this editor

function perform_shoot(){
	event_perform(ev_other, ev_user0);
}

function perform_reload(){
	event_perform(ev_other, ev_user1);
}
var weap = instance_create_layer(x,y,"Instances",Obj_weapon);
with(weap){
	Scr_weapon_init("Pulse Gun", "GOOD GUN", 1);
	Scr_weapon_image(Spr_gun_1_idle,Spr_gun_1_idle,Spr_gun_1_reload,Spr_gun_1_shoot,18,38,53,29);
	Scr_weapon_shoot_frame_set_event(1, perform_shoot);
	Scr_weapon_reload_frame_set_event(4, perform_reload);
}

Scr_weapon_set(weap);