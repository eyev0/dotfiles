local throttle_time = 200

autocmd({ "InsertLeave", "TextChanged" }, {
  group = augroup("RustAuCmds", {}),
  pattern = "*.rs",
  callback = function()
    if vim.g._rust_timer_started == true then
      return
    end
    vim.g._rust_timer_started = true
    vim.fn.timer_start(throttle_time, function()
      vim.g._rust_timer_started = false
      vim.cmd("w")
    end)
  end,
})
