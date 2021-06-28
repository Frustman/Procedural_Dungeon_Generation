///@function wlog_add_callback(func[],[id])
///@arg func[]
///@arg [id]
function wlog_add_callback() {

	if (argument_count>=2)
		global.wlogRecent=argument[1];

	ds_list_add(global.wlogRecent.list,2);
	ds_list_add(global.wlogRecent.list,argument[0]);//first argument must be inst.id.


}
