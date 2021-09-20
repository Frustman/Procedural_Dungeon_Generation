

//------------------------------------------------
#region jump

var jump = keyboard_check_pressed(vk_space);

if(jump && z == zFloor){
	zSpeed = jumpSpeed;	
}

if(z != zFloor){
	zSpeed += zGravity;	
}

if(z + zSpeed > zFloor){
	zSpeed = 0;
	z = zFloor;
}

if(Scr_place_meeting_3d(x + xSpeed, y, Obj_wall)){
	while(!Scr_place_meeting_3d(x + sign(xSpeed), y, Obj_wall)){
		x += sign(xSpeed);	
	}
	xSpeed = 0;
}

if(Scr_place_meeting_3d(x, y + ySpeed, Obj_wall)){
	while(!Scr_place_meeting_3d(x, y + sign(ySpeed), Obj_wall)){
		y += sign(ySpeed);	
	}
	ySpeed = 0;
}

if (instance_place(x, y, Obj_wall)) {
	var block = instance_place(x, y, Obj_wall);
	//If we're higher than the block, send the shadow to the top of that block
	if (block.z >= z) {
		zFloor = block.z;
	}
	//Send shadow to the ground
	else {
		zFloor = 0;
	}
} else zFloor = 0;


#endregion

//------------------------------------------------
#region function setting

x += xSpeed * global.timeScale;
y += ySpeed * global.timeScale;
z += zSpeed * global.timeScale;

anim_maxIndex = image_number;

if(anim_index < (anim_maxIndex) * anim_fps - 1){
	anim_index += global.timeScale;
} else{
	anim_index = 0;
}


Scr_alarm_step();

Scr_SM_execute();

#endregion