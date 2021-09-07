// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_debug_handler(){

}

function Scr_slider_set(_slider_minVal, _slider_maxVal, _slider_val, _slider_name){
	if(instance_exists(Obj_debug)){
		with(Obj_debug){
			ds_list_add(sliderList, [_slider_minVal, _slider_maxVal, _slider_val, _slider_name]);
			event_perform(ev_other, ev_user0);
		}
		return true;
	} else return false;
}

function Scr_slider_get(_slider_num){
	if(instance_exists(Obj_debug)){
		var val = ds_list_find_value(Obj_debug.sliderList, _slider_num);
		if(is_array(val))	return val[2];
		else return 0;
	} else return false;
}