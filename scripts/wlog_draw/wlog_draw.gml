///@function wlog_draw()
function wlog_draw() {

	if (ds_list_size(ltext)!=0){
		var __x=0,__y=0,_arr,_line=0,_end=0,_indexc=0,_indexs=0,_ldown=0,_lmiddle=0,_lemp=0,_mx=0,_effect=array_create(10,-1),_eProperty=array_create(10,[]),_font=wFont;
	
		var _x=0,_y=0,_size=1,_color=undefined,_pos=0; //For Effect. (_size<=1)
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_set_font(_font);
	
		__y+=theight[0];
		for(var i=0;i<=index;i++){
			_arr=ltext[|i];
			draw_set_color((_color==undefined)?defaultColor[_indexc]:_color);
			if (is_string(_arr)){
				for(var j=1;j<=string_length(_arr);j++){
					if (i==index && j>=indexSub+1){
						_end=1;
						break;
					}
					_pos++;
					for(var k=0;k<=9;k++){
						if (_effect[k]!=-1){
							var eProperty=_eProperty[k];
							switch(_effect[k]){//ID
						#region EffectUpdate
						
							case effect.shake:
							_x=random_range(-eProperty[0],eProperty[0]);
							_y=random_range(-eProperty[0],eProperty[0]);
							break;
						
						#endregion
							}
						}
					}
				
					draw_set_color(defaultColor[_indexc]);
					draw_text_transformed(x+__x+_x,y+__y+_y,string_char_at(_arr,j),defaultScale[_indexs],defaultScale[_indexs],0);
					_mx=floor((hSpace+tspace[_line])*0.5);
					if (_lemp)	draw_text_transformed(x+__x+1+_x,y+__y+_y,string_char_at(_arr,j),defaultScale[_indexs],defaultScale[_indexs],0);
					if (_ldown)	draw_line(x+__x-_mx-1+_x,y+__y+_y,x+__x+_x+string_width(string_char_at(_arr,j))+_mx,y+__y+_y);
					if (_lmiddle) draw_line(x+__x-_mx-1+_x,y+__y+_y-theight[_line]*0.5,x+__x+_x+string_width(string_char_at(_arr,j))+_mx,y+__y+_y-theight[_line]*0.5);
					__x+=tspace[_line]+(hSpace+string_width(string_char_at(_arr,j)))*defaultScale[_indexs];
				}
			}
			else{
				if (i>=index){
					_end=1;
					break;
				}//*명령어
				if (_arr[0]=="n"){
					_line++;
					__x=0;
					__y+=theight[_line];
					_indexc=0;
					_indexs=0;
					_lmiddle=0;
					_ldown=0;
					_lemp=0;
				}
				else if(_arr[0]=="i"){
					var _tarr=wNowProperty[3],_tarr2=_tarr[_arr[1]];
					draw_sprite(_tarr2[0],_tarr2[1],x+__x+_x+sprite_get_xoffset(_tarr2[0]),y+__y+_y+sprite_get_yoffset(_tarr2[0]) -sprite_get_height(_tarr2[0])*0.5 -theight[_line]*0.5);
					__x+=tspace[_line]+hSpace+sprite_get_width(_tarr2[0]);
				}
				else if(_arr[0]=="c"){
					_indexc=_arr[1];
				}
				else if(_arr[0]=="l"){
					_indexs=_arr[1];
				}
				else if(_arr[0]=="--"){
					_lmiddle=!_lmiddle;
				}
				else if(_arr[0]=="__"){
					_ldown=!_ldown;
				}
				else if(_arr[0]=="**"){
					_lemp=!_lemp;
				}
				else if(_arr[0]=="{"){//*Effect Design Init - use [_eProperty[]]; 
					var earr=wNowProperty[4],earr2=earr[_arr[1]];
					_eProperty[_arr[1]]=earr2[1];
					var eProperty=earr2[1];
				
					switch(earr2[0]){//ID
				#region EffectInit
					
					case effect.shake:
					//show_debug_message(string(_arr[1])+":"+string(eProperty[0]));
					break;
				
				#endregion
					}
				
					_effect[_arr[1]]=earr2[0];
				}
				else if(_arr[0]=="}"){
					_effect[_arr[1]]=-1;
				
					var earr=wNowProperty[4],earr2=earr[_arr[1]];
					_eProperty[_arr[1]]=earr2[1];
					var eProperty=earr2[1];
				
					switch(earr2[0]){//ID
				#region EffectEnd
					
					case effect.shake:
					_x=0;
					_y=0;
					break;
				
				#endregion
					}
				}
			}
		
			if (_end==1){
				break;
			}
		}
	}

	draw_set_color(c_white);


}
