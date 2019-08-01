# lowrezjam-template
Defold template project for creation of low-res pixel art games with support for the following formats:

* [LOWREZJAM-2018](https://itch.io/jam/lowrezjam-2018) - 64x64 pixel template with support for on-screen controls
* [Nokia 3310 Jam](https://itch.io/jam/3310jam) - 84x48 pixel template
* Generic low-res game with user configurable pixel dimensions

The project provides a render script for rendering the game to a low-res texture that will be centered and upscaled to fit the screen dimensions. The project also provides fonts for use in low resolution pixel art games.

HTML5 demo: https://britzl.github.io/LOWREZJAM/


# Installation
You can use the template in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

https://github.com/britzl/lowrezjam-template/archive/master.zip

Or point to the ZIP file of a [specific release](https://github.com/britzl/lowrezjam-template/releases).

This repository is also available as a [GitHub Template repository](https://help.github.com/en/articles/creating-a-repository-from-a-template).

# Usage
It is quite easy to setup and use the template:

* Open `game.project` and use the render script instead of the default one from builtins.
* Add one of the provided game objects to your bootstrap collection
  * `lowrezjam/lowrezjam.go`
  * `lowrezjam/nokia3310jam.go`
  * `lowrezjam/custom.go`


# Configuring the render script
The template provides a render script that renders to a low-res texture and upscales to fit screen dimensions. The texture will be centered in the window.

## Changing low-res size
Change from the default 64x64 screen size by posting a `set_size` message to the render script with a `width` and `height` message property.

## Scale snapping
The upscaled low-res texture will by default be scaled to fill as much of the window as possible. It is possible to ensure that the upscaled texture will have a zoom that is set to an integer value by toggling scale snapping via the `toggle_scale_snap` message.

## On screen controls
The render script will also in a separate pass draw on-screen controls as per allowed rules for the jam. The on-screen controls must be a gui with material set to the provided `controls.material`.


# Fonts
The template ships with the following fonts suitable for low resolution pixel art games:

* 04b font - 5x5 pixel font (Freeware - http://www.04.jp.org/)
