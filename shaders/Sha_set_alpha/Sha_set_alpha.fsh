//
// Simple passthrough fragment shader
//

varying vec2	v_vPosition;
varying vec2	v_vTexcoord;
varying vec4	v_vColour;

uniform vec2	chr_pos;
uniform float	invis_min_range;
uniform float	invis_falloff_range;

void main()
{
	vec4 base_col	= texture2D( gm_BaseTexture, v_vTexcoord );
	base_col.a		*= v_vColour.a;
	
	float dis		= length(v_vPosition - chr_pos);
	float weight	= smoothstep(invis_min_range, invis_min_range + invis_falloff_range, dis);	
	float alpha		= base_col.a * min((0.2 + step(base_col.r + base_col.g + base_col.b, 0.01)), 1.0);
	
	gl_FragColor	= mix(vec4(base_col.rgb, alpha), base_col, weight);
}
