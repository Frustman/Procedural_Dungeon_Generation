/// @description Insert description here
// You can write your code in this editor


//instance_create_layer(0,0, "controller",Obj_controller);

instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2 + 2) * CELL_HEIGHT, "sort_start", Obj_chr);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2 + 2) * CELL_HEIGHT, "sort_start", Obj_weapon_controller);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "sort_start", Obj_npc);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "shader", Obj_bloom_shader);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_barrel);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_itemTable);
instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "pause", Obj_pause);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_flower);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_flower);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_flower);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_enemy_flower);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "Instances", Obj_boss);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_enemy_contextMap);
//instance_create_layer((DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH + 64, (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT + 64, "sort_start", Obj_enemy_perlinNoise);
Obj_camera.x = (DG_WIDTH * 4 + DG_WIDTH / 2) * CELL_WIDTH;
Obj_camera.y = (DG_HEIGHT * 3 + DG_HEIGHT / 2) * CELL_HEIGHT;