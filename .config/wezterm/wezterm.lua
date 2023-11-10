-- WezTerm Configuration
local wezterm = require("wezterm")

local config = {}
-- provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
config = {
  -- defaults
  term = "wezterm",
  automatically_reload_config = true,

  -- font
  font = wezterm.font({
    family = "FiraCode Nerd Font Mono",
    harfbuzz_features = {
      "zero", -- alternative 0
      "cv02", -- alternative g
      "cv25", -- .- ligature
      "cv26", -- :- ligature
      "cv27", -- [] ligature
      "cv30", -- longer bar
      "ss01", -- alternative r
      "ss03", -- alternative &
      "ss05", -- alternative @
      "ss07", -- =~ !~ ligatures
      "ss09", -- >>= <<= ||= |= ligatures
    },
  }),
  -- font = wezterm.font "Terminess Nerd Font Mono",
  font_size = 8.0,
  bold_brightens_ansi_colors = false,

  -- color
  color_scheme = "Oxocarbon Dark (Gogh)",
  -- color_scheme = "tokyonight",
  -- color_scheme = "Gruvbox Dark (Gogh)",
  -- color_scheme = "Modus-Vivendi",

  -- cursor
  default_cursor_style = "BlinkingBlock",

  -- alert
  audible_bell = "Disabled",
  visual_bell = {
    fade_in_duration_ms = 100,
    fade_out_duration_ms = 100,
    target = "CursorColor",
  },

  -- window
  window_decorations = "NONE",
  window_background_opacity = .95,
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.4 },
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  window_close_confirmation = "NeverPrompt",

  -- tabs
  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,

  -- keymaps

}

return config
