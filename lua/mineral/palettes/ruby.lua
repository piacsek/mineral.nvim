-- mineral-ruby: deep garnet. A near-black wine background with a muted, refined
-- red syntax palette — wine / blood red rather than hot ruby. All accents sit in
-- one tight desaturated red band so it reads cohesively (the way gold does).
-- Same key contract as amethyst.lua.

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
	bg_visual      = "#5a1422", -- muted wine selection, light text reads on it

	-- Text
	fg_normal      = "#ecccce", -- soft warm rose-white
	fg             = "#ddbfc1",
	fg_muted       = "#7e5f63",
	fg_dim         = "#aa8c8f",
	fg_bright      = "#f8e5e7",

	-- Syntax
	comment        = "#6e5256", -- muted mauve-gray
	string         = "#c08475", -- dusty rose / clay
	variable       = "#e6d1d2", -- pale warm rose-white, near fg
	keyword        = "#d6394e", -- garnet (keywords pop, not neon)
	type           = "#c78a96", -- dusty pink
	special        = "#cf6f50", -- muted terracotta
	preproc        = "#b35f6a", -- rosewood

	-- Mineral syntax accents
	func           = "#d97a5f", -- warm clay (functions; red-leaning, not gold)
	module         = "#c25578", -- wine-rose (bold in core)
	key            = "#b3818c", -- muted mauve (object keys / atoms)
	constant       = "#d56a82", -- muted rose-red

	-- UI accents
	accent         = "#f0455f", -- bright garnet (legible as fg on dark selections)
	match          = "#d56a82", -- rose
}
