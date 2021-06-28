///@function wlog_set_pvalue(orderN,value)
///@arg orderN pvalue[orderN]=value
///@arg value
function wlog_set_pvalue(argument0, argument1) {
	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1];
	if (_arr[1]==undefined){
		_arr[1]=array_create(10,0);
	}
	var arg=_arr[1];
	arg[argument0]=argument1;

	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],arg,_arr[2],_arr[3],_arr[4],_arr[5],_arr[6],_arr[7]];


}
