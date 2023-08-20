// https://gist.github.com/Beefster09/7264303ee4b4b2086f372f1e70e8eddd
// https://www.reddit.com/r/gamedev/comments/9k7xdo/fragment_shader_gist_for_smooth_pixel_scaling/
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 tint;
uniform lowp vec4 sharpness;
uniform lowp vec4 texture_size;

float sharpen(float pix_coord) {
    float norm = (fract(pix_coord) - 0.5) * 2.0;
    float norm2 = norm * norm;
    return floor(pix_coord) + norm * pow(norm2, sharpness.x) / 2.0 + 0.5;
}

void main()
{
    // OpenGL ES 2.0 doesn't have textureSize sadly so can't use it here
    // vec2 vres = textureSize(DIFFUSE_TEXTURE, 0);
    vec2 vres = vec2(texture_size.x, texture_size.y);

    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    gl_FragColor = texture2D(DIFFUSE_TEXTURE, vec2(
        sharpen(var_texcoord0.x * vres.x) / vres.x,
        sharpen(var_texcoord0.y * vres.y) / vres.y
    )) * tint_pm;
    //gl_FragColor = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy) * tint_pm;

    // To visualize how this makes the grid:
    // gl_FragColor = vec4(
    //     fract(sharpen(var_texcoord0.x * vres.x)),
    //     fract(sharpen(var_texcoord0.y * vres.y)),
    //     0.5, 1.0
    // );
}
