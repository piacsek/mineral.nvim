-- mineral-jade: deep jade green. A dark green-black background carrying amethyst's
-- colorful syntax rainbow — gem identity comes from the green surfaces + emerald
-- UI accent, while code stays a diverse, readable rainbow. Same key contract as
-- amethyst.lua; syntax hues are shared from _rainbow.lua.

local rainbow = require("mineral.palettes._rainbow")

return vim.tbl_extend("force", rainbow, {
	-- Surfaces (deep green-black)
	bg             = "#04120c",
	bg_float       = "#071c12",
	bg_inactive    = "#06160e",
	bg_dim         = "#0b2618",
	bg_active      = "#103a24",
	bg_winbar      = "#071c12",
	bg_cursorline  = "#0a2014",
	bg_colorcolumn = "#0d2c1a",
	bg_visual      = "#14492e", -- mid jade selection
	fg_visual      = "#e6f4ec", -- light mint text on the selection (readable)

	-- Text
	fg_normal      = "#d8ecdf", -- soft mint-white
	fg             = "#c8e0d2",
	fg_muted       = "#5f8070",
	fg_dim         = "#93b3a2",
	fg_bright      = "#ecf8f1",

	-- Comment — tinted to the gem
	comment        = "#557a66", -- muted sage-gray

	-- UI accent
	accent         = "#2ee68a", -- vivid jade-emerald (legible as fg on dark)
})
