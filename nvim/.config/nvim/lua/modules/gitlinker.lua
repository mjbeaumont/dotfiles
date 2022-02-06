local status_ok, gitlinker = pcall(require, "gitlinker")
if not status_ok then
   return
end

local set_km = require('modules/utils')

gitlinker.setup()

set_km('n', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>')
set_km('v', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>')
