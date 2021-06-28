///@function wlog_init_default()
function wlog_init_default() {

	wFont=global.wFont;
	width=400;
	height=150;
	lineSpace=4; //vertical
	hSpace=1; //horizontal

	draw_set_font(wFont);
	lineHeight=string_height("ABC");

	delay=4;
	propertyDefault=["",[],[],undefined,undefined,undefined,[],undefined];//[text,value[],sound[],sprite[][],effect[][],script[][],userProperty[],variable]
	pauseEnd=1;

	defaultColor=[c_white, c_yellow, c_aqua, c_white, c_white, c_white, c_white, c_white, c_white, c_white];//0~9
	defaultScale=[1, 1.1, 1.2, 1.3, 1.4, 1.5, 0.9, 0.8, 0.7, 0.6];
	defaultSpeed=[1, 1.25, 1.5, 1.75, 2, 2.5, 0.75, 0.5, 0.25, 0.1];

	wNowProperty=[];
	wUserProperty=[]; //Name, FaceSprite...

	wLogicValue=[];
	wLogicIndex=-1;
	wEventInst=-1;
	wEventValue=[];//Callback
	wEventIndex=-1;

	wVoice=-1; //Voice


}
