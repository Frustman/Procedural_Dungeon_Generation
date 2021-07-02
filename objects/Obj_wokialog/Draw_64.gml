/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_rectangle(x-16,y-16,x+width+16,y+height+16,false);
draw_set_color(c_white);

if(abs(width - targetWidth) <= 1)
	wlog_draw() //Effect Design in wlog_draw

if(wait==-1){
	if(frame++%60<30){
		draw_sprite(s_cursor,0,x+width-32,y+height+8);
	}
}

for(var i = 0; i < array_length(wUserProperty); i++){
	draw_text(0,300+20*i,wUserProperty[i]);	
}