vim.cmd("hi clear")
vim.g.colors_name = "milk"

local c = {
  bg = "#0d0d14",
  bg_dark = "#080810",
  bg_plum = "#1a1020",
  plum = "#52263e",
  plum_mid = "#7a3a5e",
  red = "#ac3332",
  red_soft = "#c45555",
  red_light = "#e8b4b8",
  rose = "#d4909a",
  rose_dim = "#8c5060",
  fg = "#d4909a",
  fg_dim = "#8c5060",
  fg_faint = "#5c3040",
  none = "NONE",
}

local h = vim.api.nvim_set_hl

-- Editor
h(0, "Normal", { fg = c.fg, bg = c.bg })
h(0, "NormalFloat", { fg = c.fg, bg = c.bg_plum })
h(0, "NormalNC", { fg = c.fg_dim, bg = c.bg_dark })
h(0, "Cursor", { fg = c.bg, bg = c.red })
h(0, "CursorLine", { bg = c.bg_plum })
h(0, "CursorLineNr", { fg = c.red, bold = true })
h(0, "LineNr", { fg = c.fg_faint })
h(0, "SignColumn", { fg = c.fg_faint, bg = c.bg })
h(0, "ColorColumn", { bg = c.bg_plum })
h(0, "Visual", { bg = c.plum })
h(0, "VisualNOS", { bg = c.plum })
h(0, "Search", { fg = c.bg, bg = c.red })
h(0, "IncSearch", { fg = c.bg, bg = c.red_soft })
h(0, "Pmenu", { fg = c.fg, bg = c.bg_plum })
h(0, "PmenuSel", { fg = c.bg, bg = c.red })
h(0, "PmenuSbar", { bg = c.plum })
h(0, "PmenuThumb", { bg = c.red })
h(0, "StatusLine", { fg = c.fg, bg = c.plum })
h(0, "StatusLineNC", { fg = c.fg_faint, bg = c.bg_dark })
h(0, "VertSplit", { fg = c.plum })
h(0, "WinSeparator", { fg = c.plum })
h(0, "TabLine", { fg = c.fg_dim, bg = c.bg_dark })
h(0, "TabLineSel", { fg = c.bg, bg = c.red })
h(0, "TabLineFill", { bg = c.bg_dark })
h(0, "MatchParen", { fg = c.red_light, underline = true, bold = true })
h(0, "NonText", { fg = c.fg_faint })
h(0, "SpecialKey", { fg = c.fg_faint })
h(0, "Folded", { fg = c.rose_dim, bg = c.bg_plum })
h(0, "FoldColumn", { fg = c.fg_faint, bg = c.bg })
h(0, "EndOfBuffer", { fg = c.fg_faint })

-- Syntax
h(0, "Comment", { fg = c.fg_faint, italic = true })
h(0, "Constant", { fg = c.red_light })
h(0, "String", { fg = c.rose })
h(0, "Character", { fg = c.rose })
h(0, "Number", { fg = c.red_soft })
h(0, "Boolean", { fg = c.red, bold = true })
h(0, "Float", { fg = c.red_soft })
h(0, "Identifier", { fg = c.fg })
h(0, "Function", { fg = c.red, bold = true })
h(0, "Statement", { fg = c.red })
h(0, "Keyword", { fg = c.plum_mid, bold = true })
h(0, "Conditional", { fg = c.plum_mid })
h(0, "Repeat", { fg = c.plum_mid })
h(0, "Operator", { fg = c.rose_dim })
h(0, "Exception", { fg = c.red, bold = true })
h(0, "PreProc", { fg = c.red_soft })
h(0, "Include", { fg = c.red_soft })
h(0, "Define", { fg = c.red_soft })
h(0, "Type", { fg = c.red_light })
h(0, "StorageClass", { fg = c.plum_mid })
h(0, "Structure", { fg = c.plum_mid })
h(0, "Special", { fg = c.rose })
h(0, "Underlined", { underline = true })
h(0, "Error", { fg = c.red_light, bold = true })
h(0, "Todo", { fg = c.bg, bg = c.red, bold = true })

-- Treesitter
h(0, "@variable", { fg = c.fg })
h(0, "@variable.builtin", { fg = c.rose_dim })
h(0, "@property", { fg = c.rose })
h(0, "@parameter", { fg = c.fg })
h(0, "@function", { fg = c.red, bold = true })
h(0, "@function.builtin", { fg = c.red_soft })
h(0, "@method", { fg = c.red })
h(0, "@keyword", { fg = c.plum_mid, bold = true })
h(0, "@keyword.return", { fg = c.red, bold = true })
h(0, "@string", { fg = c.rose })
h(0, "@number", { fg = c.red_soft })
h(0, "@boolean", { fg = c.red, bold = true })
h(0, "@type", { fg = c.red_light })
h(0, "@type.builtin", { fg = c.red_light, italic = true })
h(0, "@constructor", { fg = c.red_soft })
h(0, "@comment", { fg = c.fg_faint, italic = true })
h(0, "@punctuation", { fg = c.rose_dim })
h(0, "@tag", { fg = c.red })
h(0, "@tag.attribute", { fg = c.rose })

