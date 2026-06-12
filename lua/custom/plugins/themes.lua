vim.pack.add {
  'https://github.com/EdenEast/nightfox.nvim',
  'https://github.com/catppuccin/nvim',
  'https://github.com/rose-pine/neovim',
  'https://github.com/neanias/everforest-nvim',
  'https://github.com/kepano/flexoki-neovim',
  'https://github.com/ellisonleao/gruvbox.nvim',
  'https://github.com/rebelot/kanagawa.nvim',
  'https://github.com/tahayvr/matteblack.nvim',
  'https://github.com/OldJobobo/miasma.nvim',
  'https://github.com/loctvl842/monokai-pro.nvim',
  'https://github.com/ribru17/bamboo.nvim',
  'https://github.com/oldjobobo/retro-82.nvim',
  'https://github.com/folke/tokyonight.nvim',
  'https://github.com/shatur/neovim-ayu',
  'https://github.com/maxmx03/solarized.nvim',
  'https://github.com/olimorris/onedarkpro.nvim',
  'https://github.com/tahayvr/vhs80.nvim',
  'https://github.com/srcery-colors/srcery-vim',
}

local function file_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == 'file'
end

local function read_file(path)
  local file = io.open(path, 'r')
  if not file then return nil end

  local content = file:read '*l'
  file:close()
  return content
end

local mode_file = vim.fn.expand '~/.config/bigaku/current/nvim-theme.mode'
local system_theme_file = vim.fn.expand '~/.config/bigaku/current/theme/neovim.lua'

local mode = read_file(mode_file) or 'default'

-- If system mode is enabled, delegate entirely to external file
if mode == 'system' and file_exists(system_theme_file) then return dofile(system_theme_file) end

-- Default fallback theme
vim.opt.termguicolors = true

local function set_colorscheme(name)
  local ok = pcall(vim.cmd.colorscheme, name)
  return ok
end

-- Try themes in order of preference
if not (set_colorscheme 'rose-pine' or set_colorscheme 'nightfox' or set_colorscheme 'catppuccin-mocha' or set_colorscheme 'carbonfox') then
  -- absolute last fallback (built-in safe option)
  vim.cmd.colorscheme 'default'
end
