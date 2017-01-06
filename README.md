# dotfiles

Simple dotfiles setup inspired from https://github.com/alrra/dotfiles

## Setup
Execute the following command in your terminal
```
bash -c "$(curl -LsS https://raw.github.com/abogdan/dotfiles/master/setup.sh)"
```
Or clone the repository in your desired location and execute the ```setup.sh``` script from the project root.


### This will:
* Download the dotfiles on your computer under USER/projects/dotfiles (it will prompt you to confirm or change the location)
* Symlink the dotfiles in your home directory (will prompt if files need to be overwritten)
* Install application (brew, git, xcode, etc.)
* Set macOS preferences
* Kill all apps that are affected (ex.: Chrome)
* Prompts for a restart if desired


## IMPORTANT
**!!!Please read the project files before executing the setup script!!!**
