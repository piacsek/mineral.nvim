-- mineral-jade: deep jade green. A dark green-black background with a cohesive
-- green syntax palette spread across the band (chartreuse → emerald → mint →
-- jade-teal) for distinctness, plus a soft mint text. Same key contract as
-- amethyst.lua.

return {
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

	-- Syntax
	comment        = "#557a66", -- muted sage-gray
	string         = "#b8d98a", -- chartreuse / yellow-green (leans warm to separate)
	variable       = "#d8ecdf", -- pale mint-white, near fg
	keyword        = "#46d98a", -- emerald (keywords pop)
	type           = "#8fd6b8", -- soft jade
	special        = "#5fd9c0", -- teal-mint
	preproc        = "#6fb88a", -- sage green

	-- Mineral syntax accents
	func           = "#79e6a8", -- bright mint-green (functions)
	module         = "#3bbfae", -- jade-teal, cooler (bold in core)
	key            = "#a0c98a", -- sage-chartreuse (object keys / atoms)
	constant       = "#b8e69a", -- light chartreuse

	-- UI accents
	accent         = "#2ee68a", -- vivid jade-emerald (legible as fg on dark)
	match          = "#79e6c0", -- mint
}
