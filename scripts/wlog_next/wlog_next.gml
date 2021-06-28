///@function wlog_next()
function wlog_next() {
	if (wait==-1){
		wait=0;
	}
	else if (wait==0){
		isRepeating=1;
		while(wait==0 && wEventInst==-1){
			wlog_update();
		}
		isRepeating=0;
	}


}
