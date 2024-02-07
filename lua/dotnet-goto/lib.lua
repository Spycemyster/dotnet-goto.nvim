local M = {}

local handle = function(result, opts)
    print(result)
    print(opts)
    vim.lsp.util.jump_to_location(result, opts)
end

local handle_references = function(result)
  if not result then
    return
  end
  local items = {}

  vim.list_extend(items, vim.lsp.util.locations_to_items(result, "utf-8") or {})

end

local legacy_handler = function(lsp_call, opts)
  return function(_, _, result)
    if lsp_call ~= nil and lsp_call == "textDocument/references" then
      handle_references(result)
    else
      handle(result, opts)
    end
  end
end

local handler = function(lsp_call, opts)
  return function(_, result, _, _)
    if lsp_call ~= nil and lsp_call == "textDocument/references" then
      handle_references(result)
    else
      handle(result, opts)
    end
  end
end

M.get_handler = function(lsp_call, opts)
  -- Only really need to check one of the handlers
  if debug.getinfo(vim.lsp.handlers["textDocument/definition"]).nparams == 4 then
    return handler(lsp_call, opts)
  else
    return legacy_handler(lsp_call, opts)
  end
end


return M
