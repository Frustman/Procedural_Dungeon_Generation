/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
hit = true;

ac_cnt = 0;
Alarm[0] = 5;
	
hp -= 1;
if(hp < 0){
	instance_destroy(self);
	instance_create_layer(x,y,layer,Obj_delbris);
}

var dir = other.image_angle - 180;
repeat(irandom(5) + 3){
	with(instance_create_layer(other.x,other.y,"sort_start",Obj_delbris)){
		sprite_index = Spr_destructable_box_broke;
		hspd = sign(lengthdir_x(1,dir)) * random(3);
	}
}