local function options()
    local opts = {
        backup = false,
        clipboard = "unnamedplus",
        expandtab = true,
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        hlsearch = false,
        incsearch = true,
        nu = true,
        relativenumber = true,
        ruler = true,
        scrolloff = 8,
        shiftwidth = 4,
        showbreak = "↳  ",
        signcolumn = "yes",
        smartindent = true,
        softtabstop = 4,
        swapfile = false,
        tabstop = 4,
        termguicolors = true,
        undodir = os.getenv("HOME") .. "/.cache/nvim/undo/",
        undofile = true,
        updatetime = 200,
        wrap = false,
    }
    for n, v in pairs(opts) do
        vim.o[n] = v
    end
end

local function filetypes()
    local type_map = {
        glsl = {"frag", "fp", "comp", "rchit", "rgen", "rmiss", "shader", "vp"}
    }
    for n, v in pairs(type_map) do
        local m = {}
        for _, ext in ipairs(v) do
            m[ext] = n
        end
        vim.filetype.add({extension=m})
    end
end

vim.g.mapleader = " "
options()
filetypes()
