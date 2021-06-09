/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(Obj_item_sequence)){
	with(instance_create_layer(0,0,"sequence",Obj_item_sequence)){
		item_sprite = other.item_type;
		item_index = other.item_index;
		item_name = other.item_name;
	}
	instance_destroy(self);
	var new_item = new Item(item_name, item_type, item_index, item_desc);
	var ii = irandom(6);
	var jj;
	for(jj = irandom(6); jj == ii; jj = irandom(6)){}
	ds_list_add(new_item.synergy,ii);
	ds_list_add(new_item.synergy,jj);
	Scr_item_get(new_item);
}