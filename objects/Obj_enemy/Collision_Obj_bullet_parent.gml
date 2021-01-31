/// @description Insert description here
// You can write your code in this editor
_damage = other.damage;
hp -= _damage;
var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
with(damage_eff){
	dmg = other._damage;
}
hit = true;
alarm[9] = 5;