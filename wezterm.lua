-- Pull in the wezterm API
local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- This will hold the configuration.

local config = wezterm.config_builder()

 ----------------
 -- Appearance --
 ----------------
--config.color_scheme = 'Monokai Pro (Gogh)'
config.color_scheme = "Catppuccin Mocha"
--config.color_scheme = "gruvbox"
--config.color_scheme = "melange"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.window_padding = {left = 3, right = 3, top = 3, bottom = 1}
config.inactive_pane_hsb = {saturation = 0.9,brightness = 0.5}
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14


-- Tabs Config
-- =====
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom=true
-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 50000
config.enable_scroll_bar = true

-- How many lines of scrollback you want to retain per tab
--config.enable_tab_bar = true
--tab_bar_at_bottom = true
--hide_tab_bar_if_only_one_tab = true


--=======
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.notification_handling = "AlwaysShow"

-----------------------
-- Status Bar        --
-----------------------
--- https://github.com/michaelbrusegard/tabline.wez?tab=readme-ov-file
-----------------------
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'Catppuccin Mocha',
--   theme = 'GruvboxDark', 
    tabs_enabled = true,
    color_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = { 'mode' },
--    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'tab', padding = 0 },
--     { 'process', padding = 0 },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'tab', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})

tabline.apply_to_config(config)


-----------------------
-- Session Management --
-----------------------
--==
--== resurrect 
--== URL:https://github.com/MLFlexer/resurrect.wezterm/tree/main
--==============================================================
resurrect.periodic_save({
    interval_seconds = 300,
    save_tabs = true,
    save_windows = true,
    save_workspaces = true,
})


--== Reload notification each time conf file has changed 
--------------------------------------------------------
wezterm.on("window-config-reloaded", function(window, pane)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 3000)
end)



-- TMUX like
-- =========

-- Table mapping keypresses to actions
local act = wezterm.action


config.leader = { key="`", mods="NONE", timeout_milliseconds=1000 }

