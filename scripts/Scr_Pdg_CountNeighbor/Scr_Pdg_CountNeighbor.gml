/// @function Scr_Pdg_CountNeighbor(map, xpos, ypos)
/// @param {ds_type_grid} map map to count
/// @param {real} xpos x position
/// @param {real} ypos x position
function Scr_Pdg_CountNeighbor(map, xpos, ypos){
	var cnt = 0;
	for(var i = -1; i <= 1; i++){
		for(var j = -1; j <= 1; j++){
			var xx = xpos + i;
			var yy = ypos + j;
			if(i == 0 && j == 0){
				
			} else if(xx < 0 || yy < 0 || xx >= ds_grid_width(map) || yy >= ds_grid_height(map)){
				cnt++;
			} else if(map[# xx, yy] == cellular.MutableGround || map[# xx, yy] == cellular.ImmutableGround){
				cnt++;
			}
		}
	}
	return cnt;
}