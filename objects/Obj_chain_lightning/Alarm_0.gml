/// @description Insert description here
// You can write your code in this editor


if(!ds_list_empty(list)){
	if(idx < ds_list_size(list) - 1){
		if(instance_exists(list[|idx]) && instance_exists(list[|idx + 1])){
			with(instance_create_layer(list[|idx].x,list[|idx].y,"sort_start",Obj_chain_eff)){
				par = other.list[|other.idx];
				target = other.list[|other.idx + 1];
			}
			idx++;
		}
	} else {
		instance_destroy(self);	
	}
}
alarm[0] = 5;