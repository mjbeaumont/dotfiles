function _G.ToggleNumber()
  if vim.wo.nu == true then
      vim.wo.nu = false
      vim.wo.relativenumber = true
  else
      vim.wo.nu = true
      vim.wo.relativenumber = false
  end
end

function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^modules') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end
