local M = {}

function M.each(f, ary)
  for i=1,#ary,1 do
    f(ary[i])
  end
end

function M.fold(f, acc, ary)
  for i=1,#ary,1 do
    acc = f(acc, ary[i])
  end
  return acc
end

function M.map_array(f, ary)
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
  vim.keymap.set(mode, lhs, rhs, value, M.optional_value(options, {}))
end

function M.nmap(lhs, rhs, value, options)
  M.create_map("n", lhs, rhs, value, options)
end

function M.vmap(lhs, rhs, value, options)
  M.create_map("v", lhs, rhs, value, options)
end

function M.tmap(lhs, rhs, value, options)
  M.create_map("t", lhs, rhs, value, options)
end

return M
