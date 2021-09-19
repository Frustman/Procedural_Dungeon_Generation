/// @description Insert description here
// You can write your code in this editor
targetX = x;
targetY = y;

spd = 1;

Scr_SM_default_init();

Scr_SM_create("IDLE",Scr_girl_idle);
Scr_SM_create("MOVE",Scr_girl_move);
Scr_SM_create("MOVETOSTOP",Scr_girl_move_to_stop);
Scr_SM_create("CROUCHING",Scr_girl_crouching);
Scr_SM_create("CROUCH",Scr_girl_crouch);

Scr_SM_init("IDLE");

image_alpha = sprite_height / 255;