config.keys = {  

    -- Pass CMD+r to terminal for Neovim redo (Mac)
    { key = 'r', mods = 'CMD', action = wezterm.action.SendString("\x12") }, -- Pass Cmd+r as Ctrl+r to terminal
    
    -- Pass Ctrl+R (capital R) to terminal for Neovim redo
    { key = 'R', mods = 'CTRL', action = wezterm.action.SendString("\x12") }, -- Pass Ctrl+R as Ctrl+r to terminal

    -- WezTerm config reload
    { key = 'r', mods = 'LEADER|SHIFT', action = wezterm.action.ReloadConfiguration },

    { key = 's', mods = 'LEADER', 
    action = wezterm.action_callback(function(win, pane)
    win:toast_notification("WezTerm", "Session saved successfully!", nil, 3000)
    resurrect.save_state(resurrect.workspace_state.get_workspace_state())
    resurrect.window_state.save_window_action()
    end)},

    -- Restore session
    { key = 'r', mods = 'LEADER', 
    action = wezterm.action_callback(function(win, pane)
    resurrect.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$") -- match after '/'
        id = string.match(id, "(.+)%..+$") -- remove file extention
        local opts = {
          relative = true,
          restore_text = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }
        if type == "workspace" then
          local state = resurrect.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    win:toast_notification("WezTerm", "Session restored successfully!", nil, 3000)
    end),
  },

    -- Session Manager - Delete old sessions (LEADER + Shift + D)
    { key = 'D', mods = 'LEADER|SHIFT', 
    action = wezterm.action.SpawnCommandInNewTab {
        args = { 'bash', '-c', '$HOME/.local/bin/wezterm_session_manager; exit' },
        cwd = wezterm.home_dir,
    }},

    -- TMUX Like 
    -- =========
    
    {key="-"    , mods="LEADER" , action = act.SplitVertical { domain = 'CurrentPaneDomain' }},
    {key="\\"   , mods="LEADER" , action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    {key="z"    , mods="LEADER" , action = act.TogglePaneZoomState },
    {key="c"    , mods="LEADER" , action = wezterm.action_callback(function(window, pane)
        window:perform_action(act.SpawnTab("CurrentPaneDomain"), pane)
        window:perform_action(
            act.PromptInputLine {
                description = "Name this tab:",
                action = wezterm.action_callback(function(win, p, line)
                    if line and line ~= "" then
                        win:active_tab():set_title(line)
                    end
                end),
            },
            pane
        )
    end)},
    {key="q"    , mods="LEADER" , action = act.CloseCurrentPane { confirm = true }},

 -- Rename tab (LEADER + r)
    {
        key = ",",
        mods = "LEADER",
        action = act.PromptInputLine {
            description = "Rename Tab",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },

    {key="LeftArrow", mods="OPT", action=act.ActivatePaneDirection("Left")},
	{key="DownArrow", mods="OPT", action=act.ActivatePaneDirection("Down")},
    {key="UpArrow", mods="OPT", action=act.ActivatePaneDirection("Up")},
    {key="RightArrow", mods="OPT", action=act.ActivatePaneDirection("Right")},

	{key="LeftArrow", mods="OPT|SHIFT", action=act{AdjustPaneSize={"Left", 5}}},
	{key="DownArrow", mods="OPT|SHIFT", action=act{AdjustPaneSize={"Down", 5}}},
	{key="UpArrow", mods="OPT|SHIFT", action=act{AdjustPaneSize={"Up", 5}}},
	{key="RightArrow", mods="OPT|SHIFT", action=act{AdjustPaneSize={"Right", 5}}},

	{key=">", mods="OPT|SHIFT", action=act.RotatePanes 'Clockwise'},
	{key="<", mods="OPT|SHIFT", action=act.RotatePanes 'CounterClockwise'},


	{key="`", mods="LEADER", action=act.ActivateLastTab},
	{key=" ", mods="LEADER", action=act.ActivateTabRelative(1)},
	{key="1", mods="LEADER", action=act{ActivateTab=0}},
	{key="2", mods="LEADER", action=act{ActivateTab=1}},
	{key="3", mods="LEADER", action=act{ActivateTab=2}},
	{key="4", mods="LEADER", action=act{ActivateTab=3}},
	{key="5", mods="LEADER", action=act{ActivateTab=4}},
	{key="6", mods="LEADER", action=act{ActivateTab=5}},
	{key="7", mods="LEADER", action=act{ActivateTab=6}},
	{key="8", mods="LEADER", action=act{ActivateTab=7}},
	{key="9", mods="LEADER", action=act{ActivateTab=8}},
	{key="x", mods="LEADER", action=act{CloseCurrentPane={confirm=true}}},

    -- Activate Copy Mode
	{key="[", mods="LEADER", action=act.ActivateCopyMode},
     -- Paste from Copy Mode
    {key="]", mods="LEADER", action=act.PasteFrom("PrimarySelection")},
   


-- Enter y to copy and quit the copy mode.
    {key="y", mods="LEADER", action=act.Multiple{
        act.CopyTo("ClipboardAndPrimarySelection"),
        act.CopyMode("Close"),
    }},
    -- Enter search mode to edit the pattern.
    -- When the search pattern is an empty string the existing pattern is preserved
   {key="/", mods="LEADER", action=act{Search={CaseSensitiveString=""}}},
   {key="?", mods="LEADER", action=act{Search={CaseInSensitiveString=""}}},
--   {key="DownArrow", mods="OPT", action=act{CopyMode="NextMatch"}},
--   {key="UpArrow", mods="OPT", action=act{CopyMode="PriorMatch"}},
    

    -- Ctrl+t as CMD+t
   { key = "t", mods = "CMD", action = wezterm.action.SendString("\x14")  },  -- Send Cmd+t
    -- Ctrl+c as CMD+c
   { key = "c", mods = "CMD", action = wezterm.action.SendString("\x03")  },  -- Send Cmd+C
    -- Ctrl+a as CMD+a
   { key = "a", mods = "CMD", action = wezterm.action.SendString("\x01")  },  -- Send Cmd+a
    -- Ctrl+e as CMD+e
   { key = "e", mods = "CMD", action = wezterm.action.SendString("\x05")  },  -- Send Cmd+e
    -- Ctrl+b as CMD+ SHIFT +a
   { key = "a", mods = "CMD|SHIFT", action = wezterm.action.SendString("\x1bb")  },  -- Send Cmd+b
    -- Ctrl+f as CMD+ Shift +e
   { key = "e", mods = "CMD|SHIFT", action = wezterm.action.SendString("\x1bf")  },  -- Send Cmd+f


   { key = "l", mods = "CMD", action = wezterm.action.SendString("clear\n") },  -- Send clear command

}  --- config.key 
    

config.colors = {
  tab_bar = {
    -- The background color of the tab bar
    background = "#1e1e2e",

    -- The active tab title color
    active_tab = {
      bg_color = "#5e81ac", -- Background color of the active tab
      fg_color = "#eceff4", -- Foreground (text) color of the active tab
      italic = false,
    },

    -- Inactive tab colors
    inactive_tab = {
      bg_color = "#2e3440", -- Background color of inactive tabs
      fg_color = "#d8dee9", -- Foreground (text) color of inactive tabs
    },

    -- Hovered tab colors
    inactive_tab_hover = {
      bg_color = "#434c5e", -- Background color when the mouse hovers over an inactive tab
      fg_color = "#eceff4", -- Foreground (text) color when hovering over inactive tabs
      italic = true,
    },

    -- New tab button
    new_tab = {
      bg_color = "#3b4252", -- Background color of the new tab button
      fg_color = "#d8dee9", -- Foreground (text) color of the new tab button
    },
    new_tab_hover = {
      bg_color = "#5e81ac", -- Background color when the mouse hovers over the new tab button
      fg_color = "#eceff4", -- Foreground (text) color when hovering over the new tab button
      italic = false,
    },
  },
}

-- and finally, return the configuration to wezterm
return config
