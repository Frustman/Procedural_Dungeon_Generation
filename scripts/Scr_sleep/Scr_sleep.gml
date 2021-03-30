// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_sleep(ms){
	/// _sleep(ms)
	var t = current_time + ms;
	while (current_time < t) { };
}