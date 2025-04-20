#version 140

in highp vec4          var_position;
in mediump vec3        var_normal;
in mediump vec2        var_texcoord0;

out vec4               out_fragColor;

uniform lowp sampler2D DIFFUSE_TEXTURE;

uniform fs_uniforms
{
    mediump vec4 tint;
};

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    vec4 color = texture(DIFFUSE_TEXTURE, var_texcoord0.xy) * tint_pm;
    out_fragColor = vec4(color.rgb, 1.0);
}
