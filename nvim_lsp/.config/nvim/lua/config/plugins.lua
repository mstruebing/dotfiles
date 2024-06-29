lgocal fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself


    -- fuzzy
    use {
        'junegunn/fzf.vim',
        requires = { 'junegunn/fzf', run = ':call fzf#install()' }
    }

    -- colortheme
    -- use({ 'rose-pine/neovim', as = 'rose-pine', config = function() vim.cmd('colorscheme rose-pine-dawn')
    --     vim.o.background = 'light'
    -- end })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,}
        use("nvim-treesitter/playground")

        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            }
        }

        -- () [] {} :)
        use 'cohama/lexima.vim'

        -- easily change/add/delete surroundings
        use 'tpope/vim-surround'

        -- git plugin
        use 'tpope/vim-fugitive'

        -- filebrowser
        use 'scrooloose/nerdtree'

        -- easily comment/uncomment lines
        use 'tpope/vim-commentary'

        -- run commands from vim inside a tmux pane
        use 'benmills/vimux'

        -- easily navigate between vim and tmux panes
        use 'christoomey/vim-tmux-navigator'

        -- BufOnly closes all buffers
        use 'vim-scripts/BufOnly.vim'

        -- easy debugging
        use 'meain/vim-printer'

        -- Automatically resize windows to golden ratio
        use 'dm1try/golden_size'

        -- Checklist
        use 'evansalter/vim-checklist'

        -- auto-session: https://github.com/rmagatti/auto-session
        use {
            'rmagatti/auto-session',
            config = function()
                require("auto-session").setup {
                    log_level = "error",
                    -- auto_session_allowed_dirs = { "~/projects" }	
                }
            end
        }

        use {
            'github/copilot.vim'
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end)