-- Diagnostics
h(0, "DiagnosticError", { fg = c.red })
h(0, "DiagnosticWarn", { fg = c.red_soft })
h(0, "DiagnosticInfo", { fg = c.rose })
h(0, "DiagnosticHint", { fg = c.rose_dim })

-- Git signs
h(0, "GitSignsAdd", { fg = c.rose_dim })
h(0, "GitSignsChange", { fg = c.red_soft })
h(0, "GitSignsDelete", { fg = c.red })

-- ---------------------------------------------------------------------------
-- Added: groups LazyVim plugins and newer treesitter/markdown rely on
-- ---------------------------------------------------------------------------

-- Floats, titles, messages
h(0, "FloatBorder", { fg = c.plum_mid, bg = c.bg_plum })
h(0, "FloatTitle", { fg = c.red, bg = c.bg_plum, bold = true })
h(0, "Title", { fg = c.red, bold = true })
h(0, "Directory", { fg = c.red_soft })
h(0, "ErrorMsg", { fg = c.red_light, bold = true })
h(0, "WarningMsg", { fg = c.red_soft })
h(0, "MoreMsg", { fg = c.rose })
h(0, "ModeMsg", { fg = c.rose, bold = true })
h(0, "Question", { fg = c.rose })
h(0, "WildMenu", { fg = c.bg, bg = c.red })
h(0, "Conceal", { fg = c.fg_faint })
h(0, "QuickFixLine", { bg = c.plum })
h(0, "CursorColumn", { bg = c.bg_plum })
h(0, "WinBar", { fg = c.fg, bg = c.bg })
h(0, "WinBarNC", { fg = c.fg_dim, bg = c.bg_dark })

-- Diff (kept in the plum/red range)
h(0, "DiffAdd", { bg = "#24161f" })
h(0, "DiffChange", { bg = "#2c1a24" })
h(0, "DiffDelete", { fg = c.red, bg = "#331519" })
h(0, "DiffText", { bg = "#4a2438" })

-- Spell
h(0, "SpellBad", { sp = c.red, undercurl = true })
h(0, "SpellCap", { sp = c.red_soft, undercurl = true })

-- LSP / diagnostics extras
h(0, "LspReferenceText", { bg = c.plum })
h(0, "LspReferenceRead", { bg = c.plum })
h(0, "LspReferenceWrite", { bg = c.plum })
h(0, "DiagnosticUnderlineError", { sp = c.red, undercurl = true })
h(0, "DiagnosticUnderlineWarn", { sp = c.red_soft, undercurl = true })
h(0, "DiagnosticUnderlineInfo", { sp = c.rose, undercurl = true })
h(0, "DiagnosticUnderlineHint", { sp = c.rose_dim, undercurl = true })

-- Treesitter (current dotted names)
h(0, "@variable.parameter", { fg = c.fg })
h(0, "@variable.member", { fg = c.rose })
h(0, "@constant", { fg = c.red_light })
h(0, "@constant.builtin", { fg = c.red_soft })
h(0, "@module", { fg = c.red_light })
h(0, "@operator", { fg = c.rose_dim })
h(0, "@keyword.function", { fg = c.plum_mid, bold = true })
h(0, "@keyword.conditional", { fg = c.plum_mid })
h(0, "@keyword.repeat", { fg = c.plum_mid })
h(0, "@keyword.import", { fg = c.red_soft })
h(0, "@function.call", { fg = c.red })
h(0, "@function.method", { fg = c.red })
h(0, "@string.escape", { fg = c.red_soft })
h(0, "@punctuation.bracket", { fg = c.rose_dim })
h(0, "@punctuation.delimiter", { fg = c.rose_dim })
h(0, "@attribute", { fg = c.red_soft })

-- Markdown (so notes and guide.md look right in nvim)
h(0, "@markup.heading", { fg = c.red, bold = true })
h(0, "@markup.strong", { bold = true })
h(0, "@markup.italic", { italic = true })
h(0, "@markup.strikethrough", { strikethrough = true })
h(0, "@markup.raw", { fg = c.red_light, bg = c.bg_plum })
h(0, "@markup.link", { fg = c.rose_dim })
h(0, "@markup.link.url", { fg = c.rose, underline = true })
h(0, "@markup.link.label", { fg = c.rose })
h(0, "@markup.list", { fg = c.red_soft })
h(0, "@markup.quote", { fg = c.fg_dim, italic = true })

-- Plugins that use their own groups
h(0, "SnacksPickerDir", { fg = c.fg_dim })
h(0, "SnacksPickerMatch", { fg = c.red, bold = true })
h(0, "WhichKey", { fg = c.red })
h(0, "WhichKeyDesc", { fg = c.fg })
h(0, "WhichKeyGroup", { fg = c.plum_mid })
h(0, "WhichKeySeparator", { fg = c.fg_faint })
h(0, "BlinkCmpMenuSelection", { fg = c.bg, bg = c.red })
h(0, "BlinkCmpMenuBorder", { fg = c.plum_mid })
h(0, "BlinkCmpLabelMatch", { fg = c.red, bold = true })
h(0, "FlashLabel", { fg = c.bg, bg = c.red, bold = true })
h(0, "FlashMatch", { fg = c.fg, bg = c.plum })
h(0, "TodoBgTODO", { fg = c.bg, bg = c.red_soft, bold = true })
