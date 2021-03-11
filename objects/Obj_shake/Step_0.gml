/// @description Insert description here
// You can write your code in this editor

if(angle > 0) angle *= angle_decrease;
else angle = 0;

if(zoom > 0.01) zoom *= zoom_decrease;
else zoom = 0;

if(shift > 0) shift *= shift_decrease;
else shift = 0;

_offsetA = random_range(-angle,angle);
_offsetB = random_range(-shift,shift);
_offsetC = random_range(-shift,shift);

camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]) + _offsetB,camera_get_view_y(view_camera[0]) + _offsetC);

camera_set_view_angle(view_camera[0], _offsetA);
if (zoom > 0) Obj_camera.zoom_shake = zoom;