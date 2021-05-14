/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < ray_count; i++) context_map[i] = 0;
with(Obj_context_inst){
	if(!(x == other.x && y == other.y)){
		for(var i = 0; i < other.ray_count; i++){
			var _dir = point_direction(x,y,other.x,other.y);
			var dist = point_distance(x,y,other.x,other.y);
			
			var x1 = lengthdir_x(1,_dir);
			var y1 = lengthdir_y(1,_dir);
			
			var x2 = lengthdir_x(1,other.context_dir[i]);
			var y2 = lengthdir_y(1,other.context_dir[i]);
			var dot = dot_product(x1,y1,x2,y2);
			
			
			//if(state == ai_state.friendly) other.context_friendly[i] =  1.0 - abs(dot - 0.65);
			//if(state == ai_state.aggressive) other.context_aggressive[i] = (1.0 - (dot)) / 2;
			
			if(state == ai_state.aggressive) other.context_map[i] += (1.0 - abs(dot - 0.65)) / dist;
			if(state == ai_state.friendly) other.context_map[i] += (1.0 - (dot)) / dist;
			
			
		}
	}
}
var maxval = -1;
maxidx = -1;
for(var i = 0; i < ray_count; i++){
	//context_map[i] = 0;
	//context_map[i] = context_friendly[i] + context_aggressive[i];
	if(context_map[i] >= maxval){
		maxidx = i;
		maxval = context_map[i];
	}
}
for(var i = 0; i < ray_count; i++){
	context_map[i] /= maxval;
}
