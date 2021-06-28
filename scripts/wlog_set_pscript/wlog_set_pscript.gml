///@function wlog_set_pscript(orderN,script,[argument0,argument1...])
///@arg orderN pvalue[orderN]=value
///@arg script
///@arg [argument0...]
function wlog_set_pscript() {
	var __arr=[];
	for(var i=0;i<argument_count-1;i++){
		__arr[i]=argument[i+1];
	}

	var _arr=global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1];

	if (_arr[5]==undefined){
		_arr[5]=array_create(10,[]);
	}

	var arg=_arr[5];
	arg[argument[0]]=__arr;


	global.wlogRecent.list[|ds_list_size(global.wlogRecent.list)-1]=[_arr[0],_arr[1],_arr[2],_arr[3],_arr[4],arg,_arr[6],_arr[7]];


}
