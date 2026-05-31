-- mineral-amethyst: deep purple. Derived from zaibatsu plus darker shades
-- layered above #0e0024. (Ported from deep-purple.nvim.)
--
-- Semantic palette keys (shared contract across all mineral variants):
--   bg / bg_float / bg_inactive / bg_dim / bg_active / bg_winbar  — surfaces
--   fg / fg_muted / fg_dim / fg_bright                            — text
--   accent    — primary UI accent (float title, PmenuSel, tabs, MatchParen)
--   match     — completion match highlight
--   func      — functions & methods
--   module    — modules / namespaces / classes / constructors
--   key       — object keys / properties / atoms
--   constant  — secondary accent for constants

return {
	bg          = "#0e0024",
	bg_float    = "#1a0540",
	bg_inactive = "#170233",
	bg_dim      = "#2a1450",
	bg_active   = "#3a1e6e",
	bg_winbar   = "#1f0a3a",

	fg          = "#d7d5db",
	fg_muted    = "#878092",
	fg_dim      = "#a39bb0",
	fg_bright   = "#e8e6ec",

	accent      = "#ffd700", -- gold
	match       = "#ff87ff", -- pink
	func        = "#ffaf00", -- amber
	module      = "#af87ff", -- violet
	key         = "#87afff", -- cornflower
	constant    = "#d7afff", -- lavender
}
