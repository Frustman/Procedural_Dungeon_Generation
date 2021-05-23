//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 orange = vec3(1.0,0.55,0.0);
	
	base_col.rgb = mix(base_col.rgb,orange,0.5);
	
	base_col.rgb = (base_col.rgb - 0.5) * 2.5 + 0.5;  // contrast
	
	float value = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	vec3 out_col = mix(vec3(value), base_col.rgb, 2.0); // saturation

	gl_FragColor = v_vColour * vec4(out_col, base_col.a);
	
}
