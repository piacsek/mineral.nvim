-- mineral-ruby: deep garnet red. A near-black wine background carrying amethyst's
-- colorful syntax rainbow — gem identity comes from the maroon surfaces + garnet
-- UI accent, while code stays a diverse, readable rainbow. Same key contract as
-- amethyst.lua; syntax hues are shared from _rainbow.lua.

local rainbow = require("mineral.palettes._rainbow")

return vim.tbl_extend("force", rainbow, {
	-- Surfaces (near-black wine)
	bg             = "#150406",
	bg_float       = "#1f080b",
	bg_inactive    = "#1a0608",
	bg_dim         = "#2a0b10",
	bg_active      = "#3d1018",
	bg_winbar      = "#1f080b",
	bg_cursorline  = "#240a0e",
	bg_colorcolumn = "#330d15",
	bg_visual      = "#5a1422", -- muted wine selection
	fg_visual      = "#f8e5e7", -- light rose text on the dark wine (readable)

	-- Text
	fg_normal      = "#ecccce", -- soft warm rose-white
	fg             = "#ddbfc1",
	fg_muted       = "#7e5f63",
	fg_dim         = "#aa8c8f",
	fg_bright      = "#f8e5e7",

	-- Comment — tinted to the gem
	comment        = "#8a6a70", -- muted mauve

	-- UI accent
	accent         = "#f0455f", -- bright garnet (legible as fg on dark selections)
})
