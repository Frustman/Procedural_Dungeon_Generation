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
				if(random(9) <= 3.0){
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
			var stack_cnt = ds_stack_size(endroom_list);
			if(stack_cnt > 0){
				var Eroom_list = ds_list_create();
				for(var i = 0; i < stack_cnt; i++){
					ds_list_add(Eroom_list, ds_stack_pop(endroom_list));	
				}
				var reward_room = Eroom_list[| irandom(stack_cnt - 1)];
				map_grid[# boss_room div 10, boss_room % 10] = 2;
				map_grid[# reward_room div 10, reward_room % 10] = 3;
				instance_create_layer(((boss_room div 10) * DG_WIDTH + DG_WIDTH /2) * CELL_WIDTH,((boss_room % 10) * DG_HEIGHT + DG_HEIGHT /2) * CELL_HEIGHT,"sort_start",Obj_stair);
				generated = true;
			} else {
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
	if(Obj_valueContainer.boss_exist == true){
		bosshpY = lerp(bosshpY, deviceHeight - 100, 0.1 * global.timeScale);
	}
	if(mini_resize == true){
		mapW = lerp(mapW, mapW_target, 0.1 * global.timeScale);
		mapH = lerp(mapH, mapH_target, 0.1 * global.timeScale);

		mapX = 90 * mapW;
		
		if(mapW == mapW_target) mini_resize = false;
	}
	
	
	curRoom = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	if(Map_visit_grid[# curRoom div 10, curRoom % 10] == 0 && map_grid[# curRoom div 10, curRoom % 10] == 1){
		repeat(6){
			mongen = false;
			while(!mongen){
				var xcur = ((curRoom div 10) * DG_WIDTH + irandom(DG_WIDTH - dg_trim * 2) + dg_trim);
				var ycur = ((curRoom % 10) * DG_HEIGHT + irandom(DG_HEIGHT - dg_trim * 2) + dg_trim);
				
				var xpos = xcur * CELL_WIDTH;
				var ypos = ycur * CELL_HEIGHT;
			
				if(!instance_place(xpos,ypos,Obj_wall) && !instance_place(xpos,ypos,Obj_wall32) && !instance_place(xpos,ypos,Obj_spawner) && real_map[# xcur, ycur] == 0){
					with(instance_create_layer(xpos, ypos,"sort_start",Obj_spawner)){
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


if(instance_exists(Obj_enemy)){
	clear = false;	
} else clear = true;


if(generated && !tiled){
	event_perform(ev_other,ev_user0);
	tiled = true;
}