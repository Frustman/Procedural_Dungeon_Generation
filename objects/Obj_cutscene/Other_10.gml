/// @description Insert description here
// You can write your code in this editor\

current_scene = cutscene_info[scene];

var len = array_length(current_scene) - 1;

cutscene_arg = -1;
cutscene_arg = array_create(len, 0);
array_copy(cutscene_arg, 0, current_scene, 1, len);
