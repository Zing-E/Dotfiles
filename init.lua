local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.termguicolors = true -- Essential for good colors in Neovim

require("lazy").setup({
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    "preservim/nerdtree",
	{
	"nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
  	'nvim-treesitter/nvim-treesitter',
 	lazy = false,
 	build = ':TSUpdate'
   }
})

vim.g.mapleader = " "
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

if vim.g.neovide then
    vim.opt.guifont = "Hack Nerd Font:h13"
    vim.g.neovide_cursor_animation_length = 0   
    vim.g.neovide_scroll_animation_length = 0  
    vim.g.neovide_cursor_vfx_mode = ""        
    vim.g.neovide_refresh_rate = 240
end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "lcd %:p:h",
})

require('lualine').setup({
    options = { theme = 'gruvbox' }
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "bash", "c", "cpp", "go", "lua", "python" },
	callback = function()
        vim.treesitter.start()
    end,
})
