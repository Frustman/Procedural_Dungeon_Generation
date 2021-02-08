/// @description Insert description here
// You can write your code in this editor
attack_list = ds_list_create();
ds_list_add(attack_list, other.id);

instance_destroy(self);
Scr_chain_lightning(attack_list,1,3,other.id);
pos_list = ds_list_create();
for(var i = 0; i < ds_list_size(attack_list); i++){
	ds_list_add(pos_list,[attack_list[|i].x,attack_list[|i].y]);
}
with(instance_create_layer(x,y,"Instances",Obj_chain_lightning)){
	list = other.pos_list;
}
