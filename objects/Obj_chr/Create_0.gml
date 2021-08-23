moveSpeed = 4 * global.timeScale;
dashSpeed = 2 * global.timeScale;

hand_x = 1.0;

charge = 0;

god = false;

justdodge = false;

shootX = x;
shootY = y;



state = "idle";
dash = false;
dashDir = 90;
shoot = false;
reload = false;
hit = false;

charging = false;

bullet_delay = Obj_valueContainer.player_attackdelay;

angle = 0;
TargetAngle = 0;

LookRight = 1;

fireshot = true;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;


gun_index = 0;
gun_reac_duration = 15;
channel_gun = animcurve_get_channel(ac_gun_reaction, 0);

footstep = true;

dx = 0;
dy = 0;

Scr_update_depth(x,y);

AttackTarget = noone;


ray_map = -1;

with(Obj_camera){
	event_perform(ev_other,ev_user0);	
}

Scr_alarm_init();
