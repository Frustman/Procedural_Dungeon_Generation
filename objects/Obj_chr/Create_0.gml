moveSpeed = 1.5;
dashSpeed = 4.5;

state = "idle";
dash = false;
dashDir = 90;
shoot = false;

LookRight = 1;

anim_maxIndex = image_number;
anim_index = 0;
anim_fps = 10;

shoot_list = ds_list_create();
wall_list = ds_list_create();

near_id = noone;
near_inst = "noone";

_Enemy_num = 0;
_Wall_num = 0;