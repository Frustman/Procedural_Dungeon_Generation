///@function wlog_set_property_event(eventProperty[])
///@arg eventProperty[]
function wlog_set_property_event(argument0) {
	var __arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1],arr=argument0;
	for(var i=array_length_1d(arr)-1;i>=0;i--){
		arr[i+1]=arr[i];
	}
	arr[0]=global.wlogRecent.wEventIndex;
	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[__arr[0],arr];
}
