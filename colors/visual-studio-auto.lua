-- vscolors: port of Light/Dark (Visual Studio) themes from VS Code

vim.cmd.highlight('clear')
vim.g.colors_name = 'visual-studio-auto'

-- stylua: ignore
local palette = {
  --                light      dark
  bg           = { '#FFFFFF', '#1E1E1E' },
  fg           = { '#000000', '#D4D4D4' },
  comment      = { '#008000', '#6A9955' },
  keyword      = { '#0000FF', '#569CD6' },
  string       = { '#A31515', '#CE9178' },
  number       = { '#098658', '#B5CEA8' },
  regex        = { '#811F3F', '#D16969' },
  tag          = { '#800000', '#569CD6' },
  tag_delim    = { '#800000', '#808080' },
  raw          = { '#800000', '#CE9178' },
  attribute    = { '#E50000', '#9CDCFE' },
  key          = { '#0451A5', '#9CDCFE' },
  invalid      = { '#CD3131', '#F44747' },
  -- ui
  line         = { '#F3F3F3', '#282828' },
  panel        = { '#F3F3F3', '#252526' },
  panel_sel    = { '#0060C0', '#04395E' },
  border       = { '#C8C8C8', '#454545' },
  selection    = { '#ADD6FF', '#264F78' },
  match        = { '#A8AC94', '#515C6A' },
  find         = { '#F8C9AA', '#623314' }, -- #EA5C00 at 33% over bg
  bracket      = { '#E5EFE5', '#1B251B' }, -- #006400 at 10% over bg
  linenr       = { '#237893', '#858585' },
  linenr_cur   = { '#0B216F', '#C6C6C6' },
  whitespace   = { '#D3D3D3', '#404040' },
  status       = { '#007ACC', '#007ACC' },
  status_fg    = { '#FFFFFF', '#FFFFFF' },
  -- diagnostics
  error        = { '#E51400', '#F14C4C' },
  warn         = { '#BF8803', '#CCA700' },
  info         = { '#0063D3', '#59A4F9' },
  hint         = { '#6C6C6C', '#B0B0B0' },
  ok           = { '#388A34', '#89D185' },
  -- diff backgrounds
  diff_add     = { '#E2F1DB', '#2B3A22' },
  diff_change  = { '#DCE8F5', '#243342' },
  diff_delete  = { '#F8D7D7', '#4B2323' },
  diff_text    = { '#B8D4F0', '#35506E' },
}

local i = vim.o.background == 'light' and 1 or 2
local c = vim.tbl_map(function(pair) return pair[i] end, palette)

