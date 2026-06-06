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
