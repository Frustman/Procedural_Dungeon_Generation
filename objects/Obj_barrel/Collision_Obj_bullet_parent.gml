/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
hit = true;

ac_cnt = 0;
alarm[0] = 10;
	
hp -= 1;
if(hp < 0){
	instance_destroy(self);
	instance_create_layer(x,y,layer,Obj_delbris);
}