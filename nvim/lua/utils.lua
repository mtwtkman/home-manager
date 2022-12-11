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

function M.attach_array(x, xs)
  return M.concat_array({x}, xs)
end

function M.optional_value(x, default)
  if (x == nil) then
    return default
  end
  return x
end

function M.nmap(key, callback, option)
  vim.keymap.set("n", key, callback, optional_value(option, {}))
end

return M
