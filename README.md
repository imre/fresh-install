# Fresh Install on a new Mac

## Firefox
[Download Browser](https://www.mozilla.org/en-GB/firefox/new/)

# Density: Compact  |
[Walkthrough Guide](https://support.mozilla.org/en-US/kb/compact-mode-workaround-firefox)

# Bookmarks open in new tab
[Walkthrough Guide](https://support.mozilla.org/en-US/questions/1207970)


# Extensions:
  - uBlock Origin
  - I don't care about cookies
  - Panorama Tab Group
  - Momentum



## HomeBrew:
Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install apps
```
brew install \
   htop \
   kitty \
   jetbrains-toolbox \
   postman \
   spotify \
   rectangle \
   sublime-text \
   vlc \ 
   slack \
```
## XCode
[Download Link](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

## System Preferences:
### Keyboard:
Modifier Keys: 🌐 (fn) Key ➡ ^ Control Key

Text Input: 🇬🇧 British - PC

## Sublime Text 4:
Theme:

- Press: ⌘ + ⬆️ + 🅿️: Install Package
- ayu
- Color Scheme: ayu-dark
- Color Theme: ayu-mirage

## Generate SSH Key:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Copy the contents of the id_rsa.pub file to your clipboard
```
pbcopy < ~/.ssh/id_rsa.pub
```  


## Tips

### If Kitty's font on oh-my-zsh isn't working properly, try installing `Powerline Fonts` manually:

- 1. Clone the repository
	```
	git clone git@github.com:powerline/fonts.git
	```
	```
	cd fonts/
	```
- 2. Install the fonts
	```
	./install.sh
	```
- 3. Refresh the font cache, saves logging
	```
	sudo fc-cache -fv
	```
- 4. Restart Kitty
