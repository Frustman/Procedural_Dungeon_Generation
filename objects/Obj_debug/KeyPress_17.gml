/// @description Insert description here
// You can write your code in this editor
toggle = !toggle;

if(toggle == true){
	event_perform(ev_other, ev_user0);	
} else {
	if(instance_exists(Obj_slider)) instance_destroy(Obj_slider);
}