///@function wlog_set_size(width,height,[lineSpace])
///@arg width
///@arg height
///@arg [lineSpace]
function wlog_set_size() {

	global.wlogRecent.targetWidth=argument[0];
	global.wlogRecent.height=argument[1];
	if (argument_count>=3)
		global.wlogRecent.lineSpace=argument[2];

	draw_set_font(global.wlogRecent.wFont);
	global.wlogRecent.lineHeight=string_height("ABC");


}
