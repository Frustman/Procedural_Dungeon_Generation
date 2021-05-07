/// @description Insert description here
// You can write your code in this editor
if(ds_list_find_index(hitList,other.id) == -1){
	_damage = Obj_valueContainer.player_explosionDamage;
	crit = false;
	hp -= _damage;
	ds_list_add(hitList,other.id);
	var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
	with(damage_eff){
		critical = other.crit;
		dmg = other._damage;
	}
}