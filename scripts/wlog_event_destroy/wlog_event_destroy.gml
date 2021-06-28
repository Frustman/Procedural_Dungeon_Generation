///@function wlog_event_destroy([callback]) : in event, must be called when event is end.
function wlog_event_destroy() {
	if (argument_count>=1)
		callback=argument[0];
	wtarget.wEventValue[callbackIndex]=callback;
	if (wlogPersistent==true){
		with(wtarget){
			ds_list_clear(ltext);
			textX=0;
			textY=0;
			frame=0;
			wait=0;
			index=0;
			indexSub=0;
			posLine=0;
			onLdown=0;
			onLmiddle=0;
			onEmp=0;
			ColorIndex=0;
			ScaleIndex=0;
			SpeedIndex=0;
			onEffect=array_create(10,-1);
		}
	}
	with(wtarget){
		ds_list_delete(list,0);
		ds_list_delete(list,0);
		wEventInst=-1;
	}
	instance_destroy();


}
