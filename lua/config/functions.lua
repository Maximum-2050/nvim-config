function FIND_PROJECT_ROOT(fname)
  local dir = vim.fn.fnamemodify(fname, ":p:h") -- start from file's directory
  while dir ~= "/" do
    if vim.fn.filereadable(dir .. "/CMake.sh") == 1 then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h") -- go one level up
  end
  return nil
end

function RUN_CMAKE_SH()
  local fname = vim.api.nvim_buf_get_name(0)
  local root = FIND_PROJECT_ROOT(fname)

  if not root then
    print("Root not found")
    return
  end

  local buildScript = root .. "/CMake.sh"

  if vim.fn.filereadable(buildScript) == 0 then
    print("No buildScript found in root")
    return
  end

  vim.fn.jobstart({ buildScript }, {
    cwd = root,
    detach = true,
  })
end
