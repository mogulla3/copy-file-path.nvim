local function copy_to_clipboard(path)
  vim.fn.setreg("+", path)
  vim.api.nvim_echo({ { "Copied: " .. path } }, false, {})
end

vim.api.nvim_create_user_command("CopyRelativeFilePath", function()
  copy_to_clipboard(vim.fn.expand("%"))
end, { nargs = 0, force = true, desc = "Copy relative file path to the clipboard" })

vim.api.nvim_create_user_command("CopyAbsoluteFilePath", function()
  copy_to_clipboard(vim.fn.expand("%:p"))
end, { nargs = 0, force = true, desc = "Copy absolute file path to the clipboard" })

vim.api.nvim_create_user_command("CopyFileName", function()
  copy_to_clipboard(vim.fn.expand("%:t"))
end, { nargs = 0, force = true, desc = "Copy just the file name to the clipboard" })

vim.cmd("command! CopyFilePath CopyRelativeFilePath")
