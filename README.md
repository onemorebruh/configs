# Configs

This is a repo I use for saving my current config files


## Colorschemes

### Dedsec
The design of the configuration is inspired by watch dogs 2

colors i used:
#07CF22
#0A0C09
#192224
#193224
#222E30
#536991
#5E6C70
#648C0D
#71BF24
#73AD24
#76A62E
#848688
#8C8488
#912C00
#A1A6A8
#A4A6A8
#BD9800
#D91882
#E2E4E5
#F216A5
#F21BB9
#F6B616
#F9F9F9
#F9F9FF
## Obvious information about each component

| name                          | purpouse                                      |
| ----------------------------- | --------------------------------------------- |
| `alacritty`                   | alacritty config file                         |
| `arch_update_playbook.yaml`   | ansible playbook for updating arch systems    |
| `config.fish`                 | file with aliases I use                       |
| `dunst`                       | notification manager config                   |
| `grub_wallpaper.jpg`          | grub wallpaper                                |
| `i3 and i3status`             | dirs with i3 config                           |
| `nvim`                        | my nvim config                                |
| `neofetch`                    | dir with neofetch config and logo             |
| `vimrc`                       | old config i used for vim                     |
| `scripts`                     | dir with bash scripts help me                 |
| `wallpaper.jpg`               | wallpaper                                     |

## I would like to say about but haven't mention in previous table

`/nvim/colors/dedsec.vim` - colorscheme I made and use. 

`scripts/clear_all_containers.sh` - bash script for destroying all containers and images docker see

`scripts/copy_configs.sh` - bash script for copying actual config to this directory

`scripts/load_configs.sh` - bash script for installing my configs to the system

I have no relation with content of `nvim/lua/dashboard` it was created by another person(sorrily i can't find who did it) and it is here only because dashboard wouldn't work witout it.

## TODO

- [x] add alacritty config
- [ ] add xinitrc
- [ ] make and add tmux config
- [ ] update `arch_update_playbook` so it will install all packages I need on all the arch based servers
- [x] add comments to config
- [ ] set close completions by `ESC` in nvim
- [ ] make multicursor mode work in nvim by holding `alt` and clicking
- [x] add installation of modified my nerd-fonts jetbrains mono
- [x] remove configs I don't use anymore
- [ ] setup notifications background as black
- [ ] add notifications for such actions as changing volume or brightness
- [ ] make `battery_level_alert.py` start when login
- [ ] make neofetch display logo.jpeg/logo.txt by default
- [x] setup custom logo in nvim
- [ ] clean nvim dashboard
- [ ] setup nivm bufferlines
- [x] setup nvim galaxyline
