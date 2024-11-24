-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
