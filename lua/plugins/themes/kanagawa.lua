local shinobi = {
  "rebelot/kanagawa.nvim",
  event = "InsertEnter"
}

-- kanagawa-wave, kanagawa-dragon, kanagawa-lotus
shinobi.name = "kanagawa"

local colors = {
  -- Bg Shades
  sumiink0 = "#16161d",
  sumiink1 = "#181820",
  sumiink2 = "#1a1a22",
  sumiInk3 = "#1F1F28",
  sumiInk4 = "#2A2A37",
  sumiInk5 = "#363646",
  sumiInk6 = "#54546D", --fg

  -- Popup and Floats
  waveBlue1 = "#223249",
  waveBlue2 = "#2D4F67",

  -- Diff and Git
  winterGreen = "#2B3328",
  winterYellow = "#49443C",
  winterRed = "#43242B",
  winterBlue = "#252535",
  autumnGreen = "#76946A",
  autumnRed = "#C34043",
  autumnYellow = "#DCA561",

  -- Diag
  samuraiRed = "#E82424",
  roninYellow = "#FF9E3B",
  waveAqua1 = "#6A9589",
  dragonBlue = "#658594",

  -- Fg and Comments
  oldWhite = "#C8C093",
  fujiWhite = "#DCD7BA",
  fujiGray = "#727169",

  oniViolet = "#957FB8",
  oniViolet2 = "#b8b4d0",
  crystalBlue = "#7E9CD8",
  springViolet1 = "#938AA9",
  springViolet2 = "#9CABCA",
  springBlue = "#7FB4CA",
  lightBlue = "#A3D4D5", -- unused yet
  waveAqua2 = "#7AA89F", -- improve lightness: desaturated greenish Aqua

  -- waveAqua2  = "#68AD99",
  -- waveAqua4  = "#7AA880",
  -- waveAqua5  = "#6CAF95",
  -- waveAqua3  = "#68AD99",

  springGreen = "#98BB6C",
  boatYellow1 = "#938056",
  boatYellow2 = "#C0A36E",
  carpYellow = "#E6C384",

  sakuraPink = "#D27E99",
  waveRed = "#E46876",
  peachRed = "#FF5D62",
  surimiOrange = "#FFA066",
  katanaGray = "#717C7C",

  dragonBlack0 = "#0d0c0c",
  dragonBlack1 = "#12120f",
  dragonBlack2 = "#1D1C19",
  dragonBlack3 = "#181616",
  dragonBlack4 = "#282727",
  dragonBlack5 = "#393836",
  dragonBlack6 = "#625e5a",

  dragonWhite = "#c5c9c5",
  dragonGreen = "#87a987",
  dragonGreen2 = "#8a9a7b",
  dragonPink = "#a292a3",
  dragonOrange = "#b6927b",
  dragonOrange2 = "#b98d7b",
  dragonGray = "#a6a69c",
  dragonGray2 = "#9e9b93",
  dragonGray3 = "#7a8382",
  dragonBlue2 = "#8ba4b0",
  dragonViolet= "#8992a7",
  dragonRed = "#c4746e",
  dragonAqua = "#8ea4a2",
  dragonAsh = "#737c73",
  dragonTeal = "#949fb5",
  dragonYellow = "#c4b28a",--"#a99c8b",
  -- "#8a9aa3",

  lotusInk1 = "#545464",
  lotusInk2 = "#43436c",
  lotusGray = "#dcd7ba",
  lotusGray2 = "#716e61",
  lotusGray3 = "#8a8980",
  lotusWhite0 = "#d5cea3",
  lotusWhite1 = "#dcd5ac",
  lotusWhite2 = "#e5ddb0",
  lotusWhite3 = "#f2ecbc",
  lotusWhite4 = "#e7dba0",
  lotusWhite5 = "#e4d794",
  lotusViolet1 = "#a09cac",
  lotusViolet2 = "#766b90",
  lotusViolet3 = "#c9cbd1",
  lotusViolet4 = "#624c83",
  lotusBlue1 = "#c7d7e0",
  lotusBlue2 = "#b5cbd2",
  lotusBlue3 = "#9fb5c9",
  lotusBlue4 = "#4d699b",
  lotusBlue5 = "#5d57a3",
  lotusGreen = "#6f894e",
  lotusGreen2 = "#6e915f",
  lotusGreen3 = "#b7d0ae",
  lotusPink = "#b35b79",
  lotusOrange = "#cc6d00",
  lotusOrange2 = "#e98a00",
  lotusYellow ="#77713f",
  lotusYellow2 = "#836f4a",
  lotusYellow3 = "#de9800",
  lotusYellow4 = "#f9d791",
  lotusRed = "#c84053",
  lotusRed2 = "#d7474b",
  lotusRed3 = "#e82424",
  lotusRed4 = "#d9a594",
  lotusAqua = "#597b75",
  lotusAqua2 = "#5e857a",
  lotusTeal1 = "#4e8ca2",
  lotusTeal2 = "#6693bf",
  lotusTeal3 = "#5a7785",
  lotusCyan = "#d7e3d8",
}

