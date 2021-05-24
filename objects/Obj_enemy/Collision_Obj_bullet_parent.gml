/// @description Insert description here
// You can write your code in this editor
if((other.cusion_cnt == 0 || (other.cusion_cnt != 0 && other.target == id)) && other.par != id && ds_list_find_index(hitList,other.id) == -1){
	_damage = other.damage;
	if(crit){
		_damage *= 2;	
	}
	hp -= _damage;
	crit_chance = Obj_valueContainer.critical_chance;
	
	ds_list_add(hitList,other.id);
	var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
	with(damage_eff){
		critical = other.crit;
		dmg = other._damage;
	}
	hit = true;
	ac_cnt = 0;
	alarm[9] = 6;
	knuckback = true;

	angle = other.image_angle;
	
	if(random(10) >= 3){
		instance_create_layer(x + random_range(-sprite_rad,sprite_rad),y + random_range(-sprite_rad,sprite_rad),"gui",Obj_hit_eff);
	}

	if(Obj_valueContainer.player_fireshot){
		for(var i = -30; i <= 30; i += 15){
			with(instance_create_layer(x,y,"sort_end",Obj_bullet_pen_eff)){
				if(Obj_valueContainer.player_charge){
					sprite_index = Spr_charge_bullet;
					image_xscale = 0.5;
					image_yscale = 0.5;
				}
				var rangle = other.angle + i + random(20) - 10;
				image_angle = rangle;
				crit = other.crit;
				damage = (other._damage div 5 == 0) ? 1 : other._damage div 5;
				par = other.id;
				motion_set(rangle, 2);
			}
		}
	}
}