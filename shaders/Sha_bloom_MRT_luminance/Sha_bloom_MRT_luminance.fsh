/*-----------------------------------------------------------------------------
Bloom Shader 1 - Filter Lights: Draws only light colours to a bloom/blur surface
Fragment Shader: Filter the lights
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float	bloom_layer_intensity;
uniform float	bloom_layer_threshold;	// lum < threshold:						is drawn black
uniform float	bloom_layer_range;		// lum > threshold + range:				is drawn normally
										// threshold < lum < threshold + range:	is drawn darkened

void main() {
	// Original Colour:
    vec4 base_col	= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragData[0]	= base_col;
	
	// Bloom Colour:
	float lum		= dot(base_col.rgb, vec3(0.229, 0.587, 0.114));
	float weight	= smoothstep(bloom_layer_threshold, bloom_layer_threshold + bloom_layer_range, lum);
	base_col.rgb	= mix(vec3(0.0), base_col.rgb, weight) * bloom_layer_intensity;
	gl_FragData[1]	= base_col;
}
