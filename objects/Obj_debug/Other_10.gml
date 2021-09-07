/// @description Insert description here
// You can write your code in this editor
if(instance_exists(Obj_slider)) instance_destroy(Obj_slider);
var size = ds_list_size(sliderList);
for(var i = 0; i < size; i++){
	with(instance_create_layer(1100 + 160 * (i div 16), 100 + 48 * (i % 16), "gui", Obj_slider)){
		slider_x = x;
		slider_y = y;
		slider_index = i;
		
		slider_minVal = other.sliderList[|i][0];
		slider_maxVal = other.sliderList[|i][1];
		slider_val = other.sliderList[|i][2];
		slider_name = other.sliderList[|i][3];
	}
}