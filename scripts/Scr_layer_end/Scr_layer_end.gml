// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_layer_end(){
	if(event_type == ev_draw){
		if(event_number == 0){
			shader_reset();
	      }
	}
}