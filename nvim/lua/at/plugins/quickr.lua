return {
	"ronakg/quickr-preview.vim",
	config = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			pattern = "*",
			command = "let g:quickr_preview_on_cursor = 1",
		})
	end,
}
