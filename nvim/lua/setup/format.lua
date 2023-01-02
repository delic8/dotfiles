require("format").setup ({
  ["*"] = {
    {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
  },
  lua = {
    {
      cmd = {
        function(file)
          return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
        end
      },
    },
  },
  html = {{cmd = {"prettier -w"}}},
  css = {{cmd = {"prettier -w"}}},
  scss = {{cmd = {"prettier -w"}}},
  json = {{cmd = {"prettier -w"}}},
  yaml = {{cmd = {"prettier -w"}}},
  javascript = {{ cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"} }},
  javascriptreact = {{ cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"} }},
  typescript = {{ cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"} }},
  typescriptreact = {{ cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"} }},
  python = {
    {
      cmd = {
        function(file)
          return string.format('black --quiet $s', file)
        end
      },
    },
  },
  markdown = {
    { cmd = {"prettier -w"} },
    {
      cmd = {"black"},
      start_pattern = "^```python$",
      end_pattern = "^```$",
      target = "current"
    },
  },
})
vim.cmd('autocmd BufWritePost * FormatWrite')
