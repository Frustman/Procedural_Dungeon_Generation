/// @description Insert description here
// You can write your code in this editor
event_inherited();
draw_sprite(Spr_slime_msk,0,x,y);
if(!stun){
	sprite_index = Spr_slime;
	draw_sprite_ext(Spr_slime,real_index,x,y,xscale,yscale,0,c_white,1.0);
}
else
	draw_sprite_ext(Spr_slime_hurt,-1,x,y,xscale,yscale,0,c_white,1.0);
shader_reset();

draw_text(x,y,point_direction(x,y,Obj_chr.x,Obj_chr.y) div( 360 / ray_count ))
for(var i = 0; i < ray_count; i++){
	if(context_dangerous[i] == false && context_left[i] == true){
		if(context_map[i] >= 0){
			draw_set_color(c_green);
		} else {
			draw_set_color(c_red);
		}
		if(i == max_idx_dir) draw_set_color(c_blue);
		draw_line(x,y,x + lengthdir_x(abs(context_map[i] * max_distance),point_direction(0,0,context_dir[i][0],context_dir[i][1])), y + lengthdir_y(abs(context_map[i] * max_distance), point_direction(0,0,context_dir[i][0],context_dir[i][1])));
		draw_set_color(c_white);
	}
}


var ideal_ppd = context_dir[max_idx_dir][2] - 90;
var x_ppd = lengthdir_x(10,ideal_ppd);
var y_ppd = lengthdir_y(10,ideal_ppd);

var x_ray = lengthdir_x(abs(context_map[max_idx_dir] * ray_distance),context_dir[max_idx_dir][2]);
var y_ray = lengthdir_y(abs(context_map[max_idx_dir] * ray_distance),context_dir[max_idx_dir][2]);

draw_set_color(c_blue);
if(plus_ray[0]) draw_set_color(c_red);
draw_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray);
draw_set_color(c_blue);
if(plus_ray[1]) draw_set_color(c_red);
draw_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray);
draw_set_color(c_white);

draw_line(x,y,x+dir[0]*10,y+dir[1]*10);

/*for(var i = 0; i < path_get_number(player_path); i++){
	targetx[i] = path_get_point_x(player_path,i);
	targety[i] = path_get_point_y(player_path,i);
}
	draw_circle(targetx[1],targety[1],2,false);
draw_text(x,y+30,path_get_number(player_path));

if(player_path != -1) draw_path(player_path,x,y,1);*/
