///@function wlog_set_pvariable(orderN,[id],"name")
///@arg orderN
///@arg [id]
///@arg "name"
function wlog_set_pvariable() {
	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1];
	if (_arr[1]==undefined){
		_arr[1]=array_create(10,0);
	}
	var arg=_arr[1];
	if (argument_count==3){
		arg[argument[0]]=[argument[1],argument[2]];
	}
	else{
		arg[argument[0]]=argument[1];
	}

	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],_arr[1],_arr[2],_arr[3],_arr[4],_arr[5],_arr[6],arg];


}
