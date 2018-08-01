# lowrezjam-template
Defold template project for [LOWREZJAM-2018](https://itch.io/jam/lowrezjam-2018)

HTML5 demo: https://britzl.github.io/LOWREZJAM/

# Contents

## Renderscript
The template provides a render script that renders to a 64x64 texture and upscales to fit screen dimensions. The 64x64 texture will be centered in the window.

## On screen controls
The render script will also in a separate pass draw on-screen controls as per allowed rules for the jam. The on-screen controls must be a gui with material set to the provided `controls.material`.

## Fonts
The template ships with the following fonts suitable for low resolution pixel art games:

* 04b font - 5x5 pixel font (Freeware - http://www.04.jp.org/)
