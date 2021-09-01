/// @description Insert description here
// You can write your code in this editor
draw_text(0,290, scene);
draw_text(0,280, timer);
draw_text(0,270, 1 * room_speed);
for(var i = 0; i < array_length(cutscene_info); i++){
	draw_text(0,300 + 10 * i, cutscene_info[i]);	
}
draw_text(0,400, cutscene_arg);