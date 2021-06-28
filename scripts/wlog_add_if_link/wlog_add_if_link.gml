///@function wlog_add_if_link(value,[wEventIndex]) return wLogicIndex
///@arg value
///@arg [wEventIndex]
function wlog_add_if_link() {

	if (argument_count>=2){
		global.wlogRecent.wEventIndex=argument[1];
	}
	global.wlogRecent.wLogicValue[++global.wlogRecent.wLogicIndex]=argument[0];

	ds_list_add(global.wlogRecent.list,3);
	ds_list_add(global.wlogRecent.list,[global.wlogRecent.wLogicIndex,global.wlogRecent.wEventIndex]);
	return global.wlogRecent.wLogicIndex;

	//wLogicValue 값은 ifv, elifv같은 경우에는 wEventValue[wEventIndex]와 wLogicValue[wLogicIndex]가 같은지 확인한다! 


}
