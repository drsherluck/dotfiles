local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

require('lspconfig').clangd.setup{}
require('lspconfig').pylsp.setup{
    plugins = {
        ruff = { enabled = true },
        pycodestyle = { enabled = false},
    }
}
require('lspconfig').rust_analyzer.setup{}
require('lspconfig').terraformls.setup{}
--require('lspconfig').glslls.setup{
--    cmd = { "glslls", "--stdin" },
--    single_file_support = true,
--    filetypes = {"glsl", "comp", "frag", "vert", "fp", "vp", "rchit", "rgen", "rmiss" }
--}

lsp.setup()
