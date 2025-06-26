
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Install Plugins
require("lazy").setup({
    -- Theme
    {
	    "fenetikm/falcon",
	    name = "falcon",
	    priority = 1000,
	    lazy = false,
	    config = function()
		    vim.cmd("colorscheme falcon")
	    end
    },

    -- File Explorer
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- LSP Config
    { "neovim/nvim-lspconfig" },

    -- Autocomplete
    { 
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})



-- Basic Settings
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.wrap = false

-- Keymap
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })


-- Load LSP config
require("config.lsp")
require("config.cmp")
