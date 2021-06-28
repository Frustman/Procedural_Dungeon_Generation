function _wlog_translate() {
	if (posLine+1>countN){//무조건 _list의 텍스트는 0에서 받아올 수밖에 없다. 
		var countWidth=0,char="",char2="",countNum=0,ltextIndex=index,_list=list[|1];
		draw_set_font(wFont);
		if !(_list[0]==""||_list[0]==undefined||is_array(_list[0])){
			if (string_copy(_list[0],1,2)!="@n"){
				theight[posLine]=0;
				tspace[posLine]=0;
				if (ColorIndex!=0){
					ds_list_add(ltext,["c",ColorIndex]);
					ltextIndex+=1;
				}
				if (ScaleIndex!=0){
					ds_list_add(ltext,["l",ScaleIndex]);
					ltextIndex+=1;
				}
				if (onLdown!=0){
					ds_list_add(ltext,["__"]);
					ltextIndex+=1;
				}
				if (onLmiddle!=0){
					ds_list_add(ltext,["--"]);
					ltextIndex+=1;
				}
				if (onEmp!=0){
					ds_list_add(ltext,["**"]);
					ltextIndex+=1;
				}
				for(var i=0;i<=9;i++){
					if (onEffect[i]!=-1){
						ds_list_add(ltext,["{",i]);
						ltextIndex+=1;
					}
				}
			}
		while(true){
			if (_list[0]==""||_list[0]==undefined||is_array(_list[0]))
				break;
			char=string_copy(_list[0],1,1);
			char2=string_copy(_list[0],1,2);//\n는 한문자 취급하니 예외취급.!
			if (char=="@"){
				var _char=string_copy(_list[0],2,1);
				if (_char=="n"){
					ds_list_add(ltext,["n"]);
					_list[0]=string_delete(_list[0],1,2);
					theight[posLine]=max(theight[posLine],(string_height("A")+lineSpace)*defaultScale[ScaleIndex]);
					list[|1]=_list;
					break;
				}
				else if (_char=="x"||_char=="p"){
					ds_list_add(ltext,[_char]);
				
					/*var _size=ds_list_size(ltext),str="";
					for(var i=0;i<_size;i++){
						str+=string(i)+":"+string(ltext[|i])+",";
					}
					show_message(str);*/
				
					_list[0]=string_delete(_list[0],1,2);
					if (is_string(ltext[|ltextIndex])) ltextIndex++;
					ltextIndex+=1;
					theight[posLine]=max(theight[posLine],(string_height("A")+lineSpace)*defaultScale[ScaleIndex]);
					if(_char=="x"){
						list[|1]=_list;
						break;
					}
				}
				else if (_char=="i"||_char=="a"||_char=="s"||_char=="v"||_char=="d"||_char=="c"||_char=="l"||_char=="b"){
					var _char2=real(string_copy(_list[0],3,1));
					if (_char2>=0&&_char2<=9){//v(value), i(sprite)는 예외 처리 + (countNum++)
						if (is_string(ltext[|ltextIndex])) ltextIndex++;//프로퍼티가 각각 배열이라는 사실을 까먹었다. 0~9까지 받을 수 있도록. 함수에서 기본적으로 0을 쓰며 이미 있을경우 추가하는식으로. 
						if (_char=="v"||_char=="b"){
							if (_char=="v"){
								var _arr=wNowProperty[1];
								ds_list_add(ltext,string(_arr[_char2]));
							}
							else{
								var _arr=wNowProperty[7],_arr2=_arr[_char2],_value;
								if (is_array(_arr2)){
									_value=variable_instance_get(_arr2[0],_arr2[1]);
								}
								else{
									_value=variable_global_get(_arr2);
								}
								ds_list_add(ltext,string(_value));
							}
						}
						else{
							if (_char=="i"){
								var _arr=wNowProperty[3],_arr2=_arr[_char2];
								var charLen=sprite_get_width(_arr2[0]);
							
								if (countWidth+charLen+hSpace>=width){
									if (countWidth+charLen<width){
										countWidth+=charLen;
										countNum+=1;
									}
									else{
										if (countWidth+charLen==width){
											countWidth+=charLen;
											countNum+=1;
											tspace[posLine]=0;
										}
										else{
											tspace[posLine]=0;
										}
										_list[0]=string_insert("@n",_list[0],1);
										break;
									}
								}
								else{
									countWidth+=charLen+hSpace;
									countNum+=1;
								}
								theight[posLine]=max(theight[posLine],sprite_get_height(_arr2[0])+lineSpace);
							
							}
							else if (_char=="l"){//얘는 또 문제가. 다음 라인에도 쭉 영향을 준다는 것. 
								ScaleIndex=_char2;
							}
							else if (_char=="c"){//Index는 바로 영향을 주기에 다음 x까지 지연시킬 변수가 필요하다. 또 이게 문제가 속성이 들어있는 라인이 지워지면? (그래도 인덱스 단위로 지워져서 속성을 저장하는 것만 있으면.)
								//어차피 이 해석기 내에서는 처리할 수 있으니 시작 첫줄마다 @인덱스를 넣자. 
								ColorIndex=_char2;
							}
							else{//스프라이트,Large시에 maxHeight 값 등 조절 필수
								theight[posLine]=max(theight[posLine],(string_height("A")+lineSpace)*defaultScale[ScaleIndex]);
							}
							ds_list_add(ltext,[_char,_char2]);
						}
						_list[0]=string_delete(_list[0],1,3);
						ltextIndex+=1;
					}
				}
				else{
					_list[0]=string_delete(_list[0],1,1);
				}
			}//ltextIndex++; 은 명령어에서도 필수다. 
			else if (char2=="__"||char2=="--"||char2=="**"){
				if (char2=="__"){
					onLdown=!onLdown;
				}
				else if (char2=="--"){
					onLmiddle=!onLmiddle;
				}
				else if (char2=="**"){
					onEmp=!onEmp;
				}
				ds_list_add(ltext,[char2]);
				_list[0]=string_delete(_list[0],1,2);
				if (is_string(ltext[|ltextIndex])) ltextIndex++;
				ltextIndex+=1;
				theight[posLine]=max(theight[posLine],(string_height("A")+lineSpace)*defaultScale[ScaleIndex]);
			}
			else if (char=="{"&&(is_string(string_copy(_list[0],3,1))&&string_copy(_list[0],3,1)=="/")&&(0<=real(string_copy(_list[0],2,1))&&real(string_copy(_list[0],2,1))<=9)){
				ds_list_add(ltext,["{",real(string_copy(_list[0],2,1))]);
			
				var _wp=wNowProperty[4];
				onEffect[real(string_copy(_list[0],2,1))]=_wp[0];
			
				_list[0]=string_delete(_list[0],1,3);
				if (is_string(ltext[|ltextIndex])) ltextIndex++;
				ltextIndex+=1;
				theight[posLine]=max(theight[posLine],(string_height("A")+lineSpace)*defaultScale[ScaleIndex]);
			}
			else if (char=="/"&&(is_string(string_copy(_list[0],3,1))&&string_copy(_list[0],3,1)=="}")&&(0<=real(string_copy(_list[0],2,1))&&real(string_copy(_list[0],2,1))<=9)){
				ds_list_add(ltext,["}",real(string_copy(_list[0],2,1))]);
				onEffect[real(string_copy(_list[0],2,1))]=-1;
			
				_list[0]=string_delete(_list[0],1,3);
				if (is_string(ltext[|ltextIndex])) ltextIndex++;
				ltextIndex+=1;
				theight[posLine]=max(theight[posLine],(string_height("A")+lineSpace)*defaultScale[ScaleIndex]);
			}
			else{
				var charLen=string_width(char)*defaultScale[ScaleIndex]; //width 계산할 때 size, font도 정확히 적용하고 해야한다. 
				if (countWidth+charLen+hSpace>=width){
					if (countWidth+charLen<width){
						countWidth+=charLen;
						countNum+=1;
					
						if (ds_list_size(ltext)==ltextIndex)
							ltext[|ltextIndex]="";
						ltext[|ltextIndex]+=char;
						_list[0]=string_delete(_list[0],1,1);
					}
					else{
						if (countWidth+charLen==width){
							countWidth+=charLen;
							countNum+=1;
							tspace[posLine]=0;
						
							if (ds_list_size(ltext)==ltextIndex)
								ltext[|ltextIndex]="";
							ltext[|ltextIndex]+=char;
							_list[0]=string_delete(_list[0],1,1);
						}
						else{//어차피 대입이라 배열이 가변적으로 변하기 때문에 크기에 신경쓸 필요는 없다. gml이니깐. 
							tspace[posLine]=(width-countWidth)/countNum;
						}
						_list[0]=string_insert("@n",_list[0],1);
						break;
					}
				}
				else{
					countWidth+=charLen+(hSpace*defaultScale[ScaleIndex]);
					if (ds_list_size(ltext)==ltextIndex)
						ltext[|ltextIndex]="";
					ltext[|ltextIndex]+=char;
					_list[0]=string_delete(_list[0],1,1);
					countNum+=1;
				}
				theight[posLine]=max(theight[posLine],(string_height(char)+lineSpace)*defaultScale[ScaleIndex]); //max scale 속성 확인. 
			}
		}
		}
		list[|1]=_list;
	}


}
