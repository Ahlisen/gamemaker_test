//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float palette;
uniform sampler2D paletteTexture;
uniform vec4 pal_uvs;

void main()
{
    vec2 uv = v_vTexcoord.xy;
    vec4 col = texture2D(gm_BaseTexture, vec2(uv.x, uv.y));
    
    //col.r *= blue;
    float range = pal_uvs.z - pal_uvs.x;
    float pal_r = pal_uvs.w - pal_uvs.y;
    vec4 col_new = texture2D(paletteTexture, vec2(pal_uvs.x+col.r*range, pal_uvs.y+palette*pal_r));
    gl_FragColor = col_new;//v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

