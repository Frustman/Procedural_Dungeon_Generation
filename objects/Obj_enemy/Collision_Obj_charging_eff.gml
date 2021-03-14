/// @description Insert description here
// You can write your code in this editor
if(!hit){
	hit = true;
	alarm[9] = 10;
	
	crit_chance = Obj_valueContainer.critical_chance;
	var _damage = other.damage;
	crit = Scr_critical(crit_chance);
	if(crit) _damage *= 2;
	
	if(crit && Obj_valueContainer.player_explosion){
		instance_create_layer(x,y,"sort_end",Obj_explosion);
	}
	
	angle = point_direction(Obj_chr.x,Obj_chr.y,x,y);

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
				damage = (_damage div 5 == 0) ? 1 : _damage div 5;
				par = other.id;
				motion_set(rangle, 2);
			}
		}
	}
	
	var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
	with(damage_eff){
		critical = other.crit;
		dmg = _damage;
	}
	
	hp -= _damage;
}