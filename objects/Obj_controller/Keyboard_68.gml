/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("W"))){
	directionBox = 45;
}
else if(keyboard_check(ord("S"))){
	directionBox = 315;
}
else{
	directionBox = 0;
}
move = true;