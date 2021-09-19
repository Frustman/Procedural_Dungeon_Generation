/// @description Insert description here
// You can write your code in this editor

Scr_slider_set(0, 1, 1, "Intensity");
Scr_slider_set(0, 1, 0.3, "Threshold");
Scr_slider_set(0, 2, 0.15, "Range");
Scr_slider_set(0, 1, 1, "Intensity2");
Scr_slider_set(0, 1, 0.3, "Threshold2");
Scr_slider_set(0, 2, 0.15, "Range2");
Scr_slider_set(0, 2, 0.15, "IntensityG");
Scr_slider_set(0, 1, 0.15, "DarkenG");
Scr_slider_set(0, 2, 0.15, "Saturation");

if(toggle == true){
	event_perform(ev_other, ev_user0);	
} else {
	if(instance_exists(Obj_slider)) instance_destroy(Obj_slider);
}