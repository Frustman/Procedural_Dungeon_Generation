/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(Spr_item_frame,1,curX,curY,2,2,0,c_white,1);

var x_start = curX - 270 + 60;
var y_start = curY - 180 + 60;


for(var i = 0; i < Obj_valueContainer.player_itemCount; i++){
	var xpos = x_start + (i % 4) * 140;
	var ypos = y_start + (i div 4) * 140;
	if(cursor != i){
		draw_sprite_ext(Spr_status_ui,0,xpos,ypos,2,2,0,c_white,1);
		draw_sprite_ext(Obj_valueContainer.player_itemList[| i].sprite,Obj_valueContainer.player_itemList[| i].index,xpos,ypos,2,2,0,c_white,1);
	}
}

//draw_sprite_ext(Spr_note,0,curX,curY,2,2,0,c_white,1);
draw_sprite_ext(Spr_button_ok,0,buttonX,buttonY,2,2,0,c_white,1);
//draw_sprite_ext(Spr_info_frame,0,infoX,infoY,1,1,0,c_white,1);

/*if(cursor != -1){
	draw_set_halign(fa_center);
	Scr_draw_text_outline(infoX,infoY - 200,1,1,4,Font_rumber,c_black,c_white,Obj_valueContainer.player_itemList[| cursor].name);
	draw_set_halign(fa_left);
}*/

if(cursor != -1){
	var cursorX = x_start + (cursor % 4) * 140;
	var cursorY = y_start + (cursor div 4) * 140 + 3;
	draw_sprite_ext(Spr_info_compo1,0,cursorX + compoX, cursorY - 23,2.0,2.0,0,c_white,1);
	draw_sprite_ext(Spr_info_frame,0,cursorX - 60, cursorY,infoW / 674,infoH / 424,0,c_white,1);
	
	draw_sprite_ext(Spr_status_ui,0,cursorX,cursorY,2,2,0,c_white,1);
	draw_sprite_ext(Obj_valueContainer.player_itemList[| cursor].sprite,Obj_valueContainer.player_itemList[| cursor].index,cursorX,cursorY,2,2,0,c_white,1);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	Scr_draw_text_outline(cursorX + (infoW) / 2 - 60,cursorY + (infoH) / 2,infoW / 674 + 0.5,infoW / 674 + 0.5,4,Font_ui,c_black,c_white,Obj_valueContainer.player_itemList[| cursor].info);
	Scr_draw_text_outline(cursorX + compoX + 98,cursorY - 18,0.5,0.5,4,Font_rumber,c_black,c_white,Obj_valueContainer.player_itemList[| cursor].name);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}