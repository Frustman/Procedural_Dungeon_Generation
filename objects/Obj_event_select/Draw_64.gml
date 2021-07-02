var xx = wtarget.x;
var yy = wtarget.y + wtarget.height + 48;

draw_set_font(global.wFont);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
for (var i=0;i<array_length(wproperty);i++){
	draw_set_color(c_black);
	draw_rectangle(xx - 12,yy+i*32 - 12,xx+wtarget.width + 12,yy+i*32 + 12,false);
	draw_set_color(c_white);
	if(i==num){
		draw_text(xx,yy+i*32,">"+string(wproperty[i]));
	}
	else{
		draw_text(xx,yy+i*32,string(wproperty[i]));
	}
}
draw_set_font(-1);

if keyboard_check_pressed(vk_down){
	num+=1;
	if (num>=array_length(wproperty)){
		num=0;
	}
}
if keyboard_check_pressed(vk_up){
	num-=1;
	if (num<0){
		num=array_length(wproperty)-1;
	}
}
if keyboard_check_pressed(vk_enter){
	wlog_event_destroy(num);//Callback**
}