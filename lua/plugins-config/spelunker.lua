local M = {}

function M.config()
	-- Enable spelunker.vim. (default: 1)
	-- 1: enable
	-- 0: disable
	vim.g.enable_spelunker_vim = 1

	-- Enable spelunker.vim on readonly files or buffer. (default: 0)
	-- 1: enable
	-- 0: disable
	vim.g.enable_spelunker_vim_on_readonly = 0

	-- Check spelling for words longer than set characters. (default: 4)
	vim.g.spelunker_target_min_char_len = 4

	-- Max amount of word suggestions. (default: 15)
	vim.g.spelunker_max_suggest_words = 15

	-- Max amount of highlighted words in buffer. (default: 100)
	vim.g.spelunker_max_hi_words_each_buf = 100

	-- Spellcheck type: (default: 1)
	-- 1: File is checked for spelling mistakes when opening and saving. This
	-- may take a bit of time on large files.
	-- 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
	-- depends on the setting of CursorHold `set updatetime=1000`.
	vim.g.spelunker_check_type = 2

	-- Highlight type: (default: 1)
	-- 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
	-- 2: Highlight only SpellBad.
	-- FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
	vim.g.spelunker_highlight_type = 2

	-- Disable checking words in backtick/backquote. (default: 0)
	vim.g.spelunker_disable_backquoted_checking = 1

	-- Disable default autogroup. (default: 0)
	vim.g.spelunker_disable_auto_group = 0

	-- Override highlight group name of incorrectly spelled words. (default:
	-- 'SpelunkerSpellBad')
	vim.g.spelunker_spell_bad_group = "SpelunkerSpellBad"

	-- Override highlight group name of complex or compound words. (default:
	-- 'SpelunkerComplexOrCompoundWord')
	vim.g.spelunker_complex_or_compound_word_group = "SpelunkerComplexOrCompoundWord"

	-- misspelled word highlighting
	vim.cmd([[
		highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
		highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
	]])
	-- popup-menu highlight
	vim.cmd([[
		hi Pmenu ctermfg=0 ctermbg=0
		hi PmenuSel ctermfg=0 ctermbg=1
	]])
end

return M
