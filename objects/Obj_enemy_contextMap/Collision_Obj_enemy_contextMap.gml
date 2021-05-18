/// @description Insert description here
// You can write your code in this editor
if(other.id != id){
	var direc = point_direction(other.x,other.y,x,y);
	
	dir[0] = lerp(dir[0], lengthdir_x(1,direc),0.2);
	dir[1] = lerp(dir[1], lengthdir_y(1,direc),0.2);
}