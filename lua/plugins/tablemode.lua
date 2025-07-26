vim.g.table_mode_disable_mappings = 1
vim.g.table_mode_disable_tableize_mappings = 1
return {
	"dhruvasagar/vim-table-mode",
	event = "VeryLazy",
	ft = "markdown",

	-- vim.keymap.set("n", "tm", "<cmd>TableModeToggle<CR>", { desc = "Toggle Table Mode" }),
	config = function()
		local Snacks = require("snacks")

		Snacks.toggle({
			name = "Table Mode",
			get = function()
				return not vim.g.loaded_table_mode
			end,
			set = function(state)
				vim.g.loaded_table_mode = not state
				vim.cmd("TableModeToggle")
			end,
		}):map("tm")
	end,
}
