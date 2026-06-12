local map = vim.keymap.set

local function toggle_lsp()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients { bufnr = bufnr }

  if #clients > 0 then
    vim.cmd 'lsp disable'
    vim.notify 'LSP disabled'
  else
    vim.cmd 'lsp enable'
    vim.notify 'LSP enabled'
  end
end

map('n', '<leader>tl', toggle_lsp, { desc = '[T]oggle [L]SP' })

