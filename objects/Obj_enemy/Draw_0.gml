/// @description Insert description here
// You can write your code in this editor
if(Obj_chr.AttackTarget == id){
	shader_set(Sha_white_outline);
	shader_set_uniform_f(upixelH,texelH);
	shader_set_uniform_f(upixelW,texelW);
}
for(var i = -1;i < 2; i++){
	for(var j = -1 ; j < 2; j++){
		if(i == 0 || j == 0) draw_sprite(Spr_dustA,0,x + width / 2 * i,y + height / 2 * j);
	}
}
