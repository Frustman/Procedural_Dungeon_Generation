/// @description Insert description here
// You can write your code in this editor
event_inherited();

#region General option

maxhp = 50;
hp = 50;

#endregion


#region variable definition

state = ai_state.wandering;
stateMachine = state_machine.wander;

crit = false;

spawnRadius = 90;

seed = irandom(300);

moveAngle = random(360);
moveSpeed = 0;

spawnX = x;
spawnY = y;


attackMaxGage = 100;
attackGage = 0;

moveDir[0] = 1;
moveDir[1] = 0;

rayCount = 16;
rayDistance = 20;

checkHalf = false;
DangerCount = 0;

for(var i = 0; i < rayCount; i++){
	var degree = 360 / rayCount * i;
	contextDir[i][0] = lengthdir_x(1, degree);
	contextDir[i][1] = lengthdir_y(1, degree);
	contextDir[i][2] = degree;
	contextCheck[i] = false;
	contextMap[i] = 0;
	contextDanger[i] = false;
}
rayExtraCheck[0] = false;
rayExtraCheck[1] = false;

maxVal = -1;
maxIdx = 0;

maxValCheck = -1;
maxIdxCheck = 0;

strafeRange = 70 + irandom(60);

attackRange = strafeRange + 50;

contextInterval = 3;
contextVal = 0;

force[0] = 0;
force[1] = 0;


theta = -10;
pos = [0,0];

#endregion


#region process

Alarm[0] = 600;
Alarm[1] = 45;

#endregion