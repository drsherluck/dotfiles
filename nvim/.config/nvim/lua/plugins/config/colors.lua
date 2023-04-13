require("catppuccin").setup {
    color_overrides = {
        all = {
            base = "#17181f"
        }
    },
    styles = {
        keywords = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
    },
    integrations = {
        treesitter = true,
    },
    native_lsp = {
        enabled = true
    }
}
