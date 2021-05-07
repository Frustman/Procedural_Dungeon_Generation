
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D distort_tex;

uniform float time;
uniform float size;			// should be turned into a constant once you're happy with the setting
uniform float strength;		// should be turned into a constant once you're happy with the setting



void main() {	
	// grab distortion off the distorion texture
	vec2 distort;
	distort.x = texture2D( distort_tex, fract(v_vTexcoord * size		+ vec2(0.0, time))).r		* strength;
	distort.y = texture2D( distort_tex, fract(v_vTexcoord * size * 3.4	+ vec2(0.0, time * 1.6))).g	* strength * 1.3;
	
	//// grab the base colour at the distorted texture coordinate:
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + distort);
	
}



