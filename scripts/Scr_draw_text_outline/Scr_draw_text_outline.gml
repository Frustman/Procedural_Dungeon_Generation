/// @function Scr_draw_text_outline(x,y,xscale,yscale,w,font,color,string,precision)

function Scr_draw_text_outline(x,y,xscale,yscale,w,font,color,color_,string){
	var cc = draw_get_color();
	draw_set_color(color)
	draw_set_font(font);
	for(var i = 1; i <= w; i++){
		draw_text_transformed(x + i,y,string,xscale,yscale,0);
		draw_text_transformed(x,y + i,string,xscale,yscale,0);
		draw_text_transformed(x - i,y,string,xscale,yscale,0);
		draw_text_transformed(x,y - i,string,xscale,yscale,0);
		draw_text_transformed(x + i,y + i,string,xscale,yscale,0);
		draw_text_transformed(x - i,y + i,string,xscale,yscale,0);
		draw_text_transformed(x + i,y - i,string,xscale,yscale,0);
		draw_text_transformed(x - i,y - i,string,xscale,yscale,0);
	}
	draw_set_color(color_);
	draw_set_font(font);
	draw_text_transformed(x,y,string,xscale,yscale,0);
	draw_set_color(cc);
	draw_set_font(-1);
}