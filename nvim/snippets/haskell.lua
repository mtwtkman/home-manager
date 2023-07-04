local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

local regular_snippets = {
  s("pragma", {
    t("{-# LANGUAGE "),
    i(1),
    t(" #-"),
  }),
}

local auto_snippets = {}

return regular_snippets, auto_snippets
