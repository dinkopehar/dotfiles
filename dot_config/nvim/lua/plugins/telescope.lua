return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "barrett-ruth/telescope-http.nvim" },
    },
    config = function()
        require("telescope").load_extension("http")

        -- Commands
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    end,
}
