local api = require("utils.api")
local map = api.map.map

map("n", "q", ':cclose<cr>', { silent = true, buffer = true }, 'Close')
map("n", "r", function () require("replacer").run() end, { silent = true, buffer = true }, 'Replace')
map("n", "<leader>r", function () require("replacer").run() end, { silent = true, buffer = true }, 'Replace')

map("n", "]c", ':cnext|wincmd p<cr>', { silent = true, buffer = true }, 'Next C item')
map("n", "[c", ':cprevious|wincmd p<cr>', { silent = true, buffer = true }, 'Previous C item')

map("n", "]l", ':lnext|wincmd p<cr>', { silent = true, buffer = true }, 'Next L item')
map("n", "[l", ':lprevious|wincmd p<cr>', { silent = true, buffer = true }, 'Previous L item')
