// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_chain_lightning(list, cnt, target, parent, distance){
	if(cnt == target) return true;
	near = noone;
	near_dist = 2000000;
	with(Obj_enemy){
		if(ds_list_find_index(list,id) == -1){
			var dist = point_distance(x,y,parent.x,parent.y);
			if(collision_line(x,y,parent.x,parent.y,Obj_wall,false,true) == noone && dist < other.near_dist && dist <= distance)
				other.near = id;
				other.near_dist = dist;
		}
	}
	if(near != noone){
		ds_list_add(list,near);
		with(near){
			_damage = other.chainDamage;
			criti = other.crit;
			if(other.crit){
				_damage *= 2;	
			}
			hp -= _damage;
			hit = true;
			alarm[9] = 5;
			var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
			with(damage_eff){
				critical = other.criti;
				dmg = other._damage;
			}
		}
		Scr_chain_lightning(list, cnt + 1, target, near, distance);
	}
}