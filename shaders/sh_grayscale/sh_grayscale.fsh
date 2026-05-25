varying vec2 v_vTexcoord;
void main()
{
const vec3 ww=vec3(0.2125,0.7154,0.0721);
vec3 irgb=texture2D(gm_BaseTexture,v_vTexcoord).rgb;
float alpha=texture2D(gm_BaseTexture,v_vTexcoord).a;
float luminance=dot(irgb,ww);
gl_FragColor=vec4(luminance,luminance,luminance,alpha);
}