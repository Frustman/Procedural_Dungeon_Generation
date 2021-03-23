// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_chain_lightning(list, cnt, target, parent, distance){
	if(cnt == target) return true;
	near = noone;
	near_dist = 2000000;
	with(Obj_enemy){
		if(ds_list_find_index(list,id) == -1){
			var dist = point_distance(x,y,parent.x,parent.y);
			var cList = ds_list_create();
			var pen = true;
			collision_line_list(x,y,parent.x,parent.y,Obj_wall,false,true,cList,false);
			for(var i = 0; i < ds_list_size(cList); i++){
				if(cList[|i].solid){
					pen = false;
					break;
				}
			}
			if(pen && dist < other.near_dist && dist <= distance)
				other.near = id;
				other.near_dist = dist;
		}
	}
	if(near != noone){
		ds_list_add(list,near);
		
		Scr_chain_lightning(list, cnt + 1, target, near, distance);
	}
}