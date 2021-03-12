/// @description Insert description here
// You can write your code in this editor
if(other.id != par && (cusion_cnt == 0 || (cusion_cnt != 0 && target == other.id))){
	instance_destroy(self);
	target = other.id;
	crit = Scr_critical(Obj_valueContainer.critical_chance);
	other.crit = crit;
	
	if(crit && Obj_valueContainer.player_explosion){
		instance_create_layer(x,y,"sort_end",Obj_explosion);
	}

	if(Obj_valueContainer.player_chain == true){
		attack_list = ds_list_create();
		ds_list_add(attack_list, other.id);

		instance_destroy(self);
		Scr_chain_lightning(attack_list,1,3,other.id,256);
	
		with(instance_create_layer(x,y,"sort_end",Obj_chain_lightning)){
			list = other.attack_list;
		}
	}
	if(Obj_valueContainer.player_sharpshooting == true && cusion_cnt < cusion_max){
		nearest = noone;
		nearest_dist = 20000000;
		with(Obj_enemy){
			if(id != other.target && id != other.par){
				var dist = point_distance(x,y,other.target.x,other.target.y);
				if(dist < other.nearest_dist && dist <= other.cusion_dist && collision_line(x,y,other.target.x,other.target.y,Obj_wall,false,true) == noone){
					other.nearest = id;
					other.nearest_dist = dist;
				}
			}
		}
		if(nearest != noone){
			sharp_dir = point_direction(other.x,other.y,nearest.x,nearest.y);
			with(instance_create_layer(other.x,other.y,"sort_end",Obj_bullet_eff)){
				damage = (other.damage div 2 == 0) ? 1 : other.damage div 2;
				motion_set(other.sharp_dir,15);
				image_angle = other.sharp_dir;
				
				chainDamage = 3;
	
				par = other.target;
				target = other.nearest;
				
				
				cusion_cnt = other.cusion_cnt + 1;
				cusion_max = other.cusion_max;
				cusion_dist = other.cusion_dist;
			}
		}
	}
}