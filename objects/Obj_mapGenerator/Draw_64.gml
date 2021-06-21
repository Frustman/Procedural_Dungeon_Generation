/// @description Insert description here
// You can write your code in this editor

gpu_set_tex_filter(false);

if(instance_exists(Obj_chr)){
	var cur_room = Scr_get_room_pos(Obj_chr.x,Obj_chr.y);
	var xpos = cur_room div 10;
	var ypos = cur_room % 10;
	draw_sprite_ext(Spr_map_frame,0,0,0,mapW,mapH,0,c_white,1);
	
	
	if(minimap_gen == false){
		for(var _i = 0; _i < 9; _i++){
			for(var _j = 0; _j < 8; _j++){
				surf = surface_create(120, 100);
				surface_set_target(surf);
					var color = make_color_rgb(200,134,79);
					//draw_rectangle_color(11,22,103,93,c_black,c_black,c_black,c_black,false);
					draw_rectangle_color(11,22,103,93,color,color,color,color,false);
					for(var k = 0; k < DG_WIDTH * 2; k++){
						for(var l = 0; l < DG_HEIGHT * 2; l++){
							//draw_text( 4 + 4 * i, 12 + 4 * j,real_mini_map[_i * DG_WIDTH + i][_j* DG_HEIGHT + j]);
							draw_sprite_ext(Spr_mini_map_water, real_mini_water[_i * DG_WIDTH * 2 + k][ _j* DG_HEIGHT * 2 + l],13 + 3 * k, 22 + 3 * l,1.5,1.5,0,c_white,1);
						}
					}
					for(var i = 0; i < DG_WIDTH; i++){
						for(var j = 0; j < DG_HEIGHT; j++){
							//draw_text( 4 + 4 * i, 12 + 4 * j,real_mini_map[_i * DG_WIDTH + i][_j* DG_HEIGHT + j]);
							draw_sprite_ext(Spr_mini_map_ground, real_mini_map[_i * DG_WIDTH + i][ _j* DG_HEIGHT + j],13 + 6 * i,22 + 6 * j,1.5,1.5,0,c_white,1);
						}
					}
				surface_reset_target();
				surf_min[_i][_j] = sprite_create_from_surface(surf,0,0,120,100,0,0,0,0);
				//surf_min = surf;
				surface_free(surf);
			}
		}
		minimap_gen = true;
	} else draw_sprite_ext(surf_min[xpos][ypos], 0, deviceWidth - 353 * mapW / 3, 2,mapW,mapH,0,c_white,1.0);
	//} else draw_surface_stretched(surf, 0, deviceWidth - 90,270,300);
	
	draw_sprite_ext(Spr_minimap_chr,0,deviceWidth - 311 * mapW / 3 + ((Obj_chr.x + CELL_WIDTH / 2 - xpos * DG_WIDTH * CELL_WIDTH) / DG_WIDTH / CELL_WIDTH * 90) * mapW, 57 * mapH / 3 + ((Obj_chr.y + CELL_HEIGHT - ypos * DG_HEIGHT * CELL_HEIGHT) / DG_HEIGHT / CELL_HEIGHT * 70) * mapH,mapW - 1,mapH - 1,0,c_white,1);
	
	draw_sprite_ext(Spr_minimap_frame,0, deviceWidth - 350 * mapW / 3 , 2,mapW,mapH,0,c_white,1);
	for(var i = 0; i < 9; i++){
		for(var j = 0; j < 8; j++){
			var xpos = 27 + 24 * i;
			var ypos = 54 + 24 * j;
			
			xpos = xpos * mapW / 3;
			ypos = ypos * mapH / 3;
			if(abs(miniMap_grid[#i, j]) == 1){
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

//var bulletX = 290;
var bulletX = 12 + mapX;

//bulletX = bulletX;
var bulletY = 10 * mapW;
var heartY = bulletY + 7 * mapW;

draw_set_font(-1);
//draw_sprite_ext(Spr_bullet_frame,0,bulletX + 15,30, (12 * CONTAINER.bullet_maxCount + 20) / 355,1.0,0,c_white,1.0);
//draw_sprite_ext(Spr_bullet_ui,0,bulletX,70, (180) / 144,2.0,0,c_white,1.0);


for(var i = 0; i < CONTAINER.bullet_maxCount; i++){
	global.bullet_ui[i].xpos = bulletX + 3 * mapW + (7 * mapW) * i;
	global.bullet_ui[i].ypos = bulletY;
	global.bullet_ui[i].scale = mapW;
}

//draw_sprite_ext(Spr_up_side,0,deviceWidth / 2,deviceHeight + 30, deviceWidth / 480,1,0,c_white,1.0);

for(var i = 0; i < CONTAINER.player_maxheart div 2; i++){
	var idx;
	if(CONTAINER.player_heart - (i+1) * 2 >= 0) idx = 0;
	else if(CONTAINER.player_heart - (i+1) * 2 == -1) idx = 1;
	else idx = 2;
	draw_sprite_ext(Spr_heart_ui,idx,bulletX + 16 * mapW * i, heartY,mapW,mapW,0,c_white,1);
}

for(var i = 0; i < CONTAINER.player_maxshield div 2; i++){
	var idx;
	if(CONTAINER.player_shield - (i+1) * 2 >= 0) idx = 0;
	else if(CONTAINER.player_shield - (i+1) * 2 == -1) idx = 1;
	else idx = 2;
	draw_sprite_ext(Spr_shield_ui,idx,bulletX + 16 * mapW * (CONTAINER.player_maxheart div 2) + 16 * mapW * i, heartY,mapW,mapW,0,c_white,1);
}

if(CONTAINER.boss_exist == true){
	draw_sprite_ext(Spr_boss_frame,0,deviceWidth / 2 - 348,bosshpY,2.0,2.0,0,c_white,1);
	var hpper = CONTAINER.boss_id.hp / CONTAINER.boss_id.maxhp;
	draw_sprite_ext(Spr_boss_hpbar,0,deviceWidth / 2 - 348,bosshpY,hpper * (348 * 2 - 22) / 584,1.0,0,c_white,1);
}