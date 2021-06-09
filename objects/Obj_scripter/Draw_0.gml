/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font_ui);
draw_set_color(c_black);
draw_set_halign(fa_left);

var ww = -1;
for(var i = 0; i < 10; i++){
	ww = max(ww, string_length(buff[i]));
}

var xpos = parent.x;
var ypos = parent.y;

ww = 160;
var xx;
if(parent.x + ww > camera_get_view_x(view_camera[0]) && parent.x + ww < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])){
	xx = parent.x;
} else xx = parent.x - ww;

xpos = xx;

for(var i = 0; i <= line; i++){
	for(var j = 1; j < string_length(buff[i]); j++){
		draw_text(xpos, ypos + 30 * i, string_char_at(buff[i],j));
		xpos += string_width(string_char_at(buff[i],j));
	}
	xpos = xx;
}
//draw_text(xpos, ypos + 20, dialog);
draw_set_color(c_white);
