///@function wlog_set_paudio(orderN,sound)
///@arg orderN pvalue[orderN]=value
///@arg sound
function wlog_set_psound(argument0, argument1) {
	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]
	if (_arr[2]==undefined){
		_arr[2]=array_create(10,0);
	}
	var arg=_arr[2];
	arg[argument0]=argument1;

	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],_arr[1],arg,_arr[3],_arr[4],_arr[5],_arr[6],_arr[7]];


}
