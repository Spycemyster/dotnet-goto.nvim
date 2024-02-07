local M = { }

local lib = require('dotnet-goto.lib')

M.lsp_request_definition = function(opts)
    local params = vim.lsp.util.make_position_params()
    local lsp_call = "textDocument/definition"
    pcall(vim.lsp.buf_request, 0, lsp_call, params, lib.get_handler(lsp_call, opts))
end

return M
