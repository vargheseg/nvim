-- Nice diagnostics look
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

vim.opt.laststatus = 3
vim.opt.showtabline = 2

-- Your keymaps
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<leader>d',  vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>i',  vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>t',  vim.lsp.buf.document_symbol, opts)
  vim.keymap.set('n', '<leader>r',  vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>h',  vim.lsp.buf.hover, opts)

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
end

-- Server configurations
vim.lsp.config.clangd = {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
  on_attach = on_attach,
}

vim.lsp.config.rust_analyzer = {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy" },
      inlayHints = { enable = true },
    },
  },
}

vim.lsp.config.basedpyright = {
  on_attach = on_attach,
  settings = {
    basedpyright = {
      analysis = { typeCheckingMode = "basic" },
    },
  },
}

vim.lsp.config.ruff = {
  on_attach = on_attach,
}

-- Enable the servers
vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ruff')




require("trouble").setup({
  -- You can leave this empty for default nice settings
  -- or add small customizations later if you want
})

-- Keymaps (these will now work)
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (all)" })
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnostics (current buffer)" })
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "References" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Document Symbols" })


vim.keymap.set("n", "<leader>g", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })


vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      border = "rounded",
      source = "always",
      focusable = false,
    })
  end,
})
