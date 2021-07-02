///@function wlog_update()
function wlog_update() {
	var effectPlaying=false;
	if (ds_list_empty(list)){
		wlog_destroy();
	}
	else{
		if (iHeight==-1 || (iHeight!=-1&&iValue[iHeight]==1)){
			if (list[|0]==0){
		#region *Dialog
			if (wait==0){//wait은 -1일 경우 pause 상태, 자연수일 경우 wait 함수를 이용한 딜레이. 이벤트일 때는 따로 멈추도록. 
				if (delayFrame<=0 && is_real(list[|0]) && list[|0]==0){//wait 중에는 당연히 작동되면 안됨. 
					delayFrame=delay;
					countN=0;
					for(var i=0;i<ds_list_size(ltext);i++){
						if (is_array(ltext[|i])){
							var testArr=ltext[|i];
							if (testArr[0]=="n"||testArr[0]=="x")
								countN++;
						}
					}
					if (initText==0){
						initText=1;
						wNowProperty=list[|1];
						wUserProperty=wNowProperty[6];
					}
					_wlog_translate();
					if (ds_list_size(ltext)==index){
						ds_list_delete(list,0);//옵션에 따라 ltext 클리어할꺼나 말꺼냐 결정하면 됨.
						ds_list_delete(list,0);//type,property기에 두번 제거.
						wait=-2;//-2일 경우 제거 상태. 
						initText=0;
						//pause, list 지울 떄는 text는 두번씩. 예외도 있음. 
					}
	
					//*스트링 처리 부분
					if (wait==0){
						if (is_array(ltext[|index])){//pos단위로 사용하지 않는다. [index, indexSub] 단위로 사용한다. 
							var testArr=ltext[|index];
							
							if (testArr[0]=="n"){//draw에서도 (posLine+1>countN)로 더 그릴지 확인해야된다. 
								do{
									index++;
									posLine++;//theight 사용, 글자 그릴 때 valign bottom, 글자 한줄의 height는 현재 적용된 scale 속성을 고려해 최대값을 계산한다. (scale 조절 효과의 경우 max scale을 지정해야 한다)
									indexSub=0;
									_wlog_translate();
					
									var maxHeight=0;
									for (var i=0;i<=posLine;i++){
										maxHeight+=theight[i];
									}
									if (maxHeight>height){//string_height(ltext[|i])+lineSpace
										for (var i=0;i<ds_list_size(ltext);i++){
											if (is_array(ltext[|i])){
												var testArr2=ltext[|i];
												if (testArr2[0]=="n"||testArr2[0]=="x"){
													i++;
													break;
												}
											}
										}
										maxHeight-=theight[0];
										for (var j=1;j<=posLine;j++){
											theight[j-1]=theight[j];
											tspace[j-1]=tspace[j];
										}
										//이상하게 이 정상코드를 넣어서 고치려고 하면 심각한 버그가 생긴다. 왜 이러지?
										repeat(i){
											ds_list_delete(ltext,0);
											index--;
										}
										posLine--;
										//height값을 기준으로 만들어야 한다. 
										//n이 뜰 때까지.  
									}
								}until(maxHeight<=height);
							}
							else{//*명령어 추가 부분
							#region Command
								if (testArr[0]=="p"){
									wait=-1;
								}
								else if (testArr[0]=="x"){
									/*var _size=ds_list_size(ltext),str="";
									for(var i=0;i<_size;i++){
										str+=string(i)+":"+string(ltext[|i])+",";
									}
									show_message(str);
									show_message(index+1);*/
									repeat(index+1){
										ds_list_delete(ltext,0);
									}
								
									//tspace=array_create(3,0);
									//theight=array_create(3,0);
									index=-1;
									posLine=0;
									textX=0;
									textY=0;
									frame=0;
									onLdown=0;
									onLmiddle=0;
									onEmp=0;
									ColorIndex=0;
									ScaleIndex=0;
									SpeedIndex=0;
									onEffect=array_create(10,-1);
								}
								else if (testArr[0]=="q"){
									repeat(index+1){
										ds_list_delete(ltext,0);
									}
								
									//tspace=array_create(3,0);
									//theight=array_create(3,0);
									index=-1;
									posLine=0;
									textX=0;
									textY=0;
									frame=0;
									onLdown=0;
									onLmiddle=0;
									onEmp=0;
									ColorIndex=0;
									ScaleIndex=0;
									SpeedIndex=0;
									onEffect=array_create(10,-1);
									wlog_destroy();
								}
								else if (testArr[0]=="a"){
									var _arr=wNowProperty[2];
									audio_play_sound(_arr[testArr[1]],0,0);
								}
								else if (testArr[0]=="s"){
									var _arg2=wNowProperty[5],_arg=_arg2[testArr[1]];
									switch(array_length(_arg)){
									case 1:
										script_execute(_arg[0]);
										break;
									case 2:
										script_execute(_arg[0],_arg[1]);
										break;
									case 3:
										script_execute(_arg[0],_arg[1],_arg[2]);
										break;
									case 4:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3]);
										break;
									case 5:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4]);
										break;
									case 6:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5]);
										break;
									case 7:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6]);
										break;
									case 8:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7]);
										break;
									case 9:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8]);
										break;
									case 10:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9]);
										break;
									case 11:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10]);
										break;
									case 12:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11]);
										break;
									case 13:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12]);
										break;
									case 14:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12],_arg[13]);
										break;
									case 15:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12],_arg[13],_arg[14]);
										break;
									case 16:
										script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12],_arg[13],_arg[14],_arg[15]);
										break;
									}
								}
								else if (testArr[0]=="d"){
									SpeedIndex=testArr[1];
								}
							
								index++;
								indexSub=0;
							
								if (testArr[0]=="s"||testArr[0]=="l"||testArr[0]=="d"||testArr[0]=="c"||testArr[0]=="__"||testArr[0]=="--"||testArr[0]=="**"||testArr[0]=="{"||testArr[0]=="}"){
									wlog_update();
									effectPlaying=true;
								}
							
							#endregion
							}
						}
						else{
							var _arr=ltext[|index];
							if (string_count(string_char_at(_arr,indexSub),global.wnotSpeaking)==0){
								//*Sound Play
								if (wVoice!=-1){
									if (isRepeating){
										if (!audio_is_playing(wVoice)){
											audio_play_sound(wVoice,0,0);
										}
									}
									else{
										audio_play_sound(wVoice,0,0);
									}
									//영어 모음마다 발음하도록 하는 기능도. 
								}
							}
							if (indexSub==string_length(ltext[|index])){
								index++;
								indexSub=0;
							}
							else{
								indexSub++;//이 경우엔 글자가 쳐진 것. 글자 나올 때 나오는 효과음 넣는 곳.
							}
						}
					}
				}
				else{
					delayFrame-=defaultSpeed[SpeedIndex];
				}
			}
		#endregion
			}

			else if (list[|0]==1){
		#region Event
			if (list[|1]!=-1){
				var _arr=list[|1],_arr2=_arr[1],newarr=array_create(array_length(_arr2)-1);
				wEventInst=instance_create_depth(0,0,0,_arr[0]);
				with(wEventInst){
					callbackIndex=_arr2[0];
					for(var i=0;i<array_length(newarr);i++){
						newarr[i]=_arr2[i+1];
					}
					depth+=wdepth;
					wtarget=other.id;
					wproperty=newarr;
				}
				list[|1]=-1;
				wlog_update();
				effectPlaying=true;
			}
		#endregion
			}

			else if (list[|0]==2){
		#region Callback
			var _arg=list[|1];//16개까지. 
			switch(array_length(_arg)){
			case 1:
				script_execute(_arg[0]);
				break;
			case 2:
				script_execute(_arg[0],_arg[1]);
				break;
			case 3:
				script_execute(_arg[0],_arg[1],_arg[2]);
				break;
			case 4:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3]);
				break;
			case 5:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4]);
				break;
			case 6:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5]);
				break;
			case 7:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6]);
				break;
			case 8:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7]);
				break;
			case 9:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8]);
				break;
			case 10:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9]);
				break;
			case 11:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10]);
				break;
			case 12:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11]);
				break;
			case 13:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12]);
				break;
			case 14:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12],_arg[13]);
				break;
			case 15:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12],_arg[13],_arg[14]);
				break;
			case 16:
				script_execute(_arg[0],_arg[1],_arg[2],_arg[3],_arg[4],_arg[5],_arg[6],_arg[7],_arg[8],_arg[9],_arg[10],_arg[11],_arg[12],_arg[13],_arg[14],_arg[15]);
				break;
			}
			ds_list_delete(list,0);
			ds_list_delete(list,0);
			wlog_update();
			effectPlaying=true;
		#endregion
			}
		}
	#region LogicIf
		if (list[|0]==3){//*If
			iHeight++;
			iValue[iHeight]=-1;
			if ((iHeight-1)==-1 || iValue[iHeight-1]==1){
				if(is_array(list[|1])){
					var _arr=list[|1];
					if (wEventValue[_arr[1]]==wLogicValue[_arr[0]]){
						iValue[iHeight]=1;
					}
					else{
						iValue[iHeight]=0;
					}
				}
				else{
					if (wLogicValue[list[|1]]>0){
						iValue[iHeight]=1;//1일 땐 실행한다는 것. 0일 경우 X / iHeight==-1일경우 검사 X
					}
					else{
						iValue[iHeight]=0;
					}
				}
			}
			ds_list_delete(list,0);
			ds_list_delete(list,0);
			wlog_update();
			effectPlaying=true;
		}
		else if (list[|0]==4){//*End
			if (iHeight!=-1){
				iHeight--;
			}
			ds_list_delete(list,0);
			wlog_update();
			effectPlaying=true;
		}
		else if (list[|0]==5){//*Else
			if (iHeight!=-1){
				if (iValue[iHeight]==0){
					iValue[iHeight]=1;
				}
				else{
					iValue[iHeight]=-1;
				}
			}
			ds_list_delete(list,0);
			wlog_update();
			effectPlaying=true;
		}
		else if (list[|0]==6){//*Elif
			if (iHeight!=-1){
				if (iValue[iHeight]==0){
					if(is_array(list[|1])){
						var _arr=list[|1];
						if (wEventValue[_arr[1]]==wLogicValue[_arr[0]]){
							iValue[iHeight]=1;
						}
						else{
							iValue[iHeight]=0;
						}
					}
					else{
						if (wLogicValue[list[|1]]>0){
							iValue[iHeight]=1;//1일 땐 실행한다는 것. 0일 경우 X / iHeight==-1일경우 검사 X
						}
					}
				}
				else{
					iValue[iHeight]=-1;
				}
			}
			ds_list_delete(list,0);
			ds_list_delete(list,0);
			wlog_update();
			effectPlaying=true;
		}
		else if !(iHeight==-1 || (iHeight!=-1&&iValue[iHeight]==1)){//Text, Event
			ds_list_delete(list,0);
			ds_list_delete(list,0);
			wlog_update();
			effectPlaying=true;
		}
	#endregion
	}

	if (wait==-2){
		if (!ds_list_empty(list)){
			if ((list[|0]==1 && list[|1]==-1 && wEventInst.wlogPersistent==0) || list[|0]!=1){
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
				isRepeating=0;
			}
		}
	}

	if (effectPlaying==false){
		frame++;
	}


}
