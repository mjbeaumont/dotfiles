local Highlite = require("highlite") --- @type Highlite

local palette, terminal_palette = Highlite.palette("highlite")
local groups = Highlite.groups("highlite", palette)

palette.my_background = "#24292e"
palette.my_background_visual_selection = "#284566"
palette.my_error = "#f97583"
palette.my_warning = "#cca700"
palette.my_info = "#75beff"
palette.my_hint = "#eeeeb3"

palette.my_gold = "#E9D16C"
palette.my_red = "#D74E42"
palette.my_light_blue = "#56B6C2"
palette.my_white = "#FFFFFF"
palette.my_orange = "#D19A66"
palette.my_purple = "#B57EDC"
palette.my_ref_bg = "#265459"

groups['Normal'] =  { fg = palette.my_white, bg = palette.my_background }
groups['Visual'] =  { bg = palette.my_background_visual_selection }

groups['Error'] =  { fg = palette.my_error }
groups['Info'] =  { fg = palette.my_info }
groups['Hint'] =  { fg = palette.my_hint }
groups['Warning'] =  { fg = palette.my_warning }

groups['@variable'] =  { fg = palette.my_white }
groups['@include'] =  { fg = palette.my_red }
groups['@operator'] =  { fg = palette.my_red }
groups['@function'] =  { fg = palette.my_purple }
groups['@function.builtin'] =  '@function'
groups['@method'] =  '@function'
groups['@keyword'] =  { fg = palette.my_red }
groups['@keyword.import'] = '@keyword'
groups['@keyword.modifier.mutability'] = '@keyword'
groups['@keyword.operator'] = '@keyword'
groups['@keyword.conditional'] = '@keyword'
groups['@keyword.return'] = '@keyword'
groups['@tag'] =  { fg = palette.my_gold }
groups['@tag.attribute'] =  { fg = palette.my_orange }
groups['@type'] =  { fg = palette.my_gold }
groups['@type.builtin'] =  '@type'
groups['@constructor'] =  '@variable'
groups['@string.regex'] =  '@string'
groups['@conditional'] =  { fg = palette.my_red }
groups['@number'] =  { fg = palette.my_light_blue }
groups['@boolean'] =  '@number'
groups['@module'] = '@string'
groups['@punctuation.special'] =  { fg = palette.my_white }
groups['@constant'] =  { fg = palette.my_white }
groups['commentTSConstant'] =  '@keyword'

groups['CmpItemAbbrMatch'] =  { fg = palette.my_gold }
groups['CmpItemAbbrMatchFuzzy'] =  { fg = palette.my_gold }

groups['CmpItemKindVariable'] =  { fg = palette.my_light_blue }
groups['CmpItemKindInterface'] =  { fg = palette.my_light_blue }
groups['CmpItemKindText'] =  { fg = palette.my_light_blue }

groups['CmpItemKindFunction'] =  { fg = palette.my_purple }
groups['CmpItemKindMethod'] =  { fg = palette.my_purple }

groups['LSPReferenceText'] =  { bg = palette.my_ref_bg }
groups['LSPReferenceRead'] =  { bg = palette.my_ref_bg }
groups['LSPReferenceWrite'] =  { bg = palette.my_ref_bg }

Highlite.generate("highlite", groups, terminal_palette)
