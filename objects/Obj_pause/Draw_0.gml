/// @description Insert description here
// You can write your code in this editor
if (global.paused == true){
	if (!sprite_exists(paused_surf)){
	    if(paused_surf == -1){
			instance_deactivate_layer(layer_get_id("controller"));
			surf = surface_create(view_wport,view_hport);
			surface_set_target(surf);
			with (all) {
				if(id != other.id){
				    event_perform(ev_draw,ev_gui_begin);
				    event_perform(ev_draw,ev_gui);
				    event_perform(ev_draw,ev_gui_end);
				}
			}
			surface_reset_target();
			paused_surf = sprite_create_from_surface(surf,0,0,view_wport,view_hport,0,0,0,0);
			
			if(!instance_exists(Obj_status))
				instance_create_layer(Obj_chr.x,Obj_chr.y, "status", Obj_status);
				
			for(var i = 0; i < room_H; i++){
				instance_deactivate_layer(global.depth_grid[# 0, i]);
			}
	    }
	}
	/*if(!sprite_exists(paused_gui)){
		surf = surface_create(view_wport,view_hport);
		surface_set_target(surf);
		with (all) {
		    event_perform(ev_draw,ev_gui_begin);
		    event_perform(ev_draw,ev_gui);
		    event_perform(ev_draw,ev_gui_end);
		}

		surface_reset_target();
		paused_gui = sprite_create_from_surface(surf,0,0,view_wport,view_hport,0,0,0,0);	
	}*/
	/*if (!sprite_exists(paused_surf)){
	    if(paused_surf == -1){
			instance_deactivate_layer(layer_get_id("controller"));
			for(var i = 0; i < room_H; i++){
				instance_deactivate_layer(global.depth_grid[# 0, i]);
			}
	    }
	    paused_surf = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);
	}*/
}