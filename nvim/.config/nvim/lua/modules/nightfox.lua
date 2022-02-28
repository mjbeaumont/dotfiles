local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    return
end

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
    fox = "nightfox", -- change the colorscheme to use nordfox
    styles = {
        comments = "none", -- change style of comments to be italic
        keywords = "none", -- change style of keywords to be bold
        functions = "none", -- styles can be a comma separated list
    },
    inverse = {
        match_paren = true, -- inverse the highlighting of match_parens
    },
    colors = {
        bg = "#000000",
        green = "#5FC73B",
        orange = "#E5C07B",
        yellow = "#E9D16C",
        blue = "#61AFEF",
        magenta = "#9A7EDC",
    },
    hlgroups = {
        typescriptInterfaceName = { fg = "${yellow}" },
        typescriptTypeReference = { link = "typescriptInterfaceName" },
        typescriptAliasDeclaration = { link = "typescriptInterfaceName" },
        typescriptMemberOptionality = { fg = "${red}" },
        tsxCloseString = { link = "tsxTagName" },
        tsxAttribute = { fg = "${orange}" },
        tsxTagName = { fg = "${blue}" },
        htmlTagName = { fg = "${yellow}" },
        Function = { fg = "${magenta}" },
        Keyword = { fg = "${blue}" },
        Identifier = { fg = "${blue}" },
        Special = { fg = "${red}" },
        Statement = { link = "Special" },
        Structure = { fg = "${white}" },
    },
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
