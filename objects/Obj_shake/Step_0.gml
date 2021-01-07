/// @description Insert description here
// You can write your code in this editor

if(angle > 0) angle *= 0.9;
else angle = 0;

if(zoom > 0.01) zoom *= 0.5;
else zoom = 0;

_offsetA = random_range(-angle,angle);

camera_set_view_angle(view_camera[0], _offsetA);
if (zoom > 0) Obj_camera.zoom_shake = zoom;