/// @function Scr_draw_text_outline(x,y,xscale,yscale,w,font,color,string,precision)

function Scr_draw_text_outline(x,y,xscale,yscale,w,font,color,string,precision){
	var cc = draw_get_color();
	draw_set_color(color)
	draw_set_font(font);
	draw_text_transformed(x-w,y-w,string,xscale,yscale,0);
	draw_text_transformed(x+w,y-w,string,xscale,yscale,0);
	draw_text_transformed(x-w,y+w,string,xscale,yscale,0);
	draw_text_transformed(x+w,y+w,string,xscale,yscale,0);
	if precision>0{
	draw_text_transformed(x-w,y,string,xscale,yscale,0);
	draw_text_transformed(x+w,y,string,xscale,yscale,0);
	draw_text_transformed(x,y-w,string,xscale,yscale,0);
	draw_text_transformed(x,y+w,string,xscale,yscale,0);
	}
	if precision>1{
	draw_text_transformed(x-w,y+w/2,string,xscale,yscale,0);
	draw_text_transformed(x+w,y+w/2,string,xscale,yscale,0);
	draw_text_transformed(x-w,y-w/2,string,xscale,yscale,0);
	draw_text_transformed(x+w,y-w/2,string,xscale,yscale,0);
	draw_text_transformed(x-w/2,y-w,string,xscale,yscale,0);
	draw_text_transformed(x-w/2,y+w,string,xscale,yscale,0);
	draw_text_transformed(x+w/2,y-w,string,xscale,yscale,0);
	draw_text_transformed(x+w/2,y+w,string,xscale,yscale,0);
	}
	draw_set_color(cc);
	draw_set_font(font);
	draw_text_transformed(x,y,string,xscale,yscale,0);
	draw_set_font(-1);
}