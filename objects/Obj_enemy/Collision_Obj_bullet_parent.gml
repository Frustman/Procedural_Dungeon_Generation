/// @description Insert description here
// You can write your code in this editor
if(other.par != id && ds_list_find_index(hitList,other.id) == -1){
	_damage = other.damage;
	hp -= _damage;
	ds_list_add(hitList,other.id);
	var damage_eff = instance_create_depth(x + random(20) - 10,y + random(20) - 15,0,Obj_damage_eff);
	with(damage_eff){
		dmg = other._damage;
	}
	hit = true;
	alarm[9] = 5;

	angle = other.image_angle;

	if(Obj_chr.fireshot == true && other.fireshot == true){
		for(var i = -30; i <= 30; i += 15){
			with(instance_create_layer(x,y,"Instances",Obj_bullet_pen_eff)){
				var rangle = other.angle + i + random(20) - 10;
				image_angle = rangle;
				damage = other._damage div 5;
				fireshot = false;
				par = other.id;
				motion_set(rangle, 2);
			}
		}
	}
}