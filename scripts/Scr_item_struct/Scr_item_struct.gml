// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum synergy_name{
	sharpshooter = 0,
	flame = 1,
	explosion = 2,
	chain = 3,
	penetrate = 4
};

Item = {
	name : "name",
	sprite : Spr_itemTable,
	index : 0,
	info : "",
	synergy : -1
	/*Exist : function(){
		if(name == "name") return false;
		else return true;
	}*/
};

function Item(_name, _sprite, _index, _info) constructor{
	name = _name;
	sprite = _sprite;
	index = _index;
	info = _info;
	synergy = ds_list_create();
	static Exist = function(){
		if(name == "name") return false;
		else return true;
	}
}

function Scr_item_struct(){

}

function Scr_item_get(item){
	var idx = ds_list_find_index(Obj_valueContainer.player_itemList,item);	
	if(idx != -1) return false;
	else {
		ds_list_add(Obj_valueContainer.player_itemList, item);
		Obj_valueContainer.player_itemCount++;
	}
	
	return true;
}