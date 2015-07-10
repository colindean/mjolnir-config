-- Window Management

-- Read through the script to see what it does. It's pretty clear based on
-- function name. 

local grid = require "mjolnir.bg.grid"
local window = require "mjolnir.window"
local hotkey = require "mjolnir.hotkey"
local alert = require "mjolnir.alert"

mash = {"cmd", "alt", "ctrl"}

grid.GRIDHEIGHT = 2
grid.GRIDWIDTH = 4

function centerpoint()
  return { x = 1, y = 0, w = grid.GRIDWIDTH / 2, h = grid.GRIDHEIGHT }
end

function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

local grid_shortcuts = {
  [";"] = function() grid.snap(window.focusedwindow()) alert.show("╔═╦═╗\n   s  n \n╠═╬═╣\n   a  p \n╚═╩═╝") end,
  J = function() grid.pushwindow_up() alert.show("🔼") end,
  H = function() grid.pushwindow_left() alert.show("◀️") end,
  L = function() grid.pushwindow_right() alert.show("▶️") end,
  K = function() grid.pushwindow_down() alert.show("🔽") end,
  I = function() grid.resizewindow_thinner() alert.show("⏩⏪") end,
  O = function() grid.resizewindow_wider() alert.show("⏪⏩") end,
  M = function() grid.maximize_window() alert.show("⏪⏫⏬⏩") end,
  C = function() grid.set(window.focusedwindow(), centerpoint(), window.focusedwindow():screen()) alert.show("↹") end,
  G = function()
        local point = grid.get(window.focusedwindow())
        alert.show(interp("⬌ ${x} ⬍ ${y}\n\t${w} × ${h}", point))
      end,
  Y = function() grid.resizewindow_taller() alert.show("⏫⏬") end,
  U = function() grid.resizewindow_shorter() alert.show("⏬⏫") end,
  N = function() grid.pushwindow_nextscreen() alert.show("➡️") end,
  P = function() grid.pushwindow_prevscreen() alert.show("⬅️") end,
}

for key, func in pairs(grid_shortcuts) do
  hotkey.bind(mash, key, func)
end
