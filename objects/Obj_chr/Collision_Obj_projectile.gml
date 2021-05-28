/// @description Insert description here
// You can write your code in this editor
if(god == false && justdodge = false && dash == false){
	hit = true;
	anim_index = 2;	
	//Scr_shake(0.3,0.2,2,30);
	var fx = lengthdir_x(3,other.image_angle);
	var fy = lengthdir_y(3,other.image_angle);
	Scr_force_update([fx,fy]);
	if(Obj_valueContainer.player_shield > 0){
		Obj_valueContainer.player_shield--;
		with(Obj_valueContainer){
			Alarm[0] = player_shieldregen;	
		}
	} else Obj_valueContainer.player_heart--;
	god = true;
	Alarm[8] = 1;
	Alarm[5] = 25;
	Alarm[6] = 120;
}