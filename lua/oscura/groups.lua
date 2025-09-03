---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs OscuraConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
   local colors = configs.colors
   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.selection or colors.bg,
   }

   return {
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalFloat = { fg = colors.fg, bg = colors.bg },
      Comment = { fg = colors.comment, italic = configs.italics.comments },
      Constant = { fg = colors.fg },
      String = { fg = colors.orange },
      Character = { fg = colors.yellow },
      Number = { fg = colors.orange },
      Boolean = { fg = colors.red },
      Float = { fg = colors.teal },
      FloatBorder = { fg = colors.fg },
      Operator = { fg = colors.purple },
      Keyword = { fg = colors.purple, italic = configs.italics.keywords },
      Keywords = { fg = colors.purple, italic = configs.italics.keywords },
      Identifier = { fg = colors.yellow },
      Function = { fg = colors.yellow },
      Statement = { fg = colors.purple },
      Conditional = { fg = colors.purple },
      Repeat = { fg = colors.purple },
      Label = { fg = colors.teal },
      Exception = { fg = colors.purple },
      PreProc = { fg = colors.teal },
      Include = { fg = colors.purple },
      Define = { fg = colors.purple },
      Title = { fg = colors.teal },
      Macro = { fg = colors.purple },
      PreCondit = { fg = colors.teal },
      Type = { fg = colors.fg },
      StorageClass = { fg = colors.purple },
      Structure = { fg = colors.teal },
      TypeDef = { fg = colors.teal },
      Special = { fg = colors.yellow },
      SpecialComment = { fg = colors.comment, italic = true },
      Error = { fg = colors.red },
      Todo = { fg = colors.purple, bold = true, italic = true },
      Underlined = { fg = colors.teal, underline = true },

      Cursor = { reverse = true },
      CursorLineNr = { fg = colors.active_line_nr, bold = true },

      SignColumn = { bg = colors.bg },

      Conceal = { fg = colors.comment },
      CursorColumn = { bg = colors.black },
      CursorLine = { bg = colors.selection },
      ColorColumn = { bg = colors.selection },

      StatusLine = { fg = colors.fg, bg = colors.black },
      StatusLineNC = { fg = colors.comment },
      StatusLineTerm = { fg = colors.fg, bg = colors.black },
      StatusLineTermNC = { fg = colors.comment },

      Directory = { fg = colors.teal },
      DiffAdd = { fg = colors.bg, bg = colors.teal },
      DiffChange = { fg = colors.blue },
      DiffDelete = { fg = colors.red },
      DiffText = { fg = colors.comment },

      ErrorMsg = { fg = colors.red },
      VertSplit = { fg = colors.black },
      WinSeparator = { fg = colors.black },
      Folded = { fg = colors.comment },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.blue },
      IncSearch = { fg = colors.blue, bg = colors.comment },
      LineNr = { fg = colors.line_nr },
      MatchParen = { fg = colors.fg, underline = true },
      NonText = { fg = colors.comment },
      Pmenu = { fg = colors.fg, bg = colors.bg },
      PmenuSel = { fg = colors.fg, bg = colors.selection },
      PmenuSbar = { bg = colors.bg },
      PmenuThumb = { bg = colors.selection },

      Question = { fg = colors.purple },
      QuickFixLine = { fg = colors.black, bg = colors.teal },
      SpecialKey = { fg = colors.comment },

      SpellBad = { fg = colors.red, underline = true },
      SpellCap = { fg = colors.teal },
      SpellLocal = { fg = colors.teal },
      SpellRare = { fg = colors.teal },

      TabLine = { fg = colors.comment },
      TabLineSel = { fg = colors.fg },
      TabLineFill = { bg = colors.bg },
      Terminal = { fg = colors.fg, bg = colors.black },
      Visual = { bg = colors.selection },
      VisualNOS = { fg = colors.selection },
      WarningMsg = { fg = colors.teal },
      WildMenu = { fg = colors.black, bg = colors.fg },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ["@error"] = { fg = colors.red },
      ["@punctuation.delimiter"] = { fg = colors.purple },
      ["@punctuation.bracket"] = { fg = colors.purple },
      ["@markup.list"] = { fg = colors.teal },

      ["@constant"] = { fg = colors.fg },
      ["@constant.builtin"] = { fg = colors.fg },
      ["@markup.link.label.symbol"] = { fg = colors.fg },

      ["@constant.macro"] = { fg = colors.teal },
      ["@string.regexp"] = { fg = colors.red },
      ["@string"] = { fg = colors.orange },
      ["@string.lua"] = { fg = colors.orange },
      ["@string.python"] = { fg = colors.orange },
      ["@string.javascript"] = { fg = colors.orange },
      ["@string.typescript"] = { fg = colors.orange },
      ["@string.css"] = { fg = colors.orange },
      ["@string.json"] = { fg = colors.orange },
      ["@string.escape"] = { fg = colors.purple },
      ["@string.special.symbol"] = { fg = colors.orange },
      ["@string.quoted.double.html"] = { fg = colors.orange },
      ["@string.quoted.single.html"] = { fg = colors.orange },
      ["@string.quoted.double.tsx"] = { fg = colors.orange },
      ["@string.quoted.single.tsx"] = { fg = colors.orange },
      ["@string.quoted.double.jsx"] = { fg = colors.orange },
      ["@string.quoted.single.jsx"] = { fg = colors.orange },
      ["@character"] = { fg = colors.yellow },
      ["@number"] = { fg = colors.orange },
      ["@boolean"] = { fg = colors.red },
      ["@number.float"] = { fg = colors.orange },
      ["@annotation"] = { fg = colors.teal },
      ["@attribute"] = { fg = colors.teal },
      ["@module"] = { fg = colors.blue },

      ["@function.builtin"] = { fg = colors.yellow },
      ["@function"] = { fg = colors.yellow },
      ["@function.macro"] = { fg = colors.yellow },
      ["@variable.parameter"] = { fg = colors.fg },
      ["@variable.parameter.reference"] = { fg = colors.fg },
      ["@function.method"] = { fg = colors.yellow },
      ["@variable.member"] = { fg = colors.yellow },
      ["@property"] = { fg = colors.fg },
      ["@constructor"] = { fg = colors.purple },

      ["@keyword.conditional"] = { fg = colors.purple },
      ["@keyword.repeat"] = { fg = colors.purple },
      ["@label"] = { fg = colors.fg },

      ["@keyword"] = { fg = colors.purple, italic = configs.italics.keywords },
      ["@keyword.function"] = { fg = colors.purple, italic = configs.italics.keywords },
      ["@keyword.function.ruby"] = { fg = colors.purple, italic = configs.italics.keywords },
      ["@keyword.operator"] = { fg = colors.purple },
      ["@operator"] = { fg = colors.purple },
      ["@keyword.exception"] = { fg = colors.purple },
      ["@type"] = { fg = colors.fg },
      ["@type.builtin"] = { fg = colors.fg, italic = true },
      ["@type.qualifier"] = { fg = colors.purple },
      ["@structure"] = { fg = colors.purple },
      ["@keyword.include"] = { fg = colors.purple, italic = configs.italics.keywords },

      ["@variable"] = { fg = colors.fg },
      ["@variable.builtin"] = { fg = colors.fg },

      ["@markup"] = { fg = colors.blue },
      ["@markup.strong"] = { fg = colors.teal, bold = true }, -- bold
      ["@markup.emphasis"] = { fg = colors.yellow }, -- italic
      ["@markup.underline"] = { fg = colors.blue },
      ["@markup.heading"] = { fg = colors.comment, bold = true }, -- title
      ["@markup.raw"] = { fg = colors.teal }, -- inline code
      ["@markup.link.url"] = { fg = colors.fg, italic = true }, -- urls
      ["@markup.link"] = { fg = colors.purple, bold = true },

      ["@tag"] = { fg = colors.purple },
      ["@tag.attribute"] = { fg = colors.yellow },
      ["@tag.delimiter"] = { fg = colors.comment },
      ["@string.html"] = { fg = colors.orange },
      ["@string.quoted.double.html"] = { fg = colors.orange },
      ["@string.quoted.single.html"] = { fg = colors.orange },
      ["@jsx.attribute.string"] = { fg = colors.orange },
      ["@tsx.attribute.string"] = { fg = colors.orange },
      ["@attribute.value"] = { fg = colors.orange },
      ["@attribute.value.html"] = { fg = colors.orange },

      -- Semantic
      ["@class"] = { fg = colors.teal },
      ["@struct"] = { fg = colors.teal },
      ["@enum"] = { fg = colors.teal },
      ["@enumMember"] = { fg = colors.purple },
      ["@event"] = { fg = colors.teal },
      ["@interface"] = { fg = colors.teal },
      ["@modifier"] = { fg = colors.teal },
      ["@regexp"] = { fg = colors.red },
      ["@typeParameter"] = { fg = colors.teal },
      ["@decorator"] = { fg = colors.teal },

      -- LSP Semantic (0.9+)
      ["@lsp.type.class"] = { fg = colors.yellow },
      ["@lsp.type.enum"] = { fg = colors.yellow },
      ["@lsp.type.decorator"] = { fg = colors.yellow },
      ["@lsp.type.enumMember"] = { fg = colors.purple },
      ["@lsp.type.function"] = { fg = colors.yellow },
      ["@lsp.type.interface"] = { fg = colors.yellow },
      ["@lsp.type.macro"] = { fg = colors.yellow },
      ["@lsp.type.method"] = { fg = colors.yellow },
      ["@lsp.type.namespace"] = { fg = colors.fg },
      ["@lsp.type.parameter"] = { fg = colors.fg },
      ["@lsp.type.property"] = { fg = colors.fg },
      ["@lsp.type.struct"] = { fg = colors.fg },
      ["@lsp.type.type"] = { fg = colors.fg },
      ["@lsp.type.variable"] = { fg = colors.fg },

      -- HTML
      htmlArg = { fg = colors.yellow },
      htmlBold = { fg = colors.teal, bold = true },
      htmlEndTag = { fg = colors.teal },
      htmlH1 = { fg = colors.purple },
      htmlH2 = { fg = colors.purple },
      htmlH3 = { fg = colors.purple },
      htmlH4 = { fg = colors.purple },
      htmlH5 = { fg = colors.purple },
      htmlH6 = { fg = colors.purple },
      htmlItalic = { fg = colors.yellow, italic = true },
      htmlLink = { fg = colors.purple, underline = true },
      htmlSpecialChar = { fg = colors.teal },
      htmlSpecialTagName = { fg = colors.teal },
      htmlString = { fg = colors.orange },
      htmlTag = { fg = colors.purple },
      htmlTagN = { fg = colors.purple },
      htmlTagName = { fg = colors.purple },
      htmlTitle = { fg = colors.fg },

      -- Markdown
      markdownBlockquote = { fg = colors.teal, italic = true },
      markdownBold = { fg = colors.teal, bold = true },
      markdownCode = { fg = colors.teal },
      markdownCodeBlock = { fg = colors.teal },
      markdownCodeDelimiter = { fg = colors.red },
      markdownH1 = { fg = colors.comment, bold = true },
      markdownH2 = { fg = colors.comment, bold = true },
      markdownH3 = { fg = colors.comment, bold = true },
      markdownH4 = { fg = colors.comment, bold = true },
      markdownH5 = { fg = colors.comment, bold = true },
      markdownH6 = { fg = colors.comment, bold = true },
      markdownHeadingDelimiter = { fg = colors.orange },
      markdownHeadingRule = { fg = colors.comment },
      markdownId = { fg = colors.teal },
      markdownIdDeclaration = { fg = colors.purple },
      markdownIdDelimiter = { fg = colors.gray },
      markdownItalic = { fg = colors.gray, italic = true },
      markdownLinkDelimiter = { fg = colors.gray },
      markdownLinkText = { fg = colors.purple },
      markdownListMarker = { fg = colors.orange },
      markdownOrderedListMarker = { fg = colors.orange },
      markdownRule = { fg = colors.comment },
      markdownUrl = { fg = colors.blue, underline = true },

      -- Diagnostic
      DiagnosticError = { fg = colors.error },
      DiagnosticWarn = { fg = colors.warning },
      DiagnosticInfo = { fg = colors.info },
      DiagnosticHint = { fg = colors.hint },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },
      DiagnosticVirtualTextError = { fg = colors.error, bg = colors.diff_del_bg },
      DiagnosticVirtualTextWarn = { fg = colors.warning },
      DiagnosticVirtualTextInfo = { fg = colors.info },
      DiagnosticVirtualTextHint = { fg = colors.hint },

      -- Git highlighting
      gitcommitComment = { fg = colors.comment, italic = true },
      gitcommitUnmerged = { fg = colors.orange },
      gitcommitOnBranch = {},
      gitcommitBranch = { fg = colors.purple },
      gitcommitDiscardedType = { fg = colors.red },
      gitcommitSelectedType = { fg = colors.orange },
      gitcommitHeader = {},
      gitcommitUntrackedFile = { fg = colors.blue },
      gitcommitDiscardedFile = { fg = colors.red },
      gitcommitSelectedFile = { fg = colors.orange },
      gitcommitUnmergedFile = { fg = colors.yellow },
      gitcommitFile = {},
      gitcommitNoBranch = { fg = colors.purple },
      gitcommitUntracked = { fg = colors.comment },
      gitcommitDiscarded = { fg = colors.comment },
      gitcommitSelected = { fg = colors.comment },
      gitcommitDiscardedArrow = { fg = colors.red },
      gitcommitSelectedArrow = { fg = colors.orange },
      gitcommitUnmergedArrow = { fg = colors.yellow },

      -- Neovim
      healthError = { fg = colors.red },
      healthSuccess = { fg = colors.teal },
      healthWarning = { fg = colors.warning },

      -- Buffer
      BufferCurrent = { bg = colors.fg, fg = colors.bg },
      BufferCurrentIndex = { bg = colors.fg, fg = colors.orange },
      BufferCurrentMod = { bg = colors.fg, fg = colors.red },
      BufferCurrentSign = { bg = colors.fg, fg = colors.bg },
      BufferCurrentTarget = { bg = colors.fg, fg = colors.orange },
      BufferVisible = { fg = colors.comment },
      BufferVisibleIndex = { fg = colors.orange },
      BufferVisibleMod = { fg = colors.red },
      BufferVisibleSign = { fg = colors.comment },
      BufferVisibleTarget = { fg = colors.orange },
      BufferInactive = { fg = colors.comment },
      BufferInactiveIndex = { fg = colors.comment },
      BufferInactiveMod = { fg = colors.red },
      BufferInactiveSign = { fg = colors.comment },
      BufferInactiveTarget = { fg = colors.orange },

      -- nvim-cmp
      CmpDocumentationBorder = { fg = colors.fg, bg = colors.input_bg },
      CmpDocumentation = { fg = colors.fg, bg = colors.input_bg },
      CmpItemAbbr = { fg = colors.fg },
      CmpItemAbbrDeprecated = { fg = colors.fg, strikethrough = true },
      CmpItemAbbrMatch = { fg = colors.blue },
      CmpItemAbbrMatchFuzzy = { fg = colors.blue },
      CmpItemKind = { fg = colors.purple },
      CmpItemMenu = { fg = colors.comment },

      -- Telescope
      TelescopeBorder = { fg = colors.purple },
      TelescopePromptBorder = { fg = colors.purple },
      TelescopeResultsBorder = { fg = colors.purple },
      TelescopePreviewBorder = { fg = colors.purple },
      TelescopeSelectionCaret = { fg = colors.orange },
      TelescopeSelection = { fg = colors.orange, bg = colors.selection },
      TelescopeMatching = { fg = colors.blue },
      TelescopePromptPrefix = { fg = colors.orange },

      -- NvimTree
      NvimTreeNormal = { bg = colors.sidebar_bg, fg = colors.sidebar_fg },
      NvimTreeVertSplit = { fg = colors.sidebar_bg, bg = colors.sidebar_bg },
      NvimTreeRootFolder = { fg = colors.sidebar_title, bold = true },
      NvimTreeGitDirty = { fg = colors.orange },
      NvimTreeGitNew = { fg = colors.teal },
      NvimTreeSpecialFile = { fg = colors.blue },
      NvimTreeFolderName = { fg = colors.blue },
      NvimTreeOpenedFolderName = { fg = colors.blue, bold = true },
      NvimTreeEmptyFolderName = { fg = colors.comment },
      NvimTreeFolderIcon = { fg = colors.purple },
      NvimTreeIndentMarker = { fg = colors.comment },

      -- NeoTree
      NeoTreeNormal = { bg = colors.sidebar_bg, fg = colors.sidebar_fg },
      NeoTreeNormalNC = { bg = colors.sidebar_bg, fg = colors.sidebar_fg },
      NeoTreeVertSplit = { fg = colors.sidebar_bg, bg = colors.sidebar_bg },
      NeoTreeRootName = { fg = colors.sidebar_title, bold = true },
      NeoTreeGitModified = { fg = colors.orange },
      NeoTreeGitAdded = { fg = colors.teal },
      NeoTreeGitConflict = { fg = colors.red },
      NeoTreeGitDeleted = { fg = colors.red },
      NeoTreeGitIgnored = { fg = colors.comment },
      NeoTreeGitRenamed = { fg = colors.purple },
      NeoTreeGitStaged = { fg = colors.teal },
      NeoTreeGitUnstaged = { fg = colors.orange },
      NeoTreeGitUntracked = { fg = colors.red },
      NeoTreeFileName = { fg = colors.sidebar_fg },
      NeoTreeFileNameOpened = { fg = colors.sidebar_fg, bold = true },

      -- WhichKey
      WhichKey = { fg = colors.blue },
      WhichKeyGroup = { fg = colors.orange },
      WhichKeyDesc = { fg = colors.purple },
      WhichKeySeperator = { fg = colors.comment },
      WhichKeySeparator = { fg = colors.comment },
      WhichKeyFloat = { bg = colors.bg },
      WhichKeyValue = { fg = colors.comment },

      -- LspSaga
      LspFloatWinNormal = { bg = colors.bg },
      LspFloatWinBorder = { fg = colors.purple },
      LspSagaBorderTitle = { fg = colors.blue },
      LspSagaHoverBorder = { fg = colors.blue },
      LspSagaRenameBorder = { fg = colors.teal },
      LspSagaDefPreviewBorder = { fg = colors.teal },
      LspSagaCodeActionBorder = { fg = colors.purple },
      LspSagaFinderSelection = { fg = colors.selection },
      LspSagaCodeActionTitle = { fg = colors.blue },
      LspSagaCodeActionContent = { fg = colors.purple },
      LspSagaSignatureHelpBorder = { fg = colors.red },
      ReferencesCount = { fg = colors.purple },
      DefinitionCount = { fg = colors.purple },
      DefinitionIcon = { fg = colors.blue },
      ReferencesIcon = { fg = colors.blue },
      TargetWord = { fg = colors.blue },

      -- NeoVim
      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.teal },
      healthWarning = { fg = colors.warning },

      -- Indent Blankline
      IndentBlanklineChar = { fg = colors.selection },
      IndentBlanklineContextChar = { fg = colors.purple },

      -- Illuminate
      illuminatedWord = { bg = colors.selection },
      illuminatedCurWord = { bg = colors.selection },

      -- Hop
      HopNextKey = { fg = colors.blue, bold = true },
      HopNextKey1 = { fg = colors.purple, bold = true },
      HopNextKey2 = { fg = colors.comment },
      HopUnmatched = { fg = colors.comment },

      -- Leap
      LeapMatch = { fg = colors.blue, bold = true, underline = true },
      LeapLabelPrimary = { fg = colors.blue, bold = true },
      LeapLabelSecondary = { fg = colors.purple, bold = true },
      LeapBackdrop = { fg = colors.comment },

      -- Barbar
      BufferTabpage = { fg = colors.comment },
      BufferTabpageFill = { fg = colors.comment },

      -- LSP
      DiagnosticFloatingError = { fg = colors.red },
      DiagnosticFloatingWarn = { fg = colors.orange },
      DiagnosticFloatingInfo = { fg = colors.blue },
      DiagnosticFloatingHint = { fg = colors.teal },
      DiagnosticDefaultError = { fg = colors.red },
      DiagnosticDefaultWarn = { fg = colors.orange },
      DiagnosticDefaultInfo = { fg = colors.blue },
      DiagnosticDefaultHint = { fg = colors.teal },
      DiagnosticSignError = { fg = colors.red },
      DiagnosticSignWarn = { fg = colors.orange },
      DiagnosticSignInfo = { fg = colors.blue },
      DiagnosticSignHint = { fg = colors.teal },
      LspSignatureActiveParameter = { fg = colors.blue, italic = true },
      LspCodeLens = { fg = colors.comment },
      LspReferenceText = { bg = colors.selection },
      LspReferenceRead = { bg = colors.selection },
      LspReferenceWrite = { bg = colors.selection },
   }
end

return { setup = setup } 
