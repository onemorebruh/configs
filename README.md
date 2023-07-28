# Configs

This is a repo I use for saving my current config files

## Obvious information about each component

| name                          | purpouse                                      |
| ----------------------------- | --------------------------------------------- |
| `alacritty`                   | alacritty config file                         |
| `arch_update_playbook.yaml`   | ansible playbook for updating arch systems    |
| `config.fish`                 | file with aliases I use                       |
| `i3 and i3status`             | dirs with i3 config                           |
| `nvim`                        | my nvim config                                |
| `vimrc`                       | old config i used for vim                     |
| `scripts`                     | dir with bash scripts help me                 |

## I would like to say about but haven't mention in previous table

`/nvim/colors/dedsec.vim` - colorscheme I made and use. 

`scripts/clear_all_containers.sh` - bash script for destroying all containers and images docker see

`scripts/copy_configs.sh` - bash script for copying actual config to this directory

`scripts/load_configs.sh` - bash script for installing my configs to the system

## TODO

- [x] add alacritty config
- [ ] add xinitrc
- [ ] make and add tmux config
- [ ] update `arch_update_playbook` so it will install all packages I need on all the arch based servers
- [ ] add comments to config
- [ ] set close completions by `ESC` in nvim
- [x] add installation of modified my nerd-fonts jetbrains mono
