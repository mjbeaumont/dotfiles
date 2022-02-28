local default_opts = { noremap = true, silent = true }

local set_km = function(mode, map, command, user_opts)
    user_opts = user_opts or {}
    for k, v in pairs(user_opts) do
        default_opts[k] = v
    end
    vim.api.nvim_set_keymap(mode, map, command, default_opts)
end

return set_km
