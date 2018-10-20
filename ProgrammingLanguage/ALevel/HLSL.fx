sampler2D input : register(s0);
sampler2D input2 : register(s1);
// new HLSL shader

/// <summary>Explain the purpose of this variable.</summary>
/// <minValue>05/minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float SampleI : register(C0);

float4 main(float2 uv : TEXCOORD) : COLOR
{ 
 

 float4 Color;

 
 if(uv.x>1/SampleI && SampleI>1 || uv.y>1/SampleI && SampleI>1){
  
  Color=Color-Color;
 }
 else{
  Color= tex2D( input2 , uv.xy*SampleI);
 }
 return Color;
}