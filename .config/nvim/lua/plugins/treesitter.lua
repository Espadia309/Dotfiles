return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      incremental_selection = {
          enable = true,
          keymaps = {
              init_selection = "<leader>ss",
              node_incremental = "<leader>si",
              scope_incremental = "<leader>sc",
              node_decemental = "<leader>sd",
          },
      }
    })
    
    require("nvim-treesitter").install{
        "lua", "python", "javascript", "bash", "c", "c_sharp", "cmake", "gdscript"
    }
  end,
}
