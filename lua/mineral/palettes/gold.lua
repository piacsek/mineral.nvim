-- mineral-gold: deep warm gold. A dark brown-gold background with a syntax
-- palette spread across the warm band (cream → amber → goldenrod → burnt
-- orange → copper) so the major lexical categories stay distinct despite the
-- monochromatic family. Same key contract as amethyst.lua.

return {
	-- Surfaces (warm brown-gold)
	bg             = "#1a1303",
	bg_float       = "#241a06",
	bg_inactive    = "#1f1605",
	bg_dim         = "#2e2208",
	bg_active      = "#43330b",
	bg_winbar      = "#241a06",
	bg_cursorline  = "#2a2008",
	bg_colorcolumn = "#3a2c0a",
	bg_visual      = "#6b5413", -- mid gold selection, dark text reads on it

	-- Text
	fg_normal      = "#f0e6c8", -- warm cream
	fg             = "#e8dcc0",
	fg_muted       = "#8a7d5a",
	fg_dim         = "#b8a878",
	fg_bright      = "#fff4d6",

	-- Syntax
	comment        = "#82765a", -- low-sat warm gray-gold
	string         = "#c2a83e", -- olive-amber (leans green to separate from func)
	variable       = "#ece0bf", -- pale wheat, near fg
	keyword        = "#d98c3c", -- burnt orange (most saturated, leans orange)
	type           = "#ddc07a", -- pale tan-gold
	special        = "#b5651d", -- copper
	preproc        = "#ad8b2c", -- brass

	-- Mineral syntax accents
	func           = "#ffc857", -- bright gold-amber (lightest, pops)
	module         = "#e0a82e", -- goldenrod (bold in core)
	key            = "#b8893f", -- bronze (object keys / atoms)
	constant       = "#d4af37", -- metallic gold

	-- UI accents
	accent         = "#ffd700", -- pure gold
	match          = "#ff9e3d", -- warm orange
}
