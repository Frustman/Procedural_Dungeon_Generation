/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < Obj_map.dungeon_width; i++){
	for(var j = 0; j < Obj_map.dungeon_height; j++){
		draw_text(i*10,j*10,Obj_map.geo_map[#i,j]);
	}
}