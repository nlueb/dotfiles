local vim = vim

vim.g.startify_lists = {
	{
		type = 'bookmarks',
		-- header = {'Bookmarks'}
	},
	{
		type = 'files',
		-- header = {'MRU'}
	},
}

vim.g.startify_bookmarks = {
	{v = '~/.config/nvim/lua/plugins.lua'},
	{k = '~/.config/kitty/kitty.conf'},
	{t = '~/.tmux.conf'},
	{b = '~/.bashrc'},
	{d = '~/Documents'},
	{c = '~/.config'},
}

vim.g.startify_change_to_vcs_root = 1
vim.g.startify_enable_special = 1
vim.g.startify_relative_path = 1

vim.g.startify_custom_header =
-- {
--   '                                        ▟▙            ',
--   '                                        ▝▘            ',
--   '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
--   '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
--   '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
--   '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
--   '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
-- }
-- {
-- 	[[        ________ ++     ________]],
-- 	[[       /VVVVVVVV\++++  /VVVVVVVV\]],
-- 	[[       \VVVVVVVV/++++++\VVVVVVVV/]],
-- 	[[        |VVVVVV|++++++++/VVVVV/']],
-- 	[[        |VVVVVV|++++++/VVVVV/']],
-- 	[[       +|VVVVVV|++++/VVVVV/'+]],
-- 	[[     +++|VVVVVV|++/VVVVV/'+++++]],
-- 	[[   +++++|VVVVVV|/VVVVV/'+++++++++]],
-- 	[[     +++|VVVVVVVVVVV/'+++++++++]],
-- 	[[       +|VVVVVVVVV/'+++++++++]],
-- 	[[        |VVVVVVV/'+++++++++]],
-- 	[[        |VVVVV/'+++++++++]],
-- 	[[        |VVV/'+++++++++]],
-- 	[[        'V/'   ++++++]],
-- 	[[                 ++]],
-- }
-- {
-- 	[[NNNNNNNN        NNNNNNNN                                  VVVVVVVV           VVVVVVVV iiii                          ]],
-- 	[[N:::::::N       N::::::N                                  V::::::V           V::::::Vi::::i                         ]],
-- 	[[N::::::::N      N::::::N                                  V::::::V           V::::::V iiii                          ]],
-- 	[[N:::::::::N     N::::::N                                  V::::::V           V::::::V                               ]],
-- 	[[N::::::::::N    N::::::N    eeeeeeeeeeee       ooooooooooo V:::::V           V:::::Viiiiiii    mmmmmmm    mmmmmmm   ]],
-- 	[[N:::::::::::N   N::::::N  ee::::::::::::ee   oo:::::::::::ooV:::::V         V:::::V i:::::i  mm:::::::m  m:::::::mm ]],
-- 	[[N:::::::N::::N  N::::::N e::::::eeeee:::::eeo:::::::::::::::oV:::::V       V:::::V   i::::i m::::::::::mm::::::::::m]],
-- 	[[N::::::N N::::N N::::::Ne::::::e     e:::::eo:::::ooooo:::::o V:::::V     V:::::V    i::::i m::::::::::::::::::::::m]],
-- 	[[N::::::N  N::::N:::::::Ne:::::::eeeee::::::eo::::o     o::::o  V:::::V   V:::::V     i::::i m:::::mmm::::::mmm:::::m]],
-- 	[[N::::::N   N:::::::::::Ne:::::::::::::::::e o::::o     o::::o   V:::::V V:::::V      i::::i m::::m   m::::m   m::::m]],
-- 	[[N::::::N    N::::::::::Ne::::::eeeeeeeeeee  o::::o     o::::o    V:::::V:::::V       i::::i m::::m   m::::m   m::::m]],
-- 	[[N::::::N     N:::::::::Ne:::::::e           o::::o     o::::o     V:::::::::V        i::::i m::::m   m::::m   m::::m]],
-- 	[[N::::::N      N::::::::Ne::::::::e          o:::::ooooo:::::o      V:::::::V        i::::::im::::m   m::::m   m::::m]],
-- 	[[N::::::N       N:::::::N e::::::::eeeeeeee  o:::::::::::::::o       V:::::V         i::::::im::::m   m::::m   m::::m]],
-- 	[[N::::::N        N::::::N  ee:::::::::::::e   oo:::::::::::oo         V:::V          i::::::im::::m   m::::m   m::::m]],
-- 	[[NNNNNNNN         NNNNNNN    eeeeeeeeeeeeee     ooooooooooo            VVV           iiiiiiiimmmmmm   mmmmmm   mmmmmm]],
-- }
{
	[[    _   _        __      ___           ]],
	[[   | \ | |       \ \    / (_)          ]],
	[[   |  \| | ___  __\ \  / / _ _ __ ___  ]],
	[[   | . ` |/ _ \/ _ \ \/ / | | '_ ` _ \ ]],
	[[   | |\  |  __/ (_) \  /  | | | | | | |]],
	[[   |_| \_|\___|\___/ \/   |_|_| |_| |_|]],
	[[]],
}
