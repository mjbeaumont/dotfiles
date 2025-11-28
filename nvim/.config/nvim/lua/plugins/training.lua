return {
    -- Blocks bad habits and suggests better motions
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
        },
    },
}
