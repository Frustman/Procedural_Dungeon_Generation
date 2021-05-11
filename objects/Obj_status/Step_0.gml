/// @description Insert description here
// You can write your code in this editor
targetX = view_wport / 2;
targetY = view_hport / 2 + 60;

curX = lerp(curX, targetX, 0.2);
curY = lerp(curY, targetY, 0.2);

buttonX = curX;
buttonY = curY + 220;

infoX = curX + 630;
infoY = curY - 18;


if(cursor != -1){
	targetW = 400;
	targetH = 200;
	
	infoW = lerp(infoW, targetW, 0.2);
	infoH = lerp(infoH, targetH, 0.2);
	
	compoX = lerp(compoX, 50, 0.2);
}