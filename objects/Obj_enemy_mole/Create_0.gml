/// @description Insert description here
// You can write your code in this editor
event_inherited();

Scr_alarm_init();

Scr_SM_default_init();

Scr_FA_init(0.3, 80, 1600, 120);
Scr_FA_attack_init(120, 300, Spr_flower_attack, Spr_flower_idle);

Scr_SM_create("MOVE", Scr_FA_move);
Scr_SM_create("ATTACK", Scr_FA_attack);

Scr_SM_init("MOVE");