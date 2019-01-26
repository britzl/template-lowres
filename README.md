# lowrezjam-template
Defold template project created for the [LOWREZJAM-2018](https://itch.io/jam/lowrezjam-2018) but adapted to also work with other low-res projects.

HTML5 demo: https://britzl.github.io/LOWREZJAM/

# Contents

## Renderscript
The template provides a render script that renders to a low-res texture and upscales to fit screen dimensions. The texture will be centered in the window.

### Changing low-res size
Change from the default 64x64 screen size by posting a `set_size` message to the render script with a `width` and `height` message property.

### Scale snapping
The upscaled low-res texture will by default be scaled to fill as much of the window as possible. It is possible to ensure that the upscaled texture will have a zoom that is set to an integer value by toggling scale snapping via the `toggle_scale_snap` message.

## On screen controls
The render script will also in a separate pass draw on-screen controls as per allowed rules for the jam. The on-screen controls must be a gui with material set to the provided `controls.material`.

## Fonts
The template ships with the following fonts suitable for low resolution pixel art games:

* 04b font - 5x5 pixel font (Freeware - http://www.04.jp.org/)
