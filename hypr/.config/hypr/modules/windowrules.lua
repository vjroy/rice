-- Suppress maximize requests globally
hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

-- Fix XWayland drag issues
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

-- Hyprland-run internal utility
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move  = "20 monitor_h-120",
  float = true,
})

-- Float common utility windows at sensible sizes
hl.window_rule({ name = "float-pavucontrol",  match = { class = "pavucontrol" },       float = true, size = "800 500",  center = true })
hl.window_rule({ name = "float-nm-applet",    match = { class = "nm-connection-editor"},float = true, size = "900 600",  center = true })
hl.window_rule({ name = "float-blueman",      match = { class = "blueman-manager" },    float = true, size = "700 500",  center = true })
hl.window_rule({ name = "float-calculator",   match = { class = "org.gnome.Calculator"},float = true, size = "400 600",  center = true })
hl.window_rule({ name = "float-file-dialog",  match = { title = "Open File" },          float = true,                    center = true })
hl.window_rule({ name = "float-file-dialog2", match = { title = "Save File" },          float = true,                    center = true })
hl.window_rule({ name = "float-dolphin-small",match = { class = "dolphin", title = ".*Properties.*" }, float = true, center = true })
hl.window_rule({ name = "float-btop",         match = { class = "kitty", title = "btop" }, float = true, size = "1200 700", center = true })

-- Drop-down terminal (scratchpad)
hl.window_rule({ name = "float-dropdown",     match = { class = "kitty", title = "dropdown" }, float = true, size = "1200 600", move = "center 20" })

-- wlogout fullscreen overlay
hl.layer_rule({ name = "wlogout-blur", match = { namespace = "wlogout" }, blur = true })
