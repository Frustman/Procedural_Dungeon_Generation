/// @description Insert description here
// You can write your code in this editor
var sc = string_copy(dialog_body,cursor,3);
if(sc == "<f>"){
	instance_destroy(self);
} else if(sc == "<c,"){
	var pos = string_pos_ext(">", dialog_body, cursor);
	var val = real(string_copy(dialog_body, cursor + 3, pos - 1));
} else if(sc == "<t,"){
	var pos = string_pos_ext(">", dialog_body, cursor);
	var val = real(string_copy(dialog_body, cursor + 3, pos - 1));
	delay = val;
	cursor = pos + 1;
} else{
	buff += string_char_at(dialog_body, cursor);
	cursor++;
	//if(string_char_at(dialog_body, cursor) == " ") cursor++;
}

Alarm[0] = delay;