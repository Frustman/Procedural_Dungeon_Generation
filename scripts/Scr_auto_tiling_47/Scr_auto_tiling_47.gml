/// @function Scr_auto_tiling_47(map, xpos, ypos, width, height, tileSet)

function Scr_auto_tiling_47(map, xpos, ypos, width, height, tileSet){
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
		
			var dir = 1*top_left + 2*top + 4*top_right + 8*left + 16*right + 32*bottom_left + 64*bottom + 128*bottom_right;
			var index = Scr_dir_to_index(dir);
			
			var tile_data = tile_set_index(tileSet,index + 1);
		
		} else{
			var tile_data = tile_set_index(tileSet,46);
		}
		return tile_data;
	}
	else return tile_set_index(tileSet,46);
}