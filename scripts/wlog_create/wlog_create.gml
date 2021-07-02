///@function wlog_create(object)
///@arg object
function wlog_create(argument0) {
	var inst=instance_create_depth(x,y,-999,argument0);
	with(inst){
		textX=0;
		textY=0;
		list=ds_list_create();
		ltext=ds_list_create();
		delayFrame=delay;
		frame=0;
		posLine=0;
		index=0;
		indexSub=0;
		tspace=array_create(3,0);
		theight=array_create(3,0);
		countN=0;
		wait=0;
		initText=0;//bool
		cameraFocus=0;//bool
		sequenceid=-1;
		iHeight=-1;
		iValue=[0];//LogicIndex
		ColorIndex=0;
		ScaleIndex=0;
		SpeedIndex=0;
		onLdown=0;
		onLmiddle=0;
		onEmp=0;
		onEffect=array_create(10,-1);
		isRepeating=0;
		parent = other.id;
	}
	global.wlogRecent=inst;
	global.wcount+=1;

	return inst;


}
