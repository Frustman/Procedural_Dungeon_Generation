/// @function Scr_Pdg_CountNeighbor(map, xpos, ypos)
/// @param {ds_type_grid} map map to count
/// @param {real} xpos x position
/// @param {real} ypos x position
function Scr_Pdg_CountNeighbor(map, xpos, ypos){
	cnt = 0;
	if(ds_grid_get(map,xpos - 1,ypos) == 1) cnt++;
	if(ds_grid_get(map,xpos + 1,ypos) == 1) cnt++;
	if(ds_grid_get(map,xpos - 1,ypos - 1) == 1) cnt++;
	if(ds_grid_get(map,xpos,ypos - 1) == 1) cnt++;
	if(ds_grid_get(map,xpos + 1,ypos - 1) == 1) cnt++;
	if(ds_grid_get(map,xpos - 1,ypos + 1) == 1) cnt++;
	if(ds_grid_get(map,xpos,ypos + 1) == 1) cnt++;
	if(ds_grid_get(map,xpos + 1,ypos + 1) == 1) cnt++;
	return cnt;
}