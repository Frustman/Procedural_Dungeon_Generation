///@function wlog_set_property_text(value[],sound[],sprite[][],effect[][],script[][],userProperty[],variable[][])
///@arg value[]
///@arg sound[]
///@arg sprite[][]
///@arg effect[][]
///@arg script[][]
///@arg userProperty[]
///@arg variable[][]
function wlog_set_property_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	//arr -> [0~9]
	var _arr=global.wlogRecent.list[|global.wlogRecent.list-1];
	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],argument0,argument1,argument2,argument3,argument4,argument5,argument6];


}
