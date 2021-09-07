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
	
	float4 matrixWVP	= mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], INPUT.Position);
	
	OUTPUT.Position	= matrixWVP;
	OUTPUT.Colour	= INPUT.Colour;
	OUTPUT.Texcoord	= INPUT.Texcoord; 
	return OUTPUT;
}
