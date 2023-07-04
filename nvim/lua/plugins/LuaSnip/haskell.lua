local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  s("pragma", {
    t("{-# LANGUAGE "),
    i(1),
    t(" #-"),
  }),
}
