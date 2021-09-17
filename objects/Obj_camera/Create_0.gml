
//--------------------------------------------------------

#region variable setting

rate = 0.1; // lerp rate

cam_width = 720;
cam_height = 405;

offsetX = 0; // shake offsetX
offsetY = 0; // shake offsetY

cam_zoom = 1.0;

focus_id = -1;

zoom_shake = 0;

targetX = x;
targetY = y;

targetTimeScale = 1.0;

globalvar screenX;
globalvar screenY;
globalvar screenW;
globalvar screenH;

dir = -271;
z = -400;
pitch = -79;

ddx = 0;
ddy = 0;



#endregion

//--------------------------------------------------------

#region camera setting

room_H = DG_HEIGHT * CELL_HEIGHT;

camera_destroy(view_camera[0]);
var cam = camera_create();
var mat_proj = matrix_build_projection_perspective_fov(90, cam_width / cam_height, 1, 32000);
camera_set_proj_mat(cam, mat_proj);
view_set_camera(0, cam);
camera_set_update_script(cam, Scr_cam_update);

image_alpha=sprite_height/255;
layer_script_begin(layer_get_id("Tiles_ground"), Scr_z_tilt_set);
layer_script_end(layer_get_id("Tiles_ground"), Scr_z_tilt_reset);
Scr_tilt_layer_sprite();
#endregion

//--------------------------------------------------------