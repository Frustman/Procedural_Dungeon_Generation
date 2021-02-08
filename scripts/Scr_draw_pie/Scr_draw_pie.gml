///@function Scr_draw_pie(x,y,size,startAngle,endAngle,outline)

function Scr_draw_pie(_x,_y,size,startAngle,endAngle,outline) {
	_x += 1;
	_y += 1;

	outline = is_undefined(outline) ? true : outline;
	startAngle = round((360+startAngle)%360);
	endAngle = round((360+endAngle)%360);
	
	var theta = angle_difference(startAngle,endAngle);
	theta = 0 > theta ? 360+theta : theta;

	draw_primitive_begin(outline ? pr_linestrip : pr_trianglefan);
	draw_vertex(_x,_y);
	draw_vertex(_x+lengthdir_x(size,startAngle),_y+lengthdir_y(size,startAngle));
	
	var rpt = floor(theta/15)+1;
	startAngle = floor(startAngle/15)*15;
	for (_i=0;_i<rpt;_i++) {
		draw_vertex(_x+lengthdir_x(size,startAngle-_i*15),_y+lengthdir_y(size,startAngle-_i*15));
	}

	draw_vertex(_x+lengthdir_x(size,endAngle),_y+lengthdir_y(size,endAngle));
	draw_vertex(_x,_y);
	draw_primitive_end();
}