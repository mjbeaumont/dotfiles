return {
    "ggandor/leap.nvim",
    config = function()
        local status_ok, leap = pcall(require, "leap")
        if not status_ok then
            return
        end

        leap.setup({
            case_sensitive = true,
            -- These keys are captured directly by the plugin at runtime.
            special_keys = {
                repeat_search = "<enter>",
                next_target = "<enter>",
                prev_target = "<tab>",
                next_group = "<space>",
                prev_group = "<tab>",
            },
        })

        leap.add_default_mappings()

        function _G.LeapBidirectional()
            leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
        end
    end,
}
