/// @description Insert description here
// You can write your code in this editor
if(!ds_list_empty(list)){
	for(var i = 0; i < ds_list_size(list) - 1; i++){
		draw_line(list[|i][0],list[|i][1],list[|i + 1][0], list[|i + 1][1]);
	}
}