function shinobi.tomo()
  require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
      palette = {},
      theme = {
        wave = {
          ui = {
            fg         = colors.fujiWhite,
            fg_dim     = colors.oldWhite,
            fg_reverse = colors.waveBlue1,

            bg_dim     = colors.sumiInk1,
            bg_gutter  = colors.sumiInk4,

            bg_m3      = colors.sumiInk0,
            bg_m2      = colors.sumiInk1,
            bg_m1      = colors.sumiInk2,
            bg         = colors.sumiInk3,
            bg_p1      = colors.sumiInk4,
            bg_p2      = colors.sumiInk5,

            special    = colors.springViolet1,
            nontext    = colors.sumiInk6,
            whitespace = colors.sumiInk6,

            bg_search  = colors.waveBlue2,
            bg_visual  = colors.waveBlue1,

            pmenu      = {
              fg       = colors.fujiWhite,
              fg_sel   = "none", -- This is important to make highlights pass-through
              bg       = colors.waveBlue1,
              bg_sel   = colors.waveBlue2,
              bg_sbar  = colors.waveBlue1,
              bg_thumb = colors.waveBlue2,
            },
            float      = {
              fg        = colors.oldWhite,
              bg        = colors.sumiInk0,
              fg_border = colors.sumiInk6,
              bg_border = colors.sumiInk0,
            },
          },
          syn = {
            string     = colors.springGreen,
            variable   = "none",
            number     = colors.sakuraPink,
            constant   = colors.surimiOrange,
            identifier = colors.carpYellow,
            -- parameter  = "#C3B1B1",
            -- parameter  = "#B1ADC8",
            -- parameter  = "#b8b4d0",
            parameter  = colors.oniViolet2,
            -- parameter = "#d5a4a6",
            -- parameter  = "#C8ADAD",
            -- parameter  = "#d7a8a8",
            fun        = colors.crystalBlue,
            statement  = colors.oniViolet,
            keyword    = colors.oniViolet,
            operator   = colors.boatYellow2,
            preproc    = colors.waveRed, --lightBlue? deserves its own color
            type       = colors.waveAqua2,
            regex      = colors.boatYellow2,
            deprecated = colors.katanaGray,
            comment    = colors.fujiGray,
            punct      = colors.springViolet2,
            special1   = colors.springBlue,
            special2   = colors.waveRed,
            special3   = colors.peachRed,
          },
          vcs = {
            added   = colors.autumnGreen,
            removed = colors.autumnRed,
            changed = colors.autumnYellow,
          },
          diff = {
            add    = colors.winterGreen,
            delete = colors.winterRed,
            change = colors.winterBlue,
            text   = colors.winterYellow,
          },
          diag = {
            ok      = colors.springGreen,
            error   = colors.samuraiRed,
            warning = colors.roninYellow,
            info    = colors.dragonBlue,
            hint    = colors.waveAqua1,
          },
          term = {
            colors.sumiInk0, -- black
            colors.autumnRed, -- red
            colors.autumnGreen, -- green
            colors.boatYellow2, -- yellow
            colors.crystalBlue, -- blue
            colors.oniViolet, -- magenta
            colors.waveAqua1, -- cyan
            colors.oldWhite, -- white
            colors.fujiGray, -- bright black
            colors.samuraiRed, -- bright red
            colors.springGreen, -- bright green
            colors.carpYellow, -- bright yellow
            colors.springBlue, -- bright blue
            colors.springViolet1, -- bright magenta
            colors.waveAqua2, -- bright cyan
            colors.fujiWhite, -- bright white
            colors.surimiOrange, -- extended color 1
            colors.peachRed, -- extended color 2
          },
        },

        lotus = {
          ui = {
            fg         = colors.lotusInk1,
            fg_dim     = colors.lotusInk2,
            fg_reverse = colors.lotusGray,

            bg_dim     = colors.lotusWhite1,
            bg_gutter  = colors.lotusWhite4,

            bg_m3      = colors.lotusWhite0,
            bg_m2      = colors.lotusWhite1,
            bg_m1      = colors.lotusWhite2,
            bg         = colors.lotusWhite3,
            bg_p1      = colors.lotusWhite4,
            bg_p2      = colors.lotusWhite5,

            nontext    = colors.lotusViolet1,
            whitespace = colors.lotusViolet1,
            special    = colors.lotusViolet2,

            bg_visual  = colors.lotusViolet3,
            bg_search  = colors.lotusBlue2,

            pmenu      = {
              fg       = colors.lotusInk2,
              fg_sel   = "none", -- This is important to make highlights pass-through
              bg       = colors.lotusBlue1,
              bg_sel   = colors.lotusBlue3,
              bg_sbar  = colors.lotusBlue1,
              bg_thumb = colors.lotusBlue2,
            },
            float      = {
              fg        = colors.lotusInk2,
              bg        = colors.lotusWhite0,
              fg_border = colors.lotusGray2,
              bg_border = colors.lotusWhite0,
            },
          },
          syn = {
            string     = colors.lotusGreen,
            variable   = "none",
            number     = colors.lotusPink,
            constant   = colors.lotusOrange,
            identifier = colors.lotusYellow,
            parameter  = colors.lotusBlue5,
            fun        = colors.lotusBlue4,
            statement  = colors.lotusViolet4,
            keyword    = colors.lotusViolet4,
            operator   = colors.lotusYellow2,
            preproc    = colors.lotusRed,
            type       = colors.lotusAqua,
            regex      = colors.lotusYellow2,
            deprecated = colors.lotusGray3,
            comment    = colors.lotusGray3,
            punct      = colors.lotusTeal1,
            special1   = colors.lotusTeal2,
            special2   = colors.lotusRed,
            special3   = colors.lotusRed,
          },
          vcs = {
            added   = colors.lotusGreen2,
            removed = colors.lotusRed2,
            changed = colors.lotusYellow3,
          },
          diff = {
            add    = colors.lotusGreen3,
            delete = colors.lotusRed4,
            change = colors.lotusCyan,
            text   = colors.lotusYellow4,
          },
          diag = {
            error   = colors.lotusRed3,
            ok      = colors.lotusGreen,
            warning = colors.lotusOrange2,
            info    = colors.lotusTeal3,
            hint    = colors.lotusAqua2,
          },
          term = {
            colors.sumiInk3, -- black
            colors.lotusRed, -- red
            colors.lotusGreen, -- green
            colors.lotusYellow, -- yellow
            colors.lotusBlue4, -- blue
            colors.lotusPink, -- magenta
            colors.lotusAqua, -- cyan
            colors.lotusInk1, -- white
            colors.lotusGray3 , -- bright black
            colors.lotusRed2, -- bright red
            colors.lotusGreen2, -- bright green
            colors.lotusYellow2, -- bright yellow
            colors.lotusTeal2, -- bright blue
            colors.lotusViolet4, -- bright magenta
            colors.lotusAqua2, -- bright cyan
            colors.lotusInk2, -- bright white
            colors.lotusOrange2, -- extended color 1
            colors.lotusRed3, -- extended color 2
          },
        },

        dragon = {
          ui = {
            fg         = colors.dragonWhite,
            fg_dim     = colors.oldWhite,
            fg_reverse = colors.waveBlue1,

            bg_dim     = colors.dragonBlack1,
            bg_gutter  = colors.dragonBlack4,

            bg_m3      = colors.dragonBlack0,
            bg_m2      = colors.dragonBlack1,
            bg_m1      = colors.dragonBlack2,
            bg         = colors.dragonBlack3,
            bg_p1      = colors.dragonBlack4,
            bg_p2      = colors.dragonBlack5,

            special    = colors.dragonGray3,
            whitespace = colors.dragonBlack6,
            nontext    = colors.dragonBlack6,

            bg_visual  = colors.waveBlue1,
            bg_search  = colors.waveBlue2,

            pmenu      = {
              fg       = colors.fujiWhite,
              fg_sel   = "none",
              bg       = colors.waveBlue1,
              bg_sel   = colors.waveBlue2,
              bg_thumb = colors.waveBlue2,
              bg_sbar  = colors.waveBlue1,
            },

            float      = {
              fg        = colors.oldWhite,
              bg        = colors.dragonBlack0,
              fg_border = colors.sumiInk6,
              bg_border = colors.dragonBlack0,
            },
          },
          syn = {
            string     = colors.dragonGreen2,
            variable   = "none",
            number     = colors.dragonPink,
            constant   = colors.dragonOrange,
            identifier = colors.dragonYellow,
            parameter  = colors.dragonGray,
            fun        = colors.dragonBlue2,
            statement  = colors.dragonViolet,
            keyword    = colors.dragonViolet,
            operator   = colors.dragonRed,
            preproc    = colors.dragonRed,
            type       = colors.dragonAqua,
            regex      = colors.dragonRed,
            deprecated = colors.katanaGray,
            punct      = colors.dragonGray2,
            comment    = colors.dragonAsh,
            special1   = colors.dragonTeal,
            special2   = colors.dragonRed,
            special3   = colors.dragonRed,
          },
          diag = {
            error   = colors.samuraiRed,
            ok      = colors.springGreen,
            warning = colors.roninYellow,
            info    = colors.dragonBlue,
            hint    = colors.waveAqua1,
          },
          diff = {
            add    = colors.winterGreen,
            delete = colors.winterRed,
            change = colors.winterBlue,
            text   = colors.winterYellow,
          },
          vcs = {
            added   = colors.autumnGreen,
            removed = colors.autumnRed,
            changed = colors.autumnYellow,
          },
          term = {
            colors.dragonBlack0, -- black
            colors.dragonRed, -- red
            colors.dragonGreen2, -- green
            colors.dragonYellow, -- yellow
            colors.dragonBlue2, -- blue
            colors.dragonPink, -- magenta
            colors.dragonAqua, -- cyan
            colors.oldWhite, -- white
            colors.dragonGray, -- bright black
            colors.waveRed, -- bright red
            colors.dragonGreen, -- bright green
            colors.carpYellow, -- bright yellow
            colors.springBlue, -- bright blue
            colors.springViolet1, -- bright magenta
            colors.waveAqua2, -- bright cyan
            colors.dragonWhite, -- bright white
            colors.dragonOrange, -- extended color 1
            colors.dragonOrange2, -- extended color 2
          },
        },
        all = {
          ui = {
            bg_gutter = "none",
          }
        },
      },
    },

    overrides = function(color) -- add/modify highlights
      local theme = color.theme
      return {
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
      }
    end,

    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
      dark = "wave",           -- try "dragon" !
      light = "lotus"
    },
  })
end

return shinobi
