// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_Pdg_Map_Init(_map, _door, _width, _height, _Wradius, _Hradius){
	var _map_W = _width div DG_WIDTH;
	var _map_H = _height div DG_HEIGHT;
	
	var _chance = 50;
	var _H_map;
	
	var _real_map = ds_grid_create(_width, _height);
	ds_grid_set_region(_real_map, 0, 0, _width, _height, cellular.MutableWall);
	
	
	for(var i = 0; i < _map_W; i++){
		for(var j = 0; j < _map_H; j++){
			
			_H_map[i][j] = min(_Wradius - 2, _Hradius - 2);;
			if(_map[# i, j] != 0){
				var centerX = i * DG_WIDTH + DG_WIDTH div 2;
				var centerY = j * DG_HEIGHT + DG_HEIGHT div 2;
				
				var _WR = _Wradius + irandom(2) - 1;
				var _HR = _Hradius + irandom(2) - 1;
				var _H = min(_WR - 2, _HR - 2);
				
				_H_map[i][j] = _H;
				
				for(var _i = i * DG_WIDTH; _i < i * DG_WIDTH + DG_WIDTH; _i++){
					for(var _j = j * DG_HEIGHT; _j < j * DG_HEIGHT + DG_HEIGHT; _j++){
						//if((_i - centerX) * (_i - centerX) / _Wradius / _Wradius + (_j - centerY) * (_j - centerY) / _Hradius / _Hradius <= 1){
						if(_i <= i * DG_WIDTH + 1 || _j <= j * DG_HEIGHT + 1 || _i >= i * DG_WIDTH + DG_WIDTH - 2 || _j >= j * DG_HEIGHT + DG_HEIGHT - 2){
							ds_grid_set(_real_map,_i,_j,cellular.MutableWall);
						} else if(random(100) <= _chance){
							ds_grid_set(_real_map, _i, _j, cellular.MutableGround);
						}
						if((_i - centerX) * (_i - centerX) + (_j - centerY) * (_j - centerY) <= 4 * 4){
							ds_grid_set(_real_map, _i, _j, cellular.ImmutableGround);
						}
					}
				}
				
			}
		}
	}
	for(var i = 0; i < _map_W; i++){
		for(var j = 0; j < _map_H; j++){
			if(_map[# i, j] != 0){
				/*if(_door[# i, j] % 10 == 1){ // left door
					var xx = i * DG_WIDTH;
					var yy = j * DG_HEIGHT + DG_HEIGHT div 2;
					ds_grid_set_region(_real_map, xx, yy, xx + dg_trim - 1, yy, cellular.ImmutableGround);
					_door_check[# i, j] = true;
					_door_check[# i - 1, j] = true;
				}*/
				if(_door[# i, j] div 10 % 10 == 1){ // down door
					var xx = i * DG_WIDTH + DG_WIDTH div 2;
					var y1 = j * DG_HEIGHT + DG_HEIGHT div 2;
					var y2 = (j + 1) * DG_HEIGHT + DG_HEIGHT div 2;
					var maxR = min(_H_map[i][j], _H_map[i + 1][j]);
					var offset = irandom(maxR) - maxR div 2;
					
					for(var yy = y1; yy <= y2; yy++){
						if(random(100) <= _chance) ds_grid_set(_real_map, xx + offset - 2, yy, cellular.MutableGround);
						if(random(100) <= _chance) ds_grid_set(_real_map, xx + offset - 1, yy, cellular.MutableGround);
						if(random(100) <= _chance) ds_grid_set(_real_map, xx + offset + 1, yy, cellular.MutableGround);
						if(random(100) <= _chance) ds_grid_set(_real_map, xx + offset + 2, yy, cellular.MutableGround);
					}
					
					ds_grid_set_region(_real_map, xx + offset, y1, xx + offset, y2, cellular.ImmutableGround);
				}
				if(_door[# i, j] div 100 % 10 == 1){ // right door
					var x1 = i * DG_WIDTH + DG_WIDTH div 2;
					var x2 = (i + 1) * DG_WIDTH + DG_WIDTH div 2;
					var yy = j * DG_HEIGHT + DG_HEIGHT div 2;
					var maxR = min(_H_map[i][j], _H_map[i][j + 1]);
					var offset = irandom(maxR) - maxR div 2;
					
					for(var xx = x1; xx <= x2; xx++){
						if(random(100) <= _chance) ds_grid_set(_real_map, xx, yy + offset - 2, cellular.MutableGround);
						if(random(100) <= _chance) ds_grid_set(_real_map, xx, yy + offset - 1, cellular.MutableGround);
						if(random(100) <= _chance) ds_grid_set(_real_map, xx, yy + offset + 1, cellular.MutableGround);
						if(random(100) <= _chance) ds_grid_set(_real_map, xx, yy + offset + 2, cellular.MutableGround);
					}
					
					ds_grid_set_region(_real_map, x1, yy + offset, x2, yy + offset, cellular.ImmutableGround);
				}
				/*if(_door[# i, j] div 1000 % 10 == 1){ // up door
					var xx = i * DG_WIDTH + DG_WIDTH div 2;
					var y1 = j * DG_HEIGHT;
					var y2 = j * DG_HEIGHT;
					var maxR = min(_WH_map[i][j][1], _WH_map[i + 1][j][1]);
					var offset = irandom(maxR) - maxR div 2;
					
					ds_grid_set_region(_real_map, xx + offset, y1, xx + offset, y2, cellular.ImmutableGround);
					_door_check[# i, j] = true;
					_door_check[# i, j + 1] = true;
				}*/
			}
		}
	}
	
	return _real_map;
	
}