moveSpeed = 2;
dashSpeed = 2;

hand_x = 1.0;

charge = 0;

god = false;


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

gun_maxIndex = 7;
gun_index = 0;
gun_fps = 5;

footstep = true;

/*shoot_list = ds_list_create();
wall_list = ds_list_create();
enemy_pr = ds_priority_create();*/

dx = 0;
dy = 0;

Scr_update_depth(x,y);

AttackTarget = noone;

ray_map = -1;

	with(Obj_camera){
		event_perform(ev_other,ev_user0);	
	}