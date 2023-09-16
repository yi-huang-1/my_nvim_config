vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

local opt = { noremap = true, silent = true }

-- block keys
-- vim.keymap.set({"n", "i"}, "<Left>", "<Nop>")
-- vim.keymap.set({"n", "i"}, "<Right>", "<Nop>")
-- vim.keymap.set({"n", "i"}, "<Up>", "<Nop>")
-- vim.keymap.set({"n", "i"}, "<Down>", "<Nop>")

if KEY_LAYOUT == 'colemak' then
	map("", "k", "i", opt)
	map("", "K", "I", opt)

	map("", "n", "j", opt)
	map("", "e", "k", opt)
	map({"n", "t"}, "i", "l", opt)
	map({"v"}, "o", "l", opt)
end

--
-- disable default s
map("n", "s", "", opt)
-- windows split
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- close current
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)


if KEY_LAYOUT == 'colemak' then
	-- back to normal
	map("i", "nn", "<Esc>", opt)
	-- Alt + hjkl jump
	map("n", "<leader>h", "<C-w>h", opt)
	map("n", "<leader>n", "<C-w>j", opt)
	map("n", "<leader>e", "<C-w>k", opt)
	map("n", "<leader>i", "<C-w>l", opt)
else
	-- back to normal
	map("i", "jj", "<Esc>", opt)
	-- Alt + hjkl jump
	map("n", "<leader>h", "<C-w>h", opt)
	map("n", "<leader>j", "<C-w>j", opt)
	map("n", "<leader>k", "<C-w>k", opt)
	map("n", "<leader>l", "<C-w>l", opt)
end

-- window ratios left right
-- map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
-- map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize +4<CR>", opt)
map("n", "s.", ":vertical resize -4<CR>", opt)

-- window ratios up down
-- map("n", "<C-Down>", ":resize +2 <CR>", opt)
-- map("n", "<C-Up>", ":resize -2 <CR>", opt)
if KEY_LAYOUT == 'colemak' then
	map("n", "sn", ":resize +4<CR>", opt)
	map("n", "se", ":resize -4<CR>", opt)
else
	map("n", "sj", ":resize +4<CR>", opt)
	map("n", "sk", ":resize -4<CR>", opt)
end

-- equal
map("n", "s=", "<C-w>=", opt)

-- Terminal
-- map("n", "<leader>t", ":sp | terminal<CR>", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("n", "<leader>t", ":ToggleTerm direction=float<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
if KEY_LAYOUT == 'colemak' then
	map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
	map("t", "<leader>n", [[ <C-\><C-N><C-w>j ]], opt)
	map("t", "<leader>e", [[ <C-\><C-N><C-w>k ]], opt)
	map("t", "<leader>i", [[ <C-\><C-N><C-w>l ]], opt)
else
	map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
	map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
	map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
	map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)
end

-- Visual mode
-- indent
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- move selected contents
if KEY_LAYOUT == 'colemak' then
	map("v", "N", ":move '>+1<CR>gv-gv", opt)
	map("v", "E", ":move '<-2<CR>gv-gv", opt)
else
	map("v", "J", ":move '>+1<CR>gv-gv", opt)
	map("v", "K", ":move '<-2<CR>gv-gv", opt)
end

-- Scroll up & down
-- map("n", "<C-j>", "4j", opt)
-- map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- no yank when paste
map("v", "p", '"_dP', opt)

-- exit
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- insert mode jump
map("i", "<C-h>", "<Esc>I", opt)
map("i", "<C-l>", "<Esc>A", opt)

-- bufferline
-- swith tab
if KEY_LAYOUT == 'colemak' then
	map("n", "<A-t>h", ":BufferLineCyclePrev<CR>", opt)
	map("n", "<A-t>i", ":BufferLineCycleNext<CR>", opt)
else
	map("n", "<A-t>h", ":BufferLineCyclePrev<CR>", opt)
	map("n", "<A-t>l", ":BufferLineCycleNext<CR>", opt)
end
-- close tab
-- "moll/vim-bbye"
map("n", "<C-w>", ":bw<CR>", opt)
map("n", "<leader>bi", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
