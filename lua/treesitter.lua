require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}


 require'nvim-treesitter.configs'.setup {
   refactor = {
     highlight_current_scope = { enable = false },
   },
 }

 require'nvim-treesitter.configs'.setup {
   refactor = {
     smart_rename = {
       enable = true,
       keymaps = {
         smart_rename = "grr",
       },
     },
   },
 }

