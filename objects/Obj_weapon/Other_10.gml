/// @description shoot func

if(bullet_count > 0){
	var target = Scr_interpolate_aim(shootX, shootY, bullet_dir);
	
	if(target == noone){
		bullet_dir	= angle;
	} else {
		bullet_dir	= point_direction(shootX, shootY, target.x, target.y);
		angle		= bullet_dir;
	}
	
	with(instance_create_layer(shootX,shootY,"sort_start", Obj_bullet)){
		
		#region bullet setting
	
		bullet_image			= other.bullet_image;
		bullet_create_event		= other.bullet_create_event;
		bullet_tick_event		= other.bullet_tick_event;
		bullet_hit_event		= other.bullet_hit_event;
		
		bullet_dir				= other.bullet_dir;
		bullet_speed			= other.bullet_speed;
		bullet_damage			= other.bullet_damage;
		
		bullet_create_event_arg = other.bullet_create_event_arg;
		bullet_tick_event_arg   = other.bullet_tick_event_arg;
		bullet_hit_event_arg    = other.bullet_hit_event_arg;
		
		event_tick				= other.bullet_tick;
	
		#endregion
	}
	bullet_count--;
	with(global.bullet_ui[bullet_count]){
		event_perform(ev_other,ev_user0);
	}
	if(bullet_count == 0){
		Scr_SM_switch("RELOAD");
	}
}
