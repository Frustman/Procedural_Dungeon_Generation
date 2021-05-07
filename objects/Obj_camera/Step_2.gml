/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_chr)){
	if(cur_room != Scr_get_room_pos(Obj_chr.x,Obj_chr.y)){
		cur_room = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
		event_perform(ev_other,ev_user0);
	}
}