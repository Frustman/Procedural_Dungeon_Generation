/// @description Insert description here
// You can write your code in this editor
event_inherited();
sprite_index = Spr_slime;
if(state != ai_state.stop){
	draw_sprite_ext(Spr_slime,real_index,x,y,xscale,yscale,0,c_white,1.0);
} else {
	draw_sprite_ext(Spr_slime,0,x,y,xscale,yscale,0,c_white,1.0);
}
shader_reset();

//draw_text(x,y,round(point_direction(x,y,Obj_chr.x,Obj_chr.y) / ( 360 / rayCount )))
for(var i = 0; i < rayCount; i++){
	if(contextDanger[i] == false && contextCheck[i] == true){
		if(contextMap[i] >= 0){
			draw_set_color(c_green);
		} else {
			draw_set_color(c_red);
		}
		if(i == maxIdxCheck) draw_set_color(c_blue);
		draw_line(x,y,x + lengthdir_x(contextMap[i] * abs(20),point_direction(0,0,contextDir[i][0],contextDir[i][1])), y + lengthdir_y(abs(contextMap[i] *20), point_direction(0,0,contextDir[i][0],contextDir[i][1])));
		draw_set_color(c_white);
	}
}

/*
var ideal_ppd = contextDir[maxIdxCheck][2] - 90;
var x_ppd = lengthdir_x(10,ideal_ppd);
var y_ppd = lengthdir_y(10,ideal_ppd);

var x_ray = lengthdir_x(abs(contextMap[maxIdxCheck] * rayDistance),contextDir[maxIdxCheck][2]);
var y_ray = lengthdir_y(abs(contextMap[maxIdxCheck] * rayDistance),contextDir[maxIdxCheck][2]);

draw_set_color(c_blue);
if(rayExtraCheck[0]) draw_set_color(c_red);
draw_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray);
draw_set_color(c_blue);
if(rayExtraCheck[1]) draw_set_color(c_red);
draw_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray);*/
draw_set_color(c_white);
draw_line(x,y,x+moveDir[0]*10,y+moveDir[1]*10);
