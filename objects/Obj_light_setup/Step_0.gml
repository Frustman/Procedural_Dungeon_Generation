/// @description Insert description here
// You can write your code in this editor

function Quad(_vb,_x1,_y1,_x2,_y2){
	//Upper triangle
	vertex_position_3d(_vb,_x1,_y1,0);
	vertex_position_3d(_vb,_x1,_y1,2); //repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,1);
	
	//Lower Triangle
	vertex_position_3d(_vb,_x1,_y1,2); //repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,1);
	vertex_position_3d(_vb,_x2,_y2,3); //repositioned vertex
}



//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;
with(Obj_light_wall){
	Quad(_vb,x,y,x+sprite_width,y+sprite_height); //Negative Slope Diagonal Wall
	Quad(_vb,x+sprite_width,y,x,y+sprite_height); //Positive Slope Diagonal Wall
}
with(Obj_chr){
	var x1 = x - 8, x2 = x + 9;
	var y1 = y + 6, y2 = y + 12;
	Quad(_vb,x1,y1,x2,y2); //Negative Slope Diagonal Wall
	Quad(_vb,x2,y1,x1,y2); //Positive Slope Diagonal Wall
}
with(Obj_wall){
	var x1 = x - sprite_width / 2, x2 = x + sprite_width / 2;
	var y1 = y - sprite_height * 5 / 16, y2 = y + sprite_height * 7 / 32;
	Quad(_vb,x1,y1,x2,y2); //Negative Slope Diagonal Wall
	Quad(_vb,x2,y1,x1,y2); //Positive Slope Diagonal Wall
}
/*with(obj_tri){
	Quad(_vb,x,y,x+sprite_width,y+sprite_height); //large diagonal wall
	Quad(_vb,x,y+sprite_height,mid_x,mid_y); //small diagonal wall
}*/
vertex_end(vb);


//add lights by left clicking. For testing purposes
if (mouse_check_button_pressed(mb_middle)){
		instance_create_depth(mouse_x,mouse_y,depth,Obj_light);	
}
if (mouse_check_button_pressed(mb_right)){
	repeat(100)
		instance_create_depth(mouse_x,mouse_y,depth,Obj_light);	
}

//restart
if (keyboard_check_pressed(ord("Q"))){
	game_restart();	
}