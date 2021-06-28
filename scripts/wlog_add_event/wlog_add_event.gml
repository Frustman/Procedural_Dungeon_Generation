///@function wlog_add_event(eventObj,[id]) return wEventIndex
///@arg eventObj
///@arg [id]
function wlog_add_event() {

	if (argument_count>=2)
		global.wlogRecent=argument[1];

	global.wlogRecent.wEventValue[++global.wlogRecent.wEventIndex]=0;

	ds_list_add(global.wlogRecent.list,1);
	ds_list_add(global.wlogRecent.list,[argument[0],[global.wlogRecent.wEventIndex]]);

	return global.wlogRecent.wEventIndex;
	//eventProperty[0] must be global.wlogRecent.wEventIndex
	//eventProperty=[wEventIndex,~~] -> wproperty=[~~]


}
