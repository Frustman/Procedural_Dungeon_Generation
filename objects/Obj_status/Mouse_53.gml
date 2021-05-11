/// @description Insert description here
// You can write your code in this editor
var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if(mouseX >= buttonX - 50 && mouseX <= buttonX + 50 && mouseY >= buttonY - 50 && mouseY <= buttonY + 50){
	with(Obj_pause){
		event_perform(ev_other, ev_user0);
	}
}
var x_start = curX - 270 + 60;
var y_start = curY - 180 + 60;

for(var i = 0; i < Obj_valueContainer.player_itemCount; i++){
	var xpos = x_start + (i % 4) * 140;
	var ypos = y_start + (i div 4) * 140;
	if(mouseX >= xpos - 61 && mouseX <= xpos + 61 && mouseY >= ypos - 61 && mouseY <= ypos + 61){
		if(cursor != i){
			if(Obj_valueContainer.player_itemList[| i].Exist())	cursor = i;
			compoX = 0;
			infoW = 200;
			infoH = 100;
		}
		break;
	}
	cursor = -1;
}