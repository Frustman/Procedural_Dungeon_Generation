// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
	ds_list_add(CONTAINER.player_itemList, item);
	CONTAINER.player_itemCount++;
	for(var i = 0; i < ds_list_size(item.synergy); i++)
		CONTAINER.player_synergy[item.synergy[| i]]++;
	
	return true;
}