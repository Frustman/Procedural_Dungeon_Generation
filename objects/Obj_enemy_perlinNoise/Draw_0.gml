/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(!stun){
	sprite_index = Spr_slime;
	if(!relax){
		draw_sprite_ext(Spr_slime,real_index,x,y,xscale,yscale,0,c_white,1.0);
	} else {
		draw_sprite_ext(Spr_slime,0,x,y,xscale,yscale,0,c_white,1.0);
	}
}
else
	draw_sprite_ext(Spr_slime_hurt,-1,x,y,xscale,yscale,0,c_white,1.0);
shader_reset();


draw_circle(spawnX,spawnY,spawn_radius,true);
draw_set_color(c_blue);
draw_line(x,y,x+lengthdir_x(15,_angle), y + lengthdir_y(15,_angle));
draw_set_color(c_red);
var dir = point_direction(x,y,spawnX,spawnY);
draw_line(x,y,x+lengthdir_x(15,dir), y + lengthdir_y(15,dir));
draw_set_color(c_white);

/*for(var i = 0; i < ray_count; i++){
	if(context_map[i] >= 0){
		draw_set_color(c_green);
	} else {
		draw_set_color(c_white);
	}
	//if(i == max_idx) draw_set_color(c_blue);
	draw_line(x,y,x + lengthdir_x(abs(context_map[i] * max_distance),point_direction(0,0,context_dir[i][0],context_dir[i][1])), y + lengthdir_y(abs(context_map[i] * max_distance), point_direction(0,0,context_dir[i][0],context_dir[i][1])));
	draw_set_color(c_white);
}

draw_line(x,y,x+dir[0]*10,y+dir[1]*10);
draw_text(x,y+10,player_dist);
*/
/*for(var i = 0; i < path_get_number(player_path); i++){
	targetx[i] = path_get_point_x(player_path,i);
	targety[i] = path_get_point_y(player_path,i);
}
	draw_circle(targetx[1],targety[1],2,false);
draw_text(x,y+30,path_get_number(player_path));

if(player_path != -1) draw_path(player_path,x,y,1);*/
