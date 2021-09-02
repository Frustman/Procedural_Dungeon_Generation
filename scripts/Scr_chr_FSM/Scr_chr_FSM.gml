// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_chr_FSM(){

}

function Scr_chr_idle(){
	if(!instance_exists(Obj_cutscene) && !instance_exists(Obj_wokialog)){
		var wPress = keyboard_check(ord("W"));
		var aPress = keyboard_check(ord("A"));
		var sPress = keyboard_check(ord("S"));
		var dPress = keyboard_check(ord("D"));
		
		if(wPress || aPress || sPress || dPress) Scr_SM_switch("MOVE");
	}
}

function Scr_chr_move(){
	if(!instance_exists(Obj_cutscene) && !instance_exists(Obj_wokialog)){
		var wPress = keyboard_check(ord("W"));
		var aPress = keyboard_check(ord("A"));
		var sPress = keyboard_check(ord("S"));
		var dPress = keyboard_check(ord("D"));
		
		var moveX = dPress - aPress;
		var moveY = sPress - wPress;
		
		if(!(wPress || aPress || sPress || dPress)){
			Scr_SM_switch("IDLE");
			return;
		}
		
		var dx = lengthdir_x(moveSpeed, point_direction(0,0,moveX,moveY));
		var dy = lengthdir_y(moveSpeed, point_direction(0,0,moveX,moveY));
		if(dx != 0){
			if(sign(dx) >= 0) image_xscale = 1.0;
			else image_xscale = -1.0;
		}
		
		Scr_force_update([dx * global.timeScale,dy * global.timeScale]);
	}
}

function Scr_chr_dash(){
	if(!instance_exists(Obj_cutscene) && !instance_exists(Obj_wokialog)){	
		dashSpeed -= 0.3 * global.timeScale;
		if(dashSpeed < 0) dashSpeed = 0;
		if(random(1) < 0.4){
			instance_create_layer(x,y+8,"sort_end",Obj_dust);
		}
		Scr_force_update([dx * global.timeScale,dy * global.timeScale]);
	}
}