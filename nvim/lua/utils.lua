local M = {}

function M.map_array(ary, f)
  local xs = {}
  for i=1,#ary,1 do
    xs[i] = f(ary[i])
  end
  return xs
end

function M.concat_array(a, b)
  return {unpack(a), unpack(b)}
end

function M.optional_value(x, default)
  if (x == nil) then
    return default
  end
  return x
end

function M.create_map(mode, lhs, rhs, value, options)
  vim.keymap.set(mode, lhs, rhs, value, M.optional_value(options, { nargs = 1 }))
end

function M.nmap(lhs, rhs, value, options)
  M.create_map("n", lhs, rhs, value, options)
end

return M
