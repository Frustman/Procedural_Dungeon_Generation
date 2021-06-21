// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_draw_sprite_part_angle(_sprite, _subimage, _left, _right, _width, _height, _x, _y, _angle){

	var xx = _left - sprite_get_xoffset(_sprite);
	var yy = _right - sprite_get_yoffset(_sprite);
	var _c = dcos(_angle);
	var _s = dsin(_angle);
	draw_sprite_general(
	    _sprite,_subimage,  //sprite and sub image
	    _left,_right,  //left,right
	    _width,_height,  //width,height
	    _x+_c*xx+_s*yy,
	    _y-_s*xx+_c*yy,
	    1,1,  //scale
	    _angle,  //angle
	    c_white,c_white,c_white,c_white,1  //colour and alpha
	);
}