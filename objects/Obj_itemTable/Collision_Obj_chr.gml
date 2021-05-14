/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(Obj_item_sequence)){
	with(instance_create_layer(0,0,"sequence",Obj_item_sequence)){
		item_sprite = other.item_type;
		item_index = other.item_index;
		item_name = other.item_name;
	}
	instance_destroy(self);
	Scr_item_get(new item(item_name, item_type, item_index, item_description[irandom(3)]));
}