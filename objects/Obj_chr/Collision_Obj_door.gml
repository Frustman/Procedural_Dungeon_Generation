/// @description Insert description here
// You can write your code in this editor

var pos = Scr_get_room_pos();
var xpos = pos div 10;
var ypos = pos % 10;

var dg_width = Obj_mapGenerator.dg_width;
var dg_height = Obj_mapGenerator.dg_height;
switch(other.dir){
	case 0: // L
		x = (xpos * dg_width - 4.5) * CELL_WIDTH;
		y = (ypos * dg_height + dg_height / 2) * CELL_HEIGHT;
		break;
	case 1: // D
		x = (xpos * dg_width + dg_width / 2) * CELL_WIDTH;
		y = ((ypos + 1) * dg_height + 4.5) * CELL_HEIGHT;
		break;
	case 2: // R
		x = ((xpos + 1) * dg_width + 4.5) * CELL_WIDTH;
		y = (ypos * dg_height + dg_height / 2) * CELL_HEIGHT;
		break;
	case 3: // U
		x = (xpos * dg_width + dg_width / 2) * CELL_WIDTH;
		y = ((ypos) * dg_height - 4.5) * CELL_HEIGHT;
		break;
}
				/*if(door_grid[# i, j] % 10 == 1){
					ds_grid_set(real_map, i * dg_width + 3, j * dg_height + dg_height / 2, 2);
					var door_L = instance_create_layer(floor(i * dg_width + 3) * CELL_WIDTH, floor(j * dg_height + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_door);	
					door_L.dir = 0;
				}
				if(door_grid[# i, j] div 10 % 10 == 1){
					ds_grid_set(real_map, i * dg_width + dg_width / 2, (j + 1) * dg_height - 4, 2);
					var door_D = instance_create_layer(floor(i * dg_width + dg_width / 2) * CELL_WIDTH, ((j + 1) * dg_height - 4) * CELL_HEIGHT, "Instances", Obj_door);	
					door_D.dir = 1;
				}
				if(door_grid[# i, j] div 100 % 10 == 1){
					ds_grid_set(real_map, (i + 1) * dg_width - 4, j * dg_height + dg_height / 2, 2);
					var door_R = instance_create_layer(floor((i + 1) * dg_width - 4) * CELL_WIDTH, floor(j * dg_height + dg_height / 2) * CELL_HEIGHT, "Instances", Obj_door);	
					door_R.dir = 2;
				}
				if(door_grid[# i, j] div 1000 % 10 == 1){
					ds_grid_set(real_map, i * dg_width + dg_width / 2, j * dg_height + 3, 2);
					var door_U = instance_create_layer(floor(i * dg_width + dg_width / 2) * CELL_WIDTH, floor(j * dg_height + 3) * CELL_HEIGHT, "Instances", Obj_door);	
					door_U.dir = 3;
				}*/