varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_fIntensity;
const int Quality = 16;

void main() {
    vec4 Color;
    float v;
    for( float i = 0.0; i < 1.0; i += 1.0 / float(Quality) ) {
        v = 1. - u_fIntensity + i * u_fIntensity;
        Color += texture2D(gm_BaseTexture, (v_vTexcoord * v) + 0.5 - (0.5 * v));
    }
    Color /= float(Quality);
    gl_FragColor =  Color * v_vColour;
}