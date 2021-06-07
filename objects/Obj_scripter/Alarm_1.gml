/// @description Insert description here
// You can write your code in this editor
var curPrevious	= 1;
var cur	= string_pos_ext("<",dialog_body,1);
while(cur != 0){
	cur	= string_pos_ext("<",dialog_body,curPrevious);
	dialog += string_copy(dialog_body, curPrevious, cur - curPrevious);
	curPrevious = string_pos_ext(">",dialog_body,cur) + 1;
}
//dialog += string_copy(dialog_body, curPrevious, string_length(dialog_body) - curPrevious - 1);