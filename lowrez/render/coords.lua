
-- A module for converting mouse coordinates to GUI coordinates for checking collision with GUI nodes.

local M = {}

local proj_w = sys.get_config_int("display.width", 960)
local proj_h = sys.get_config_int("display.height", 640)

M.window_width, M.window_height = proj_w, proj_h
M.game_width = 64
M.game_height = 64
M.scale_snap = true

local function get_zoom()
	local zoom = math.min(M.window_width / M.game_width, M.window_height / M.game_height)
	if M.scale_snap then
		zoom = math.max(1, math.floor(zoom))
	end
	return zoom
end

local function get_offset(zoom)
	local w, h = M.game_width * zoom, M.game_height * zoom
	return (M.window_width - w)/2, (M.window_height - h)/2
end

function M.action_to_screen(ax, ay)
	local sx = (ax / proj_w) * M.window_width
	local sy = (ay / proj_h) * M.window_height
	return sx, sy
end
local action_to_screen = M.action_to_screen

function M.screen_to_action(sx, sy)
	local ax = sx * proj_w / M.window_width
	local ay = sy * proj_h / M.window_height
	return ax, ay
end
local screen_to_action = M.screen_to_action

function M.action_to_gui_pick(ax, ay)
	local sx, sy = action_to_screen(ax, ay) -- It's way less confusing to work in real screen coords.

	local action_width, action_height = screen_to_action(M.game_width, M.game_height) -- Bottom left of gui is always at 0, 0.
	local scalex, scaley = action_width/M.game_width, action_height/M.game_height

	local zoom = get_zoom()
	local ox, oy = get_offset(zoom)

	local x = (sx - ox)/zoom -- Zero to `width` inside canvas area.
	local y = (sy - oy)/zoom -- Zero to `height` inside canvas area.
	x, y = x * scalex, y * scaley

	return x, y -- NOTE: Not rounded to even pixels.
end

return M
