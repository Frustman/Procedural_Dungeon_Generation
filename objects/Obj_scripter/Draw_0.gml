/// @description Insert description here
// You can write your code in this editor
var xpos = parent.x;
var ypos = parent.y;

draw_set_font(Font_ui);
draw_set_color(c_black);
draw_set_halign(fa_left);
for(var i = 0; i <= line; i++){
	for(var j = 1; j < string_length(buff[i]); j++){
		draw_text(xpos, ypos + 30 * i, string_char_at(buff[i],j));
		xpos += string_width(string_char_at(buff[i],j));
	}
	xpos = parent.x;
}
//draw_text(xpos, ypos + 20, dialog);
draw_set_color(c_white);
