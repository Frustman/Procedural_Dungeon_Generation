// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_draw_dialog(_parent, _name, _text){
	with(instance_create_layer(_parent.x, _parent.y, "gui", Obj_scripter)){
		parent = _parent;
		dialog_body = _text;
	}
}