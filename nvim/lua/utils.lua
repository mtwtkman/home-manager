local M = {}

function M.map_array(ary, f)
  local xs = {}
  for i=1,#ary,1 do
    xs[i] = f(ary[i])
  end
  return xs
end

return M
