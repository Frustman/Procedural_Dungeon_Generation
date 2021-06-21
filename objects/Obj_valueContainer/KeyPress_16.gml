/// @description Insert description here
// You can write your code in this editor

player_gunBulletCount[player_guntype]	= (bullet_count == 0) ? player_gunMaxCount[player_guntype] : bullet_count;
player_guntype							= (player_guntype + 1) % player_gunMaxType;
bullet_maxCount							= player_gunMaxCount[player_guntype];
bullet_count							= player_gunBulletCount[player_guntype];
player_attackdelay						= player_gundelay[player_guntype];
player_recoil							= player_gunrecoil[player_guntype];
bullet_count							= player_gunBulletCount[player_guntype];

instance_destroy(Obj_bullet_ui);

for(var i = 0; i < bullet_maxCount; i++){
	global.bullet_ui[i] = instance_create_layer(x,y,"bullet_gui",Obj_bullet_ui);
	with(global.bullet_ui[i]){
		if(i >= other.bullet_count){
			state = bulletState.used;	
		}
	}
}