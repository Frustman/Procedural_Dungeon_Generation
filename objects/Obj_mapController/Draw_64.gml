/// @description Insert description here
// You can write your code in this editor

gpu_set_tex_filter(false);

if(instance_exists(Obj_sequence)){
	mapW = 0;
	mapH = 0;
}

/*else {
	for(var i = 0; i < 9; i++){
		for(var j = 0; j < 8; j++){
			draw_text(i * 10, j * 10, map_grid[#i,j]);
		}
	}
}*/


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

if(CONTAINER.player_curWeapon != noone){
	for(var i = 0; i < CONTAINER.player_curWeapon.bullet_maxCount; i++){
		global.bullet_ui[i].xpos = bulletX + 3 * mapW + (7 * mapW) * i;
		global.bullet_ui[i].ypos = bulletY;
		global.bullet_ui[i].scale = mapW;
	}
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