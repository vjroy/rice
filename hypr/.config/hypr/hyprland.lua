-- ==================
-- MONITORS
-- ==================
hl.monitor({
  output   = "DP-1",
  mode     = "2560x1440@240",
  position = "auto",
  scale    = "auto",
})

-- ==================
-- ENV VARIABLES
-- ==================
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- ==================
-- AUTOSTART
-- ==================
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh --restore")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("~/.config/hypr/scripts/startup-layout.sh")
end)

-- ==================
-- LOOK AND FEEL
-- ==================
hl.config({
  general = {
    gaps_in          = 5,
    gaps_out         = 20,
    border_size      = 2,
    col              = {
      active_border   = "rgba(fabd2fee)",
      inactive_border = "rgba(504945aa)",
    },
    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },

  decoration = {
    rounding         = 8,
    rounding_power   = 2,
    active_opacity   = 1.0,
    inactive_opacity = 1.0,
    shadow           = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = 0xee282828,
    },
    blur             = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    },
  },

  animations = { enabled = true },

  dwindle  = { preserve_split = true },
  master   = { new_status = "master" },

  scrolling = { fullscreen_on_one_column = true },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo   = false,
  },

  input = {
    kb_layout  = "us",
    kb_options = "caps:escape",
    follow_mouse = 1,
    sensitivity  = 0,
    touchpad     = { natural_scroll = false },
  },
})

-- ==================
-- ANIMATIONS
-- ==================
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  spring = "easy",       style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",     style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",      style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- ==================
-- SMART GAPS
-- ==================
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
hl.window_rule({
  name  = "no-gaps-wtv1",
  match = { float = false, workspace = "w[tv1]" },
  border_size = 0,
  rounding    = 0,
})
hl.window_rule({
  name  = "no-gaps-f1",
  match = { float = false, workspace = "f[1]" },
  border_size = 0,
  rounding    = 0,
})

-- ==================
-- WINDOW RULES
-- ==================
hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true,
})
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move  = "20 monitor_h-120",
  float = true,
})

-- Startup layout: nvim left, Chrome right on workspace 1
hl.window_rule({ name = "startup-nvim",   match = { class = "kitty", title = "nvim" },  workspace = "1" })
hl.window_rule({ name = "startup-chrome", match = { class = "google-chrome" },           workspace = "1" })

-- Float common utility windows
hl.window_rule({ name = "float-pavucontrol",  match = { class = "pavucontrol" },         float = true, size = "800 500", center = true })
hl.window_rule({ name = "float-nm-editor",    match = { class = "nm-connection-editor" }, float = true, size = "900 600", center = true })
hl.window_rule({ name = "float-blueman",      match = { class = "blueman-manager" },      float = true, size = "700 500", center = true })
hl.window_rule({ name = "float-calculator",   match = { class = "org.gnome.Calculator" }, float = true, size = "400 600", center = true })
hl.window_rule({ name = "float-btop",         match = { class = "kitty", title = "btop" }, float = true, size = "1200 700", center = true })
hl.window_rule({ name = "float-dropdown",     match = { class = "kitty", title = "dropdown" }, float = true, size = "1200 600", move = "center 20" })

-- ==================
-- KEYBINDINGS
-- ==================
local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Power menu
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))

-- Lock screen
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Window / app switcher
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))

-- Drop-down terminal scratchpad
hl.bind(mainMod .. " + grave",         hl.dsp.workspace.toggle_special("dropdown"))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:dropdown" }))

-- Clipboard history
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(
  "cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy"
))

-- Wallpaper
hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh --pick"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh --random"))

-- Notification center
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Night light toggle
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprsunset-toggle.sh"))

-- Screenshots
hl.bind("PRINT",               hl.dsp.exec_cmd("grimblast --notify copy screen"), { locked = true })
hl.bind("SHIFT + PRINT",       hl.dsp.exec_cmd("grimblast --notify copy area"),   { locked = true })
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("grimblast --notify copy active"), { locked = true })

-- Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
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
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Per-device
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
