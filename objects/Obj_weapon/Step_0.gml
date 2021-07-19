/// @description Insert description here
// You can write your code in this editor
switch(sprite_index){
    case weapon_shoot_anim:
        if(image_index == weapon_shoot_frame){
            with(instance_create_layer(shootX, shootY, "sort_start", Obj_bullet_eff)){
    			damage = other.bullet_damage;
    			dir = other.bullet_dir;
    			spd = other.bullet_speed;
    			motion_set(dir,spd * global.timeScale);
    			image_angle = _angle;
    	
    			chainDamage = Obj_valueContainer.player_chainDamage;
    			chain_lightning = Obj_valueContainer.player_chain;
    			critical_chance = Obj_valueContainer.critical_chance;
    	
    			par = other.id;	
    	
    			fireshot = Obj_valueContainer.player_fireshot;
    	
    			target = other.AttackTarget;
    			sharp_shooting = Obj_valueContainer.player_sharpshooting;
    			cusion_max = Obj_valueContainer.sharp_cusionCount;
    			cusion_dist = Obj_valueContainer.sharp_distance;
            }
        }
        break;
    case weapon_reload_anim:
        if(image_index == weapon_reload_frame){
            
        }
        break;
}