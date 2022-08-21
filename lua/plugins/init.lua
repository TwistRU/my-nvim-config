-- ~/.config/nvim/lua/plugins/init.lua

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

 -- набор Lua функций, используется как зависимость в большинстве
  -- плагинов, где есть работа с асинхронщиной
  use 'nvim-lua/plenary.nvim'

  -- конфиги для LSP серверов, нужен для простой настройки и
  -- возможности добавления новых серверов
  use {
      'williamboman/nvim-lsp-installer',
      require('nvim-lsp-installer').setup {}

  }
  use {
      'neovim/nvim-lspconfig',
      config = function()
          require('plugins.lspconfig')
      end
  }

  -- иконки в выпадающем списке автодополнений (прямо как в vscode)
  use('onsails/lspkind-nvim')
  use {
      'tzachar/cmp-tabnine',
      run='./install.sh'
  }
  -- зависимости для движка автодополнения
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- движок автодополнения для LSP
  use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('plugins.cmp')
      end
  }

  -- парсер для всех языков программирования, цветной код как в твоем
  -- любимом IDE
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        -- так подгружается конфигурация конкретного плагина
        -- ~/.config/nvim/lua/plugins/treesitter.lua
        require('plugins.treesitter')
      end
  }

  -- навигация по файлам, fzf, работа с буферами и многое другое
  -- если больше привыкли к файловому дереву, есть альтернатива - nvim-tree
 	-- https://github.com/kyazdani42/nvim-tree.lua
  use {
	'kyazdani42/nvim-web-devicons',
	config = function()
		require('plugins.devicons')
	end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
        require('plugins.nvimtree')
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('plugins.telescope')
    end
  }

  -- статусбар, аналог vim-airline, только написан на lua
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end
  }
  use {
       'akinsho/bufferline.nvim',
       tag = "v2.*",
       config = function()
         require('plugins.bufferline')
       end
  }

 -- utils
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
-- snippets
    use {
      'L3MON4D3/LuaSnip',
      after = 'friendly-snippets',
      config = function()
        require('luasnip/loaders/from_vscode').load({
          paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
        })
      end
    }
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    use {
      'TimUntersberger/neogit',
      config = function()
        require('neogit').setup()
      end
    }
  if packer_bootstrap then
    require('packer').sync()
  end
end)

