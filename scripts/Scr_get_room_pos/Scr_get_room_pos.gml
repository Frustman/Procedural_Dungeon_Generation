/// @function Scr_get_room_pos()
function Scr_get_room_pos(){
	if(instance_exists(Obj_mapGenerator)){
		var width = Obj_mapGenerator.dg_width;
		var height = Obj_mapGenerator.dg_height;
	} else return 0;
	
	if(instance_exists(Obj_chr)){
		var xpos = Obj_chr.x - Obj_chr.sprite_width / 2;
		var ypos = Obj_chr.y - Obj_chr.sprite_height / 2;
	} else return 0;
	
	var roomX, roomY;
	
	for(var i = 0; i < 9; i++){
		if(xpos >= (width * i) * CELL_WIDTH && xpos <= (width * (i + 1)) * CELL_WIDTH){
			roomX = i;
			break;
		}
	}
	for(var j = 0; j < 8; j++){
		if(ypos >= (height * j) * CELL_HEIGHT && ypos <= (height * (j + 1)) * CELL_HEIGHT){
			roomY = j;
			break;
		}
	}
	return roomX * 10 + roomY;
}