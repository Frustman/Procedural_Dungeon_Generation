//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = in_Colour;
	vec4 object_space_pos = vec4(in_Position, 1.0);
	
	float top = 1.0 - mod(col.b * 255.0, 2.0);
	
	object_space_pos.z -= 255.0 * col.a * top;
	object_space_pos.y += col.a / 10.0;
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = vec4(col.rgb, 1.0);
    v_vTexcoord = in_TextureCoord;
}
