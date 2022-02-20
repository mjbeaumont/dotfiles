local set_km = require("modules/utils")
local gh_username = "mjbeaumont"

set_km("n", '<Leader>prr', ":Octo search is:pr is:open review-requested:@me archived:false<CR>");
set_km("n", '<Leader>prm', ":Octo search is:pr is:open author:@me archived:false<CR>");
set_km("n", '<Leader>prc', ":Octo search is:pr is:open commenter:@me archived:false<CR>");


