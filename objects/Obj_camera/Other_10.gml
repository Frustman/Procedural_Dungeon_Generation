/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_chr)){
	instance_deactivate_region((DG_WIDTH * (cur_room div 10)) * CELL_WIDTH,(DG_HEIGHT * (cur_room % 10)) * CELL_HEIGHT,DG_WIDTH * CELL_WIDTH, DG_HEIGHT * CELL_HEIGHT, false, true);
	instance_activate_region((DG_WIDTH * (cur_room div 10)) * CELL_WIDTH,(DG_HEIGHT * (cur_room % 10)) * CELL_HEIGHT,DG_WIDTH * CELL_WIDTH, DG_HEIGHT * CELL_HEIGHT, true);
	instance_activate_object(Obj_shake);
	instance_activate_object(Obj_controller);
	instance_activate_object(Obj_bloom_shader);
	instance_activate_object(Obj_valueContainer);
	instance_activate_object(Obj_mapController);
	instance_activate_object(Obj_depth_sorting);
	instance_activate_object(Obj_status);
	instance_activate_object(Obj_chr);
	instance_activate_object(Obj_bullet_ui);
	instance_activate_object(Obj_pause);
	instance_activate_object(Obj_item_sequence);
	
	Obj_mapController.mapW_target = 3.0;
	Obj_mapController.mapH_target = 3.0;
	Obj_mapController.mini_resize = true;
	Obj_mapController.alarm[1] = 120;
}