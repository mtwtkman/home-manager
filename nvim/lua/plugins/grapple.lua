local utils = require("utils")
local grapple = require("grapple")

utils.nmap("<leader>m", grapple.toggle)
utils.nmap("<leader>M", grapple.toggle_tags)
