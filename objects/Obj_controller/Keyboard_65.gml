/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("W"))){
	directionBox = 135;
}
else if(keyboard_check(ord("S"))){
	directionBox = 225;
}
else{
	directionBox = 180;
}
move = true;