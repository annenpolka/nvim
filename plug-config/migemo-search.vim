if executable('cmigemo')
    cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
endif
