///@function wlog_add_elif(logic) return wLogicIndex
///@arg logic
function wlog_add_elif(argument0) {

	global.wlogRecent.wLogicValue[++global.wlogRecent.wLogicIndex]=argument0;

	ds_list_add(global.wlogRecent.list,6);
	ds_list_add(global.wlogRecent.list,global.wlogRecent.wLogicIndex);
	return global.wlogRecent.wLogicIndex;


}
