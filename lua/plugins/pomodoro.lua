local M = {
  "epwalsh/pomo.nvim",
  version = "*",
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession", "TimerStop", "TimerPause", "TimerResume" },
  keys = {
    { "<leader>pc4", "<cmd>TimerSession coding4<CR>", desc = "Pomodoro 30/10n, 4x sessions" },
    { "<leader>pc2", "<cmd>TimerSession coding2<CR>", desc = "Pomodoro 50/10, 2x sessions" },
    { "<leader>pd", "<cmd>TimerSession pomodoro<CR>",  desc = "Pomodoro Default" },
    { "<leader>ps", "<cmd>TimerStop<CR>",            desc = "Hentikan Pomodoro" },
    { "<leader>pp", "<cmd>TimerPause<CR>",           desc = "Pause Pomodoro" },
    { "<leader>pr", "<cmd>TimerResume<CR>",          desc = "Lanjutkan Pomodoro" },
    { "<leader>pw", "<cmd>TimerShow<CR>",          desc = "Lihat Pomodoro Aktif" },
    { "<leader>ph", "<cmd>TimerHide<CR>",          desc = "Sembunyikan Pomodoro Aktif" },
  },
  dependencies = {
    "rcarriga/nvim-notify",
  },
}

function M.config()
  local function play_sound(type)
    local total_bip = 5
    local tinggi_rendah_nada = 1500
    local panjang_bunyi = 300
    local jeda = 800

    if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
      local cmd = ""
      if type == "start" then
        cmd = string.format("[Console]::Beep(2500, 50)",tinggi_rendah_nada,panjang_bunyi)
      elseif type == "done" then
        cmd = string.format(
        "1..%d | ForEach-Object { [Console]::Beep(%d, %d); Start-Sleep -Milliseconds %d }",
        total_bip,tinggi_rendah_nada,panjang_bunyi,jeda)
      elseif type == "stop" then
        cmd = string.format("[Console]::Beep(1000, 50)",tinggi_rendah_nada,panjang_bunyi)
      end
      vim.fn.jobstart({"powershell.exe", "-Command", cmd}, {detach = true})

    elseif vim.fn.has("macunix") == 1 then
      local cmd = ""
      if type == "start" then
        cmd = "afplay /System/Library/Sounds/Tink.aiff"
      elseif type == "done" then
        cmd = strng.format("for i in {1..%d}; do afplay /System/Library/Sounds/Hero.aiff; sleep %.2f; done",total_bip,jeda / 1000)
      elseif type == "stop" then
        cmd = "afplay /System/Library/Sounds/Basso.aiff"
      end
      vim.fn.jobstart({"zsh", "-c", cmd}, {detach = true})

    else
      local cmd = ""
      if type == "start" then
        cmd = "aplay /usr/share/sounds/alsa/Front_Center.wav >/dev/null 2>&1"
      elseif type == "done" then
        cmd = string.format("for i in $(seq 1 %d); do aplay /usr/share/sounds/alsa/Front_Center.wav >/dev/null 2>&1; sleep %.2f; done",total_bip,jeda/1000)
      elseif type == "stop" then
        cmd = "aplay /usr/share/sounds/alsa/Side_Left.wav >/dev/null 2>&1"
      end
      vim.fn.jobstart({"sh", "-c", cmd}, {detach = true})
    end
  end

  require("pomo").setup({
    sessions = {
      coding4 = {
        { name = "Coding 1", duration = "30m" },
        { name = "Break 1", duration = "10m" },

        {name = "Coding 2", duration = "30m"},
        {name = "Break 2", duration = "11m"},

        {name = "Coding 3", duration = "30m"},
        {name = "Break 3", duration = "12m"},

        {name = "Coding 4", duration = "30m"},
        -- {name = "Break 4", duration = "13m"},
      },
      coding2 = {
        { name = "Coding 1", duration = "50m" },
        { name = "Break 1", duration = "10m" },

        {name = "Coding 2", duration = "50m"},
        -- {name = "Break 2", duration = "10m"},
      },
      pomodoro = {
        {name = "Fokus 1", duration = "25m"},
        {name = "Break 1", duration = "5m"},

        {name = "Fokus 2", duration = "25m"},
        {name = "Break 2", duration = "5m"},

        {name = "Fokus 3", duration = "25m"},
        {name = "Break 3", duration = "5m"},

        {name = "Fokus 4", duration = "25m"},
        -- {name = "Break 4", duration = "7m"},
        --pomodoro selesai, setelah sessions selesai tidak perlu lagi adanya BREAK karena setelah BREAK tidak akan ada lagi sessions, jadi user bebas mau lanjut atau istirahat lama
      }
    },

    notifiers = {
      {
        name = "Default",
        opts = {
          sticky = false,
        },
      },
      {
        init = function(timer)
          local CustomNotifier = {}

          function CustomNotifier:start() play_sound("start") end

          function CustomNotifier:tick(time_left) end

          function CustomNotifier:done() play_sound("done") end

          function CustomNotifier:stop() play_sound("stop") end

          return CustomNotifier
        end,
      },
    },
  })
end

return M
