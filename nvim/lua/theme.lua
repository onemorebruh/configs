vim.cmd([[colorscheme dedsec]])
vim.cmd([[set termguicolors]])

require([[themes.dedsec]])

local dedsec_ascii = {
	[[█▒█▒█▀█▒█▀▀▒█▒█▒▒▒▀█▀▒█▒█▒█▀▀▒▒▒█▀█▒█▒▒▒█▀█▒█▀▄▒█▀▀▒▀█▀▒]],
	[[█▀█▒█▄█▒█▒▒▒█▄▀▒▒▒▒█▒▒█▀█▒█▄▄▒▒▒█▄█▒█▒▒▒█▄█▒█▒█▒█▄▄▒▒█▒▒]],
	[[█▒█▒█▒█▒█▄▄▒█▒█▒▒▒▒█▒▒█▒█▒█▄▄▒▒▒█▒▒▒█▄▄▒█▒█▒█▒█▒█▄▄▒▒█▒▒]],
}

--TODO disable shortcut project and mru
Dashboard_config = {
--  shortcut = { enable = false },
  packages = { enable = false },
  project = { enable = false },
  mru = { enable = false},
  header = dedsec_ascii,
  center = {
    enable = false
  },
  footer = { [[󰚌 <Dare to Resist> ]] }
}

require([[themes.dedsec]])
