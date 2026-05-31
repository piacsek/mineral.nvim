-- mineral-amethyst: deep purple. The reference palette — its base values are
-- zaibatsu's exact colors, so amethyst renders identically to the original
-- deep-purple.nvim while the rest of the family recolors the same contract.
--
-- Palette key contract (every variant must define all of these):
--   Surfaces:  bg bg_float bg_inactive bg_dim bg_active bg_winbar
--              bg_cursorline bg_colorcolumn bg_visual fg_visual
--   Text:      fg_normal (editor text)  fg (UI text)  fg_muted fg_dim fg_bright
--   Syntax:    comment string variable keyword type special preproc
--              func module key constant
--   Accents:   accent (primary UI)  match (completion match)

return {
	-- Surfaces
	bg             = "#0e0024",
	bg_float       = "#1a0540",
	bg_inactive    = "#170233",
	bg_dim         = "#2a1450",
	bg_active      = "#3a1e6e",
	bg_winbar      = "#1f0a3a",
	bg_cursorline  = "#362b49", -- zaibatsu CursorLine
	bg_colorcolumn = "#510039", -- zaibatsu ColorColumn
	bg_visual      = "#5fd7ff", -- zaibatsu Visual
	fg_visual      = "#0e0024", -- dark text on bright cyan (zaibatsu Visual fg)

	-- Text
	fg_normal      = "#ffffff", -- zaibatsu Normal fg
	fg             = "#d7d5db",
	fg_muted       = "#878092",
	fg_dim         = "#a39bb0",
	fg_bright      = "#e8e6ec",

	-- Syntax (zaibatsu base)
	comment        = "#afafff",
	string         = "#ffff5f", -- Constant/String/Number/Boolean
	variable       = "#87ffff", -- Identifier/Function
	keyword        = "#ffafff", -- Statement/Keyword
	type           = "#ff5faf", -- Type/Typedef
	special        = "#87ff00", -- Special
	preproc        = "#00afff", -- PreProc/SignColumn/FoldColumn

	-- Mineral syntax accents
	func           = "#ffaf00", -- amber
	module         = "#af87ff", -- violet
	key            = "#87afff", -- cornflower
	constant       = "#d7afff", -- lavender

	-- UI accents
	accent         = "#ffd700", -- gold
	match          = "#ff87ff", -- pink
}
