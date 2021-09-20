/// @description Insert description here
// You can write your code in this editor

instance_create_layer(0,0,"gui",Obj_mapController);

layer_depth(layer_get_id("setter"),2);
layer_depth(layer_get_id("Instances"),1);
layer_depth(layer_get_id("cutscene"),-200);
layer_depth(layer_get_id("gui"),-1);
layer_depth(layer_get_id("Asset_deco"),5);
layer_depth(layer_get_id("Tiles_ground"),7);
layer_depth(layer_get_id("Tiles_water"),9);
layer_depth(layer_get_id("Tiles_mud"),9);
layer_depth(layer_get_id("Tiles_2"),10);
layer_depth(layer_get_id("setter2"),11);