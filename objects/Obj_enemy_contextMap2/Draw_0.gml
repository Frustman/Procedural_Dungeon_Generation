/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(!stun){
	sprite_index = Spr_slime;
	draw_sprite_ext(Spr_slime,real_index,x,y,xscale,yscale,0,c_white,1.0);
}
else
	draw_sprite_ext(Spr_slime_hurt,-1,x,y,xscale,yscale,0,c_white,1.0);
shader_reset();

for(var i = 0; i < ray_count; i++){
	if(context_map[i] >= 0){
		draw_set_color(c_green);
	} else {
		draw_set_color(c_red);
	}
	if(i == maxidx) draw_set_color(c_blue);
	draw_line(x,y,x + lengthdir_x(abs(context_map[i] * 50),context_dir[i]), y + lengthdir_y(abs(context_map[i] * 50), context_dir[i]));
	//draw_text(x + lengthdir_x(abs(context_map[i] * 200),context_dir[i]), y + lengthdir_y(abs(context_map[i] * 200), context_dir[i]),context_dir[i]);
	draw_set_color(c_white);
}

draw_circle(x,y,200,true);



for(var i = 0; i < ds_list_size(wall_list); i++){
	draw_set_color(c_black);
	draw_circle(wall_list[|i].x,wall_list[|i].y,3,false);
	draw_set_color(c_white);
}

/*for(var i = 0; i < path_get_number(player_path); i++){
	targetx[i] = path_get_point_x(player_path,i);
	targety[i] = path_get_point_y(player_path,i);
}
	draw_circle(targetx[1],targety[1],2,false);
draw_text(x,y+30,path_get_number(player_path));

if(player_path != -1) draw_path(player_path,x,y,1);*/
