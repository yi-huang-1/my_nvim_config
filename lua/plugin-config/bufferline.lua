local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("Not found bufferline")
  return
end

-- bufferline
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    -- close Tab，use moll/vim-bbye cmd: :Bdelete
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- sidebar
    -- set location of nvim-tree 的位置，show File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- nvim LSP
    diagnostics = "nvim_lsp",
    -- LSP error icon
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})
