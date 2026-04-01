return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- Add file to harpoon list
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

        -- Toggle harpoon quick menu
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end
}
