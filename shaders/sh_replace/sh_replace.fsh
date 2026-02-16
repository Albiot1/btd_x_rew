// Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 newcolor;
uniform bool active;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
    if (texColor.rgb == 0.0 && active == true){
        gl_FragColor = vec4(newcolor.rgb, texColor.a);
    }
    else{
        gl_FragColor = texColor;
    }
}