/// @description Insert description here
// You can write your code in this editor
event_inherited();

#region process

player_dist = point_distance(Obj_chr.x,Obj_chr.y,x,y);



if(player_dist <= strafeRange + 100 && in_sight == true){
	stateMachine = state_machine.fight;	
} else {
	stateMachine = state_machine.wander;	
}

#endregion



#region hp manage

if(hp <= 0){
	with(instance_create_layer(x,y,"sort_end",Obj_corpse)){
		spr = Spr_slime_dead;
		moveDir = point_direction(Obj_chr.x,Obj_chr.y,other.x,other.y);
	}
	instance_destroy(self);
}

#endregion



#region ai manage

if(stateMachine == state_machine.wander){
	
	
	if(state != ai_state.stop) moveSpeed = lerp(moveSpeed, 0.3, random(0.05) + 0.07) * global.timeScale;
	else moveSpeed = 0;

	if(point_distance(x,y,spawnX,spawnY) >= spawnRadius){
		moveAngle = lerp(moveAngle,point_direction(x,y,spawnX,spawnY),0.1 * global.timeScale);
	}
	moveAngle += Scr_perlin_noise_1d(seed + current_time / 100) * 2;
	Scr_force_update([lengthdir_x(moveSpeed,moveAngle), lengthdir_y(moveSpeed, moveAngle)]);

	if(instance_place(x + lengthdir_x(10,moveAngle), y + lengthdir_y(10,moveAngle),Obj_wall)){
		moveAngle = lerp(moveAngle,point_direction(x,y,spawnX,spawnY), 0.1 * global.timeScale);
	}
	
	
	
} else if(stateMachine== state_machine.fight){
	
	
	contextVal += global.timeScale;

	if(contextVal >= contextInterval) contextVal = 0;
	if(contextVal == 0){
		if(state != ai_state.attack && state != ai_state.attackready){
			if(attackGage <= attackMaxGage){
				attackGage += global.timeScale;
			} else if(attackGage > attackMaxGage){
				attackReady = true;
				attackGage = 0;
			}
		}
		if(attackReady == true){
			state = ai_state.attackready;
			attackReady = false;
			moveSpeed = 0;
			Alarm[2] = 30;
		} else if(state == ai_state.attack){
			moveSpeed = 2.1 * global.timeScale;
			if(attackTime < attackDuration){
				attackTime += global.timeScale;	
			} else {
				state = ai_state.chase;
				moveSpeed = 1.3 * global.timeScale;
				attackTime = 0;
			}
			if(player_dist <= attackRange){
				state = ai_state.stop;
				moveSpeed = 0;
				attackDir = point_direction(x,y,Obj_chr.x,Obj_chr.y);
				Alarm[3] = 20;
			}
		} else if(state != ai_state.stop && state != ai_state.attackready){
			if(player_dist > strafeRange){
				state = ai_state.chase;
				moveSpeed = 1.3 * global.timeScale;
			}
			else if(player_dist <= strafeRange && player_dist >= strafeRange - 10){
				state = ai_state.strafe;
				moveSpeed = 1.3 * global.timeScale;
			}
			else if(player_dist < strafeRange - 10){
				state = ai_state.backward;
				moveSpeed = 1.3 * global.timeScale;
			}
		}
		

		maxVal = -999;
		maxIdx = 0;

		maxValCheck = -999;
		maxIdxCheck = 0;

		var normal = point_direction(Obj_chr.x,Obj_chr.y,x,y);
	
		for(var i = 0; i < rayCount; i++){
			contextMap[i] = 0;	
			contextDanger[i] = false;
		
			var x1 = lengthdir_x(1,normal);
			var y1 = lengthdir_y(1,normal);
			var x2 = contextDir[i][0];
			var y2 = contextDir[i][1];
		
			var dot = (x1 * x2 + y1 * y2);
			if(state == ai_state.backward) contextMap[i] =  (1.0 - abs(dot - 0.9)) * 2;
			if(state == ai_state.strafe) contextMap[i] = (1.0 - abs(dot)) * 2;
			if(state == ai_state.chase) contextMap[i] = 1.0 - (dot);
			if(state == ai_state.attackready) contextMap[i] = 1.0 - (dot);
			if(state == ai_state.attack) contextMap[i] = 1.0 - (dot);
	
	
			if(collision_line(x,y,x + lengthdir_x(abs(contextMap[i] * rayDistance),contextDir[i][2]),y + lengthdir_y(abs(contextMap[i] * rayDistance),contextDir[i][2]),Obj_enemy,true,true) != noone || collision_line(x,y,x + lengthdir_x(abs(contextMap[i] * rayDistance),contextDir[i][2]),y + lengthdir_y(abs(contextMap[i] * rayDistance),contextDir[i][2]),Obj_wall,true,true) != noone){
			//if(collision_line(x,y,x + lengthdir_x(abs(contextMap[i] * rayDistance),contextDir[i][2]),y + lengthdir_y(abs(contextMap[i] * rayDistance),contextDir[i][2]),Obj_wall,false,true) != noone){
				contextDanger[i] = true;
			}
	
			contextCheck[i] = false;
			if(!contextDanger[i]){
				if(contextMap[i] > maxVal){
					maxIdx = i;
					maxVal = contextMap[i];
				}
			}
		}

		force[0] = 0;
		force[1] = 0;

		var st = round(point_direction(x,y,Obj_chr.x,Obj_chr.y) / ( 360 / rayCount));

		if(checkHalf == true){
			for(var i = st; i < st + rayCount div 2; i++){
				if(!contextDanger[i % rayCount]){
					if(contextMap[i % rayCount] > maxValCheck){
						maxIdxCheck = i % rayCount;
						maxValCheck = contextMap[i % rayCount];
					}
				}
				contextCheck[i % rayCount] = true;
			}
		} else {
			for(var i = st + rayCount div 2; i < st + rayCount; i++){
				if(!contextDanger[i % rayCount]){
					if(contextMap[i % rayCount] > maxValCheck){
						maxIdxCheck = i % rayCount;
						maxValCheck = contextMap[i % rayCount];
					}
				}
				contextCheck[i % rayCount] = true;
			}
		}
		if(abs(maxValCheck - maxVal) >= 0.75) checkHalf = !checkHalf;
		if(maxValCheck == -999) checkHalf = !checkHalf;
	}

	dirGoal[0] = contextDir[maxIdxCheck][0];
	dirGoal[1] = contextDir[maxIdxCheck][1];

	// check big size

	rayExtraCheck[0] = false;
	rayExtraCheck[1] = false;

	if(state == ai_state.chase || state == ai_state.attack || state == ai_state.attackready){
		var ideal_ppd = contextDir[maxIdxCheck][2] - 90;
		var x_ppd = lengthdir_x(sprite_rad,ideal_ppd);
		var y_ppd = lengthdir_y(sprite_rad,ideal_ppd);

		var x_ray = lengthdir_x(abs(contextMap[maxIdxCheck] * rayDistance),contextDir[maxIdxCheck][2]);
		var y_ray = lengthdir_y(abs(contextMap[maxIdxCheck] * rayDistance),contextDir[maxIdxCheck][2]);

		if(collision_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray, Obj_enemy, true, true) != noone || collision_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray, Obj_wall, true, true) != noone){
			rayExtraCheck[0] = true;
			dirGoal[0] += lengthdir_x(0.7, ideal_ppd + 180);
			dirGoal[1] += lengthdir_y(0.7, ideal_ppd + 180);
		}

		if(collision_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray, Obj_enemy, true, true) != noone || collision_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray, Obj_wall, true, true) != noone){
			rayExtraCheck[1] = true;
			dirGoal[0] += lengthdir_x(0.7, ideal_ppd);
			dirGoal[1] += lengthdir_y(0.7, ideal_ppd);
		}
	} else if(state == ai_state.strafe){
		var ideal_ppd = contextDir[maxIdxCheck][2] - 90;
		var x_ppd = lengthdir_x(sprite_rad,ideal_ppd);
		var y_ppd = lengthdir_y(sprite_rad,ideal_ppd);

		var x_ray = lengthdir_x(abs(contextMap[maxIdxCheck] * rayDistance),contextDir[maxIdxCheck][2]);
		var y_ray = lengthdir_y(abs(contextMap[maxIdxCheck] * rayDistance),contextDir[maxIdxCheck][2]);

		if(collision_line(x + x_ppd, y + y_ppd, x + x_ppd + x_ray, y + y_ppd + y_ray, Obj_wall, true, true) != noone){
			rayExtraCheck[0] = true;
			dirGoal[0] += lengthdir_x(0.3, ideal_ppd + 180);
			dirGoal[1] += lengthdir_y(0.3, ideal_ppd + 180);
		}

		if(collision_line(x - x_ppd, y - y_ppd, x - x_ppd + x_ray, y - y_ppd + y_ray, Obj_wall, true, true) != noone){
			rayExtraCheck[1] = true;
			dirGoal[0] += lengthdir_x(0.3, ideal_ppd);
			dirGoal[1] += lengthdir_y(0.3, ideal_ppd);
		}
	}
	//

	force[0] = dirGoal[0] - moveDir[0];
	force[1] = dirGoal[1] - moveDir[1];

	moveDir[0] += force[0] / 6;
	moveDir[1] += force[1] / 6;
	

	moveAngle = point_direction(0,0,moveDir[0],moveDir[1]);
	
	
	Scr_force_update([lengthdir_x(moveSpeed, moveAngle), lengthdir_y(moveSpeed, moveAngle)]);
	
}


#endregion
