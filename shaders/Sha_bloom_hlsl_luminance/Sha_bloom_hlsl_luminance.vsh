//
// Simple passthrough vertex shader
//
struct VertexShaderInput {
	float4 Position	: POSITION;
	float4 Colour	: COLOR0;
	float2 Texcoord	: TEXCOORD0;
};

struct VertexShaderOutput {
	float4 Position	: SV_POSITION;
	float4 Colour	: COLOR0;
	float2 Texcoord	: TEXCOORD0;
};


VertexShaderOutput main(VertexShaderInput INPUT) {
	VertexShaderOutput OUTPUT;
	
	float4 object_space_pos = float4(INPUT.Position.xyz, 1.0);
	float4 col = INPUT.Colour;
	
	float top = 1.0 - (col.b * 255.0 % 2.0);
	
	object_space_pos.z -= 255.0 * col.a * top;
	object_space_pos.y += col.a / 10.0;
	
	float4 matrixWVP	= mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], object_space_pos);
	
	OUTPUT.Position	= matrixWVP;
	OUTPUT.Colour	= INPUT.Colour;
	OUTPUT.Texcoord	= INPUT.Texcoord; 
	return OUTPUT;
}
