return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
        filetypes = {
          "html", "javascript", "typescript", "javascriptreact",
          "typescriptreact", "svelte", "vue", "tsx", "jsx", "php", "markdown",
        },
      },
    })
  end,
}

