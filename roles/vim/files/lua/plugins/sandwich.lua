local vim = vim

vim.g["sandwich#recipes"] = {}

table.insert(vim.g["sandwich#recipes"], { buns = {'( ', ' )'}, nesting = 1, match_syntax = 1, input = {'('} })
table.insert(vim.g["sandwich#recipes"], { buns = {'[ ', ' ]'}, nesting = 1, match_syntax = 1, input = {'['} })
table.insert(vim.g["sandwich#recipes"], { buns = {'{ ', ' }'}, nesting = 1, match_syntax = 1, input = {'{'} })

{buns = ['{ ', ' }'], nesting = 1, match_syntax = 1, kind = ['add', 'replace'], action = ['add'], input = ['{']},
{buns = ['[ ', ' ]'], nesting = 1, match_syntax = 1, kind = ['add', 'replace'], action = ['add'], input = ['[']},
{buns = ['( ', ' )'], nesting = 1, match_syntax = 1, kind = ['add', 'replace'], action = ['add'], input = ['(']},
{buns = ['{\s*', '\s*}'],   nesting = 1, regex = 1, match_syntax = 1, kind = ['delete', 'replace', 'textobj'], action = ['delete'], input = ['{']},
{buns = ['\[\s*', '\s*\]'], nesting = 1, regex = 1, match_syntax = 1, kind = ['delete', 'replace', 'textobj'], action = ['delete'], input = ['[']},
{buns = ['(\s*', '\s*)'],   nesting = 1, regex = 1, match_syntax = 1, kind = ['delete', 'replace', 'textobj'], action = ['delete'], input = ['(']}
