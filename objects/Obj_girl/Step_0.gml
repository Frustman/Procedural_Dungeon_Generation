/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(Obj_cutscene) && !instance_exists(Obj_wokialog)){
	if(instance_exists(Obj_chr)){
		targetX = Obj_chr.x;
		targetY = Obj_chr.y;
	} else {
		targetX = x;
		targetY = y;
	}
	image_xscale = (x < targetX) ? 1 : -1;
}

Scr_SM_execute();