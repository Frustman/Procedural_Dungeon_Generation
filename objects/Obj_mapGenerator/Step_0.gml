/// @description Insert description here
// You can write your code in this editor
if(!generated){
	if(!ds_queue_empty(room_queue)){
		var created = false;
		var val = ds_queue_dequeue(room_queue);
		xpos = val div 10;
		ypos = val % 10;
	
		for(var dir = 0; dir < 4; dir++){ // 0 - left / 1 - down / 2 - right / 3 - up
			if(map_cnt < max_mapcnt){
				if(random(9) <= 5.0){
					var xCursor = xpos + dir_list[dir][0];
					var yCursor = ypos + dir_list[dir][1];
					if(xCursor > 1 && xCursor < 9 && yCursor > 2 && yCursor < 7){
						if(map_grid[# xCursor, yCursor] == 0){
							var neighbor = 0;
							for(var i = 0; i < 4; i++){
								neighbor += map_grid[# xCursor + dir_list[i][0], yCursor + dir_list[i][1]] != 0;	
							}
							if(neighbor == 1){
								created = true;
								ds_queue_enqueue(room_queue, 10 * xCursor + yCursor);
								switch(dir){
									case 0 : // left
										if(door_grid[# xpos, ypos] % 10 == 0)
											door_grid[# xpos, ypos] += 1;
										if(door_grid[# xCursor, yCursor] div 100 % 10 == 0)
											door_grid[# xCursor, yCursor] += 100;
										break;
									case 1 : // down
										if(door_grid[# xpos, ypos] div 10 % 10 == 0)
											door_grid[# xpos, ypos] += 10;
										if(door_grid[# xCursor, yCursor] div 1000 % 10 == 0)
											door_grid[# xCursor, yCursor] += 1000;
										break;
									case 2 : // right
										if(door_grid[# xpos, ypos] div 100 % 10 == 0)
											door_grid[# xpos, ypos] += 100;
										if(door_grid[# xCursor, yCursor] % 10 == 0)
											door_grid[# xCursor, yCursor] += 1;
										break;
									case 3 : // up
										if(door_grid[# xpos, ypos] div 1000 % 10 == 0)
											door_grid[# xpos, ypos] += 1000;
										if(door_grid[# xCursor, yCursor] div 10 % 10 == 0)
											door_grid[# xCursor, yCursor] += 10;
										break;
								}
								map_grid[# xCursor, yCursor] = 1;
								ds_list_add(room_list, xCursor * 10 + yCursor);
								map_cnt++;
							}
						}
					}
				}
			}
		}
		if(!created){
			ds_stack_push(endroom_list, xpos * 10 + ypos);
		}
	} else { 
		if(map_cnt >= max_mapcnt){
			var boss_room = ds_stack_pop(endroom_list);
			var stack_cnt = ds_stack_size(endroom_list) - 2;
			repeat(irandom(stack_cnt)){
				ds_stack_pop(endroom_list);
			}
			var reward_room = ds_stack_pop(endroom_list);
			map_grid[# boss_room div 10, boss_room % 10] = 2;
			map_grid[# reward_room div 10, reward_room % 10] = 3;
			generated = true;
		}
		if(map_cnt < max_mapcnt){
			ds_grid_set_region(map_grid,0,0,8,7,0);
			ds_grid_set_region(door_grid,0,0,8,7,0);
			ds_grid_set(map_grid,4,3,1);
			ds_queue_enqueue(room_queue, 43);
			ds_stack_clear(endroom_list);
			map_cnt = 1;
			xpos = 4;
			ypos = 3;
		}
	}
}else if(!tiled){
	for(var i = 0; i < 9; i++){
		for(var j = 0; j < 8; j++){
			if(map_grid[# i, j] != 0){
				ds_grid_set_grid_region(real_map, map_list, 0, 0, dg_width - 1, dg_height - 1, i * dg_width, j * dg_height);
			}
		}
	}
	tiled = true;
}