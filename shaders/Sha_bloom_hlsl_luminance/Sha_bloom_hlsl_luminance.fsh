//
// Simple passthrough fragment shader
//
struct PixelShaderInput {
	float4 Position	: SV_POSITION;
	float4 Colour	: COLOR0;
	float2 Texcoord	: TEXCOORD0;
};

struct PixelShaderOutput {
	float4	base_col	: SV_TARGET0;
	float4	bloom_col	: SV_TARGET1;
};

uniform float	bloom_layer_intensity;
uniform float	bloom_layer_threshold;	// lum < threshold:						is drawn black
uniform float	bloom_layer_range;		// lum > threshold + range:				is drawn normally
										// threshold < lum < threshold + range:	is drawn darkened


PixelShaderOutput main(PixelShaderInput INPUT) {
	PixelShaderOutput OUTPUT;
	
	// Original Colour:
	float4 base_col = gm_BaseTextureObject.Sample(gm_BaseTexture, INPUT.Texcoord);
	if(base_col.a < 1.0) { discard; }
	OUTPUT.base_col	= base_col;

	// Bloom Colour:
	float lum		= dot(base_col.rgb, float3(0.229, 0.587, 0.114));
	float weight	= smoothstep(bloom_layer_threshold, bloom_layer_threshold + bloom_layer_range, lum);
	base_col.rgb	= lerp(0.0f.xxx, base_col.rgb, weight) * bloom_layer_intensity;
	OUTPUT.bloom_col= base_col;

	return OUTPUT;
}
