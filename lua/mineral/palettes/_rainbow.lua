-- Shared "rainbow" syntax hues — amethyst's proven diverse set. Colorful
-- variants (ruby, jade, …) spread this into their palette and override only
-- surfaces / text / comment / accent, so gem identity comes from the background
-- and UI accent while code stays a consistent, readable rainbow.
--
-- amethyst defines these values literally in its own file and is intentionally
-- NOT wired to this module, so it can never drift (see the user's "amethyst is
-- perfect, don't touch it" rule).

return {
	string   = "#ffff5f", -- yellow
	variable = "#87ffff", -- cyan
	keyword  = "#ffafff", -- pink
	type     = "#ff5faf", -- pink-red
	special  = "#87ff00", -- lime
	preproc  = "#00afff", -- blue
	func     = "#ffaf00", -- amber
	module   = "#af87ff", -- violet
	key      = "#87afff", -- cornflower
	constant = "#d7afff", -- lavender
	match    = "#ff87ff", -- pink (completion match)
}
