draw_set_color(c_black);
draw_rectangle(x-32,y-32,x+width+32,y+height+32,false);
draw_set_color(c_white);

wlog_draw() //Effect Design in wlog_draw

if(wait==-1){
	if(frame++%60<30){
		draw_sprite(s_cursor,0,x+width-48,y+height+48);
	}
}