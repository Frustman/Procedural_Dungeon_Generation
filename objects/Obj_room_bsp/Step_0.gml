/// @description 

#macro CELL_WIDTH 64
#macro CELL_HEIGHT 64

if is_create{
	var MIN_SIZE = Obj_map_bsp.MIN_SIZE;
	width = x2 - x1;
	height = y2 - y1;
	
	cx = (x1 + x2) div 2;
	cy = (y1 + y2) div 2;
	
	x = cx * CELL_WIDTH;
	y = cy * CELL_HEIGHT;
	
	var splitH = irandom(10) > 4;
	
	if(width / height >= 1.25){
		splitH = true;
	} else if(height / width >= 1.25){
		splitH = false;
	}
	
	var split = min(width, height) > MIN_SIZE;
	
	if(split){
		split_width = round(width / 4 + irandom(width / 2));
		split_height = round(height / 4 + irandom(height / 2));
	
	
		if(splitH){
			left_node = instance_create_layer(x1,y1,"room",Obj_room_bsp);
			right_node = instance_create_layer(x1 + split_width,y1,"room",Obj_room_bsp);
			with(left_node){
				x1 = other.x1;
				y1 = other.y1;
				x2 = other.x1 + other.split_width;
				y2 = other.y2;
			
				parent_node = other;
				brother_node = right_node;
			}
			with(right_node){
				x1 = other.x1 + other.split_width;
				x2 = other.x2;
				y1 = other.y1;
				y2 = other.y2;
			
				parent_node = other;
				brother_node = left_node;
			}
			is_terminal = false;
		} else{
			left_node = instance_create_layer(x1,y1,"room",Obj_room_bsp);
			right_node = instance_create_layer(x1,y1 + split_height,"room",Obj_room_bsp);
			with(left_node){
				x1 = other.x1;
				x2 = other.x2;
				y1 = other.y1;
				y2 = other.y1 + other.split_height;
			
				parent_node = other;
				brother_node = right_node;
			}
			with(right_node){
				x1 = other.x1;
				x2 = other.x2;
				y1 = other.y1 + other.split_height;
				y2 = other.y2;
			
				parent_node = other;
				brother_node = left_node;
			}
			is_terminal = false;
		}
	}
	is_create = false;
}
if(!is_terminal){
	instance_destroy(self);
} else{
	var data_list = array_create(4,0);
	data_list[0] = x;
	data_list[1] = y;
	data_list[2] = cx;
	data_list[3] = cy;
	var Mroom_width = width / 2 - 2;
	var Mroom_height = height / 2 - 2;
	ds_grid_set_region(Obj_map_bsp.geo_map,cx - Mroom_width, cy - Mroom_height,cx + Mroom_width, cy + Mroom_height, 1);
	ds_list_add(Obj_map_bsp.node_list, data_list);
	instance_destroy(self);
}
