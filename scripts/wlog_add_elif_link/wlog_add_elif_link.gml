///@function wlog_add_elif_link(value,[wEventIndex]) return wLogicIndex
///@arg value
///@arg [wEventIndex]
function wlog_add_elif_link() {

	if (argument_count>=2){
		global.wlogRecent.wEventIndex=argument[1];
	}
	global.wlogRecent.wLogicValue[++global.wlogRecent.wLogicIndex]=argument[0];

	ds_list_add(global.wlogRecent.list,6);
	ds_list_add(global.wlogRecent.list,[global.wlogRecent.wLogicIndex,global.wlogRecent.wEventIndex]);
	return global.wlogRecent.wLogicIndex;


}
