-- mineral-ruby: deep ruby red. A dark maroon background with jewel-tone syntax
-- spread across the warm-red band (crimson → coral → rose → orchid) plus a pale
-- rose text, so the major lexical categories stay distinct. Same key contract
-- as amethyst.lua.

return {
	-- Surfaces (deep maroon)
	bg             = "#1a0509",
	bg_float       = "#260810",
	bg_inactive    = "#20060c",
	bg_dim         = "#320a14",
	bg_active      = "#4a0f1e",
	bg_winbar      = "#260810",
	bg_cursorline  = "#2c0a12",
	bg_colorcolumn = "#3d0c18",
	bg_visual      = "#6b1228", -- mid ruby selection, dark text reads on it

	-- Text
	fg_normal      = "#f5d8dc", -- soft rosy white
	fg             = "#e8ccd0",
	fg_muted       = "#8a6a70",
	fg_dim         = "#b8949a",
	fg_bright      = "#fff0f2",

	-- Syntax
	comment        = "#7a5560", -- muted mauve-gray
	string         = "#d99a8a", -- clay rose
	variable       = "#f0dde0", -- pale rose-white, near fg
	keyword        = "#ff4d6d", -- vivid crimson (keywords pop)
	type           = "#d99ab0", -- dusty pink
	special        = "#ff7e5f", -- coral
	preproc        = "#c96f7a", -- rosewood

	-- Mineral syntax accents
	func           = "#ff9e6b", -- coral-orange (leans orange to separate from reds)
	module         = "#e070a8", -- orchid-magenta (bold in core)
	key            = "#c98fa0", -- dusty mauve (object keys / atoms)
	constant       = "#ff8fb0", -- bright pink

	-- UI accents
	accent         = "#ff2d55", -- vivid ruby
	match          = "#ff8fb0", -- pink
}
