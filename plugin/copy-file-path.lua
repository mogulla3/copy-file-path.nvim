---@param mods string filename-modifiers
---@return string
---see: https://vim-jp.org/vimdoc-ja/cmdline.html#filename-modifiers
local function get_path(mods)
  return vim.fn.fnamemodify(vim.fn.expand("%"), mods)
end

---@param path string
local function copy_to_clipboard(path)
  vim.fn.setreg("+", path)
  vim.api.nvim_echo({ { "Copied: " .. path } }, false, {})
end

vim.api.nvim_create_user_command("CopyRelativeFilePath", function()
  copy_to_clipboard(get_path(":."))
end, { nargs = 0, force = true, desc = "Copy relative file path to the clipboard" })

vim.api.nvim_create_user_command("CopyAbsoluteFilePath", function()
  copy_to_clipboard(get_path(":p"))
end, { nargs = 0, force = true, desc = "Copy absolute file path to the clipboard" })

vim.api.nvim_create_user_command("CopyRelativeFilePathFromHome", function()
  copy_to_clipboard(get_path(":~"))
end, { nargs = 0, force = true, desc = "Copy relative file path from $HOME to the clipboard" })

vim.api.nvim_create_user_command("CopyFileName", function()
  copy_to_clipboard(get_path(":t"))
end, { nargs = 0, force = true, desc = "Copy just the file name to the clipboard" })

vim.cmd("command! CopyFilePath CopyRelativeFilePath")
