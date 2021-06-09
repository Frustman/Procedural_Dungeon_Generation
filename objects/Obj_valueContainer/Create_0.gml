/// @description Insert description here
// You can write your code in this editor

#macro CONTAINER Obj_valueContainer

global.level			= 1;
global.timeScale		= 1;

player_maxhp			= 30;
player_hp				= 30;

player_attackdelay		= 7;

critical_chance			= 0.5;

player_bulletDamage		= 1;
player_chainDamage		= 2;
player_explosionDamage	= 4;
player_chargeMaxDamage	= 30;
player_chainCount		= 6;

player_charge			= false;
player_sharpshooting	= false;
player_fireshot			= false;
player_chain			= false;
player_explosion		= false;
player_penetrate		= false;
player_flameShot		= false;

game_timeScale			= 1.0;
game_surface_blur_sigma	= 0;
game_surface_blur		= false;

sharp_cusionCount		= 4;
sharp_distance			= 400;

bullet_maxCount			= 30;
bullet_count			= 30;

player_heart			= 6;
player_maxheart			= 6;

player_shield			= 4;
player_maxshield		= 4;

player_shieldregen		= 320;

boss_exist				= false;
boss_id					= noone;


player_itemCount = 0;
player_itemList = ds_list_create();


global.synergy_name = string(load_csv("synergy_name.csv"));
global.item = string_upper(string(load_csv("item_desc.csv")));
global.synergy_count = ds_grid_height(global.synergy_name);
for(var i = 0; i < global.synergy_count; i++){
	player_synergy[i] = 0;
//	show_message(global.synergy_name[#0, i]);	
}

Scr_alarm_init();