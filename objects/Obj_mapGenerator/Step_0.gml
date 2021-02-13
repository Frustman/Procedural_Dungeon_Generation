/// @description Insert description here
// You can write your code in this editor
if(!generated){
	var error = false;
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
			if(stack_cnt > 0){
				repeat(irandom(stack_cnt)){
					ds_stack_pop(endroom_list);
				}
				if(ds_stack_empty(endroom_list)){
					error = true;
				}
				reward_room = ds_stack_pop(endroom_list);
				map_grid[# boss_room div 10, boss_room % 10] = 2;
				map_grid[# reward_room div 10, reward_room % 10] = 3;
				instance_create_layer(((boss_room div 10) * dg_width + dg_width /2) * CELL_WIDTH,((boss_room % 10) * dg_height + dg_height /2) * CELL_HEIGHT,"Instances",Obj_stair);
				generated = true;
			} else{
				error = true;	
			}
		}
		if(map_cnt < max_mapcnt) error = true;
		if(error){
			generated = false;
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
}


randomize();
if(generated && instance_exists(Obj_chr)){
	var curRoom = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	if(Map_visit_grid[# curRoom div 10, curRoom % 10] == 0 && map_grid[# curRoom div 10, curRoom % 10] == 1){
		repeat(6){
			mongen = false;
			while(!mongen){
				var xpos = irandom(dg_width - dg_trim * 2) + dg_trim;
				var ypos = irandom(dg_height - dg_trim * 2) + dg_trim;
			
				if(!instance_place(((curRoom div 10) * dg_width + xpos) * CELL_WIDTH + CELL_WIDTH / 2,((curRoom % 10) * dg_height + ypos) * CELL_HEIGHT + CELL_HEIGHT / 2,Obj_spawner) && real_map[# (curRoom div 10) * dg_width + xpos, (curRoom % 10) * dg_height + ypos] == 0){
					with(instance_create_layer(((curRoom div 10) * dg_width + xpos) * CELL_WIDTH + CELL_WIDTH / 2,((curRoom % 10) * dg_height + ypos) * CELL_HEIGHT + CELL_HEIGHT / 2,"Instances",Obj_spawner)){
						if(irandom(1) == 0){
							//obj = Obj_enemy_wildpig;
						}
					}
					mongen = true;
				}
			}
		}
	}
	Map_visit_grid[# curRoom div 10, curRoom % 10] = 1;
	miniMap_grid[# curRoom div 10, curRoom % 10] = map_grid[# curRoom div 10, curRoom % 10];
	miniMap_grid[# curRoom div 10, curRoom % 10 - 1] = map_grid[# curRoom div 10, curRoom % 10 - 1];
	miniMap_grid[# curRoom div 10 - 1, curRoom % 10] = map_grid[# curRoom div 10 - 1, curRoom % 10];
	miniMap_grid[# curRoom div 10 + 1, curRoom % 10] = map_grid[# curRoom div 10 + 1, curRoom % 10];
	miniMap_grid[# curRoom div 10, curRoom % 10 + 1] = map_grid[# curRoom div 10, curRoom % 10 + 1];
}


if(generated && !tiled){
	event_perform(ev_other,ev_user0);
	tiled = true;
}