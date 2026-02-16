// Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 newcolor;
uniform vec3 whitereplace;
uniform bool active;

void main()
{
    

    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
    gl_FragColor =texColor;
    
    if (texColor.rgb == 0.0 && active == true){
        gl_FragColor = vec4(newcolor.rgb, texColor.a);
    }
    
    if (texColor.rgb == 1.0){
        gl_FragColor = vec4(whitereplace.rgb, texColor.a);
    }

}