// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_layer_set_alpha(){
	if(event_type == ev_draw){
		if(event_number == 0){
			chr_pos = shader_get_uniform(Sha_set_alpha,"chr_pos");
			invis_min_range = shader_get_uniform(Sha_set_alpha,"invis_min_range");
			invis_falloff_range = shader_get_uniform(Sha_set_alpha,"invis_falloff_range");
			
			shader_set(Sha_set_alpha);
			if(instance_exists(Obj_chr)){
				shader_set_uniform_f(chr_pos, Obj_chr.x, Obj_chr.y);
			} else{
				shader_set_uniform_f(chr_pos, 0, 0);
			}
			shader_set_uniform_f(invis_min_range, 0);
			shader_set_uniform_f(invis_falloff_range, 64);
		}
	}
}