///@function wlog_set_psprite(orderN,sprite_index,subimg)
///@arg orderN pvalue[orderN]=value
///@arg sprite_index
///@arg subimg
function wlog_set_psprite(argument0, argument1, argument2) {
	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1];
	if (_arr[3]==undefined){
		_arr[3]=array_create(10,[]);
	}
	var arg=_arr[3];
	arg[argument0]=[argument1,argument2];

	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],_arr[1],_arr[2],arg,_arr[4],_arr[5],_arr[6],_arr[7]];


}
