return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
                require("mini.pairs").setup()
                require("mini.completion").setup()
                require("mini.git").setup()
                require("mini.icons").setup()
                require("mini.starter").setup()
    end,
}
