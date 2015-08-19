-- Window Management

-- Read through the script to see what it does. It's pretty clear based on
-- function name.

local griderr, grid  = pcall(function() return require "mjolnir.bg.grid" end)
local windowerr, window = pcall(function() return require "mjolnir.window" end)
local hotkeyerr, hotkey = pcall(function() return require "mjolnir.hotkey" end)
local alerterr, alert = pcall(function() return require "mjolnir.alert" end)

function print_if_not_table(var)
  if not(type(var) == "table") then print(var) end
end

if not griderr or not windowerr or not hotkeyerr or not alerterr then
  mjolnir.showerror("Some packages appear to be missing.")
  print("At least one package was missing. Have you installed the packages? See README.md.")
  print_if_not_table(grid)
  print_if_not_table(window)
  print_if_not_table(hotkey)
  print_if_not_table(alert)
end

mash = {"cmd", "alt", "ctrl"}

grid.GRIDHEIGHT = 2
grid.GRIDWIDTH = 4

function centerpoint()
  return { x = 1, y = 0, w = grid.GRIDWIDTH / 2, h = grid.GRIDHEIGHT }
end

function fullheightatleftwithwidth(width)
  return { x = 0, y = 0, w = width, h = grid.GRIDHEIGHT }
end
function fullheightatrightwithwidth(width)
  return { x = grid.GRIDWIDTH - width, y = 0, w = width, h = grid.GRIDHEIGHT }
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
  ["1"] = function() grid.set(window.focusedwindow(), fullheightatleftwithwidth(1), window.focusedwindow():screen()) alert.show("1") end,
  ["2"] = function() grid.set(window.focusedwindow(), fullheightatleftwithwidth(2), window.focusedwindow():screen()) alert.show("2") end,
  ["3"] = function() grid.set(window.focusedwindow(), fullheightatleftwithwidth(3), window.focusedwindow():screen()) alert.show("3") end,
  ["9"] = function() grid.set(window.focusedwindow(), fullheightatrightwithwidth(3), window.focusedwindow():screen()) alert.show("9") end,
  ["0"] = function() grid.set(window.focusedwindow(), fullheightatrightwithwidth(2), window.focusedwindow():screen()) alert.show("0") end,
  ["-"] = function() grid.set(window.focusedwindow(), fullheightatrightwithwidth(1), window.focusedwindow():screen()) alert.show("-") end,
  
  G = function()
        local point = grid.get(window.focusedwindow())
        alert.show(interp("⬌ ${x} ⬍ ${y}\n\t${w} × ${h}", point))
      end,
  Y = function() grid.resizewindow_taller() alert.show("⏫⏬") end,
  U = function() grid.resizewindow_shorter() alert.show("⏬⏫") end,
  N = function() grid.pushwindow_nextscreen() alert.show("➡️") end,
  P = function() grid.pushwindow_prevscreen() alert.show("⬅️") end,
}
print("If Mjolnir console windows can be manipulated, but others cannot, "..
      "ensure that Mjolnir is allowed in Accessibility preferences.")

for key, func in pairs(grid_shortcuts) do
  hotkey.bind(mash, key, func)
end
