return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({ hidden = true })
		end)
		vim.keymap.set("n", "<leader>pl", function()
			builtin.live_grep({ hidden = true })
		end)
		vim.keymap.set("n", "<C-p>", function()
			builtin.git_files({ hidden = true })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ hidden = true, search = vim.fn.input("Grep > ") })
		end)

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist,
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
