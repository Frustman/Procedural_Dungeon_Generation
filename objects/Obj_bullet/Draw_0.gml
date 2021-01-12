/// @description Insert description here
// You can write your code in this editor

if(targetX != 0 && targetY != 0){
	if(bullet_type == "normal"){
		var r = random(0.2);
		var r2 = random(0.1);
		startX = lerp(startX,targetX,0.4 + r);
		startY = lerp(startY,targetY,0.4 + r);
		dumX = lerp(startX,targetX,0.11 + r2);
		dumY = lerp(startY,targetY,0.11 + r2);
	} else if(bullet_type == "strong"){
		var r = random(0.2);
		var r2 = random(0.1);
		startX = lerp(startX,targetX,0.7 + r);
		startY = lerp(startY,targetY,0.7 + r);
		//dumX = lerp(startX,targetX,0.05 + r2);
		//dumY = lerp(startY,targetY,0.05 + r2);
	}
}

draw_sprite_ext(Spr_hitmsk3,index div 3,x,y,1.0,1.0,point_direction(x,y,targetX,targetY) - 180,c_white,1.0);
draw_line(dumX,dumY,startX,startY);

if(bullet_type == "normal"){
	if(ran == 0)
	draw_sprite_ext(Spr_hitmsk1,index div 3,targetX,targetY,1.0,1.0,point_direction(x,y,targetX,targetY),c_white,1.0);
	if(ran == 1)
	draw_sprite_ext(Spr_hitmsk2,index div 3,targetX,targetY,1.0,1.0,point_direction(x,y,targetX,targetY),c_white,1.0);
} else if(bullet_type == "strong"){
	draw_sprite_ext(Spr_hitmsk4,index div 3,targetX,targetY,1.0,1.0,point_direction(x,y,targetX,targetY),c_white,1.0);
}