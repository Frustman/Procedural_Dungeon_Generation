// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_critical(chance){
	if(random(1) <= chance) return true;
	else return false;
}