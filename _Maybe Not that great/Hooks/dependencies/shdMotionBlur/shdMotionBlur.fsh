varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 pos;
const int Quality = 16;

void main()
{
    vec4 Color;
    for( float i=0.0;i<1.0;i+=1.0/float(Quality) )
    {
      Color += texture2D( gm_BaseTexture, v_vTexcoord+vec2(pos.x,pos.y)*i);
    }
    Color /= float(Quality);
    gl_FragColor =  Color * v_vColour;
}