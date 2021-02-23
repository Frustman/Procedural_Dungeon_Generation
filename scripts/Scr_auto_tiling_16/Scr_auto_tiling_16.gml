/// @function Scr_auto_tiling_16(map, xpos, ypos, width, height, tileSet)

function Scr_auto_tiling_16(map, xpos, ypos, width, height, tileSet){
	if(abs(map[#xpos, ypos]) == 1){
		if(xpos != 0 && xpos != width - 1 && ypos != 0 && ypos != height - 1){
			var top = (abs(map[#xpos, ypos-1]) == 1) ? 1 : 0;
			var left = (abs(map[#xpos-1, ypos]) == 1) ? 1 : 0;
			var bottom = (abs(map[#xpos, ypos+1]) == 1) ? 1 : 0;
			var right = (abs(map[#xpos+1, ypos]) == 1) ? 1 : 0;
			var top_left = (abs(map[#xpos-1, ypos-1]) == 1 && top && left) ? 1 : 0;
			var top_right = (abs(map[#xpos+1, ypos-1]) == 1 && top && right) ? 1 : 0;
			var bottom_left = (abs(map[#xpos-1, ypos+1]) == 1 && bottom && left) ? 1 : 0;
			var bottom_right = (abs(map[#xpos+1, ypos+1]) == 1 && bottom && right) ? 1 : 0;
		
			var index = top_right * 1 + bottom_right * 2 + bottom_left * 4 + top_left * 8;
			
			var tile_data = tile_set_index(tileSet,index);
		
		} else{
			var tile_data = tile_set_index(tileSet,15);
		}
		return tile_data;
	}
	else return tile_set_index(tileSet,15);
}