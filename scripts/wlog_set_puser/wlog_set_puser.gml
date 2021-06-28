///@function wlog_set_puser(userProperty[])
///@arg userProperty[]
function wlog_set_puser(argument0) {
	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1];

	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],_arr[1],_arr[2],_arr[3],_arr[4],_arr[5],argument0,_arr[7]];


}
