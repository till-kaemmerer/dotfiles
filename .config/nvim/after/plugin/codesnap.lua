require("codesnap").setup({
  save_path = "~/Pictures/codesnap",
  watermark = "",
  watermark_font_family = "Helvetica",
  bg_theme = "sea",
  has_line_number = true,
})

vim.api.nvim_set_keymap("v", "c", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>cc", ":CodeSnap<cr>")
vim.keymap.set("v", "<leader>cs", ":CodeSnapSave<cr>")
vim.keymap.set("v", "<leader>ch", ":CodeSnapHighlight<cr>")
vim.keymap.set("v", "<leader>cz", ":CodeSnapHighlightSave<cr>")
