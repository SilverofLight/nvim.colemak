return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "gemini",
				keymaps = {
					close = {
						modes = { n = "<C-c>", i = "<C-c>" },
						opts = {},
					},
				},
			},
		},

		adapter = {
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					env = {
						api_key = "GEMINI_API_KEY",
					},
				})
			end,
		},

		display = {
			action_palette = {
				width = 95,
				height = 10,
				provider = "snacks",
			},
		},
	},
}
