return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
                    -- Record macro 
					{
						function()
							if vim.fn.reg_recording() ~= "" then
								return "Recording @" .. vim.fn.reg_recording()
							else
								return ""
							end
						end,
						color = function()
							return { bg = "#ff79c6", fg = "bg", gui = "bold" }
						end,
						separator = { right = "" },
					},
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
        -- Detection of the record macro (instantaneous)
		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
				require("lualine").refresh()
			end,
		})

		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				require("lualine").refresh()
			end,
		})
	end,
}
