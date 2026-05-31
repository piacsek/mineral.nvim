# mineral.nvim

A family of "deep" colorschemes forked from Neovim's bundled `zaibatsu`, tuned
for everyday TypeScript and Elixir work. Each variant is a deeply-saturated take
on a gemstone or mineral.

## Variants

| Colorscheme         | Tone           |
| ------------------- | -------------- |
| `mineral-amethyst`  | deep purple    |
| `mineral-gold`      | deep warm gold |
| `mineral-ruby`      | deep ruby red  |

More gems are on the way — each is just a palette swap over the same shared
highlight set.

## What's different from zaibatsu

- **Statusline** is a softer accent surface instead of bright white.
- **Floats** (LSP hover, diagnostics, plugin popups, Spectre, Harpoon, etc.) use
  a slightly-lighter-than-bg surface instead of white.
- **Completion popup** (`Pmenu` and friends) matches floats — no white background
  on `<C-x><C-o>`, nvim-cmp, blink, etc.
- **MatchParen** uses accent-on-surface instead of reverse video, so the cursor
  is visible inside matched parens.
- **Treesitter + LSP** highlights are tuned so colors stay stable when the LSP
  attaches (no flicker), and so the major lexical categories — variables,
  object keys / atoms, functions & methods, modules / namespaces / classes,
  strings, and keywords — stay visually distinct.
- **`terminal_color_0`** is lifted from zaibatsu's bg so ANSI-black UI elements
  (lazygit borders inside `:terminal`, etc.) stay visible.

## Install

With `vim.pack`:

```lua
vim.pack.add({ "https://github.com/piacsek/mineral.nvim" })
vim.cmd.colorscheme("mineral-amethyst")
```

With `lazy.nvim`:

```lua
{ "piacsek/mineral.nvim", config = function() vim.cmd.colorscheme("mineral-amethyst") end }
```

The themes inherit from Neovim's bundled `zaibatsu` (loaded via `:runtime
colors/zaibatsu.vim`), so they require no other dependencies — `zaibatsu` ships
with Neovim.

## Adding a variant

1. Create `lua/mineral/palettes/<name>.lua` returning a palette table (see
   `amethyst.lua` for the semantic key contract).
2. Create `colors/mineral-<name>.lua` with a single line:
   `require("mineral").load("<name>")`.
