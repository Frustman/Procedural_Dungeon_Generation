moveSpeed = 1.4;
dashSpeed = 3;

handX = 2.0;

state = "idle";
dash = false;
dashDir = 90;
shoot = false;
reload = false;
hit = false;

bullet_delay = Obj_valueContainer.player_attackdelay;

angle = 0;

LookRight = 1;

fireshot = true;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

footstep = true;

shoot_list = ds_list_create();
wall_list = ds_list_create();
enemy_pr = ds_priority_create();

for(var i = 0; i < Obj_valueContainer.bullet_maxCount; i++){
	__number = i;
	bullet_ui[i] = instance_create_layer(x,y,"sort_end",Obj_bullet_ui);
	with(bullet_ui[i]){
		xpos = 200 + 20 * other.__number;
		ypos = 20;
	}
}

Scr_update_depth(x,y);

AttackTarget = noone;

ray_map = -1;
