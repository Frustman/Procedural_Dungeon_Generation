moveSpeed = 2.5 * global.timeScale;
dashSpeed = 2 * global.timeScale;

hand_x = 1.0;

god = false;

justdodge = false;

hit = false;

shoot = false;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

footstep = true;

Scr_update_depth(x,y);

with(Obj_camera){
	event_perform(ev_other,ev_user0);	
}

Scr_alarm_init();


Scr_SM_default_init();

Scr_SM_create("IDLE",Scr_chr_idle);
Scr_SM_create("MOVE",Scr_chr_move);
Scr_SM_create("DASH",Scr_chr_move);

Scr_SM_init("IDLE");
