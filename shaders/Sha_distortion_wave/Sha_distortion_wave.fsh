//
// Simple passthrough fragment shader
//
varying vec2		v_vTexcoord;

uniform float		fx_strength;
uniform float		aspect;
uniform float		aberration;
uniform sampler2D	tex_waves;

#define BORDER_COL vec3(0.2, 0.25, 0.3)


void main() {
	// --------------------------------------------------------------------
	// OFFSET FROM NORMAL
	// --------------------------------------------------------------------
	vec2 offset	= (texture2D( tex_waves, v_vTexcoord ).rg - 0.5) * 2.0 * fx_strength;
	offset.x	/= aspect;
	
	
	// --------------------------------------------------------------------
	// COLOUR VERSIONS
	// --------------------------------------------------------------------
	vec4 out_col;
	
	// v1: Plain:----------------------------------------------------------
	//out_col			=	texture2D(gm_BaseTexture, v_vTexcoord + offset);
	
	// v2: Simple Blur:----------------------------------------------------
	/*out_col			=	(texture2D(gm_BaseTexture, v_vTexcoord + offset) + 
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) +
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration))) *
						0.33;*/
	
	// v3a: Chromatic Aberation magenta/cyan:------------------------------
	out_col			=	(texture2D(gm_BaseTexture, v_vTexcoord + offset) +                   //vec4(vec3(1.0, 1.0, 1.0), 1.0)
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) * vec4(vec3(1.0, 0.0, 1.0), 1.0) +
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration)) * vec4(vec3(0.0, 1.0, 1.0), 1.0)) *
						vec4(0.5, 0.5, 0.33, 0.33);                                          //          2.0  2.0  3.0   3.0 -> * 0.5, 0.5, 0.33, 0.33
	
	// v3b: Chromatic Aberation orange/blue:------------------------------
	/*out_col			=	(texture2D(gm_BaseTexture, v_vTexcoord + offset) +                   //vec4(vec3(1.0, 1.0, 1.0), 1.0)
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 - aberration)) * vec4(vec3(1.0, 0.5, 0.0), 1.0) +
						texture2D(gm_BaseTexture, v_vTexcoord + offset * (1.0 + aberration)) * vec4(vec3(0.0, 0.5, 1.0), 1.0)) *
						vec4(0.5, 0.5, 0.5, 0.33);                                               //      2.0  2.0  2.0   3.0 -> * 0.5, 0.5, 0.5, 0.33
	*/
	
	
	// --------------------------------------------------------------------
	// OPTIONAL BORDER:
	// --------------------------------------------------------------------	
	float border	=	step(abs(v_vTexcoord.x + offset.x - 0.5), 0.5) *
						step(abs(v_vTexcoord.y + offset.y - 0.5), 0.5);
	out_col.rgb		=	out_col.rgb * border + (1.0 - border) * BORDER_COL;
	
	
	
	// --------------------------------------------------------------------
	// OUTPUT:
	// --------------------------------------------------------------------
	gl_FragColor	= out_col;
}
