/// @function Scr_bit_masking_47(map, xpos, ypos, width, height, value)

function Scr_bit_masking_47(map, xpos, ypos, width, height, value){
	if(abs(map[# xpos, ypos]) == value){
		if(xpos != 0 && xpos != width - 1 && ypos != 0 && ypos != height - 1){
			var top = (abs(map[#xpos, ypos-1]) == value) ? 1 : 0;
			var left = (abs(map[#xpos-1, ypos]) == value) ? 1 : 0;
			var bottom = (abs(map[#xpos, ypos+1]) == value) ? 1 : 0;
			var right = (abs(map[#xpos+1, ypos]) == value) ? 1 : 0;
			var top_left = (abs(map[#xpos-1, ypos-1]) == value && top && left) ? 1 : 0;
			var top_right = (abs(map[#xpos+1, ypos-1]) == value && top && right) ? 1 : 0;
			var bottom_left = (abs(map[#xpos-1, ypos+1]) == value && bottom && left) ? 1 : 0;
			var bottom_right = (abs(map[#xpos+1, ypos+1]) == value && bottom && right) ? 1 : 0;
		
			var dir = 1*top_left + 2*top + 4*top_right + 8*left + 16*right + 32*bottom_left + 64*bottom + 128*bottom_right;
			var index = Scr_dir_to_index(dir);
			
			return index + 1;
		
		} else{
			return 46;
		}
	}
	else return 46;
}