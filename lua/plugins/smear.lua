local M = {
  "sphamba/smear-cursor.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

M.opts = {
  stiffness = 0.8,
  trailing_stiffness = 0.6,
  stiffness_insert_mode = 0.7,
  trailing_stiffness_insert_mode = 0.7,
  damping = 0.65,
  damping_insert_mode = 0.85,
  distance_stop_animating = 0.1,
  time_interval = 7,
  cursor_color = "none",
}

return M
