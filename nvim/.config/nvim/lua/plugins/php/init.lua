return {
    "phpactor/phpactor",
    ft = "php",
    run = "composer install --no-dev --optimize-autoloader",
    config = function()
        bind("n", "<leader>pm", ":PhpactorContextMenu<CR>")
    end,
}
