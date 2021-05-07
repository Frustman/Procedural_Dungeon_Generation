/// @function Scr_auto_tiling_16(map, xpos, ypos, width, height, tileSet, value)

function Scr_auto_tiling_16(map, xpos, ypos, width, height, tileSet, value){
	if(abs(map[#xpos, ypos]) == value){
		if(xpos != 0 && xpos != width - 1 && ypos != 0 && ypos != height - 1){
			var top = (abs(map[#xpos, ypos-1]) == value) ? 1 : 0;
			var left = (abs(map[#xpos-1, ypos]) == value) ? 1 : 0;
			var bottom = (abs(map[#xpos, ypos+1]) == value) ? 1 : 0;
			var right = (abs(map[#xpos+1, ypos]) == value) ? 1 : 0;
			var top_left = (abs(map[#xpos-1, ypos-1]) == value && top && left) ? 1 : 0;
			var top_right = (abs(map[#xpos+1, ypos-1]) == value && top && right) ? 1 : 0;
			var bottom_left = (abs(map[#xpos-1, ypos+1]) == value && bottom && left) ? 1 : 0;
			var bottom_right = (abs(map[#xpos+1, ypos+1]) == value && bottom && right) ? 1 : 0;
		
			var index = top_right * 1 + bottom_right * 2 + bottom_left * 4 + top_left * 8;
			
			var tile_data = tile_set_index(tileSet,index);
		
		} else{
			var tile_data = tile_set_index(tileSet,15);
		}
		return tile_data;
	}
	else return tile_set_index(tileSet,15);
}