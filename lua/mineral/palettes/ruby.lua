-- mineral-ruby: deep garnet red. Diverse syntax, but anchored in the warm half
-- of the wheel so it sits seamlessly on the maroon background — golds, corals
-- and roses where amethyst uses cyans and violets. One cool teal accent (atoms /
-- map keys) provides relief and separation, the way amethyst's cyan does on
-- purple. Same key contract as amethyst.lua.

return {
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

	-- Syntax — warm-anchored, with a single cool relief (key)
	comment        = "#9a7a72", -- warm taupe
	string         = "#f5b54a", -- gold (jewel-like literal)
	variable       = "#f0cba0", -- warm sand (light, frequent token)
	keyword        = "#ff6f8f", -- rose-red (punchy, in-family)
	type           = "#ff8f7a", -- salmon
	special        = "#ffd05c", -- bright gold
	preproc        = "#d9886a", -- terracotta

	-- Mineral syntax accents
	func           = "#ff9e5c", -- coral-orange (functions pop warm)
	module         = "#ff8fc0", -- rose-pink (bold; replaces the clashing violet)
	key            = "#6fcfc0", -- muted teal (cool relief — atoms / map keys)
	constant       = "#ffb0a0", -- light coral

	-- UI accents
	accent         = "#f0455f", -- bright garnet (legible as fg on dark selections)
	match          = "#ff8fb0", -- pink
}
