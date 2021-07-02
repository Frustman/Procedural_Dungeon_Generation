///@function wlog_add_text(text,[id])
///@arg text
///@arg [id]
function wlog_add_text() {

	var _property=global.wlogRecent.propertyDefault;

	if (argument_count>=2)
		global.wlogRecent=argument[1];

	_property[0]=argument[0];
	if (global.wlogRecent.pauseEnd){
		_property[0]+="@p";
	}
	ds_list_add(global.wlogRecent.list,0);
	ds_list_add(global.wlogRecent.list,_property);
	
}
