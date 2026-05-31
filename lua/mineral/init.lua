-- mineral.nvim
-- A family of "deep" colorschemes forked from Neovim's bundled `zaibatsu`, with
-- friendlier popup, statusline, and treesitter/LSP highlighting tuned for
-- everyday TS + Elixir. Each variant (amethyst, …) supplies its own palette;
-- the highlight logic below is shared across all of them.

local M = {}

local function hl(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end

-- Apply the shared mineral highlight set on top of zaibatsu, using `p` (a
-- palette table) for colors and registering under colorscheme `name`.
function M.apply(name, p)
	-- Inherit zaibatsu as the base, then layer our overrides on top.
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.cmd.runtime("colors/zaibatsu.vim")
	vim.g.colors_name = name

	-- Statusline: tone down zaibatsu's bright white statusline.
	hl("StatusLine", { fg = p.fg_bright, bg = p.bg_active })
	hl("StatusLineNC", { fg = p.fg_dim, bg = p.bg_dim })

	-- Zaibatsu sets terminal_color_0 to its bg, so anything ANSI-black
	-- (e.g. lazygit borders) vanishes inside :terminal. Lift it just enough
	-- to be visible without affecting the editor background.
	vim.g.terminal_color_0 = p.bg_dim

	-- Floats (LSP hover, diagnostics, plugin popups, snacks, etc.)
	hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
	hl("FloatBorder", { fg = p.fg_muted, bg = p.bg_float })
	hl("FloatTitle", { fg = p.accent, bg = p.bg_float, bold = true })

	-- Completion popup (LSP, nvim-cmp, blink)
	hl("Pmenu", { fg = p.fg, bg = p.bg_float })
	hl("PmenuSel", { fg = p.accent, bg = p.bg_active, bold = true })
	hl("PmenuKind", { fg = p.fg_muted, bg = p.bg_float })
	hl("PmenuKindSel", { fg = p.fg_muted, bg = p.bg_active })
	hl("PmenuExtra", { fg = p.fg_muted, bg = p.bg_float })
	hl("PmenuExtraSel", { fg = p.fg_muted, bg = p.bg_active })
	hl("PmenuMatch", { fg = p.match, bg = p.bg_float, bold = true })
	hl("PmenuMatchSel", { fg = p.match, bg = p.bg_active, bold = true })
	hl("PmenuSbar", { bg = p.bg_dim })
	hl("PmenuThumb", { bg = p.fg_muted })

	-- Other surfaces zaibatsu leaves bright/white.
	hl("VisualNOS", { fg = p.fg, bg = p.bg_active })
	hl("WildMenu", { fg = p.accent, bg = p.bg_active, bold = true })
	hl("TabLine", { fg = p.fg_dim, bg = p.bg_dim })
	hl("TabLineSel", { fg = p.accent, bg = p.bg_active, bold = true })
	hl("TabLineFill", { bg = p.bg_inactive })
	hl("WinBar", { fg = p.fg, bg = p.bg_winbar })
	hl("WinBarNC", { fg = p.fg_muted, bg = p.bg_inactive })
	hl("MsgArea", { fg = p.fg, bg = p.bg })

	-- WhichKey-style overlays (covers folke/which-key.nvim and snacks variants).
	hl("WhichKeyFloat", { bg = p.bg_float })
	hl("WhichKeyBorder", { fg = p.fg_muted, bg = p.bg_float })

	-- MatchParen: zaibatsu uses reverse video which obscures the cursor.
	hl("MatchParen", { fg = p.accent, bg = p.bg_active, bold = true })

	-- Distinguish object keys from value identifiers (JSON, JS/TS, Lua tables, etc.).
	hl("@variable.member", { fg = p.key })
	hl("@property", { fg = p.key })
	-- Elixir atoms / map keys (`:foo`, `%{key: val}`).
	hl("@string.special.symbol", { fg = p.key })

	-- Function/method calls + declarations. Distinct from variables, strings,
	-- keys, keywords. Covers JS/TS + Elixir.
	hl("@function", { fg = p.func })
	hl("@function.call", { fg = p.func })
	hl("@function.method", { fg = p.func })
	hl("@function.method.call", { fg = p.func })

	-- Module / namespace names — bold. Elixir modules, TS classes &
	-- constructors all share this styling.
	hl("@module", { fg = p.module, bold = true })
	hl("@constructor", { fg = p.module, bold = true })

	-- Elixir constants (module attributes like `@foo`) — kept in the theme's
	-- secondary accent so it doesn't compete with module names.
	hl("@constant.elixir", { fg = p.constant })

	-- LSP semantic tokens override treesitter once the server attaches; keep
	-- our colors stable across pre-/post-LSP transitions.
	hl("@lsp.type.property", { fg = p.key })
	hl("@lsp.type.function", { fg = p.func })
	hl("@lsp.type.method", { fg = p.func })
	hl("@lsp.type.module", { fg = p.module, bold = true })
	hl("@lsp.type.namespace", { fg = p.module, bold = true })
	hl("@lsp.type.class", { fg = p.module, bold = true })
	hl("@lsp.type.enumMember", { link = "@variable.member" })
	hl("@lsp.typemod.enumMember.readonly", { link = "@variable.member" })
end

-- Convenience loader: `require("mineral").load("amethyst")` loads the palette
-- from `mineral.palettes.amethyst` and applies it as `mineral-amethyst`.
function M.load(variant)
	local p = require("mineral.palettes." .. variant)
	M.apply("mineral-" .. variant, p)
end

return M
