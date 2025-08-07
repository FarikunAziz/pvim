local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  ls.add_snippets("javascript",{
    s("clog",{
      t("console.log("),
      i(1),
      t(");"),
      i(0)
    }),

    s("al",{
      t("alert("),
      i(1),
      t(");"),
      i(0)
    })
  })
}
