/// @description Insert description here
// You can write your code in this editor
if(hit == false){
	hit = true;
	alarm[9] = 6;
	
	_damage = other.damage div 2;
	if(crit){
		_damage *= 2;	
	}
	hp -= _damage;
	crit_chance = Obj_valueContainer.critical_chance;
	var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
	with(damage_eff){
		critical = other.crit;
		dmg = other._damage;
	}
	ac_cnt = 0;
}