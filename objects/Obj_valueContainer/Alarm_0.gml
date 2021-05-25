/// @description Insert description here
// You can write your code in this editor
if(player_maxshield > player_shield){
	player_shield++;
	alarm[0] = player_shieldregen / global.timeScale;
}