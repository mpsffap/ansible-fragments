return {
  "nvim-tree/nvim-web-devicons",
  -- El override corre después de que devicons se carga realmente
  config = function()
    local devicons = require("nvim-web-devicons")
    devicons.set_icon({
      yml = {
        icon = "󰡪",
        color = "#6A5ACD",
        name = "Yaml",
      },
      yaml = {
        icon = "󰡪",
        color = "#6A5ACD",
        name = "Yaml",
      },
      css = {
        icon = "",
        color = "#2eaa2e",
        name = "css",
      },
    })
  end,
}
