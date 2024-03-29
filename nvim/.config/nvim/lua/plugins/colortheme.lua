return {
    "Iron-E/nvim-highlite",
    config = function()
        -- or one of the alternate colorschemes (see the "Built-in Colorschemes" section
        vim.api.nvim_command("colorscheme highlite")

        local status_ok, highlite = pcall(require, "highlite")
        if not status_ok then
            return
        end

        local background = { "#24292e", 255, "gray" }
        local background_visual_selection = { "#284566", 255, "grey" }

        local error = { "#f97583", 255, "red" }
        local warning = { "#cca700", 255, "yellow" }
        local info = { "#75beff", 255, "blue" }
        local hint = { "#eeeeb3", 255, "green" }

        local gold = { "#E9D16C", 255, "gold" }
        local red = { "#D74E42", 255, "red" }
        local light_blue = { "#56B6C2", 255, "blue" }
        local white = { "#FFFFFF", 255, "white" }
        local orange = { "#D19A66", 255, "orange" }
        local purple = { "#B57EDC", 255, "purple" }
        local ref_bg = { "#265459", 255, "blue" }

        highlite.highlight("Normal", { fg = white, bg = background })
        highlite.highlight("Visual", { bg = background_visual_selection })

        highlite.highlight("Error", { fg = error })
        highlite.highlight("Info", { fg = info })
        highlite.highlight("Hint", { fg = hint })
        highlite.highlight("Warning", { fg = warning })

        highlite.highlight("@variable", { fg = white })
        highlite.highlight("@include", { fg = red })
        highlite.highlight("@operator", { fg = red })
        highlite.highlight("@function", { fg = purple })
        highlite.highlight("@function.builtin", "@function")
        highlite.highlight("@method", "@function")
        highlite.highlight("@keyword", { fg = red })
        highlite.highlight("@tag", { fg = gold })
        highlite.highlight("@tag.attribute", { fg = orange })
        highlite.highlight("@type", { fg = gold })
        highlite.highlight("@type.builtin", "@type")
        highlite.highlight("@constructor", "@variable")
        highlite.highlight("@string.regex", "@string")
        highlite.highlight("@conditional", { fg = red })
        highlite.highlight("@number", { fg = light_blue })
        highlite.highlight("@boolean", "@number")
        highlite.highlight("@punctuation.special", { fg = white })
        highlite.highlight("@constant", { fg = white })
        highlite.highlight("commentTSConstant", "@keyword")

        highlite.highlight("CmpItemAbbrMatch", { fg = gold })
        highlite.highlight("CmpItemAbbrMatchFuzzy", { fg = gold })

        highlite.highlight("CmpItemKindVariable", { fg = light_blue })
        highlite.highlight("CmpItemKindInterface", { fg = light_blue })
        highlite.highlight("CmpItemKindText", { fg = light_blue })

        highlite.highlight("CmpItemKindFunction", { fg = purple })
        highlite.highlight("CmpItemKindMethod", { fg = purple })

        highlite.highlight("LSPReferenceText", { bg = ref_bg })
        highlite.highlight("LSPReferenceRead", { bg = ref_bg })
        highlite.highlight("LSPReferenceWrite", { bg = ref_bg })
    end,
    lazy = false,
    priority = math.huge,
    version = "3.1.0",
}
