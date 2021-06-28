///@function wlog_add_if(logic) return wLogicIndex
///@arg logic
function wlog_add_if(argument0) {

	global.wlogRecent.wLogicValue[++global.wlogRecent.wLogicIndex]=argument0;
	
	ds_list_add(global.wlogRecent.list,3);
	ds_list_add(global.wlogRecent.list,global.wlogRecent.wLogicIndex);
	return global.wlogRecent.wLogicIndex;

	//wLogicValue 값은 0, 1로 확인. 그래서 사용자는 무조건 논리식으로 변수값을 설정해야 한다. 


}
