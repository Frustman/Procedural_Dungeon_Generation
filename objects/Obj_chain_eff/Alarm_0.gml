/// @description Insert description here
// You can write your code in this editor
with(target){
	var _dmg = Obj_valueContainer.player_chainDamage;
	var _critical = other.crit;
	if(_critical){
		_dmg *= 2;	
		if(Obj_valueContainer.player_explosion){
			instance_create_layer(x,y,"sort_start",Obj_explosion);	
		}
	}
	hp -= _dmg;
	hit = true;
	alarm[9] = 5;
	var damage_eff = instance_create_layer(x + random(20) - 10,y + random(20) - 15,"sort_start",Obj_damage_eff);
	with(damage_eff){
		critical = _critical;
		dmg = _dmg;
	}
}