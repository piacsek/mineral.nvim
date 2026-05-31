# scintilla.nvim — repo guide

A family of "deep" gemstone colorschemes forked from Neovim's bundled
`zaibatsu`. Each variant is `scintilla-<gem>` (amethyst, ruby, jade, sapphire, …).

## Architecture

- `lua/scintilla/init.lua` — shared core. `M.apply(name, palette)` loads zaibatsu
  as a base, then drives the editor base (Normal, core syntax, line numbers,
  cursorline, selection, search), surfaces (floats, statusline, tabs, popups),
  treesitter and LSP groups from the palette. `M.load(variant)` requires
  `scintilla.palettes.<variant>` and applies it as `scintilla-<variant>`.
- `lua/scintilla/palettes/<gem>.lua` — a palette table. Every palette must define
  the full semantic key contract (see `amethyst.lua` for the canonical list:
  surfaces, text, syntax, accents).
- `colors/scintilla-<gem>.lua` — one line: `require("scintilla").load("<gem>")`.

Adding a gem = a new palette file + a one-line colors file. No core changes.

## Palette philosophy

Each gem must be **diverse** (not monochromatic) AND feel **seamless with its
background**. Two failure modes we've hit:
- Monochromatic syntax (all one hue) reads "weird."
- Amethyst's exact hues on another bg read "foreign" — its purple-family violet
  modules / cornflower atoms clash on a red or green background.

The working principle: **analogous harmony anchored on the background's hue,
plus a complementary pop or two for relief and token separation.** This is why
amethyst works — a purple-family core (violet modules, lavender constants,
cornflower keys) with cyan/yellow pops.

- **ruby** (maroon bg): warm core — golds, corals, rose-red modules — with one
  cool teal accent for atoms/keys (the "cyan relief" role).
- **jade** (green bg): green/teal/cyan core with a warm gold (strings) as the pop.

When the core drives a group from the palette, dark-on-light tricks only work on
light surfaces — e.g. `fg_visual` exists so each variant sets selected-text
color explicitly (dark on a light selection, or light on a dark one). Keep
UI-accent colors legible as foreground on dark selected backgrounds.

## Hard rules

- **Never change `scintilla-amethyst`** (palette or rendered output) unless the
  user explicitly asks. It's the reference variant and their daily theme. When
  refactoring shared code, verify amethyst's output is byte-identical (diff its
  highlight groups against the previous version / against `zaibatsu` for base
  groups).
- Each palette owns its own syntax hues — there is no shared syntax module.
- **Keep this file current.** Whenever we agree on a new convention or guideline,
  add it here in the same change.

## Verifying a change

Headless render of any variant:

```sh
nvim --headless --clean --cmd "set rtp+=$PWD" -c "colorscheme scintilla-<gem>" \
  -c "redir => m | for g in ['Normal','Statement','@module','@property','Visual','PmenuSel'] | silent exe 'hi '.g | endfor | redir END | echo m" \
  -c "qa"
```

Confirm: syntax categories are distinct, `Visual` selected-text is readable, the
UI accent reads on dark selections, and (for shared-code changes) amethyst is
unchanged.

## Sample screenshots (README gallery)

The README's Variants section has a `###` sub-section per variant — a colored
circle emoji + `` `scintilla-<gem>` `` heading, then a two-column `tsx | ex`
table holding `samples/screenshots/<gem>-tsx.png` and `<gem>-ex.png`, each
`samples/showcase.*` rendered with treesitter highlighting. **Whenever a change visibly alters a
theme** (a palette edit, a new gem, or any shared-core change that shifts
colors), regenerate the gallery so the README stays truthful:

```sh
samples/render.sh            # all variants (auto-discovered from palettes/)
samples/render.sh ruby jade  # only the named ones
```

The script drives `nvim :TOhtml` → headless Google Chrome → ImageMagick (no live
GUI screenshot). When you **add a gem**, also add a `###` sub-section to the
README's Variants section: a circle emoji matching the gem's hue + the
`` `scintilla-<gem>` `` heading, then the `tsx | ex` table
(`<gem>-tsx.png` | `<gem>-ex.png`). When you **add a syntax
construct worth showing**, extend the two `showcase.*` files (keep them
exercising the full set: modules, functions, keys/atoms, strings, types,
constants, numbers, comments) and re-run for every variant. Commit the
regenerated PNGs alongside the palette change.

## Install / dev loop

Consumed via `vim.pack` from `piacsek/scintilla.nvim`. The user develops in
`~/projects/scintilla.nvim` and the installed copy lives at
`~/.local/share/nvim/site/pack/core/opt/scintilla.nvim`. After pushing, the
installed clone can be fast-forwarded (`git fetch && git checkout <sha>`) — note
`vim.pack.update()` opens a confirmation buffer that must be `:w`-saved to apply.
