-- oil
-- https://github.com/stevearc/oil.nvim

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

-- global function for winbar
_G.CustomOilBar = function()
  local path = vim.fn.expand('%')
  path = path:gsub('oil://', '')
  return '  ' .. vim.fn.fnamemodify(path, ':.')
end

require("oil").setup({
  columns = { "icon" },

  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-k>"] = false,
    ["<C-j>"] = false,
    ["<M-h>"] = "actions.select_split",
  },

  win_options = {
    winbar = "%{v:lua.CustomOilBar()}",
  },

  view_options = {
    show_hidden = true,
    is_always_hidden = function(name)
      local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
      return vim.tbl_contains(folder_skip, name)
    end,
  },
})

-- keymaps (IMPORTANT: use Lua API, not :Oil command string)
vim.keymap.set("n", "-", function()
  require("oil").open()
end, { desc = "Open parent directory" })

vim.keymap.set("n", "<space>-", function()
  require("oil").toggle_float()
end, { desc = "Oil float" })
