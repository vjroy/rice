local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun"

-- Core
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Power menu (wlogout)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))

-- Lock screen
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Window switcher
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))

-- Drop-down terminal (quake-style scratchpad, auto-spawned via workspace rule)
hl.bind(mainMod .. " + grave",       hl.dsp.workspace.toggle_special("dropdown"))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:dropdown" }))

-- Clipboard history
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(
  "cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy"
))

-- Wallpaper picker
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh --pick"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh --random"))

-- Notification center (swaync)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Night light toggle (hyprsunset)
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprsunset-toggle.sh"))

-- Screenshots (grimblast)
hl.bind("PRINT",             hl.dsp.exec_cmd("grimblast --notify copy screen"), { locked = true })
hl.bind("SHIFT + PRINT",     hl.dsp.exec_cmd("grimblast --notify copy area"),   { locked = true })
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("grimblast --notify copy active"), { locked = true })

-- Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",       hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse move/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

-- Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Per-device config
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
