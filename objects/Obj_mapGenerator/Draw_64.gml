/// @description Insert description here
// You can write your code in this editor

gpu_set_tex_filter(false);

if(instance_exists(Obj_chr)){
	var cur_room = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	var xpos = cur_room div 10;
	var ypos = cur_room % 10;
	draw_sprite_ext(Spr_map_frame,0,0,0,mapW,mapH,0,c_white,1.0);
	
	if(minimap_gen == false){
		for(var _i = 0; _i < 9; _i++){
			for(var _j = 0; _j < 8; _j++){
				surf = surface_create(120, 100);
				surface_set_target(surf);
					draw_rectangle_color(11,22,103,93,false,c_black,c_black,c_black,false);
					for(var i = 0; i < DG_WIDTH; i++){
						for(var j = 0; j < DG_HEIGHT; j++){
							//draw_text( 4 + 4 * i, 12 + 4 * j,real_mini_map[_i * DG_WIDTH + i][_j* DG_HEIGHT + j]);
							draw_sprite(Spr_mini_map_ground, real_mini_map[_i * DG_WIDTH + i][ _j* DG_HEIGHT + j],13 + 4 * i,21 + 4 * j);
						}
					}
					for(var k = 0; k < DG_WIDTH * 2; k++){
						for(var l = 0; l < DG_HEIGHT * 2; l++){
							//draw_text( 4 + 4 * i, 12 + 4 * j,real_mini_map[_i * DG_WIDTH + i][_j* DG_HEIGHT + j]);
							draw_sprite(Spr_mini_map_water, real_mini_water[_i * DG_WIDTH * 2 + k][ _j* DG_HEIGHT * 2 + l],13 + 2 * k, 21 + 2 * l);
						}
					}
				surface_reset_target();
				surf_min[_i][_j] = sprite_create_from_surface(surf,0,0,120,100,0,0,0,0);
				//surf_min = surf;
				surface_free(surf);
			}
		}
		minimap_gen = true;
	} else draw_sprite_ext(surf_min[xpos][ypos], 0, deviceWidth - 350 * mapW / 3, 2,mapW,mapH,0,c_white,1.0);
	//} else draw_surface_stretched(surf, 0, deviceWidth - 90,270,300);
	
	draw_sprite_ext(Spr_minimap_chr,0,deviceWidth - 311 * mapW / 3 + ((Obj_chr.x - xpos * DG_WIDTH * CELL_WIDTH) / CELL_WIDTH * 12) * mapW / 3, 57 * mapH / 3 + ((Obj_chr.y - ypos * DG_HEIGHT * CELL_HEIGHT) / CELL_HEIGHT * 12) * mapH / 3,mapW - 1,mapH - 1,0,c_white,1);
	
	draw_sprite_ext(Spr_minimap_frame,0, deviceWidth - 350 * mapW / 3, 2,mapW,mapH,0,c_white,1);
	for(var i = 0; i < 9; i++){
		for(var j = 0; j < 8; j++){
			var xpos = 27 + 24 * i;
			var ypos = 54 + 24 * j;
			
			xpos = xpos * mapW / 3;
			ypos = ypos * mapH / 3;
			if(miniMap_grid[#i, j] == 1){
				if(i * 10 + j == cur_room)
					draw_sprite_ext(Spr_mini_map,3,xpos, ypos, mapW / 3, mapH / 3, 0, c_white, 1);
				else
					draw_sprite_ext(Spr_mini_map,0,xpos, ypos, mapW / 3, mapH / 3, 0, c_white, 1);
			}
			if(miniMap_grid[#i, j] == 2){
				if(i * 10 + j == cur_room)
					draw_sprite_ext(Spr_mini_map,5,xpos, ypos, mapW / 3, mapH / 3, 0, c_white, 1);
				else
					draw_sprite_ext(Spr_mini_map,2,xpos, ypos, mapW / 3, mapH / 3, 0, c_white, 1);
			}
			if(miniMap_grid[#i, j] == 3){
				if(i * 10 + j == cur_room)
					draw_sprite_ext(Spr_mini_map,4,xpos, ypos, mapW / 3, mapH / 3, 0, c_white, 1);
				else
					draw_sprite_ext(Spr_mini_map,1,xpos, ypos, mapW / 3, mapH / 3, 0, c_white, 1);
			}
		}
	}
} else {
	for(var i = 0; i < 9; i++){
		for(var j = 0; j < 8; j++){
			draw_text(i * 10, j * 10, map_grid[#i,j]);
		}
	}
}

	draw_set_font(Font_ui);
	
//draw_text(190,20,string(global.level) + " Floor");

var bulletX = 290;

bulletX = bulletX * mapW / 3;

draw_set_font(-1);
draw_sprite_ext(Spr_bullet_ui,0,bulletX,50, (20 * Obj_valueContainer.bullet_maxCount + 20) / 144,2.0,0,c_white,1.0);
draw_sprite_ext(Spr_bullet_ui,0,bulletX,10, (180) / 144,2.0,0,c_white,1.0);


for(var i = 0; i < Obj_valueContainer.bullet_maxCount; i++){
	global.bullet_ui[i].xpos = bulletX - 14 + 20 * i;
}

//draw_sprite_ext(Spr_up_side,0,deviceWidth / 2,deviceHeight + 30, deviceWidth / 480,1,0,c_white,1.0);

for(var i = 0; i < Obj_valueContainer.player_maxheart div 2; i++){
	var idx;
	if(Obj_valueContainer.player_heart - (i+1) * 2 >= 0) idx = 0;
	else if(Obj_valueContainer.player_heart - (i+1) * 2 == -1) idx = 1;
	else idx = 2;
	draw_sprite(Spr_heart_ui,idx,bulletX + 10 + 32 * i, 20);
}

for(var i = 0; i < Obj_valueContainer.player_maxshield div 2; i++){
	var _idx;
	if(Obj_valueContainer.player_shield - (i+1) * 2 >= 0) _idx = 0;
	else if(Obj_valueContainer.player_shield - (i+1) * 2 == -1) _idx = 1;
	else _idx = 2;
	draw_sprite(Spr_shield_ui,_idx,bulletX + 10 + 32 * (Obj_valueContainer.player_maxheart div 2) + 32 * i, 20);
}
