local M = {}

M.setup = function(dap)
  dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  }
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
          return cwd .. "/venv/bin/python"
        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
          return cwd .. "/.venv/bin/python"
        else
          return "python"
        end
      end,
    },
  }
end

return M
