// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Scr_tilt_layer_sprite(){
	_layers=["Asset_deco"];
	var i=0; repeat(array_length(_layers)){
		var _l = layer_get_id(_layers[i]);
		var _all=layer_get_all_elements(_l);
		var j=0; repeat(array_length(_all)){
			var _e = _all[j];
			if layer_get_element_type(_e) == layerelementtype_sprite {
				var _height = layer_sprite_get_xscale(_e)*sprite_get_height(layer_sprite_get_sprite(_e));
				layer_sprite_alpha(_e, _height/255 );
				layer_sprite_x(_e,layer_sprite_get_x(_e) div 1);
				layer_sprite_y(_e,layer_sprite_get_y(_e) div 1);
			}
		++j}
		_all = 0;
	++i;}
}