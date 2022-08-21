-- ~/.config/nvim/lua/plugins/telescope.lua
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

require('telescope').setup {
	pickers = {
		buffers = {
			-- начинать в normal моде при открытии списка буферов
			initial_mode = 'normal'
		}
	}
}
-- горячие клавиши
map('n', '<Leader>ff', '<CMD>Telescope find_files<CR>', opts)
map('n', '<Leader>fg', '<CMD>Telescope live_grep<CR>', opts)
map('n', '<Leader>fb', '<CMD>Telescope buffers<CR>', opts)
