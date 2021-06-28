for (var i=0;i<array_length_1d(wproperty);i++){
	if(i==num){
		draw_text(x,y+i*32,">"+string(wproperty[i]));
	}
	else{
		draw_text(x,y+i*32,string(wproperty[i]));
	}
}

if keyboard_check_pressed(vk_down){
	num+=1;
	if (num>=array_length_1d(wproperty)){
		num=0;
	}
}
if keyboard_check_pressed(vk_up){
	num-=1;
	if (num<0){
		num=array_length_1d(wproperty)-1;
	}
}
if keyboard_check_pressed(vk_space){
	wlog_event_destroy(num);//Callback**
}