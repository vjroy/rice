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

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  scrolling = {
    fullscreen_on_one_column = true,
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo   = false,
  },

  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "caps:escape",
    kb_rules     = "",
    follow_mouse = 1,
    sensitivity  = 0,
    touchpad     = {
      natural_scroll = false,
    },
  },
})

-- Drop-down terminal scratchpad auto-spawn
hl.workspace_rule({ workspace = "special:dropdown", on_created_empty = "kitty --class kitty --title dropdown" })

-- Smart gaps: no borders/gaps when only one tiled window
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
