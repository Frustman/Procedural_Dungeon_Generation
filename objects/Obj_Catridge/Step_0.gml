/// @description Insert description here
// You can write your code in this editor\

image_xscale = sign(hspd);

vspd += grav * global.timeScale;

x += hspd * global.timeScale;
y += vspd * global.timeScale;