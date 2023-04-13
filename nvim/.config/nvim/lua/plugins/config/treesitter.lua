require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'vim', 'python', 'lua', 'rust', 'bash', 'glsl' },
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { 'help' },
    additional_vim_regex_highlighting = false,
  },
}
