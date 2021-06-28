draw_set_color(c_red);
draw_circle(x,y,15+lengthdir_y(150,frame),false);
draw_set_color(c_white);
frame+=2;
if(frame==360)
	instance_destroy();