/// @description Insert description here
// You can write your code in this editor
if(cur_room != Scr_get_room_pos(x,y)) instance_destroy(self);
if(abs(floor(y) - floor(yprevious)) >= 1){
	Scr_update_depth(x,y);
}