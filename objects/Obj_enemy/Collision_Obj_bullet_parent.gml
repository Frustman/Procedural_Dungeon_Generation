/// @description Insert description here
// You can write your code in this editor
if((other.cusion_cnt == 0 || (other.cusion_cnt != 0 && other.target == id)) && other.par != id && ds_list_find_index(hitList,other.id) == -1){
	_damage = other.damage;
	if(crit){
		_damage *= 2;	
	}
	hp -= _damage;
	crit_chance = other.critical_chance;
	ds_list_add(hitList,other.id);
	var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
	with(damage_eff){
		critical = other.crit;
		dmg = other._damage;
	}
	hit = true;
	ac_cnt = 0;
	alarm[9] = 10;

	angle = other.image_angle;

	if(Obj_chr.fireshot == true && other.fireshot == true){
		for(var i = -30; i <= 30; i += 15){
			with(instance_create_layer(x,y,"sort_end",Obj_bullet_pen_eff)){
				var rangle = other.angle + i + random(20) - 10;
				image_angle = rangle;
				crit = other.crit;
				critical_chance = other.crit_chance;
				damage = (other._damage div 5 == 0) ? 1 : other._damage div 5;
				fireshot = false;
				par = other.id;
				motion_set(rangle, 2);
			}
		}
	}
}