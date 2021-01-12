/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(chr_diff > 45 && in_sight){
	targetX = Obj_chr.x;
	targetY = Obj_chr.y;
	targeted = true;
}

if(targeted){
	if(point_distance(x,y,targetX,targetY) >= 16){
		mp_potential_step_object(targetX,targetY,1,Obj_wall);
	} else{
		targetX = x;
		targetY = y;
		targeted = false;
	}
}