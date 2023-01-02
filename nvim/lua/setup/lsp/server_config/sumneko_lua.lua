return {
  settings = {
    sumneko_lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
