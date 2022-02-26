-- Import nvim-highlite
local highlite = require('highlite')

local background = {'#24292e', 255, 'gray' }
local background_visual_selection = { '#284566', 255, 'grey' }

local error = { '#f97583', 255, 'red' };
local warning = { '#cca700', 255, 'yellow' };
local info = { '#75beff', 255, 'blue'};
local hint = { '#eeeeb3', 255, 'green'};

local gold = { '#E9D16C', 255, 'gold' }
local red = { '#D74E42', 255, 'red' }
local light_blue = { '#56B6C2', 255, 'blue' }
local dark_blue = { '#1085FF', 255, 'blue' }
local white = {'#FFFFFF', 255, 'white' }
local gray_light  = {'#c0c0c0', 250, 'gray'}
local gray_darker = {'#505050', 239, 'gray'}
local orange = { '#D19A66', 255, 'orange' }
local purple = { '#B57EDC', 255, 'purple' }

highlite.highlight('Normal', { fg = white, bg = background });
highlite.highlight('Visual', { bg = background_visual_selection });

highlite.highlight('Error', { fg = error });
highlite.highlight('Info', { fg = info });
highlite.highlight('Hint', { fg = hint });
highlite.highlight('Warning', { fg = warning });

highlite.highlight('TSInclude', { fg = red });
highlite.highlight('TSOperator', { fg = red });
highlite.highlight('TSFunction', { fg = purple });
highlite.highlight('TSFuncBuiltin', 'TSFunction');
highlite.highlight('TSMethod', 'TSFunction');
highlite.highlight('TSKeyword', { fg = red });
highlite.highlight('TSPunctSpecial', { fg = red });
highlite.highlight('TSTag', { fg = gold });
highlite.highlight('TSType', { fg = gold });
highlite.highlight('TSTypeBuiltin', 'TSType');
highlite.highlight('TSTagAttribute', { fg = orange });
highlite.highlight('TSConstructor', 'TSVariable');
highlite.highlight('TSStringRegex', 'TSString');
highlite.highlight('TSConditional', { fg = red });
highlite.highlight('TSNumber', { fg = light_blue });
highlite.highlight('TSBoolean', 'TSNumber');
highlite.highlight('TSPunctSpecial', { fg = white });
highlite.highlight('TSConstant', { fg = white });
highlite.highlight('commentTSConstant',  'Keyword');

highlite.highlight('CmpItemAbbrMatch', { fg = gold });
highlite.highlight('CmpItemAbbrMatchFuzzy', { fg = gold });

highlite.highlight('CmpItemKindVariable', { fg = light_blue });
highlite.highlight('CmpItemKindInterface', { fg = light_blue });
highlite.highlight('CmpItemKindText', { fg = light_blue });

highlite.highlight('CmpItemKindFunction', { fg = purple });
highlite.highlight('CmpItemKindMethod', { fg = purple });
