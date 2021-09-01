/// @description Insert description here
// You can write your code in this editor
targetX = x;
targetY = y;

spd = 1;

Scr_update_depth(x,y);

Scr_SM_default_init();

Scr_SM_create("IDLE",Scr_girl_idle);
Scr_SM_create("MOVE",Scr_girl_move);
Scr_SM_create("MOVETOSTOP",Scr_girl_move_to_stop);

Scr_SM_init("IDLE");