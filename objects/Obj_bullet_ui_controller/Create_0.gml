/// @description Insert description here
// You can write your code in this editor

var weapon = CONTAINER.player_curWeapon;

if(weapon == noone) instance_destroy(self);

for(var i = 0; i < weapon.bullet_maxCount; i++){
    global.bullet_ui[i] = instance_create_layer(x,y,"bullet_gui",Obj_bullet_ui);
}