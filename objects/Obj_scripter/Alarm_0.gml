/// @description Insert description here
// You can write your code in this editor
if(pause == false){
	var sc = string_copy(dialog_body,cursor,3);
	if(sc == "<x>"){
		instance_destroy(self);
	} else if(sc == "<c,"){
		var pos = string_pos_ext(">", dialog_body, cursor);
		var val = real(string_copy(dialog_body, cursor + 3, pos - cursor + 3));
	} else if(sc == "<t,"){
		var pos = string_pos_ext(">", dialog_body, cursor);
		var val = real(string_copy(dialog_body, cursor + 3, pos - cursor + 3));
		delay = val;
		cursor = pos + 1;
	} else if(sc == "<n>"){
		var pos = string_pos_ext(">", dialog_body, cursor);
		cursor = pos + 1;
		line++;
	} else if(sc == "<p,"){
		var pos = string_pos_ext(">", dialog_body, cursor);
		var val = real(string_copy(dialog_body, cursor + 3, pos - cursor + 3));
		cursor = pos + 1;
		pause = true;
		Alarm[2] = val;
	} else{
		buff[line] += string_char_at(dialog_body, cursor);
		cursor++;
		//if(string_char_at(dialog_body, cursor) == " ") cursor++;
	}
	Alarm[0] = delay;
}