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
--  shortcut = { nil },
  packages = { enable = false },
  project = { nil },
  mru = { nil },
  header = dedsec_ascii,
  center = {
    nil
  },
  footer = { [[󰚌 <Dare to Resist> ]] }
}

require([[themes.dedsec]])
