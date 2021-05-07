/// @function Scr_Astar(grid_map, x_start, y_start, x_end, y_end)
function Scr_Astar(grid_map, x_start, y_start, x_end, y_end){
	var _search = true, _found = false;
	var _i = 0, _j = 0;

	var parent_list = ds_map_create();
	var closed_list = ds_list_create();
	var _g = ds_map_create();
	var _h = ds_map_create();
	var _f = ds_priority_create();
	
	var _path = -1;
	
	var xpos = x_start;
	var ypos = y_start;
	
	ds_map_add(_g, xpos * dg_width + ypos , 0);
	
	while(_search){
		ds_list_add(closed_list, xpos * dg_width + ypos);
		for(_i = max(0,xpos - 1); _i <= min(dg_width - 1, xpos + 1); _i++){
			for(_j = max(0,ypos - 1); _j <= min(dg_height - 1, ypos + 1); _j++){
				if((_i = xpos && _j = ypos)){
					continue;
				}
				var _closed = ds_list_find_index(closed_list,dg_width * _i + _j) == -1;
				var _walk;
				var _dist = 0;					
				if((_i + _j) % 2 == (xpos + ypos) % 2){
					_walk = !grid_map[#_i,_j] && (!grid_map[#_i,ypos] || !grid_map[#xpos,_j]);
					_dist = 1.414;
				} else{
					_walk = !grid_map[#_i,_j];
					_dist = 1;
				}
				if(_walk && _closed){
					var temp_g = ds_map_find_value(_g,dg_width * xpos + ypos) + _dist;
					var temp_h = abs(x_end - _i) + abs(y_end - _j);
					var temp_f = temp_g + temp_h;
					if(ds_map_exists(_g, dg_width * _i + _j)){
						if(temp_g < ds_map_find_value(_g,dg_width * _i + _j)){
							ds_map_replace(_g, dg_width*_i + _j, temp_g);
							ds_map_replace(_h, dg_width*_i + _j, temp_h);
							ds_map_replace(parent_list, dg_width*_i + _j, dg_width * xpos + ypos);
							ds_priority_change_priority(_f, dg_width * _i + _j, temp_f);
						}
					} else{
						ds_map_add(_g, dg_width*_i + _j, temp_g);
						ds_map_add(_h, dg_width*_i + _j, temp_g);
						ds_map_add(parent_list, dg_width*_i + _j, dg_width * xpos + ypos);
						ds_priority_add(_f, dg_width * _i + _j, temp_f);
					}
				}
			}
		}
		
		if(ds_priority_empty(_f) == false){
			var _min = ds_priority_delete_min(_f);
			xpos = _min div dg_width;
			ypos = _min % dg_width;
		} else{
			_found = false;
			_search = false;
		}
		if(xpos == x_end && ypos == y_end){
			_found = true;
			_search = false;
		}
	}
	if(_found){
		_path = path_add();
		var _node = dg_width * xpos + ypos;
		while(ds_map_find_value(parent_list, _node) != ds_map_find_value(parent_list,x_start * dg_width + y_start)){
			var x_node = _node div dg_width;
			var y_node = _node % dg_width;
			path_add_point(_path, x_node * CELL_WIDTH, y_node * CELL_HEIGHT, 100);
			_node = ds_map_find_value(parent_list,_node);
		}
		_search = true;
		path_add_point(_path, x_start * CELL_WIDTH, y_start * CELL_HEIGHT, 100);
		path_reverse(_path);
		path_set_closed(_path, false);			
	}
	ds_map_destroy(parent_list);
	ds_list_destroy(closed_list);
	ds_map_destroy(_h);
	ds_map_destroy(_g);
	ds_priority_destroy(_f);
	
	return _path;
}