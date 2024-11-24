function ColorMyPencils(color)
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
end

require("catppuccin").setup({
  highlight_overrides = {
    all = function(_)
      return {
        LineNr = { fg = '#776767' },
      }
    end
  }
})

ColorMyPencils()
