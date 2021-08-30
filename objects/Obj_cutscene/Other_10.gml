/// @description Insert description here
// You can write your code in this editor\

var len = array_length(cutscene_info[scene]) - 1;

cutscene_arg = array_create(array_length(cutscene_info[scene]) - 1);
array_copy(cutscene_arg, 0, cutscene_info[scene], 1, len);
