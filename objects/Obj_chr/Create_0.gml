moveSpeed = 1.5;
dashSpeed = 4.5;

state = "idle";
dash = false;
dashDir = 90;
shoot = false;

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

bullet_maxCount = 4;
bullet_count = 0;

bullet_delay = 20;

AttackTarget = noone;
near_id = noone;
near_inst = "noone";

_Enemy_num = 0;
_Wall_num = 0;

ray_map = -1;

hitX = 0;
hitY = 0;