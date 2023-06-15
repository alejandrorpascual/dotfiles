local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

bind("n", "<leader>a", mark.add_file, "Add file to harpoon")
bind("n", "<leader>hm", ui.toggle_quick_menu, "Toggle harpoon menu")
-- bind("n", "<leader>l", mark.marks)
--
bind("n", "<leader>1", function()
    ui.nav_file(1)
end, "Harpoon: Navigate to file 1")
bind("n", "<leader>2", function()
    ui.nav_file(2)
end, "Harpoon: Navigate to file 2")
bind("n", "<leader>3", function()
    ui.nav_file(3)
end, "Harpoon: Navigate to file 3")
bind("n", "<leader>4", function()
    ui.nav_file(4)
end, "Harpoon: Navigate to file 4")