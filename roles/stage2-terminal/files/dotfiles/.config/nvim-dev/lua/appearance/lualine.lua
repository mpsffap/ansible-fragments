local hl = vim.api.nvim_set_hl
hl(0, "LualineDiagError", { bg = "#3e3e3e", fg = "#c53b53" })
hl(0, "LualineDiagWarn", { bg = "#3e3e3e", fg = "#ECBE7B" })
hl(0, "LualineDiagInfo", { bg = "#3e3e3e", fg = "#51afef" })
hl(0, "LualineDiagHint", { bg = "#3e3e3e", fg = "#98be65" })

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        refresh_time = 16, -- ~60fps
        events = {
          "WinEnter",
          "BufEnter",
          "BufWritePost",
          "SessionLoadPost",
          "FileChangedShellPost",
          "VimResized",
          "Filetype",
          "CursorMoved",
          "CursorMovedI",
          "ModeChanged",
        },
      },
    },
    sections = {
      lualine_a = { {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      } },
      lualine_b = {
        {
          "diagnostics",
          --
          -- -- Table of diagnostic sources, available sources are:
          -- --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- -- or a function that returns a table as such:
          -- --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { "nvim_lsp", "nvim_diagnostic" },
          --
          -- -- Displays diagnostics for the defined severity types
          sections = { "error", "warn", "info", "hint" },
          symbols = { error = "", warn = "", info = "", hint = "" },
          colored = true, -- Displays diagnostics status in color if set to true.
          update_in_insert = true, -- Update diagnostics in insert mode.
          always_visible = true, -- Show diagnostics even if there are none.
        },
        {
          "diff",
          colored = true,
          symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
          source = nil, -- A function that works as a data source for diff.
          -- It must return a table as such:
          --   { added = add_count, modified = modified_count, removed = removed_count }
          -- or nil on failure. count <= 0 won't be displayed.
        },
        {
          "branch",
        },
      },
      lualine_c = {
        {
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = true, -- Display new file status (new file means no write after created)
          path = 3, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = "[+]", -- Text to show when the file is modified.
            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
            newfile = "[New]", -- Text to show for newly created file before first write
          },
        },
      },
      lualine_x = {
        { "lsp_status" },
      },
      lualine_y = {
        { "progress" },
        { "encoding" },
        {
          "fileformat",
          symbols = {
            unix = "", -- e712
            dos = "", -- e70f
            mac = "", -- e711
          },
        },
        {
          "filetype",
          colored = true, -- Displays filetype icon in color if set to true
          icon_only = false, -- Display only an icon for filetype
          icon = { align = "right" }, -- Display filetype icon on the right hand side
          -- icon =    {'X', align='right'}
          -- Icon string ^ in table is ignored in filetype component
        },
        {
          "searchcount",
          maxcount = 999,
          timeout = 500,
        },
      },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
