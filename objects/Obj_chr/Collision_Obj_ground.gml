/// @description Insert description here
// You can write your code in this editor
if(Obj_mapGenerator.clear == true){
	var pos = Scr_get_room_pos(x, y);
	var xpos = pos div 10;
	var ypos = pos % 10;

	var dg_trim = Obj_mapGenerator.dg_trim;

	switch(other.dir){
		case 0: // L
			x = (xpos * DG_WIDTH - 0.5 - dg_trim) * CELL_WIDTH;
			y = (ypos * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT;
			break;
		case 1: // D
			x = (xpos * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH;
			y = ((ypos + 1) * DG_HEIGHT + 0.5 + dg_trim) * CELL_HEIGHT;
			break;
		case 2: // R
			x = ((xpos + 1) * DG_WIDTH + 0.5 + dg_trim) * CELL_WIDTH;
			y = (ypos * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT;
			break;
		case 3: // U
			x = (xpos * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH;
			y = ((ypos) * DG_HEIGHT - 0.5 - dg_trim) * CELL_HEIGHT;
			break;
	}
	with(Obj_camera){
		event_perform(ev_other,ev_user0);	
	}
					/*if(door_grid[# i, j] % 10 == 1){
						ds_grid_set(real_map, i * DG_WIDTH + 3, j * DG_HEIGHT + DG_HEIGHT / 2, 2);
						var door_L = instance_create_layer(floor(i * DG_WIDTH + 3) * CELL_WIDTH, floor(j * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_door);	
						door_L.dir = 0;
					}
					if(door_grid[# i, j] div 10 % 10 == 1){
						ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2, (j + 1) * DG_HEIGHT - 4, 2);
						var door_D = instance_create_layer(floor(i * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH, ((j + 1) * DG_HEIGHT - 4) * CELL_HEIGHT, "Instances", Obj_door);	
						door_D.dir = 1;
					}
					if(door_grid[# i, j] div 100 % 10 == 1){
						ds_grid_set(real_map, (i + 1) * DG_WIDTH - 4, j * DG_HEIGHT + DG_HEIGHT / 2, 2);
						var door_R = instance_create_layer(floor((i + 1) * DG_WIDTH - 4) * CELL_WIDTH, floor(j * DG_HEIGHT + DG_HEIGHT / 2) * CELL_HEIGHT, "Instances", Obj_door);	
						door_R.dir = 2;
					}
					if(door_grid[# i, j] div 1000 % 10 == 1){
						ds_grid_set(real_map, i * DG_WIDTH + DG_WIDTH / 2, j * DG_HEIGHT + 3, 2);
						var door_U = instance_create_layer(floor(i * DG_WIDTH + DG_WIDTH / 2) * CELL_WIDTH, floor(j * DG_HEIGHT + 3) * CELL_HEIGHT, "Instances", Obj_door);	
						door_U.dir = 3;
					}*/
}