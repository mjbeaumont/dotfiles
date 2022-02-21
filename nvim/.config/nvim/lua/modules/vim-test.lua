vim.g['test#javascript#jest#file_pattern'] = "\\vtest\\.(js|jsx|ts|tsx)$";

local function getJestTestCmd()
	local lsputil = require('lspconfig.util')
	local path = lsputil.path

	-- Our default command
	local cmd = 'jest'

	local cwd = vim.loop.cwd()
	-- path of the current buffer, relative to the cwd
	local currentBufferFilePath = vim.fn.expand('%:~:.')

	local pkgJsonParentDir = lsputil.find_package_json_ancestor(
		currentBufferFilePath
	)
	local pkgJsonPath = path.join(cwd, pkgJsonParentDir, 'package.json')

	local file = io.open(pkgJsonPath, 'r')

	if file then
		local run = 'pnpm run'

		local fileContents = file:read('*a')
		local jsonTable = vim.fn.json_decode(fileContents)

		-- What we're expecting the script command to be
		local expectedTestCmd = 'test'
		local testCmd = jsonTable.scripts[expectedTestCmd]

		cmd =  run .. ' --cwd ' .. pkgJsonParentDir .. ' ' .. testCmd

		io.close(file)
	end

	return cmd
end

_G.setJestSettings = function(package)
   vim.g['test#javascript#jest#executable'] = 'NODE_ENV=test pnpx jest' 
   vim.g['test#project_root'] = 'packages/' ..package
end

_G.setJestCmd = function()
	vim.g['test#javascript#jest#executable'] = getJestTestCmd()
end

vim.cmd([[
  augroup test
    autocmd!
    autocmd BufEnter ~/Code/TFD/website/packages/website/* call v:lua.setJestSettings('website')
    autocmd BufEnter ~/Code/TFD/website/packages/tosa/* call v:lua.setJestSettings('tosa')
    " autocmd BufEnter *.tsx,*.ts,*.js,*.jsx call v:lua.setJestCmd()
  augroup END
]])
