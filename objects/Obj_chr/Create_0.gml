

#region Character Setting

moveSpeed = 2.5 * global.timeScale;
dashSpeed = 2 * global.timeScale;
jumpSpeed = -7;

xSpeed = 0;
ySpeed = 0;
zSpeed = 0;
zGravity = 0.5;
zFloor = 0;
zHeight = -36;

image_alpha = sprite_height / 255;

#endregion

//------------------------------------------------

#region variable

z = 0;

hand_x = 1.0;
god = false;
justdodge = false;
hit = false;
shoot = false;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

footstep = true;

#endregion

//------------------------------------------------

#region function setting


with(Obj_camera){
	event_perform(ev_other,ev_user0);	
}

Scr_alarm_init();


Scr_SM_default_init();

Scr_SM_create("IDLE",Scr_chr_idle);
Scr_SM_create("MOVE",Scr_chr_move);
Scr_SM_create("DASH",Scr_chr_move);

Scr_SM_init("IDLE");

#endregion