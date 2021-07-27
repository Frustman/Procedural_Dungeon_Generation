/// @description Insert description here
// You can write your code in this editor

switch(state){
	case "USE":
		draw_sprite_ext(weapon_equip_image, image_index, x, y, image_xscale, image_yscale, angle, c_white, 1.0);
		break;
	case "RELOAD":
		draw_sprite_ext(weapon_reload_anim, image_index, x, y, image_xscale, image_yscale, angle, c_white, 1.0);
		break;
	case "BACK":
		draw_sprite_ext(weapon_has_image, image_index, x, y, image_xscale, image_yscale, angle, c_white, 1.0);
		break;
	case "SHOOT":
		draw_sprite_ext(weapon_shoot_anim, image_index, x, y, image_xscale, image_yscale, angle, c_white, 1.0);
		break;
}
