local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
    return
end

github_theme.setup({
  theme_style = "dark",
  colors = { 
    green = "#5FC73B",
  },
  overrides = function(c) 
    return {
     TSType = { fg = c.yellow },
     TSVariable = { fg = c.white },
     TSConstructor = { link = "TSVariable" },
     TSKeyword = { fg = c.bright_blue },
     TSProperty = { fg = c.white },
     String = { fg = c.green },
     Special = { fg = c.red },
     TSTag = { fg = c.bright_blue },
    }
  end
})
