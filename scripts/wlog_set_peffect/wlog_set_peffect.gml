///@function wlog_set_peffect(orderN,effect,effectProperty[])
///@arg orderN pvalue[orderN]=value
///@arg effect
///@arg effectProperty[]
function wlog_set_peffect(argument0, argument1, argument2) {
	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1];

	if (_arr[4]==undefined){
		_arr[4]=array_create(10,[]);
	}

	var arg=_arr[4];
	arg[argument0]=[argument1,argument2];

	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],_arr[1],_arr[2],_arr[3],arg,_arr[5],_arr[6],_arr[7]];


}
