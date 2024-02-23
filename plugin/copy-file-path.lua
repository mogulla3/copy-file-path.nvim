local message_prefix = "[copy-file-path.nvim] "

vim.api.nvim_create_user_command("CopyRelativeFilePath", function()
  vim.fn.setreg("+", vim.fn.expand('%'))
  vim.api.nvim_echo({ { message_prefix .. "Copied relative file path." } }, false, {})
end, { nargs = 0, force = true, desc = "Copy relative file path to the clipboard" })

vim.api.nvim_create_user_command("CopyAbsoluteFilePath", function()
  vim.fn.setreg("+", vim.fn.expand('%:p'))
  vim.api.nvim_echo({ { message_prefix .. "Copied absolute file path." } }, false, {})
end, { nargs = 0, force = true, desc = "Copy absolute file path to the clipboard" })

vim.api.nvim_create_user_command("CopyFileName", function()
  vim.fn.setreg("+", vim.fn.expand('%:t'))
  vim.api.nvim_echo({ { message_prefix .. "Copied filename." } }, false, {})
end, { nargs = 0, force = true, desc = "Copy just the file name to the clipboard" })

vim.cmd("command! CopyFilePath CopyRelativeFilePath")