-- stylua: ignore
local highlights = {
  -- :h highlight-groups
  ColorColumn    = { bg = c.line },
  CurSearch      = { bg = c.match },
  CursorColumn   = { bg = c.line },
  CursorLine     = { bg = c.line },
  CursorLineNr   = { fg = c.linenr_cur },
  DiffAdd        = { bg = c.diff_add },
  DiffChange     = { bg = c.diff_change },
  DiffDelete     = { bg = c.diff_delete },
  DiffText       = { bg = c.diff_text },
  Directory      = { fg = c.keyword },
  EndOfBuffer    = { fg = c.bg },
  ErrorMsg       = { fg = c.invalid },
  Folded         = { bg = c.line },
  IncSearch      = { bg = c.match },
  LineNr         = { fg = c.linenr },
  MatchParen     = { bg = c.bracket },
  ModeMsg        = { fg = c.fg },
  MoreMsg        = { fg = c.fg },
  NonText        = { fg = c.whitespace },
  Normal         = { fg = c.fg, bg = c.bg },
  NormalFloat    = { fg = c.fg, bg = c.panel },
  FloatBorder    = { fg = c.border, bg = c.panel },
  Pmenu          = { fg = c.fg, bg = c.panel },
  PmenuSel       = { fg = c.status_fg, bg = c.panel_sel },
  Question       = { fg = c.keyword },
  Search         = { bg = c.find },
  SignColumn     = { fg = c.linenr },
  SpecialKey     = { fg = c.whitespace },
  SpellBad       = { undercurl = true, sp = c.error },
  SpellCap       = { undercurl = true, sp = c.warn },
  SpellLocal     = { undercurl = true, sp = c.info },
  SpellRare      = { undercurl = true, sp = c.info },
  StatusLine     = { fg = c.status_fg, bg = c.status },
  StatusLineNC   = { fg = c.linenr, bg = c.panel },
  TabLine        = { fg = c.linenr, bg = c.panel },
  TabLineFill    = { bg = c.panel },
  TabLineSel     = { fg = c.fg, bg = c.bg },
  Title          = { fg = c.tag, bold = true },
  Visual         = { bg = c.selection },
  WarningMsg     = { fg = c.warn },
  Whitespace     = { fg = c.whitespace },
  WinSeparator   = { fg = c.border },

  -- :h group-name
  Boolean        = { fg = c.keyword },
  Character      = { fg = c.string },
  Comment        = { fg = c.comment },
  Conditional    = { fg = c.keyword },
  Constant       = { fg = c.fg },
  Define         = { fg = c.keyword },
  Delimiter      = { fg = c.fg },
  Error          = { fg = c.invalid },
  Exception      = { fg = c.keyword },
  Float          = { fg = c.number },
  Function       = { fg = c.fg },
  Identifier     = { fg = c.fg },
  Include        = { fg = c.keyword },
  Keyword        = { fg = c.keyword },
  Label          = { fg = c.keyword },
  Macro          = { fg = c.keyword },
  Number         = { fg = c.number },
  Operator       = { fg = c.fg },
  PreCondit      = { fg = c.keyword },
  PreProc        = { fg = c.keyword },
  Repeat         = { fg = c.keyword },
  Special        = { fg = c.fg },
  SpecialChar    = { fg = c.string },
  SpecialComment = { fg = c.comment },
  Statement      = { fg = c.keyword },
  StorageClass   = { fg = c.keyword },
  String         = { fg = c.string },
  Structure      = { fg = c.keyword },
  Tag            = { fg = c.tag },
  Todo           = { fg = c.comment, bold = true },
  Type           = { fg = c.fg },
  Typedef        = { fg = c.keyword },
  Underlined     = { underline = true },

  -- :h diagnostic-highlights
  DiagnosticError          = { fg = c.error },
  DiagnosticWarn           = { fg = c.warn },
  DiagnosticInfo           = { fg = c.info },
  DiagnosticHint           = { fg = c.hint },
  DiagnosticOk             = { fg = c.ok },
  DiagnosticUnderlineError = { undercurl = true, sp = c.error },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = c.warn },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = c.info },
  DiagnosticUnderlineHint  = { undercurl = true, sp = c.hint },
  DiagnosticUnderlineOk    = { undercurl = true, sp = c.ok },

  -- :h treesitter-highlight-groups
  ['@markup.heading']      = { fg = c.tag, bold = true },
  ['@markup.italic']       = { italic = true },
  ['@markup.strong']       = { bold = true },
  ['@markup.raw']          = { fg = c.raw },
  ['@property.json']       = { fg = c.key },
  ['@property.yaml']       = { fg = c.key },
  ['@string.regexp']       = { fg = c.regex },
  ['@tag']                 = { fg = c.tag },
  ['@tag.attribute']       = { fg = c.attribute },
  ['@tag.delimiter']       = { fg = c.tag_delim },
}

-- stylua: ignore
local links = {
  ['@constant.builtin']       = 'Boolean',
  ['@lsp.type.class']         = 'Type',
  ['@lsp.type.enum']          = 'Type',
  ['@lsp.type.interface']     = 'Type',
  ['@lsp.type.struct']        = 'Type',
  ['@lsp.type.typeParameter'] = 'Type',
  ['@type.builtin']           = 'Keyword',
  ['@variable.builtin']       = 'Keyword',

  TelescopeSelection = 'CursorLine',
}

for name, val in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, val)
end
for name, target in pairs(links) do
  vim.api.nvim_set_hl(0, name, { link = target })
end

-- stylua: ignore
local ansi = {
  -- light      dark
  { '#000000', '#000000' }, -- black
  { '#CD3131', '#CD3131' }, -- red
  { '#107C10', '#0DBC79' }, -- green
  { '#949800', '#E5E510' }, -- yellow
  { '#0451A5', '#2472C8' }, -- blue
  { '#BC05BC', '#BC3FBC' }, -- magenta
  { '#0598BC', '#11A8CD' }, -- cyan
  { '#555555', '#E5E5E5' }, -- white
  { '#666666', '#666666' }, -- bright black
  { '#F14C4C', '#F14C4C' }, -- bright red
  { '#14CE14', '#23D18B' }, -- bright green
  { '#B5BA00', '#F5F543' }, -- bright yellow
  { '#3B8EEA', '#3B8EEA' }, -- bright blue
  { '#D670D6', '#D670D6' }, -- bright magenta
  { '#29B8DB', '#29B8DB' }, -- bright cyan
  { '#A5A5A5', '#E5E5E5' }, -- bright white
}
for n, pair in ipairs(ansi) do
  vim.g['terminal_color_' .. (n - 1)] = pair[i]
end
