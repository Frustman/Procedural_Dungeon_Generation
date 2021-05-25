// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_slow_motion(){
	with(all){
		/*for(var i = 0 ; i < 12; i++){
			alarm[i] = alarm[i] / global.timeScale;	
		}*/
		if(image_speed != 0) image_speed = global.timeScale;
	}
}